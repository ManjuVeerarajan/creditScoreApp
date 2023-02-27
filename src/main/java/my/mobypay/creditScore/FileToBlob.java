package my.mobypay.creditScore;

import java.sql.Blob;
import java.sql.SQLException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.*;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.*;
import java.util.Base64;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class FileToBlob {
/*
	public static byte[] convertToBlob(String filename) throws IOException {
		byte[] fileContent = null;
		   try {
			fileContent = FileUtils.readFileToByteArray(new File(filename));
		   } catch (IOException e) {
			throw new IOException("Unable to convert file to byte array. " +
		              e.getMessage());
		   }
		   
		   System.out.println("fileContent " + fileContent);
		return fileContent;
	}*/
	
	 
	    public static void main(String[] args) throws Exception {
	        Connection connection = null;
	        String responseStr = null;
	        String nric = "990917-05-5034";
			String xml = "<xml>\r\n"
					+ "    <report_date>16 Jun 2022</report_date>\r\n"
					+ "    <summary>\r\n"
					+ "        <input_request>\r\n"
					+ "            <search_name>CHING MEI SIN</search_name>\r\n"
					+ "            <old_ic/>\r\n"
					+ "            <new_ic>990917-05-5034</new_ic>\r\n"
					+ "            <product_code>IRISS</product_code>\r\n"
					+ "            <nationality>MY</nationality>\r\n"
					+ "        </input_request>\r\n"
					+ "        <ccris_individual_info/>\r\n"
					+ "        <ccris_individual_addresses/>\r\n"
					+ "        <info_summary>\r\n"
					+ "            <credit_approval_count>0</credit_approval_count>\r\n"
					+ "            <credit_pending_count>0</credit_pending_count>\r\n"
					+ "            <special_attention_account_count>0</special_attention_account_count>\r\n"
					+ "            <legal_action_banking_count>0</legal_action_banking_count>\r\n"
					+ "            <existing_facility_count>0</existing_facility_count>\r\n"
					+ "            <bankruptcy_count>0</bankruptcy_count>\r\n"
					+ "            <legal_suit_count>0</legal_suit_count>\r\n"
					+ "            <trade_bureau_count>0</trade_bureau_count>\r\n"
					+ "            <enquiry_count>0</enquiry_count>\r\n"
					+ "            <interest_count>0</interest_count>\r\n"
					+ "        </info_summary>\r\n"
					+ "        <i_score>\r\n"
					+ "            <i_score>0</i_score>\r\n"
					+ "            <risk_grade>0</risk_grade>\r\n"
					+ "            <key_factor>\r\n"
					+ "                <item>ENTITY HAS INSUFFICIENT OR NO CCRIS AND EXPERIAN DATA AVAILABLE FOR THE SCORING</item>\r\n"
					+ "            </key_factor>\r\n"
					+ "            <na_iscore_legend/>\r\n"
					+ "            <error_message/>\r\n"
					+ "            <grade_format/>\r\n"
					+ "            <i_score_risk_grade_format_consumer/>\r\n"
					+ "        </i_score>\r\n"
					+ "        <person_company_interests/>\r\n"
					+ "        <previous_company_interests/>\r\n"
					+ "    </summary>\r\n"
					+ "    <banking_info>\r\n"
					+ "        <ccris_selected_by_you>\r\n"
					+ "            <entity_name>CHING MEI SIN</entity_name>\r\n"
					+ "            <entity_id2/>\r\n"
					+ "            <entity_id>990917-05-5034</entity_id>\r\n"
					+ "            <entity_key>32919295</entity_key>\r\n"
					+ "        </ccris_selected_by_you>\r\n"
					+ "        <ccris_banking_warning/>\r\n"
					+ "        <ccris_banking_summary>\r\n"
					+ "            <summary_credit_report>\r\n"
					+ "                <approved_count>0</approved_count>\r\n"
					+ "                <approved_amount>0</approved_amount>\r\n"
					+ "                <pending_count>0</pending_count>\r\n"
					+ "                <pending_amount>0</pending_amount>\r\n"
					+ "            </summary_credit_report>\r\n"
					+ "            <summary_liabilities>\r\n"
					+ "                <borrower>\r\n"
					+ "                    <outstanding>0</outstanding>\r\n"
					+ "                    <total_limit>0</total_limit>\r\n"
					+ "                    <fec_limit>0</fec_limit>\r\n"
					+ "                </borrower>\r\n"
					+ "                <legal_action_taken>N</legal_action_taken>\r\n"
					+ "                <special_attention_account>N</special_attention_account>\r\n"
					+ "            </summary_liabilities>\r\n"
					+ "        </ccris_banking_summary>\r\n"
					+ "        <ccris_banking_details>\r\n"
					+ "            <start_year>2021</start_year>\r\n"
					+ "            <end_year>2022</end_year>\r\n"
					+ "            <month>\r\n"
					+ "                <item>J</item>\r\n"
					+ "                <item>M</item>\r\n"
					+ "                <item>A</item>\r\n"
					+ "                <item>M</item>\r\n"
					+ "                <item>F</item>\r\n"
					+ "                <item>J</item>\r\n"
					+ "                <item>D</item>\r\n"
					+ "                <item>N</item>\r\n"
					+ "                <item>O</item>\r\n"
					+ "                <item>S</item>\r\n"
					+ "                <item>A</item>\r\n"
					+ "                <item>J</item>\r\n"
					+ "            </month>\r\n"
					+ "            <outstanding_credit/>\r\n"
					+ "            <credit_application/>\r\n"
					+ "            <special_attention_account/>\r\n"
					+ "            <facilities_remark/>\r\n"
					+ "            <status_remark/>\r\n"
					+ "            <legal_remark/>\r\n"
					+ "        </ccris_banking_details>\r\n"
					+ "    </banking_info>\r\n"
					+ "    <litigation_info>\r\n"
					+ "        <legal_suit_by_regno/>\r\n"
					+ "        <legal_suit_proclamation_by_regno/>\r\n"
					+ "        <others_known_legal_suit/>\r\n"
					+ "        <legal_suit_by_plaintiff/>\r\n"
					+ "        <person_bankruptcy/>\r\n"
					+ "    </litigation_info>\r\n"
					+ "    <trade_bureau>\r\n"
					+ "        <trade_bureau_entity_details/>\r\n"
					+ "    </trade_bureau>\r\n"
					+ "    <aml_sanction>\r\n"
					+ "        <aml_sanction_list_individual/>\r\n"
					+ "    </aml_sanction>\r\n"
					+ "    <enquiry>\r\n"
					+ "        <previous_enquiry>\r\n"
					+ "            <finance>\r\n"
					+ "                <item>\r\n"
					+ "                    <year>2022</year>\r\n"
					+ "                    <yearly_count>0</yearly_count>\r\n"
					+ "                    <month>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                    </month>\r\n"
					+ "                </item>\r\n"
					+ "                <item>\r\n"
					+ "                    <year>2021</year>\r\n"
					+ "                    <yearly_count>1</yearly_count>\r\n"
					+ "                    <month>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>1</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                    </month>\r\n"
					+ "                </item>\r\n"
					+ "                <item>\r\n"
					+ "                    <year>2020</year>\r\n"
					+ "                    <yearly_count>0</yearly_count>\r\n"
					+ "                    <month>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                    </month>\r\n"
					+ "                </item>\r\n"
					+ "            </finance>\r\n"
					+ "            <commercial>\r\n"
					+ "                <item>\r\n"
					+ "                    <year>2022</year>\r\n"
					+ "                    <yearly_count>0</yearly_count>\r\n"
					+ "                    <month>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                    </month>\r\n"
					+ "                </item>\r\n"
					+ "                <item>\r\n"
					+ "                    <year>2021</year>\r\n"
					+ "                    <yearly_count>0</yearly_count>\r\n"
					+ "                    <month>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                    </month>\r\n"
					+ "                </item>\r\n"
					+ "                <item>\r\n"
					+ "                    <year>2020</year>\r\n"
					+ "                    <yearly_count>0</yearly_count>\r\n"
					+ "                    <month>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                        <item>0</item>\r\n"
					+ "                    </month>\r\n"
					+ "                </item>\r\n"
					+ "            </commercial>\r\n"
					+ "        </previous_enquiry>\r\n"
					+ "    </enquiry>\r\n"
					+ "    <legend_gen2>\r\n"
					+ "        <na_iscore_legend/>\r\n"
					+ "    </legend_gen2>\r\n"
					+ "    <end>\r\n"
					+ "        <subscriber_name>MOBY MONEY SDN. BHD.</subscriber_name>\r\n"
					+ "        <username>MBMN WEBSERVICE</username>\r\n"
					+ "        <order_date>2022-06-16</order_date>\r\n"
					+ "        <order_time>12:33:10</order_time>\r\n"
					+ "        <userid>MBMN1</userid>\r\n"
					+ "        <order_id>160077952</order_id>\r\n"
					+ "    </end>\r\n"
					+ "</xml>";
			try {
				String response = convertToPDF(nric,xml);
			System.out.println("response" +response);
			 responseStr = convertXmlToBase64(response);
			System.out.println("responseStr" +responseStr);
			}catch(Exception e) {
				 e.printStackTrace();
			}
			
	        try {
	            File file = new File("C:\\Users\\sushm\\Downloads\\900117-05-5077.pdf");
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            connection = DriverManager.getConnection("jdbc:mysql://airapay-sandbox.c3rilhzfezwb.ap-southeast-1.rds.amazonaws.com:3306/airapay_dev", "admin",
	                    "admin123qwe");
	             // writeObject(file, connection);
	            writeObject(responseStr, connection);
	            System.out.println("main:");
	          // readObject(connection);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            connection.close();
	        }
	    }
	 
	  //  public static void writeObject(File file, Connection connection) throws Exception {
	    public static void writeObject(String file, Connection connection) throws Exception {
	        PreparedStatement pStmt = null;
	        ByteArrayOutputStream bAout = new ByteArrayOutputStream();
	        try {
	        /*	
	        	byte[] fileContent = null;
	 		   try {
	 			fileContent = FileUtils.readFileToByteArray(new File("C:\\Users\\sushm\\Downloads\\900117-05-5077.pdf"));
	 		   } catch (IOException e) {
	 			throw new IOException("Unable to convert file to byte array. " +
	 		              e.getMessage());
	 		   }
	 		   
	 		   System.out.println("fileContent " + fileContent);
	 		   
	 		   */
	            pStmt = connection.prepareStatement("insert into blob_test(id, base64) values(?, ?)");
	            pStmt.setInt(1, 1);
	           // pStmt.setBlob(2, new FileInputStream(new File("C:\\Users\\sushm\\Downloads\\900117-05-5077.pdf")));
	           // pStmt.setBytes(2, FileUtils.readFileToByteArray(new File("C:\\Users\\sushm\\Downloads\\900117-05-5077.pdf")));
	            pStmt.setString(2, file);
	            
	            pStmt.execute();
	        } finally {
	            bAout.close();
	            pStmt.close();
	        }
	    }
	 
	    public static void readObject(Connection connection) throws Exception {
	    	System.out.println("readObject:");
	        Statement statement = null;
	        ResultSet resultSet = null;
	        try {
	            statement = connection.createStatement();
	            resultSet = statement.executeQuery("select * from blob_test where id=3");
	            if (resultSet.next()) {
	                int fildId = resultSet.getInt("id");
	                Blob blob = resultSet.getBlob("pdfBlob");
	                // getBlob method of ResultSet is used to get Blob from database.
	                //Now we can use Blob to save data to file or transfer data to other place.
	                System.out.println("FileId:" + fildId);
	                System.out.println("Blob:" + blob);
	                int length = (int) blob.length();
	                // length() method will return size of Blob Object.
	                System.out.println("length:" + length);
	                String base64String = Base64.getEncoder().encodeToString(blob.getBytes(1L, length));
	                // Encode image byte array into base64
	                System.out.println("blob "+blob.getBytes(1L, length).length);
	                // Remove above comments to print image data
	            }
	        } finally {
	            statement.close();
	        }
	    }
	

public static String convertXmlToBase64(String out) {
	String xmlBase64 = null;
	try {
		System.out.println("Inside convertXmlToBase64 ");
	    File pdfFile = new File(out);
	    byte[] encoded = Files.readAllBytes(Paths.get(pdfFile.getAbsolutePath()));
	    Base64.Encoder enc = Base64.getEncoder();
	    byte[] strenc = enc.encode(encoded);
	    String encode = new String(strenc, "UTF-8");
	    pdfFile.delete();
	    
	    
		    xmlBase64 = encode;
	}catch(Exception ex) {
		System.out.println("Exception " +ex);
	}
	return xmlBase64;
}


public static String convertToPDF(String nricNumber, String xmlResponse) throws Exception {
	/*HashMap<String,String> dbvalues = dbconfig.getValueFromDB();
	Experianxmlfolder = dbvalues.get("Experianxmlfolder");
	Experianxslfolder = dbvalues.get("Experianxslfolder");
	ExperianHTMLfolder = dbvalues.get("ExperianHTMLfolder");
	ExperianPDFFolder = dbvalues.get("ExperianPDFFolder");*/
	String path = "D:\\var\\tmp\\xml" + "\\data.xml";
	TransformerFactory tFactory = TransformerFactory.newInstance();
	// specify the input xsl file location to apply the styles for the pdf
	// output file
	
	Transformer transformer = tFactory.newTransformer(new StreamSource("D:\\var\\tmp\\xsl\\" + "spkccs.xsl"));
	transformer.setOutputProperty("method", "xhtml");
	// specify the input xml file location
	// FileOutputStream fos = new FileOutputStream(path, true);

	/*
	 * File file=new File(path); if (file.exists() && file.isFile()) {
	 * file.delete(); }
	 */
	FileOutputStream fos = new FileOutputStream(path, false);
	byte[] b = xmlResponse.getBytes();
	fos.write(b);
	transformer.transform(new StreamSource(path),
			new StreamResult(new FileOutputStream("D:\\var\\tmp\\HTML\\" + "ExperianReport.html")));
	String File_To_Convert = "D:\\var\\tmp\\HTML\\" + "ExperianReport.html";
	String url = new File(File_To_Convert).toURI().toURL().toString();
	System.out.println("" + url);

	String filename = "D:\\var\\tmp\\PDF\\" + nricNumber + "test.pdf";
	System.out.println("FileName = " + filename);
	System.out.println(filename);
	OutputStream out;
	out = new java.io.FileOutputStream(filename);

	ITextRenderer renderer = new ITextRenderer();
	renderer.setDocument(url);
	renderer.layout();
	renderer.createPDF(out);
	System.out.println(" out " +out.toString());
	out.close();
	//FileUtils.re
	return filename;

}
}
	/*
	
	public static void main(String[] args) throws IOException {
		
		
		//b.getBytes(0, 0);
	
		
		try {
			byte[] blob = convertToBlob("C:\\Users\\sushm\\Downloads\\870710-14-5634.pdf");
			Blob b = null;
			b.setBytes(1, blob);
			File outputFile = new File("C:\\Users\\sushm\\Downloads\\\\whatever.pdf");
			FileOutputStream fout = new FileOutputStream(outputFile);
			//IOUtils.copy(b.getBytes(1, blob.length), fout);
			IOUtils.copy(b.getBinaryStream(), fout);
			System.out.println("blob " +blob.length);
		} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}*/
