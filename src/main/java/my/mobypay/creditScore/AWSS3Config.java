package my.mobypay.creditScore;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

import my.mobypay.creditScore.dao.AWSS3Details;
import my.mobypay.creditScore.repository.AWSS3Repository;

@Configuration
public class AWSS3Config {

	/*
	@Value("${aws.access_key_id}")
	private String accessKeyId;
	@Value("${aws.secret_access_key}")
	private String secretAccessKey;
	
	
	@Value("${aws.s3.region}")
	private String region;
*/
	@Autowired
	AWSS3Repository awss3repo;
	
	@Bean
	public AmazonS3 getAmazonS3Cient() {
			 String[] x = new String[3];
		List<AWSS3Details> awsCred = awss3repo.findAll();
		 x[0] =  awsCred.get(0).getValue().toString().trim();
		 x[1] =  awsCred.get(2).getValue().toString().trim();
		 x[2] =  awsCred.get(3).getValue().toString().trim();
		 
		 String region = "";
		 String accessKeyId = "";
		 String secretAccessKey = "";
		 
		 accessKeyId = x[0];
		 secretAccessKey = x[1];
		 region = x[2];
		 
		final BasicAWSCredentials basicAWSCredentials = new BasicAWSCredentials(accessKeyId, secretAccessKey);
		// Get AmazonS3 client and return the s3Client object.
		return AmazonS3ClientBuilder
				.standard()
				.withRegion(Regions.fromName(region))
				.withCredentials(new AWSStaticCredentialsProvider(basicAWSCredentials))
				.build();
	}
}
