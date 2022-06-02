
package my.mobypay.creditScore.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.amazonaws.util.IOUtils;

import lombok.extern.slf4j.Slf4j;
import my.mobypay.creditScore.AWSS3Config;
import my.mobypay.creditScore.DBConfig;
import my.mobypay.creditScore.dto.UserSearchRequest;
import my.mobypay.creditScore.repository.AWSS3Service;
import my.mobypay.creditScore.dao.CreditScoreConfigRepository;
import my.mobypay.creditScore.utility.EmailUtility;

@Slf4j
@Service
public class AWSS3ServiceImpl implements AWSS3Service {

	private static final Logger LOGGER = LoggerFactory.getLogger(AWSS3ServiceImpl.class);

	@Autowired
	private AmazonS3 amazonS3;
	
	
	// @Value("${aws.s3.bucket}")
	protected String bucketName = null;
	
	@Autowired
	private AWSS3Config awss3Config;
/*
	@Autowired
	CreditScoreConfigRepository creditScoreConfigRepository;
	*/
	
	@Autowired
	DBConfig dbconfig;
	@Bean
	public String getS3BucketValueFromDB() {
		//List<CreditScoreConfig> configValues = creditScoreConfigRepository.findAll();
		HashMap<String,String> dbvalues = dbconfig.getValueFromDB();
		bucketName = dbvalues.get("aws.s3.bucket");
		log.info("bucketName " +bucketName);
		
		return bucketName;
	}
	
	// @Async annotation ensures that the method is executed in a different background thread 
	// but not consume the main thread.
	
	/*
	 * public void uploadFile(final MultipartFile multipartFile,String entityId) {
	 * 
	 * }
	 */

	/*
	 * private File convertMultiPartFileToFile(final MultipartFile multipartFile,
	 * String entityId) { final File file = new
	 * File(multipartFile.getOriginalFilename()); try (final FileOutputStream
	 * outputStream = new FileOutputStream(file)) {
	 * outputStream.write(multipartFile.getBytes()); } catch (final IOException ex)
	 * { LOGGER.error("Error converting the multi-part file to file= ",
	 * ex.getMessage()); } return file; }
	 */
	private String uploadFileToS3Bucket(final String bucketName, final File file, String oUTPUT_DIR) {
		System.out.println(oUTPUT_DIR+"...................,,,,,,,,,,,,,,,,,,,,,??????");
		
		 String response[]=oUTPUT_DIR.split("/"); 
		//String response[]=oUTPUT_DIR.split("//");
		String finalpath=response[4].toString();
			final String uniqueFileName = /* LocalDateTime.now() + "_" + */finalpath;
			System.out.println(uniqueFileName);
		LOGGER.info("Uploading file with name= " + uniqueFileName);
		final PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, uniqueFileName, file);
		LOGGER.info("Establishing AWS Connection start####");
		//awss3Config.getAmazonS3Cient();
		AmazonS3 amazonS3=awss3Config.getAmazonS3Cient();
		amazonS3.putObject(putObjectRequest);
		LOGGER.info("Established AWS Connection ####");
		//amazonS3.putObject(putObjectRequest);
		return uniqueFileName;
	}

	@Override
	@Async
	public String uploadFile(String oUTPUT_DIR) throws Exception {
		System.out.println(oUTPUT_DIR+"///////////////////////////");
		LOGGER.info("File upload in progress.");
		
		String filename = "";
		try {
			File file=new File(oUTPUT_DIR);
			InputStream stream =  new FileInputStream(file);
			MockMultipartFile multipartFileToSend = new MockMultipartFile("file", file.getName(), "text/plain", stream);
			final File files = convertMultiPartFileToFile(multipartFileToSend);
			bucketName = getS3BucketValueFromDB();
			LOGGER.info("File upload is completed."+bucketName+""+files+""+oUTPUT_DIR);
			
			filename=uploadFileToS3Bucket(bucketName, files,oUTPUT_DIR);
			
			//file.delete();	// To remove the file locally created in the project folder.
		} catch (final AmazonServiceException ex) {
			// EmailUtility emailUtility=new EmailUtility();
			//  emailUtility.sentEmail(ex.getLocalizedMessage());
			 EmailUtility emailUtility=new EmailUtility();
			  emailUtility.sentEmail(ex.getLocalizedMessage(),"premkumar@mobypay.my,selva@mobypay.my");
			LOGGER.info("File upload is failed.");
			LOGGER.error("Error= {} while uploading file.", ex.getMessage());
		}
		return filename;
		
	}
	
	
	 @Override
	    // @Async annotation ensures that the method is executed in a different background thread 
	    // but not consume the main thread.
	    @Async
	    public byte[] downloadFile(final String keyName) {
	        byte[] content = null;
	        boolean fileExistFlag = false;
	        LOGGER.info("Downloading an object with key= " + keyName);
	       
	        try {
	        	bucketName = getS3BucketValueFromDB();
	        ObjectListing listing = amazonS3.listObjects(bucketName, keyName);
	        System.out.println(listing.toString());
			List<S3ObjectSummary> summaries = listing.getObjectSummaries();
			System.out.println(summaries);
			for (S3ObjectSummary summary : summaries) {

				String summaryKey = summary.getKey();
				fileExistFlag = summaryKey.equalsIgnoreCase(keyName);
				LOGGER.info("Checking file name is exsist in s3 bucket" + keyName);
				if (fileExistFlag == true) {

					break;
				}
			}
				if (fileExistFlag == true) {	
	        final S3Object s3Object = amazonS3.getObject(bucketName, keyName);
	        final S3ObjectInputStream stream = s3Object.getObjectContent();
	        try {
	            content = IOUtils.toByteArray(stream);
	            LOGGER.info("File downloaded successfully.");
	            s3Object.close();
	        } catch(final IOException ex) {
	            LOGGER.info("IO Error Message= " + ex.getMessage());
	        }
	        return content;
				}else {
					byte[] bytes = "File Not Found For This Customer!!!!!!".getBytes();  
					     
					return bytes;
				}
	        }catch (Exception e) {
	        	byte[] bytes = "File Not Found For This Customer!!!!!!".getBytes();  
	        	 EmailUtility emailUtility=new EmailUtility();
				  emailUtility.sentEmail(e.getLocalizedMessage(),"premkumar@mobypay.my,selva@mobypay.my");
			 
	        	return bytes;
			}
			
	      
	    }
	
	
	

	private File convertMultiPartFileToFile(MockMultipartFile multipartFileToSend) {
		final File file = new File(multipartFileToSend.getOriginalFilename());
		try (final FileOutputStream outputStream = new FileOutputStream(file)) {
			
				outputStream.write(multipartFileToSend.getBytes());
			} catch (final IOException ex) {
				LOGGER.error("Error converting the multi-part file to file= ", ex.getMessage());
				 EmailUtility emailUtility=new EmailUtility();
				  emailUtility.sentEmail(ex.getLocalizedMessage(),"premkumar@mobypay.my,selva@mobypay.my");
			}
			return file;
		}

	

	

}
