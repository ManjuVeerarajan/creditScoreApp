package my.mobypay.creditScore.service;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import lombok.extern.slf4j.Slf4j;
import my.mobypay.creditScore.dao.CreditScoreConfigRepository;
import my.mobypay.creditScore.dao.CustomerCreditReports;
import my.mobypay.creditScore.dto.CreditCheckError;
import my.mobypay.creditScore.dto.CustomerCreditReportRequest;
import my.mobypay.creditScore.dto.UserConfirmCCRISEntityRequest;
import my.mobypay.creditScore.dto.UserSearchRequest;
import my.mobypay.creditScore.dto.UserTokensRequest;
import my.mobypay.creditScore.dto.Utility;
import my.mobypay.creditScore.dto.request.CcrisRequestXml;
import my.mobypay.creditScore.dto.request.TokensRequest;
import my.mobypay.creditScore.dto.response.Error;
import my.mobypay.creditScore.dto.response.Report;
import my.mobypay.creditScore.dto.response.Tokens;
import my.mobypay.creditScore.repository.CreditCheckErrorRepository;
import my.mobypay.creditScore.utility.EmailUtility;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.io.IOUtils;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.web.client.RestTemplate;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xhtmlrenderer.pdf.ITextRenderer;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.Reader;
import java.io.StringReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.stream.Collectors;

//@Slf4j
@Service
public class CcrisReportRetrievalService {

	private static Logger log = LoggerFactory.getLogger(CcrisReportRetrievalService.class);
	RestTemplate restTemplate = new RestTemplate();

	public static int PRETTY_PRINT_INDENT_FACTOR = 4;
	// private String experianReportUrl
	// ="https://b2buat.experian.com.my/index.php/moby/xml";
	private String experianReportUrl = "C:\\backupcode - Copy - Copy\\creditScore\\src\\main\\resources\\report.xml";

	@Autowired
	AWSS3ServiceImpl awss3ServiceImpl;

	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	CreditScoreConfigRepository creditScoreConfigRepository;


	//@Value("${ExperianURLXML}")
	private String ExperianURLXML ;

	// @Value("${ExperianUsername}")
	private String ExperianUsername;

	//@Value("${ExperianPassword}")
	private String ExperianPassword;

	//@Value("${Experianxmlfolder}")
	private String Experianxmlfolder;

	// @Value("${Experianxslfolder}")
	private String Experianxslfolder;

	//@Value("${ExperianPDFFolder}")
	private String ExperianPDFFolder;

	//@Value("${ExperianHTMLfolder}")
	private String ExperianHTMLfolder;

	@Autowired
	CcrisSearchService ccrisSearchService;

	@Autowired
	CreditCheckErrorRepository creditCheckErrorRepository;

	public static final String RESOURCES_DIR;
	public static final String OUTPUT_DIR;

	static {
		RESOURCES_DIR = "src//main//resources//";
		OUTPUT_DIR = "src//main//resources//output//";

	}

	public CustomerCreditReportRequest retrieveReport(UserTokensRequest userTokensRequest, boolean reportFlag,
			UserSearchRequest userSearchRequest, String triggerreconnectCount, String triggersleeptime, String to)
			throws Exception {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		// headers.setBasicAuth("MOBYUAT1", "Mobyuat.1");
		ExperianUsername = creditScoreConfigRepository.findValueFromName("ExperianUsername");
		ExperianPassword = creditScoreConfigRepository.findValueFromName("ExperianPassword");
		headers.setBasicAuth(ExperianUsername, ExperianPassword);
		ResponseEntity<String> response = null;
		boolean ExperianServerDownFlag = false;
		boolean checkingUserInErrorTable = false;
		String xmlRequest = null;
		String nric = null;
		int reconnectCount = Integer.parseInt(triggerreconnectCount);

		try {
			XmlMapper xmlMapper = new XmlMapper();

			TokensRequest tokensRequest = TokensRequest.builder().token1(userTokensRequest.getToken1())
					.token2(userTokensRequest.getToken2()).build();

			CcrisRequestXml ccrisXml = new CcrisRequestXml();
			ccrisXml.setRequest(tokensRequest);

			xmlRequest = xmlMapper.writeValueAsString(ccrisXml);
			/*
			 * System.out.println("***********request**************");
			 * log.info("***********request**************"); System.out.println(xmlRequest);
			 * log.info("Experian Report request :" + xmlRequest);
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}

		HttpEntity<String> request = new HttpEntity<String>(xmlRequest, headers);
		char[] k = xmlRequest.toString().toCharArray();
		log.info("xmlRequest in Report retrival " +xmlRequest);
		int count = 0;
		for (char v : k) {
			if (v == '<') {
				count++;
			}
		}

		log.info("_count = " + count + "_" + xmlRequest);
		if (count > 6) {
			int count1 = 0;
			CreditCheckError checkError = new CreditCheckError();
			do {
				ExperianURLXML = creditScoreConfigRepository.findValueFromName("ExperianURLXML");
				response = restTemplate.postForEntity(ExperianURLXML, request, String.class);
				System.out.println("***********response**************");
				System.out.println(response.getBody());
				log.info("Experian Report response:" + response.getBody());
				String checkcode = response.getBody().toString();
				Boolean check = response.getBody().toString().contains("Result is processing");
				log.info("Experian Report response:" + check);

				log.info("Value is present:" + response.getBody().contains(checkcode));

				if (response.getBody().toString().contains("102")
						&& response.getBody().toString().contains("Result is processing")) {

					if (count1 < reconnectCount) {

						count1++;
						int finalretivalcount = count1;
						log.info("getting the total retival count : " + finalretivalcount);
						// EmailUtility emailUtility=new EmailUtility();
						// emailUtility.sentEmail(String.valueOf(finalretivalcount));
						log.info("checking the retival value" + finalretivalcount);
						String codes = "102";
						checkError = creditCheckErrorRepository.findbyErrorcode(userSearchRequest.getEntityId(), codes);
						DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
						LocalDateTime now = LocalDateTime.now();
						String updatedDate = dtf.format(now);
						SimpleDateFormat dateParser = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						Date date = dateParser.parse(updatedDate);
						System.out.println(date);
						if (checkError != null) {
							log.info("DB update for retivalCount:" + date + "====" + finalretivalcount);
							creditCheckErrorRepository.updateRetivalCount(finalretivalcount,
									userSearchRequest.getEntityId(), date, codes);
							// log.info("DB update for retivalCount:" + dbsaveRetrival);
						} else {
							try {
								log.info("new Error Entry to ErrorTable");
								CreditCheckError checkError1 = new CreditCheckError();
							//	String message = "we are unable to process your application as our 3rd party services provider is not available at the moment. Please try again later.";
								String message = "Experian API connection issue";
								String code = "102";
								checkError1.setErrorCode(code);
								checkError1.setErrorStatus(message);
								checkError1.setName(userSearchRequest.getName());
								checkError1.setNric(userSearchRequest.getEntityId());
								checkError1.setRetrivalCount(finalretivalcount);
								checkError1.setCreatedAt(new Date());
								checkError1.setUpdatedAt(new Date());
								log.info("saving to ErrorTable" + checkError1);
								creditCheckErrorRepository.save(checkError1);
							} catch (Exception e) {
								System.out.println(e.getLocalizedMessage());
							}
						}
						// Integer
						// dbsaveRetrival=creditCheckErrorRepository.updateRetivalCount(finalretivalcount,userSearchRequest.getEntityId());
						// log.info("DB update for retivalCount:" + dbsaveRetrival);
						response = null;
						log.info("Setting the time delay again" + triggersleeptime);
						int triggersleeptimes = Integer.parseInt(triggersleeptime);
						delay(triggersleeptimes);

					}
				} else {
					count1 = reconnectCount;
					return processReport(response.getBody(), ExperianServerDownFlag, reportFlag, userSearchRequest, 0,
							to);
				}

			} while (count1 < reconnectCount);
			if (count1 >= reconnectCount) {
				log.info("Getting total number of retival COunt : " + count1);

				System.out.println("Getting total number of retival COunt : " + count1);
				ExperianServerDownFlag = true;
				// EmailUtility emailUtility=new EmailUtility();
				// emailUtility.sentEmail("we are unable to process your application as our 3rd
				// party services provider is not available at the moment. Please try again
				// later.");
				return processReport("Result is processing", ExperianServerDownFlag, reportFlag, userSearchRequest,
						count1, to);
			}
			return null;

		} else {
			log.info("Experian without body");
			return processReport("Request body is empty", ExperianServerDownFlag, reportFlag, userSearchRequest, 0, to);

		}
	}

	private void delay(long l) {
		try {
			Thread.sleep(l);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private ResponseEntity<String> TryRequest(String experianURLXML2, HttpEntity<String> request2) {
		log.info("Try retrying the connection====" + experianURLXML2 + "========" + request2);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.postForEntity(experianURLXML2, request2, String.class);
		System.out.println("***********response**************");
		System.out.println(response.getBody());
		log.info("Experian Report response:" + response.getBody());
		String checkcode = response.getBody().toString();
		Boolean check = response.getBody().toString().contains("Result is processing");
		log.info("Experian Report response:" + check);
		log.info("Value is present:" + response.getBody().contains(checkcode));

		return response;

	}

	/**
	 * @param content
	 * @param experianServerDownFlag
	 * @param reportFlag
	 * @param userSearchRequest
	 * @param userSearchRequest
	 * @param count1
	 * @param to
	 * @param retrivalCount
	 * @return
	 * @throws Exception
	 */
	public CustomerCreditReportRequest processReport(String content, boolean experianServerDownFlag, boolean reportFlag,
			UserSearchRequest userSearchRequest, int count1, String to) throws Exception {

		// System.out.println(content);
		CustomerCreditReportRequest report = null;
		Error error = new Error();
		NodeList list = null;
		Node node = null;
		boolean ccris = false;
		String name = "";

		String filepaths = "";
		// boolean InvalidFlag=false;
		log.info("checking true or false-------------"
				+ (!content.equals("Request body is empty") && !content.equals("Result is processing")));
		System.out.println(!content.equals("Request body is empty") && !content.equals("Result is processing"));
		try {
			if (!content.isEmpty() && !content.contains("Request body is empty")
					&& !content.contains("Result is processing")) {
				String responsess = "";
				XmlFormatter formatter = new XmlFormatter();
				String xmlResponse = formatter.format(content);
				System.out.println(xmlResponse + "");
				String nricNumber = StringUtils.substringBetween(xmlResponse, "<new_ic>", "</new_ic>");
				String xmlName = StringUtils.substringBetween(xmlResponse, "<name>", "</name>");
				/*
				 * String ccrisindividualinfo = StringUtils.substringBetween(xmlResponse,
				 * "<ccris_individual_info>", "</ccris_individual_info>");
				 * if(ccrisindividualinfo!=null) { ccris=true; }else { ccris=false; }
				 */
				String searchName = StringUtils.substringBetween(xmlResponse, "<search_name>", "</search_name>");
				String iscores = StringUtils.substringBetween(xmlResponse, "<i_score>", "</i_score>").trim()
						.replaceAll("<i_score>", "");

				int iscorevalue = Integer.parseInt(iscores);
				if (searchName != null) {
					responsess = searchName.trim().replaceAll("[ ]{2,}", " ");
				} else {
					responsess = xmlName.trim().replaceAll("[ ]{2,}", " ");
				}
				if (responsess.contains("BINTI")) {
					responsess = responsess.replaceAll("BINTI", "").trim().replaceAll("[ ]{2,}", " ");
				} else if (responsess.contains("BIN")) {
					responsess = responsess.replaceAll("BIN", "").trim().replaceAll("[ ]{2,}", " ");
				} else if (responsess.contains("Bin")) {
					responsess = responsess.replaceAll("Bin", "").trim().replaceAll("[ ]{2,}", " ");
				} else if (responsess.contains("BT")) {
					responsess = responsess.replaceAll("BT", "").trim().replaceAll("[ ]{2,}", " ");
				} else if (responsess.contains("bt")) {
					responsess = responsess.replaceAll("bt", "").trim().replaceAll("[ ]{2,}", " ");
				} else if (responsess.contains("BTE")) {
					responsess = responsess.replaceAll("BTE", "").trim().replaceAll("[ ]{2,}", " ");
				} else if (responsess.contains("bte")) {
					responsess = responsess.replaceAll("bte", "").trim().replaceAll("[ ]{2,}", " ");
				} else if (responsess.contains("BY")) {
					responsess = responsess.replaceAll("BY", "").trim().replaceAll("[ ]{2,}", " ");
				} else if (responsess.contains("by")) {
					responsess = responsess.replaceAll("by", "").trim().replaceAll("[ ]{2,}", " ");
				}

				/*
				 * else if(responsess.contains("B")) { responsess=responsess.replaceAll("B",
				 * "").trim().replaceAll("[ ]{2,}", " "); }else if(responsess.contains("b")) {
				 * responsess=responsess.replaceAll("b", "").trim().replaceAll("[ ]{2,}", " ");
				 * }
				 */
				else {
					responsess = responsess.replaceAll("Binti", "").trim().replaceAll("[ ]{2,}", " ");
				}
			//	boolean check = true;
				 boolean check=userSearchRequest.getServiceName()!=null &&
				 userSearchRequest.getServiceName().equalsIgnoreCase("GetReport");
				log.info("check " +check);
				if ( reportFlag==true &&  check == true) {
					log.info("Inside reportFlag==true &&  check == true ");
					// System.out.println(userSearchRequest.getEntityId()+"new report
					// nric============");
					System.out.println(nricNumber + "new report nric============");

					String filepath = convertToPDF(nricNumber, xmlResponse);
					System.out.println(filepath + "file is generated or not");

					String filename = awss3ServiceImpl.uploadFile(filepath);
					String path = request.getRequestURL().toString();

					String[] urlvalue = path.split("//");

					String contextvalue = urlvalue[1].toString();
					String[] g = contextvalue.split("/");
					// String finalvalue = g[0].toString(); 
					String finalvalue = creditScoreConfigRepository.findValueFromName("sandbox.server"); 
					log.info("Server name " +finalvalue);

					filepaths = "https://" + finalvalue + "/api/creditchecker/DownloadExperianReport?fileName="
							+ filename + "";
					File file = new File(filename);
					log.info("delete the file from directory" + filename);
					System.out.println("delete the file from directory" + filename);
					file.delete();

					DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
					/*
					 * DocumentBuilder dBuilder = dbFactory.newDocumentBuilder(); // Document doc =
					 * Document doc = dBuilder.parse(new InputSource(content));
					 */
					/*
					 * InputStream is = new InputSource(names);
					 * 
					 * DocumentBuilder db = dbFactory.newDocumentBuilder();
					 * 
					 * Document doc = db.parse(is);
					 */
					DocumentBuilder db = dbFactory.newDocumentBuilder();
					Document doc = db.parse(new InputSource(new StringReader(xmlResponse)));

					/*
					 * DocumentBuilder builder =
					 * DocumentBuilderFactory.newInstance().newDocumentBuilder(); InputSource src =
					 * new InputSource(); src.setCharacterStream(new StringReader(content));
					 * Document doc = builder.parse(src);
					 */

					// code and error
					/*
					 * String codes= doc.getElementsByTagName("token2").item(0).getTextContent();
					 * log.info("rrrrrrrrrrrrrrrrr:"+codes); if(codes!=null) {
					 */

					list = doc.getElementsByTagName("input_request");
					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "search_name") {
									name = sibling.getTextContent();
									break;
								}
							}

						}

					}

					list = doc.getElementsByTagName("ccris_individual_info");
					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "name") {
									name = sibling.getTextContent();

									ccris = false;
									log.info("Value present " + name + "====" + ccris);
									break;
								} else {
									ccris = true;
									log.info("Value not present " + name + "====" + ccris);
									break;
								}
							}
							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "new_ic") {
									name = sibling.getTextContent();

									ccris = false;
									log.info("Value present " + name + "====" + ccris);
									break;
								} else {
									ccris = true;
									log.info("Value not present " + name + "====" + ccris);
									break;
								}
							}

						}

					} else {
						ccris = true;
						log.info("Value not present " + name + "====" + ccris);
					}

					// nric new_ic

					String nric = doc.getElementsByTagName("new_ic").item(0).getTextContent();
					/*
					 * if(nric!=null) { ccris=true; log.info("Name present "+nric+"===="+ccris);
					 * }else { ccris=false; log.info("Name is not  present "+nric+"===="+ccris); }
					 */

					// bankruptcy_count
					Integer bankruptcy_count = Integer
							.valueOf(doc.getElementsByTagName("bankruptcy_count").item(0).getTextContent());
					log.info("bankruptcy_count :" + bankruptcy_count);

					// legal_suit_count
					int legalsuitcount = 0;
					list = doc.getElementsByTagName("info_summary");
					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "legal_suit_count") {
									legalsuitcount = Integer.valueOf(sibling.getTextContent());
									break;
								}
							}

						}

					}

					/*
					 * String legal_status = null; if (legalsuitcount > 0) {
					 * log.info("legal_suit_count is greater than zero. Verifying legal status");
					 * legal_status=
					 * doc.getElementsByTagName("legal_status").item(0).getTextContent(); //
					 * if(legal_status!=null) {
					 * 
					 * System.out.println("legal_status :" + legal_status); } }
					 * 
					 */

					String legal_status = null;
					list = doc.getElementsByTagName("outstanding_credit");
					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "legal_status") {
									legalsuitcount = Integer.valueOf(sibling.getTextContent());
									break;
								}
							}

						}

					}

					// tradebureaucount
					Integer trade_bureau_count = Integer
							.valueOf(doc.getElementsByTagName("trade_bureau_count").item(0).getTextContent());
					System.out.println("trade_bureau_count :" + trade_bureau_count);

					// i_score
					/*
					 * String data = doc.getElementsByTagName("i_score").item(0).getTextContent();
					 * System.out.println("**************");
					 * 
					 * List scoreList = data.lines().filter(s -> (!s.isBlank() ||
					 * !s.isEmpty())).collect(Collectors.toList()); String score =
					 * scoreList.get(0).toString().trim().substring(0, 3); Integer iscore =
					 * Integer.valueOf(score); System.out.println("i_score :" + iscore);
					 */

					Integer iscore = 0;
					String iscore_list = null;
					list = doc.getElementsByTagName("i_score");

					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "i_score") {
									iscore_list = sibling.getTextContent();
									iscore = Integer.valueOf(iscore_list);
									break;
								}
							}

						}

					}
					/*
					 * list = doc.getElementsByTagName("special_attention_account");
					 * 
					 * if (list.getLength() > 0 && IsEmpty(list) && legalsuitcount>0) { // for(int i
					 * = 0; i < list.getLength(); i++) { // dueDateInfo="not avaliable"; Node nNode
					 * = list.item(0); NodeList nestedList = nNode.getChildNodes(); for (int j = 0;
					 * j < nestedList.getLength(); j++) {
					 * 
					 * if (nestedList.item(j).getNodeType() == Node.TEXT_NODE &&
					 * nestedList.item(j).getNextSibling() != null) { Node sibling =
					 * nestedList.item(j).getNextSibling();
					 * 
					 * if (sibling.getNodeName() != null && sibling.getNodeName() == "legal_status")
					 * { iscore_list = sibling.getTextContent();
					 * iscore=Integer.valueOf(iscore_list); break; } }
					 * 
					 * }
					 * 
					 * }
					 */

					/*
					 * if(doc.getElementsByTagName("legal_status").toString()!=null) { String ss =
					 * doc.getElementsByTagName("legal_status").item(0).getTextContent();
					 * System.out.println(ss); }
					 */

					// i_score_risk_grade

					int i_score_risk_grade = Integer
							.valueOf(doc.getElementsByTagName("risk_grade").item(0).getTextContent());

					// i_score_grade_formate

					String iscoregradeformat = doc.getElementsByTagName("grade_format").item(0).getTextContent();

					// legal_action_banking_count

					int legalactionbankingcount = Integer
							.valueOf(doc.getElementsByTagName("legal_action_banking_count").item(0).getTextContent());
					System.out.println("legal_action_banking_count :" + legalactionbankingcount);

					// borroweroutstanding

					list = doc.getElementsByTagName("trade_bureau_entity_detail");
					String dueDateInfo = null;
					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "payment_aging") {
									dueDateInfo = sibling.getTextContent();
									break;
								}
							}

						}

					}

					double borroweroutstanding = 0;

					list = doc.getElementsByTagName("borrower");
					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "outstanding") {
									borroweroutstanding = Double.valueOf(sibling.getTextContent());
									break;
								}
							}

						}

					}
					// legal suit count

					// }

					// Banking credit approved count
					list = doc.getElementsByTagName("summary_credit_report");

					int Banking_credit_approved_count = 0;
					double Banking_credit_approved_amount = 0;
					int Banking_credit_pending_count = 0;
					double Banking_credit_pending_amount = 0;

					node = list.item(0);

					if (node.getNodeType() == Node.ELEMENT_NODE) {

						Element element = (Element) node;
						Banking_credit_approved_count = Integer
								.valueOf(element.getElementsByTagName("approved_count").item(0).getTextContent());
						Banking_credit_approved_amount = Double
								.valueOf(element.getElementsByTagName("approved_amount").item(0).getTextContent());
						Banking_credit_pending_count = Integer
								.valueOf(element.getElementsByTagName("pending_count").item(0).getTextContent());
						Banking_credit_pending_amount = Double
								.valueOf(element.getElementsByTagName("pending_amount").item(0).getTextContent());
					}

					// xml string

					/*
					 * Reader fileReader = new FileReader(content); BufferedReader bufReader = new
					 * BufferedReader(fileReader); StringBuilder sb = new StringBuilder(); String
					 * line = bufReader.readLine(); while( line != null){
					 * sb.append(line).append("\n"); line = bufReader.readLine(); } String
					 * xml2String = sb.toString();
					 * log.info("XML to String using BufferedReader : ");
					 * 
					 * bufReader.close();
					 */

					// JSON String

					JSONObject xmlJSONObj = XML.toJSONObject(content);
					String jsonPrettyPrintString = xmlJSONObj.toString(PRETTY_PRINT_INDENT_FACTOR);
					System.out.println(jsonPrettyPrintString);

					//

					NodeList list1 = doc.getElementsByTagName("legal_suit_by_regno");
					String casesettled = null;
					String casewithdraw = null;
					boolean pendingstatus = false;

					if (list1.getLength() > 0 && IsEmpty(list1)) {
						Node nNode = list1.item(0);
						NodeList listItem = nNode.getChildNodes();
						// NodeList itemChild = listItem.Item(0);
						System.out.println((listItem.item(0).getNodeType() == Node.TEXT_NODE)
								&& (listItem.item(0).getNextSibling() != null));
						if (listItem.item(0).getNodeType() == Node.TEXT_NODE
								&& listItem.item(0).getNextSibling() != null) {
							Node sibling = listItem.item(0).getNextSibling();
							// Node sibling1=sibling.getNextSibling();
							NodeList list11 = sibling.getChildNodes();

							for (int jj = 0; jj < list11.getLength(); jj++) {
								if (list11.item(jj).getNodeType() == Node.TEXT_NODE
										&& list11.item(jj).getNextSibling() != null) {
									Node siblings = list11.item(jj).getNextSibling();
									if (siblings.getNodeName() != null) {
										switch (siblings.getNodeName()) {
										case "case_settled":
											casesettled = siblings.getTextContent();
											break;
										case "case_withdrawn":
											casewithdraw = siblings.getTextContent();
											break;
										case "pending_status_as_at_date":
											pendingstatus = siblings.getTextContent() != null;
											pendingstatus = true;

										}

									}
								}
							}
						}
					}
					
					//banking_info
					
					list = doc.getElementsByTagName("banking_info");
					boolean entity_key = false;
					boolean entity_id = false;
					String special_attention_account = null ;
					String facility = null;
					node = list.item(0);

					if (list.getLength() > 0 && IsEmpty(list)) {
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "ccris_selected_by_you") {
									Element element = (Element) node;
									entity_key = element.getElementsByTagName("entity_key").item(0)
											.getTextContent() != null;
									log.info("#### entity_key " +entity_key + " value is " +element.getElementsByTagName("entity_key").item(0)
											.getTextContent() );
									entity_id = element.getElementsByTagName("entity_id").item(0)
											.getTextContent() != null;
									log.info("#### entity_id " +entity_id + " value is "+element.getElementsByTagName("entity_id").item(0)
											.getTextContent());
								}
							}
								if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
										&& nestedList.item(j).getNextSibling() != null) {
									Node sibling = nestedList.item(j).getNextSibling();
									System.out.println("sibling " +sibling );
									//Node siblings = nestedList.item(3);
									if (sibling.getNodeName() != null && sibling.getNodeName() == "ccris_banking_summary") {
										System.out.println("summary_liabilities "  );
										Element element = (Element) node;
										special_attention_account = element.getElementsByTagName("special_attention_account").item(0)
												.getTextContent() ;
										System.out.println("special_attention_account " +special_attention_account );
										
									}
									if (sibling.getNodeName() != null && sibling.getNodeName() == "ccris_banking_details") {
										Element element = (Element) node;
										facility = element.getElementsByTagName("facility").item(0)
												.getTextContent();
										System.out.println("#### facility " +facility);
										
									}
								}
							
						}
					}

					
					/*
					 * myWriter.close(); myWriter.flush();
					 */
					log.info("#### legalsuitcount #### " +legalsuitcount);
					report = CustomerCreditReportRequest.builder().name(responsess).nric(nric)
							.bankruptcyCount(bankruptcy_count).legalSuitCount(legalsuitcount)
							.tradeBureauCount(trade_bureau_count).iScore(iscore).iScoreRiskGrade(i_score_risk_grade)
							.iScoreGradeFormat(iscoregradeformat).legalActionBankingCount(legalactionbankingcount)
							.borrowerOutstanding(borroweroutstanding)
							.bankingCreditApprovedCount(Banking_credit_approved_count)
							.bankingCreditApprovedAmount(Banking_credit_approved_amount)
							.bankingCreditPendingCount(Banking_credit_pending_count)
							.bankingCreditPendingAmount(Banking_credit_pending_amount).xmlString(xmlResponse)
							.Criss(ccris)/* .jsonString(xmlResponse) */.casesettled(casesettled)
							.casewithdrawn(casewithdraw).paymentaging(dueDateInfo).PendingStatus(pendingstatus)
							.LegalstatusCount(legalsuitcount).downaloadfilepath(filepaths).entityId(entity_id).entityKey(entity_key).specialAttentionAccount(special_attention_account).facility(facility)// *
																							// .InvalidUserFlag(InvalidFlag)
																							// */
							.build();
					return report;

				} else {
					/*
					 * FileWriter myWriter = new FileWriter(experianReportUrls);
					 * myWriter.write(names);
					 */
					String filepath = convertToPDF(nricNumber, xmlResponse);
					log.info("filepath in else loop " +filepath);

					String filename = awss3ServiceImpl.uploadFile(filepath);
					String path = request.getRequestURL().toString();

					String[] urlvalue = path.split("//");

					String contextvalue = urlvalue[1].toString();
					String[] g = contextvalue.split("/");
					String finalvalue = creditScoreConfigRepository.findValueFromName("sandbox.server"); 
					log.info("Server name " +finalvalue);

					filepaths = "https://" + finalvalue + "/api/creditchecker/DownloadExperianReport?fileName="
							+ filename + "";
					File file = new File(filename);
					log.info("delete the file from directory" + filename);
					System.out.println("delete the file from directory" + filename);
					file.delete();
					DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
					/*
					 * DocumentBuilder dBuilder = dbFactory.newDocumentBuilder(); // Document doc =
					 * Document doc = dBuilder.parse(new InputSource(content));
					 */
					/*
					 * InputStream is = new InputSource(names);
					 * 
					 * DocumentBuilder db = dbFactory.newDocumentBuilder();
					 * 
					 * Document doc = db.parse(is);
					 */
					DocumentBuilder db = dbFactory.newDocumentBuilder();
					Document doc = db.parse(new InputSource(new StringReader(xmlResponse)));

					/*
					 * DocumentBuilder builder =
					 * DocumentBuilderFactory.newInstance().newDocumentBuilder(); InputSource src =
					 * new InputSource(); src.setCharacterStream(new StringReader(content));
					 * Document doc = builder.parse(src);
					 */

					// code and error
					/*
					 * String codes= doc.getElementsByTagName("token2").item(0).getTextContent();
					 * log.info("rrrrrrrrrrrrrrrrr:"+codes); if(codes!=null) {
					 */

					list = doc.getElementsByTagName("input_request");
					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "search_name") {
									name = sibling.getTextContent();
									break;
								}
							}

						}

					}

					list = doc.getElementsByTagName("ccris_individual_info");
					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "name") {
									name = sibling.getTextContent();
									ccris = false;
									log.info("Value present " + name);
									break;
								} else {
									ccris = true;
									log.info("Value not present " + name);
									break;
								}

							}
							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "new_ic") {
									name = sibling.getTextContent();
									ccris = false;
									log.info("Value present " + name);
									break;
								} else {
									ccris = true;
									log.info("Value not present " + name);
									break;
								}

							}

						}

					} else {
						ccris = true;
						log.info("Value not present " + name + "====" + ccris);
					}

					// nric new_ic

					String nric = doc.getElementsByTagName("new_ic").item(0).getTextContent();
					/*
					 * if(nric!=null) { ccris=true; log.info("ccris is present"+ccris+"====="+nric);
					 * 
					 * }else { log.info("ccris is not present"+ccris+"====="+nric); ccris=false; }
					 */

					// bankruptcy_count
					Integer bankruptcy_count = Integer
							.valueOf(doc.getElementsByTagName("bankruptcy_count").item(0).getTextContent());
					System.out.println("bankruptcy_count :" + bankruptcy_count);

					// legal_suit_count
					int legalsuitcount = 0;
					list = doc.getElementsByTagName("info_summary");
					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "legal_suit_count") {
									legalsuitcount = Integer.valueOf(sibling.getTextContent());
									break;
								}
							}

						}

					}

					/*
					 * String legal_status = null; if (legalsuitcount > 0) {
					 * log.info("legal_suit_count is greater than zero. Verifying legal status");
					 * legal_status=
					 * doc.getElementsByTagName("legal_status").item(0).getTextContent(); //
					 * if(legal_status!=null) {
					 * 
					 * System.out.println("legal_status :" + legal_status); } }
					 * 
					 */

					String legal_status = null;
					list = doc.getElementsByTagName("outstanding_credit");
					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "legal_status") {
									legalsuitcount = Integer.valueOf(sibling.getTextContent());
									break;
								}
							}

						}

					}

					// tradebureaucount
					Integer trade_bureau_count = Integer
							.valueOf(doc.getElementsByTagName("trade_bureau_count").item(0).getTextContent());
					System.out.println("legal_suit_count :" + trade_bureau_count);

					// i_score
					/*
					 * String data = doc.getElementsByTagName("i_score").item(0).getTextContent();
					 * System.out.println("**************");
					 * 
					 * List scoreList = data.lines().filter(s -> (!s.isBlank() ||
					 * !s.isEmpty())).collect(Collectors.toList()); String score =
					 * scoreList.get(0).toString().trim().substring(0, 3); Integer iscore =
					 * Integer.valueOf(score); System.out.println("i_score :" + iscore);
					 */

					Integer iscore = 0;
					String iscore_list = null;
					list = doc.getElementsByTagName("i_score");

					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "i_score") {
									iscore_list = sibling.getTextContent();
									iscore = Integer.valueOf(iscore_list);
									break;
								}
							}

						}

					}
					/*
					 * list = doc.getElementsByTagName("special_attention_account");
					 * 
					 * if (list.getLength() > 0 && IsEmpty(list) && legalsuitcount>0) { // for(int i
					 * = 0; i < list.getLength(); i++) { // dueDateInfo="not avaliable"; Node nNode
					 * = list.item(0); NodeList nestedList = nNode.getChildNodes(); for (int j = 0;
					 * j < nestedList.getLength(); j++) {
					 * 
					 * if (nestedList.item(j).getNodeType() == Node.TEXT_NODE &&
					 * nestedList.item(j).getNextSibling() != null) { Node sibling =
					 * nestedList.item(j).getNextSibling();
					 * 
					 * if (sibling.getNodeName() != null && sibling.getNodeName() == "legal_status")
					 * { iscore_list = sibling.getTextContent();
					 * iscore=Integer.valueOf(iscore_list); break; } }
					 * 
					 * }
					 * 
					 * }
					 */

					/*
					 * if(doc.getElementsByTagName("legal_status").toString()!=null) { String ss =
					 * doc.getElementsByTagName("legal_status").item(0).getTextContent();
					 * System.out.println(ss); }
					 */

					// i_score_risk_grade

					int i_score_risk_grade = Integer
							.valueOf(doc.getElementsByTagName("risk_grade").item(0).getTextContent());

					// i_score_grade_formate

					String iscoregradeformat = doc.getElementsByTagName("grade_format").item(0).getTextContent();

					// legal_action_banking_count

					int legalactionbankingcount = Integer
							.valueOf(doc.getElementsByTagName("legal_action_banking_count").item(0).getTextContent());
					System.out.println("legal_action_banking_count :" + legalactionbankingcount);

					// borroweroutstanding

					list = doc.getElementsByTagName("trade_bureau_entity_detail");
					String dueDateInfo = null;
					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "payment_aging") {
									dueDateInfo = sibling.getTextContent();
									break;
								}
							}

						}

					}

					double borroweroutstanding = 0;

					list = doc.getElementsByTagName("borrower");
					if (list.getLength() > 0 && IsEmpty(list)) {
						// for(int i = 0; i < list.getLength(); i++) {
						// dueDateInfo="not avaliable";
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "outstanding") {
									borroweroutstanding = Double.valueOf(sibling.getTextContent());
									break;
								}
							}

						}

					}
					// legal suit count

					// }

					// Banking credit approved count
					list = doc.getElementsByTagName("summary_credit_report");

					int Banking_credit_approved_count = 0;
					double Banking_credit_approved_amount = 0;
					int Banking_credit_pending_count = 0;
					double Banking_credit_pending_amount = 0;

					node = list.item(0);

					if (node.getNodeType() == Node.ELEMENT_NODE) {

						Element element = (Element) node;
						Banking_credit_approved_count = Integer
								.valueOf(element.getElementsByTagName("approved_count").item(0).getTextContent());
						Banking_credit_approved_amount = Double
								.valueOf(element.getElementsByTagName("approved_amount").item(0).getTextContent());
						Banking_credit_pending_count = Integer
								.valueOf(element.getElementsByTagName("pending_count").item(0).getTextContent());
						Banking_credit_pending_amount = Double
								.valueOf(element.getElementsByTagName("pending_amount").item(0).getTextContent());
					}

					// xml string

					/*
					 * Reader fileReader = new FileReader(content); BufferedReader bufReader = new
					 * BufferedReader(fileReader); StringBuilder sb = new StringBuilder(); String
					 * line = bufReader.readLine(); while( line != null){
					 * sb.append(line).append("\n"); line = bufReader.readLine(); } String
					 * xml2String = sb.toString();
					 * log.info("XML to String using BufferedReader : ");
					 * 
					 * bufReader.close();
					 */

					// JSON String

					JSONObject xmlJSONObj = XML.toJSONObject(content);
					String jsonPrettyPrintString = xmlJSONObj.toString(PRETTY_PRINT_INDENT_FACTOR);
					System.out.println(jsonPrettyPrintString);

					//

					NodeList list1 = doc.getElementsByTagName("legal_suit_by_regno");
					String casesettled = null;
					String casewithdraw = null;
					boolean pendingstatus = false;

					if (list1.getLength() > 0 && IsEmpty(list1)) {
						Node nNode = list1.item(0);
						NodeList listItem = nNode.getChildNodes();
						// NodeList itemChild = listItem.Item(0);
						System.out.println((listItem.item(0).getNodeType() == Node.TEXT_NODE)
								&& (listItem.item(0).getNextSibling() != null));
						if (listItem.item(0).getNodeType() == Node.TEXT_NODE
								&& listItem.item(0).getNextSibling() != null) {
							Node sibling = listItem.item(0).getNextSibling();
							// Node sibling1=sibling.getNextSibling();
							NodeList list11 = sibling.getChildNodes();

							for (int jj = 0; jj < list11.getLength(); jj++) {
								if (list11.item(jj).getNodeType() == Node.TEXT_NODE
										&& list11.item(jj).getNextSibling() != null) {
									Node siblings = list11.item(jj).getNextSibling();
									if (siblings.getNodeName() != null) {
										switch (siblings.getNodeName()) {
										case "case_settled":
											casesettled = siblings.getTextContent();
											break;
										case "case_withdrawn":
											casewithdraw = siblings.getTextContent();
											break;
										case "pending_status_as_at_date":
											pendingstatus = siblings.getTextContent() != null;
											pendingstatus = true;

										}

									}
								}
							}
						}
					}
					
					//banking_info
					
					list = doc.getElementsByTagName("banking_info");
					boolean entity_key = false;
					boolean entity_id = false;
					String special_attention_account = null;
					String facility = null;
					node = list.item(0);

					if (list.getLength() > 0 && IsEmpty(list)) {
						Node nNode = list.item(0);
						NodeList nestedList = nNode.getChildNodes();
						for (int j = 0; j < nestedList.getLength(); j++) {

							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();

								if (sibling.getNodeName() != null && sibling.getNodeName() == "ccris_selected_by_you") {
									Element element = (Element) node;
									entity_key = element.getElementsByTagName("entity_key").item(0)
											.getTextContent() != null;
									log.info("entity_key " +entity_key + " value is " +element.getElementsByTagName("entity_key").item(0)
											.getTextContent() );
									entity_id = element.getElementsByTagName("entity_id").item(0)
											.getTextContent() != null;
									log.info("entity_id " +entity_id + " value is "+element.getElementsByTagName("entity_id").item(0)
											.getTextContent());
								}
							}
							if (nestedList.item(j).getNodeType() == Node.TEXT_NODE
									&& nestedList.item(j).getNextSibling() != null) {
								Node sibling = nestedList.item(j).getNextSibling();
								//Node siblings = nestedList.item(3);
								if (sibling.getNodeName() != null && sibling.getNodeName() == "ccris_banking_summary") {
									Element element = (Element) node;
									special_attention_account = element.getElementsByTagName("special_attention_account").item(0)
											.getTextContent() ;
									log.info("special_attention_account " +special_attention_account );
									
								}
								if (sibling.getNodeName() != null && sibling.getNodeName() == "ccris_banking_details") {
									Element element = (Element) node;
									if(element.getElementsByTagName("facility").item(0) != null) {
									facility = element.getElementsByTagName("facility").item(0)
											.getTextContent();
									log.info("facility " +facility);
									}
									
								}
							}
						}
					}

					
					/*
					 * myWriter.close(); myWriter.flush();
					 */
					
					log.info("++++ legalsuitcount ++++ " +legalsuitcount);
					report = CustomerCreditReportRequest.builder().name(responsess).nric(nric)
							.bankruptcyCount(bankruptcy_count).legalSuitCount(legalsuitcount)
							.tradeBureauCount(trade_bureau_count).iScore(iscore).iScoreRiskGrade(i_score_risk_grade)
							.iScoreGradeFormat(iscoregradeformat).legalActionBankingCount(legalactionbankingcount)
							.borrowerOutstanding(borroweroutstanding)
							.bankingCreditApprovedCount(Banking_credit_approved_count)
							.bankingCreditApprovedAmount(Banking_credit_approved_amount)
							.bankingCreditPendingCount(Banking_credit_pending_count)
							.bankingCreditPendingAmount(Banking_credit_pending_amount).xmlString(xmlResponse)
							/* .jsonString(xmlResponse) */.casesettled(casesettled).casewithdrawn(casewithdraw)
							.paymentaging(dueDateInfo).PendingStatus(pendingstatus).LegalstatusCount(legalsuitcount)
							.downaloadfilepath(filepaths).Criss(ccris).entityId(entity_id).entityKey(entity_key).specialAttentionAccount(special_attention_account).facility(facility)// * .InvalidUserFlag(InvalidFlag) */
							.build();
					// System.out.println(report.toString() + "===========================");

				}

			} else if (experianServerDownFlag == true) {

				log.info("Experian Server Flag" + experianServerDownFlag);
				log.info("sending count to controller " + count1);
				// log.info("experian Retrival Count : "+retrivalCount);
				//String message = "we are unable to process your application as our 3rd party services provider is not available at the moment. Please try again later.";
				String message = "Experian API connection issue";
				String code = "102";
				report = CustomerCreditReportRequest.builder().error(message).code(code)
						.ExperianServerFlag(experianServerDownFlag).RetrivalCount(count1).build();
				log.info("coming inside Experain server flag" + report);
			} else {

				// String errormessage=
				// doc.getElementsByTagName("error").item(0).getTextContent();

				// InvalidFlag=true;
				String message = "Invalid Input";
				String code = "400";
				report = CustomerCreditReportRequest.builder().error(message).code(code)/*
																						 * RetrivalCount(retrivalCount)
																						 */
						/* .InvalidUserFlag(InvalidFlag) */.build();
				log.info("coming inside else block" + report);
			}
		} catch (Exception e) {
			e.printStackTrace();
			EmailUtility emailUtility = new EmailUtility();
			emailUtility.sentEmail(e.getLocalizedMessage(), to);

		}
		return report;

	}

	private boolean IsEmpty(NodeList list1) {
		boolean d = list1.item(0).hasChildNodes();
		return d;
	}

	/*
	 * @SuppressWarnings("deprecation") public CustomerCreditReportRequest
	 * retrieveReport() throws Exception { // return return
	 * processReport(experianReportUrl, false, false, null, 0, ExperianHTMLfolder);
	 * 
	 * String xmlRequest = "<xml><request><token1/><token2/></request></xml>";
	 * 
	 * boolean ExperianServerDownFlag = false;
	 * 
	 * char[] k = xmlRequest.toString().toCharArray(); int count = 0; for (char v :
	 * k) { if (v == '<') { count++; } }
	 * 
	 * log.info("_count = " + count + "_" + xmlRequest); if (count >= 6) {
	 * 
	 * if (xmlRequest.contains("102") &&
	 * xmlRequest.contains("Result is processing")) { ExperianServerDownFlag = true;
	 * return processReport("Result is processing", ExperianServerDownFlag,
	 * ExperianServerDownFlag, null, count, xmlRequest); } else {
	 * 
	 * return processReport(experianReportUrl, ExperianServerDownFlag,
	 * ExperianServerDownFlag, null, count, xmlRequest); }
	 * 
	 * } else { log.info("Experian without body"); return
	 * processReport("Request body is empty", ExperianServerDownFlag,
	 * ExperianServerDownFlag, null, count, xmlRequest);
	 * 
	 * }
	 * 
	 * }
	 */

	public String FilepathdownloadforExisitingCustomer(String xmlResponse, String nricnumber) throws Exception {
		System.out.println(Experianxmlfolder);
		System.out.println(nricnumber + "==================");
		String filepaths = "";
		String filepath = convertToPDF(nricnumber, xmlResponse);
		System.out.println(filepath);

		String filename = awss3ServiceImpl.uploadFile(filepath);
		String path = request.getRequestURL().toString();

		String[] urlvalue = path.split("//");

		String contextvalue = urlvalue[1].toString();
		String[] g = contextvalue.split("/");
		String finalvalue = creditScoreConfigRepository.findValueFromName("sandbox.server"); 
		log.info("Server name " +finalvalue);

		filepaths = "https://" + finalvalue + "/api/creditchecker/DownloadExperianReport?fileName=" + filename + "";
		File file = new File(filename);
		log.info("delete the file from directory" + filename);
		System.out.println("delete the file from directory" + filename);
		file.delete();
		return filepaths;

	}

	public String convertToPDF(String nricNumber, String xmlResponse) throws Exception {

		Experianxmlfolder = creditScoreConfigRepository.findValueFromName("Experianxmlfolder");
		Experianxslfolder = creditScoreConfigRepository.findValueFromName("Experianxslfolder");
		ExperianHTMLfolder = creditScoreConfigRepository.findValueFromName("ExperianHTMLfolder");
		ExperianPDFFolder = creditScoreConfigRepository.findValueFromName("ExperianPDFFolder");
		String path = Experianxmlfolder + "//data.xml";
		TransformerFactory tFactory = TransformerFactory.newInstance();
		// specify the input xsl file location to apply the styles for the pdf
		// output file
		
		Transformer transformer = tFactory.newTransformer(new StreamSource(Experianxslfolder + "//spkccs.xsl"));
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
				new StreamResult(new FileOutputStream(ExperianHTMLfolder + "//ExperianReport.html")));
		String File_To_Convert = ExperianHTMLfolder + "//ExperianReport.html";
		String url = new File(File_To_Convert).toURI().toURL().toString();
		System.out.println("" + url);

		String filename = ExperianPDFFolder + nricNumber + ".pdf";
		System.out.println("=========" + filename);
		System.out.println(filename);
		OutputStream out;
		out = new java.io.FileOutputStream(filename);

		ITextRenderer renderer = new ITextRenderer();
		renderer.setDocument(url);
		renderer.layout();
		renderer.createPDF(out);
		out.close();
		return filename;

	}
	
	
	
	}
