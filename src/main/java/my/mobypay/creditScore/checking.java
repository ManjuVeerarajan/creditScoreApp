package my.mobypay.creditScore;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.lang3.StringUtils;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

import my.mobypay.creditScore.dto.CustomerCreditReportRequest;
import my.mobypay.creditScore.service.AWSS3ServiceImpl;
import my.mobypay.creditScore.service.CcrisReportRetrievalService;

public class checking {

	
	
//public static void main(String[] args) {
		/*
		  String name="NURA ADILA BAHARUDDIN"; String
		  ExperianName="NURA ADILA BINTI              BAHARUDDIN".replaceAll("\\s",
		  "");; if(name.equalsIgnoreCase(ExperianName)) {
		  System.out.println(ExperianName); }
		 */
		
		
		/*
		 * String experianReportUrl =
		 * "C:\\backupcode - Copy - Copy\\creditScore\\src\\main\\resources\\report.xml"
		 * ; CcrisReportRetrievalService ccrisReportRetrievalService=new
		 * CcrisReportRetrievalService();
		 * ccrisReportRetrievalService.processReport(experianReportUrl, false);
		 */
		
		  public static final String RESOURCES_DIR; public static final String
		  OUTPUT_DIR;
		  
		  static { RESOURCES_DIR = "src//main//resources//"; OUTPUT_DIR =
		  "src//main//resources//output//"; }
		 
			  public static void main( String[] args ) { try {
				  boolean ccris=false;
						/*
						 * checking checking=new checking(); checking.convertToPDF();
						 */
						/*
						 * String name="Nor Hafiezah Binti Mohd Saufi"; name=name.replaceAll("Binti",
						 * "").trim().replaceAll("[ ]{2,}", " ");
						 * 
						 * String names="NOOR HAFIEZAH BINTI           MOHD SAUFI";
						 * names=names.replaceAll("BINTI", "").trim().replaceAll("[ ]{2,}", " ");
						 * if(name.equalsIgnoreCase(names)) { System.out.println("true"); }
						 */
					//DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
				 // SimpleDateFormat sdfIn = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					/*
					 * DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd HH:mm:ss");
					 * LocalDateTime now = LocalDateTime.now(); String updatedDate=dtf.format(now);
					 * SimpleDateFormat sdfIn1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); Date
					 * date = sdfIn1.parse(updatedDate); System.out.println(sdfIn1.format(date));
					 */
					/*
					 * String
					 * invalid="We are facing technical issue at the moment. Please try again later.2"
					 * ; int l=invalid.length(); String news=invalid.substring(0,
					 * invalid.length()-1);
					 */
				  String xmlResponse =" <ccris_individual_info></ccris_individual_info>";
							/*
							 * + "      <name>SYARIRAH BT MOHD AZHAR</name>\r\n" +
							 * "      <new_ic>971203-02-5630</new_ic>\r\n" +
							 * "      <note>NOTE: The NAME of subject provided by you is NOT CONSISTENT with the information in our databank.</note>\r\n"
							 */
				  		
				  String ccrisindividualinfo = StringUtils.substringBetween(xmlResponse, "<ccris_individual_info>", "</ccris_individual_info>");
				  if(ccrisindividualinfo!=null) {
					  ccris=true;
		    	   }else {
		    		   ccris=false;
		    	   }
					  System.out.println(ccrisindividualinfo);
				  } catch
			  (Exception e) { e.printStackTrace(); } }
			  
			 // public  String convertToPDF() throws Exception {
			
		        // the XSL FO file
		     /*   File xsltFile = new File(RESOURCES_DIR + "//NewStylesheet.xsl");
		        // the XML file which provides the input
		        StreamSource xmlSource = new StreamSource(new File(RESOURCES_DIR + "//data.xml"));
		        // create an instance of fop factory
		        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
		        // a user agent is needed for transformation
		        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
		        // Setup output
		        OutputStream out;
		        out = new java.io.FileOutputStream(OUTPUT_DIR + "//output.pdf");
		        

		        try {
		            // Construct fop with desired output format
		            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

		            // Setup XSLT
		            TransformerFactory factory = TransformerFactory.newInstance();
		            Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

		            // Resulting SAX events (the generated FO) must be piped through to
		            // FOP
		            Result res = new SAXResult(fop.getDefaultHandler());

		            // Start XSLT transformation and FOP processing
		            // That's where the XML is first transformed to XSL-FO and then
		            // PDF is created
		           transformer.transform(xmlSource, res);
		        } finally {
		            out.close();
		        }
		    }
		*/
				  
				  
				/*  File xsltFile = new File(RESOURCES_DIR + "//NewStylesheet.xsl");
			        // the XML file which provides the input
			        StreamSource xmlSource = new StreamSource(new File(RESOURCES_DIR + "//data.xml"));
			        // create an instance of fop factory
			        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
			        // a user agent is needed for transformation
			        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
			        // Setup output
			        String filename=OUTPUT_DIR +"950725-14-6373"+".pdf";
			        System.out.println(filename);
			        OutputStream out;
			        out =  new java.io.FileOutputStream(filename);
			      
			      //  System.out.println("File path: "+directoryPath.getAbsolutePath());
			        

			        try {
			            // Construct fop with desired output format
			            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

			            // Setup XSLT
			            TransformerFactory factory = TransformerFactory.newInstance();
			            Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

			            // Resulting SAX events (the generated FO) must be piped through to
			            // FOP
			            Result res = new SAXResult(fop.getDefaultHandler());

			            // Start XSLT transformation and FOP processing
			            // That's where the XML is first transformed to XSL-FO and then
			            // PDF is created
			           transformer.transform(xmlSource, res);
				  
				  
				  
				  
				  
				  
				  
				  
				  
				  
				  
				  
				  
				  
				  
			        
			  
			  }   finally {
		            out.close();
		        }
					return filename;
			  }*/
				  public  void convertToPDF() throws Exception {
					  File xsltFile = new File(RESOURCES_DIR + "//spkccs.xsl");
				        // the XML file which provides the input
					  String path=RESOURCES_DIR +"//data.xml";
					  AWSS3ServiceImpl awss3ServiceImpl=new AWSS3ServiceImpl();
					 
					//  FileOutputStream fos = new FileOutputStream(path, true);
					  
					/*
					 * File file=new File(path); if (file.exists() && file.isFile()) {
					 * file.delete(); }
					 */
					/*
					 * FileOutputStream fos = new FileOutputStream(path, false); byte[] b =
					 * xmlResponse.getBytes(); fos.write(b);
					 */
				      /*  StreamSource xmlSource = new StreamSource(new File(path));
				        // create an instance of fop factory
				        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
				        // a user agent is needed for transformation
				        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
				        // Setup output
				        String filename=OUTPUT_DIR+"999999"+".pdf";
				        System.out.println("========="+filename);
				        System.out.println(filename);
				        OutputStream out;
				        out =  new java.io.FileOutputStream(filename);
				      
				      //  System.out.println("File path: "+directoryPath.getAbsolutePath());
				        

				        try {
				            // Construct fop with desired output format
				            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

				            // Setup XSLT
				            TransformerFactory factory = TransformerFactory.newInstance();
				            Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

				            // Resulting SAX events (the generated FO) must be piped through to
				            // FOP
				            Result res = new SAXResult(fop.getDefaultHandler());

				            // Start XSLT transformation and FOP processing
				            // That's where the XML is first transformed to XSL-FO and then
				            // PDF is created
				           transformer.transform(xmlSource, res);
					       // fw.flush();
				  }   finally {
					  //Files.delete(Paths.get(path));
			          out.close();
			        //  fos.close();
			        //  
			      }
						return filename;
				
				  }*/
					  
						/*
						 * TransformerFactory tFactory = TransformerFactory.newInstance(); // specify
						 * the input xsl file location to apply the styles for the pdf // output file
						 * Transformer transformer = tFactory.newTransformer(new
						 * StreamSource(RESOURCES_DIR + "//spkccs.xsl"));
						 * transformer.setOutputProperty("method", "xhtml"); // specify the input xml
						 * file location transformer.transform(new StreamSource(RESOURCES_DIR
						 * +"//data.xml"), new StreamResult(new FileOutputStream(OUTPUT_DIR
						 * +"//ExperianReport.html"))); // Specifying the location of the html file (xml
						 * converted to html) String File_To_Convert = OUTPUT_DIR
						 * +"//ExperianReport.html"; String url = new
						 * File(File_To_Convert).toURI().toURL().toString(); System.out.println("" +
						 * url); // Specifying the location of the outpuf pdf file. String HTML_TO_PDF =
						 * OUTPUT_DIR+"//PdfFromXml.pdf"; OutputStream os = new
						 * FileOutputStream(HTML_TO_PDF); ITextRenderer renderer = new ITextRenderer();
						 * renderer.setDocument(url); renderer.layout(); renderer.createPDF(os);
						 * renderer.finishPDF(); File file=new File(HTML_TO_PDF); file.deleteOnExit();
						 * //String name= awss3ServiceImpl.uploadFile(HTML_TO_PDF);
						 * 
						 * os.close();
						 */
					  
					  
					  
					  
					  
					  
					  
					  
				  }
	}
//}
	


