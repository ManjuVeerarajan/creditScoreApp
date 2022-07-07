package my.mobypay.creditScore.controller;

import lombok.extern.slf4j.Slf4j;
import my.mobypay.creditScore.DBConfig;
import my.mobypay.creditScore.dao.ApplicationSettings;
import my.mobypay.creditScore.dao.ApplicationSettingsRepository;
import my.mobypay.creditScore.dao.TokensRequest;
import my.mobypay.creditScore.dao.CreditCheckerLogs;
import my.mobypay.creditScore.dao.CreditScoreConfigRepository;
import my.mobypay.creditScore.dao.CustomerCreditReports;
import my.mobypay.creditScore.dao.CustomerSpendingLimitResponse;
import my.mobypay.creditScore.dao.ExperianPropertyResponse;
import my.mobypay.creditScore.dao.ExperianReportResponse;
import my.mobypay.creditScore.dao.ReportEntity;
import my.mobypay.creditScore.dao.UserRequest;

import my.mobypay.creditScore.dto.CustomerCreditError;
import my.mobypay.creditScore.dto.CreditCheckResponse;
import my.mobypay.creditScore.dto.CustomerCreditReportRequest;
import my.mobypay.creditScore.dto.UserConfirmCCRISEntityRequest;
import my.mobypay.creditScore.dto.UserSearchRequest;

import my.mobypay.creditScore.dto.Utility;
//import my.mobypay.creditScore.dto.request.CreditCheckerEmail;
import my.mobypay.creditScore.dto.response.CcrisXml;
import my.mobypay.creditScore.dto.response.Error;

import my.mobypay.creditScore.dto.response.Tokens;
import my.mobypay.creditScore.repository.AWSS3Service;
import my.mobypay.creditScore.repository.CreditCheckErrorRepository;
import my.mobypay.creditScore.repository.CreditCheckerAuthRepository;
import my.mobypay.creditScore.repository.CreditCheckerLogRepository;
import my.mobypay.creditScore.repository.CustomerCreditReportsRepository;
import my.mobypay.creditScore.repository.CustomerUserTokenRepository;
//import my.mobypay.creditScore.repository.EmailSendingRepository;
import my.mobypay.creditScore.repository.ExperianPropertyRepository;
import my.mobypay.creditScore.repository.ReportEntityRepository;
import my.mobypay.creditScore.repository.UserRequestEntityRepository;
import my.mobypay.creditScore.service.CcrisReportRetrievalService;
import my.mobypay.creditScore.service.CcrisSearchService;
import my.mobypay.creditScore.service.CcrisUnifiedService;
import my.mobypay.creditScore.service.SimulatorService;
import my.mobypay.creditScore.service.XmlFormatter;
import my.mobypay.creditScore.utility.EmailUtility;
import my.mobypay.ekyc.dao.CheckResultRequest;
import my.mobypay.ekyc.dao.CheckResultResponse;
import my.mobypay.ekyc.dao.InitializeRequest;
import my.mobypay.ekyc.dao.InitializeResponse;
import my.mobypay.ekyc.service.EkycService;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.hibernate.service.ServiceRegistry;
import org.jasypt.encryption.StringEncryptor;
import org.jasypt.encryption.pbe.PooledPBEStringEncryptor;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.SimpleStringPBEConfig;
import org.jasypt.properties.PropertyValueEncryptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.amazonaws.internal.config.InternalConfig.Factory;
import com.fasterxml.jackson.core.JsonProcessingException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zoloz.api.sdk.client.OpenApiClient;

import javassist.bytecode.stackmap.BasicBlock.Catch;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.InetAddress;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping(value = "/api")
@RestController
public class CcrisController {

	// @Autowired
	// EmailSendingRepository emailSendingRepository;

	@Autowired
	UserRequestEntityRepository userRequestRepository;

	@Autowired
	CreditCheckErrorRepository creditCheckErrorRepository;

	@Autowired
	ExperianPropertyRepository experianPropertyRepository;

	@Autowired
	ReportEntityRepository reportEntityRepository;

	@Autowired
	CustomerCreditReportsRepository customerCreditReportsRepository;
	@Autowired
	CcrisUnifiedService ccrisUnifiedService;
	@Autowired
	CcrisReportRetrievalService ccrisReportRetrievalService;

//	 @Autowired
	OpenApiClient openApiClient = new OpenApiClient();
//	 @Autowired
	EkycService ekycService = new EkycService();
	/*
	 * @Autowired private CcrisReportRetrievalService ccrisReportRetrievalService;
	 */
	@Autowired
	CustomerUserTokenRepository customerUserTokenRepository;

	@Autowired
	private AWSS3Service awsService;

	@Autowired
	ApplicationSettingsRepository appSettings;


	@Autowired
	SimulatorService simulatorService;
	
	@Autowired
	DBConfig dbconfig;
	
	@Autowired
	CreditCheckerLogRepository creditCheckerLogRepository;
	
	@Autowired
	CreditCheckerAuthRepository creditCheckerAuthRepository;
	
	@Value("${spring.datasource.url}")
	String datasourceUrl;
	
	@Value("${spring.datasource.username}")
	String username;
	
	@Value("${spring.datasource.password}")
	String password;
	
	/*
	 @Autowired
	CreditScoreConfigRepository creditScoreConfigRepository;
	
	@Value("${zolos.server}")
	private String hostUrl;

	@Value("${zolos.initialize}")
	private String initializeApi;

	@Value("${zolos.checkresult}")
	private String checkResultApi;

	@Value("${clientId}")
	private String clientId;

	@Value("${merchant.publickey}")
	private String merchantPublicKey;

	@Value("${merchant.privatekey}")
	private String merchantPrivatekey;
*/
	boolean ispresent = false;
	protected String simulator = null;
	protected String hostUrl = null;
	protected String clientId = null;
	protected String merchantPrivatekey = null;
	protected String merchantPublicKey = null;
	protected String initializeApi = null;
	protected String checkResultApi = null;
	
	// String ServerDownError="we are unable to process your application as our 3rd party services provider is not available at the moment. Please try again  later.";
	
	
	String ServerDownError = "Experian API connection issue.";
	CustomerCreditReportRequest customercreditreportrequest = null;
	// private static final log log = log.getlog(CcrisController.class);
	/*
	 * @PostMapping("/ccris-search") public CcrisXml ccrisSearch(@RequestBody
	 * UserSearchRequest userSearchRequest) throws Exception { CcrisSearchService
	 * ccrisSearchService = new CcrisSearchService();
	 * 
	 * log.info("=1111111=========" + userSearchRequest.getEntityId().length());
	 * CcrisXml ccrisXml = ccrisSearchService.ccrisSearch(userSearchRequest);
	 * 
	 * if (ccrisXml.getError().contains("Invalid New IC No")) {
	 * ccrisXml.setCode(ccrisXml.getCode()); ccrisXml.setError(ccrisXml.getError());
	 * return ccrisXml; } else { return ccrisXml; }
	 * 
	 * }
	 * 
	 * @PostMapping("/ccris-confirm") public Tokens ccrisConfirm(@RequestBody
	 * UserConfirmCCRISEntityRequest userConfirmCCRISEntityRequest) throws Exception
	 * { CcrisSearchService ccrisSearchService = new CcrisSearchService();
	 * ccrisSearchService.ccrisConfirm(userConfirmCCRISEntityRequest);
	 * 
	 * return ccrisSearchService.ccrisConfirm(userConfirmCCRISEntityRequest); }
	 */
	/*
	 * @PostMapping("/ccris-retrieve") public Report retrieveReport(@RequestBody
	 * UserTokensRequest userTokensRequest) { CcrisReportRetrievalService
	 * ccrisReportRetrievalService = new CcrisReportRetrievalService(); return
	 * ccrisReportRetrievalService.retrieveReports(userTokensRequest); }
	 */

	/*
	 * @PostMapping("/api/creditchecker/CreditCheckOnRegisterUat") // public
	 * CreditCheckResponse processReport(@RequestBody UserSearchRequest
	 * userSearchRequest){ public CreditCheckResponse processReport(@RequestParam
	 * String requestbody){
	 * 
	 * log.info("Request :"+ userSearchRequest.toString());
	 * saveRequestToDB(userSearchRequest);
	 * 
	 * CcrisUnifiedService ccrisUnifiedService = new CcrisUnifiedService();
	 * CreditCheckResponse creditCheckResponse =
	 * ccrisUnifiedService.getCcrisReport(requestbody); log.info("Response :"+
	 * creditCheckResponse.toString()); //
	 * saveResponseToDB(userSearchRequest,creditCheckResponse); return
	 * creditCheckResponse; }
	 */

	private boolean RetriveCustomerDetails(String Nric) {
		ispresent = customerCreditReportsRepository.findByName(Nric) != null;
		/*
		 * if(ispresent) { log.info("Appending existing nric with old");
		 * CustomerCreditReports customerCreditReports = new CustomerCreditReports();
		 * customerCreditReports.setNric(Nric+"_old"); log.info("After append "
		 * +customerCreditReports.getNric());
		 * customerCreditReportsRepository.save(customerCreditReports); }
		 */
		return ispresent;
		// TODO Auto-generated method stub findByNameAndTime

	}

	public StringEncryptor strongHibernateStringEncryptor() {
	    PooledPBEStringEncryptor encryptor = new PooledPBEStringEncryptor();
	    SimpleStringPBEConfig config = new SimpleStringPBEConfig();
	  //  config.setPassword("password");
	    config.setPassword("Moby1234");
	    config.setAlgorithm("PBEWithMD5AndDES");
	    config.setPoolSize("1");
	    encryptor.setConfig(config);
	    return encryptor;
	}
	
	
	
	@Transactional
	public boolean retrieveNricFromDB(String nric) {
		log.info("Inside retrieveNricFromDB ");	
		
		boolean ispresent = false;

		Session session = null;
		Transaction transaction = null;
		 String decrypted = null;
		try {
			// SessionFactory factory = HibernateUtil.getSessionFactory();
			// SessionFactory factory = new
			// AnnotationConfiguration().configure().buildSessionFactory();
			Configuration config = new Configuration();
			config.configure();
			
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml")
					.addAnnotatedClass(CustomerCreditReports.class).buildSessionFactory();
			/*
			StandardPBEStringEncryptor strongEncryptor = new StandardPBEStringEncryptor();
			  HibernatePBEEncryptorRegistry registry =
			      HibernatePBEEncryptorRegistry.getInstance();
			  registry.registerPBEStringEncryptor("strongHibernateStringEncryptor", strongEncryptor);
			  */
			session = factory.openSession();
	            
			transaction = session.beginTransaction();
			String daysExpire = appSettings.findValueFromName("daysExpire");

			log.info("daysExpire " + daysExpire);
			String hqlQuery = "SELECT p.nric from cc_customerCreditReports p WHERE p.nric = " + nric
					+ " AND p.UpdatedAt >= date_sub(now(),interval " + daysExpire + ")";
			org.hibernate.query.Query query = session.createSQLQuery(hqlQuery);
			log.info("Query Response" + query.getResultList());
			if (!query.getResultList().isEmpty()) {
				log.info("Query Response not NUll");
				ispresent = true;
			} else if (query.getResultList().isEmpty()) {
				log.info("Query Response NUll");
				ispresent = false;
			}

			transaction.commit();
		} catch (Exception e) {
			System.out.println("exception " + e);
		}
		finally {
		if(session != null) {
			log.info("session " +session.toString());
			//session.close();
			session.getSessionFactory().close();
			//session.disconnect();
			log.info("session after close" +session.toString());
		}
		}
		return ispresent;
	}
	
	
	
	@Transactional
	public Object retrieveNameNricFromDB(String nric) {
		boolean ispresent = false;

		Session session = null;
		Object dbResponse = null;
		Transaction transaction = null;
		try {
			// SessionFactory factory = HibernateUtil.getSessionFactory();
			// SessionFactory factory = new
			// AnnotationConfiguration().configure().buildSessionFactory();
			Configuration config = new Configuration();
			config.configure();
			
			// local SessionFactory bean created
			// SessionFactory sessionFactory = config.buildSessionFactory();
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml")
					.addAnnotatedClass(CustomerCreditReports.class).buildSessionFactory();
			session = factory.openSession();
			transaction = session.beginTransaction();
			// TODO
			// List<ApplicationSettings> inputDays = appSettings.findAll();
			// ApplicationSettings expireDays = inputDays.get(6);
			// String daysExpire = expireDays.getValue();
			String hqlQuery = "SELECT p.name,p.nric from cc_customerCreditReports p WHERE p.nric= "+nric;
			org.hibernate.query.Query query = session.createSQLQuery(hqlQuery);
			log.info("Query Response" + query.getResultList());
			if (!query.getResultList().isEmpty()) {
				log.info("Query Response not NUll");
				ispresent = true;
				 List<Object[]> response = query.getResultList();
					System.out.println("dbResponse " + response.get(0));
					dbResponse =  response.get(0);
				log.info("dbResponse " + dbResponse);
			} else if (query.getResultList().isEmpty()) {
				
				log.info("Query Response NUll");
				ispresent = false;
			}

			transaction.commit();
		} catch (Exception e) {
			System.out.println("exception " + e);
		}
		finally {
		if(session != null) {
			log.info("session " +session.toString());
			session.close();
			//session.disconnect();
			log.info("session after close" +session.toString());
		}
		}
		return dbResponse;
	}

	@SuppressWarnings("null")
	@PostMapping("/creditchecker/CreditCheckOnRegisterUats")
	public Object processReports(@RequestBody UserSearchRequest userSearchRequest) throws Exception {
		/*
		 * String key="experian-erroremail-cc"; String
		 * emailSending=experianPropertyRepository.findemailIdbyName(key);
		 * System.out.println(emailSending+"====================="); CreditCheckerEmail
		 * emailSendings=emailSendingRepository.findEmailId(); String
		 * names=emailSendings.getCc();
		 * System.out.println(emailSendings.getTo()+"============="+names);
		 */
		Error error = new Error();
		List<String> triggersleep = new LinkedList<String>();
		// Integer
		// dbsaveRetrival=creditCheckErrorRepository.updateRetivalCount(1,userSearchRequest.getEntityId());
		// System.out.println(dbsaveRetrival);
		TokensRequest checkToken = new TokensRequest();
		// String TokenMap=null;
		/*
		 * String
		 * TokenMap=customerUserTokenRepository.findTokenByNric(userSearchRequest.
		 * getEntityId()); String split[]=TokenMap.split(","); String
		 * token1=split[0].toString(); String token2=split[1].toString();
		 * System.out.println(token1+"====="+token2);
		 */
		log.info("Inside CreditCheckOnRegisterUats for user " + userSearchRequest.getName() + "entity "
				+ userSearchRequest.getEntityId());

		Map<String, String> ExperianPropertyValue = new LinkedHashMap<String, String>();
		boolean reportFlag = false;

		HashMap<String,String> dbvalues = dbconfig.getValueFromDB();
		CreditCheckResponse checkcreditscoreResponse = null;
		ExperianPropertyResponse experianPropertyResponse = new ExperianPropertyResponse();
		triggersleep.add("experian-trigger-time");
		triggersleep.add("experian-trigger-count");
		triggersleep = experianPropertyRepository.findvalueandName(triggersleep);
		log.info("Experian trigger :" + triggersleep);
		String triggersleeptime = triggersleep.get(0);
		String triggerreconnectCount = triggersleep.get(1);
		System.out.println(triggersleeptime + "========" + triggerreconnectCount);
		log.info("Request :" + userSearchRequest.toString());
		String nricnumber = NricRegchecking(userSearchRequest.getEntityId());
		// Integer retivalCount =
		// creditCheckErrorRepository.findbynric(userSearchRequest.getEntityId());
		Integer retivalCount = 0;
		/*
		 * int finalretivalvalue=Integer.parseInt(retivalCount); if(finalretivalvalue<3)
		 * { finalretivalvalue++; String
		 * updatedretrivalCount=creditCheckErrorRepository.updateRetivalCount(String.
		 * valueOf(finalretivalvalue)); }
		 */
		// System.out.println(retivalCount);
	//	String simulator = creditScoreConfigRepository.findValueFromName("simulator.call");
		simulator = dbvalues.get("simulator.call")	;	
		log.info("Call Simulator :" + simulator);
		CustomerSpendingLimitResponse res = new CustomerSpendingLimitResponse();
		if (simulator.equals("true")) {
			if ((userSearchRequest.getEntityId().contains("500101")
					|| userSearchRequest.getEntityId().contains("501230")
					|| userSearchRequest.getEntityId().contains("501231"))
					|| (userSearchRequest.getName().contains("WRONG NAME")
							|| userSearchRequest.getName().contains("ABDULLAH BIN MALIK")
							|| userSearchRequest.getName().contains("LARRY HENG")
							|| userSearchRequest.getName().contains("BILL CLINTON")
							|| userSearchRequest.getName().contains("DEVI THANAPAKIAM"))) {
				log.info("Calling Simulator");
				JSONObject request = new JSONObject();
				request.put("entityId", userSearchRequest.getEntityId());
				request.put("name", userSearchRequest.getName());

				res = creditCheckerSimulatorForSpendingLimit(request);
				log.info("response from simulator " + res);
				log.info("Status code " + res.getStatusCode());
				if (res.getStatusCode() != null) {
					log.info("Inside  res.getStatusCode()!= null");
					
					//To add logs in DB
					/*
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(res.toString());
					saveLogsToDB(ccLogs);
					*/
					return res;
				}
			}
		}
		
		if(res != null && res.getStatusCode()== null) {
			log.info("Inside  res.getStatusCode()== null" );
		if (nricnumber.length() == 14) {
			saveRequestToDB(userSearchRequest);
			String name = userSearchRequest.getName().toUpperCase().replaceAll("[ ]{2,}", " ");

			if (name.contains("BINTI")) {
				name = name.replaceAll("BINTI", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("BIN")) {
				name = name.replaceAll("BIN", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("Bin")) {
				name = name.replaceAll("Bin", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("BT")) {
				name = name.replaceAll("BT", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("bt")) {
				name = name.replaceAll("bt", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("BTE")) {
				name = name.replaceAll("BTE", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("bte")) {
				name = name.replaceAll("bte", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("BY")) {
				name = name.replaceAll("BY", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("by")) {
				name = name.replaceAll("by", "").trim().replaceAll("[ ]{2,}", " ");
			}

			/*
			 * else if(name.contains("B")) { name=name.replaceAll("B",
			 * "").trim().replaceAll("[ ]{2,}", " "); }else if(name.contains("b")) {
			 * name=name.replaceAll("b", "").trim().replaceAll("[ ]{2,}", " "); }
			 */
			else {
				name = name.replaceAll("Binti", "").trim().replaceAll("[ ]{2,}", " ");
			}
			
			
			String Nric = userSearchRequest.getEntityId();
			String regexexpression = Nric.replaceAll("-", "");
			ispresent = retrieveNricFromDB(regexexpression);
			log.info("ispresent flag value " + ispresent);
			if (ispresent == true) {
				 String inputResponse = customerCreditReportsRepository.find(userSearchRequest.getName(),regexexpression);
				
				// Object inputResponseName = retrieveNameNricFromDB(regexexpression);
				 Object inputResponseName =  customerCreditReportsRepository.findByNricName(regexexpression);
				log.info("inputResponse: " + inputResponse);
				String response = customerCreditReportsRepository.find(name, regexexpression);
				log.info("response: " + response);
				if (response != null) {
					String splits[] = response.split(",");
					String responseName = splits[0].toString();
					String responseNric = splits[1].toString();
					userSearchRequest.setName(name);

					log.info("responseName " + responseName);
					log.info("name " + name);

					log.info("responseNric " + responseNric);
					log.info("regexexpression " + regexexpression);

					if (responseName.equalsIgnoreCase(name) && responseNric.equalsIgnoreCase(regexexpression)) {
						log.info("name and nric matched!!");
						String xmlresponse = customerCreditReportsRepository.findbyXMLpath(regexexpression);
						String jsonString = customerCreditReportsRepository.findbynameandnric(regexexpression);
						if (xmlresponse != null) {
							log.info("xmlresponse: " + xmlresponse);
							log.info("jsonString in controller: " + jsonString);
							CustomerSpendingLimitResponse jsonresponse = new ObjectMapper().readValue(jsonString,
									CustomerSpendingLimitResponse.class);
							log.info("customer already exist so returning json response" + jsonresponse);
							
							//To add logs in DB
							/*
							CreditCheckerLogs ccLogs = new CreditCheckerLogs();
							ccLogs.setRequest(userSearchRequest.toString());
							ccLogs.setResponse(jsonresponse.toString());
							saveLogsToDB(ccLogs);
							*/
							
							return jsonresponse;
						} else {
							log.info("xmlresponse is empty!!: ");
							CustomerSpendingLimitResponse jsonresponse = new CustomerSpendingLimitResponse();
							jsonresponse.setIsNricExist(true);
							jsonresponse.setIsNameNricMatched(true);
							jsonresponse.setIsRegistrationAllowed(false);
							jsonresponse.setMaximumAllowedInstallments(0);
							jsonresponse.setMaximumSpendingLimit(0);
							jsonresponse.setStatusCode("1");
							jsonresponse.setErrorMessage(
									"We are sorry,We are unable to provide AiraPay services to you. Upon our internal checks and verifications, we regret to inform you that you did not meet certain requirements we are looking for to enable the instalment payments under AiraPay for your account.");
							// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);
							
							//To add logs in DB
							/*
							CreditCheckerLogs ccLogs = new CreditCheckerLogs();
							ccLogs.setRequest(userSearchRequest.toString());
							ccLogs.setResponse(jsonresponse.toString());
							saveLogsToDB(ccLogs);
							*/
							return jsonresponse;
						}

					} 
					else if (! responseName.equals(name)) {
						CustomerSpendingLimitResponse jsonresponse = new CustomerSpendingLimitResponse();
						jsonresponse.setIsNricExist(false);
						jsonresponse.setIsNameNricMatched(false);
						jsonresponse.setIsRegistrationAllowed(false);
						jsonresponse.setMaximumAllowedInstallments(0);
						jsonresponse.setMaximumSpendingLimit(0);
						jsonresponse.setStatusCode("404");
						// jsonresponse.setErrorMessage(
						// "Oops, maybe it is us and not you, but we can’t seem to validate this MyKad
						// number/name! Probably it was not in a correct format. For MyKad No, please
						// key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name,
						// please ensure the name is keyed in exactly as per your MyKad i.e with
						// Bin/Binti/ A/L / A/P and without any abbreviations.\"");

						// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);

						jsonresponse.setErrorMessage("Invalid Input"); // 10-05
						SavetoCreditCheckError(jsonresponse.getStatusCode(), jsonresponse.getErrorMessage(), name,
								regexexpression, 0);
						
						//To add logs in DB
						/*
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(jsonresponse.toString());
						saveLogsToDB(ccLogs);
						*/
						return jsonresponse;
						
					}
					else {
						/*
						 * error.setErrorcode("404"); error.setErrormessage();
						 * 
						 * SavetoCreditCheckError(error,name,regexexpression); return error;
						 */
						log.info("name and nric not matched!!");
						CustomerSpendingLimitResponse jsonresponse = new CustomerSpendingLimitResponse();
						jsonresponse.setIsNricExist(false);
						jsonresponse.setIsNameNricMatched(false);
						jsonresponse.setIsRegistrationAllowed(false);
						jsonresponse.setMaximumAllowedInstallments(0);
						jsonresponse.setMaximumSpendingLimit(0);
						jsonresponse.setStatusCode("400");
						// jsonresponse.setErrorMessage(
						// "Oops, maybe it is us and not you, but we can’t seem to validate this MyKad
						// number/name! Probably it was not in a correct format. For MyKad No, please
						// key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name,
						// please ensure the name is keyed in exactly as per your MyKad i.e with
						// Bin/Binti/ A/L / A/P and without any abbreviations.\"");

						// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);

						jsonresponse.setErrorMessage("Invalid Input"); // 10-05
						SavetoCreditCheckError(jsonresponse.getStatusCode(), jsonresponse.getErrorMessage(), name,
								regexexpression, 0);
						
						//To add logs in DB
						/*
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(jsonresponse.toString());
						saveLogsToDB(ccLogs);
						*/
						return jsonresponse;
					}
				} else if (inputResponse != null) {

					String splits[] = inputResponse.split(",");
					String responseName = splits[0].toString();
					String responseNric = splits[1].toString();
					if (responseName.equalsIgnoreCase(userSearchRequest.getName())
							&& responseNric.equalsIgnoreCase(regexexpression)) {
						String xmlresponse = customerCreditReportsRepository.findbyXMLpath(regexexpression);
						String jsonString = customerCreditReportsRepository.findbynameandnric(regexexpression);
						if (xmlresponse != null) {
							CustomerSpendingLimitResponse jsonresponse = new ObjectMapper().readValue(jsonString,
									CustomerSpendingLimitResponse.class);
							log.info("customer already exist so returning json response" + jsonresponse);
							return jsonresponse;
						} else {
							// log.info("coming inside the error path==============" + jsonresponse);
							CustomerSpendingLimitResponse jsonresponse = new CustomerSpendingLimitResponse();
							jsonresponse.setIsNricExist(true);
							jsonresponse.setIsNameNricMatched(true);
							jsonresponse.setIsRegistrationAllowed(false);
							jsonresponse.setMaximumAllowedInstallments(0);
							jsonresponse.setMaximumSpendingLimit(0);
							jsonresponse.setStatusCode("1");
							jsonresponse.setErrorMessage(
									"We are sorry,We are unable to provide AiraPay services to you. Upon our internal checks and verifications, we regret to inform you that you did not meet certain requirements we are looking for to enable the instalment payments under AiraPay for your account.");
							// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);
							
							//To add logs in DB
							/*
							CreditCheckerLogs ccLogs = new CreditCheckerLogs();
							ccLogs.setRequest(userSearchRequest.toString());
							ccLogs.setResponse(jsonresponse.toString());
							saveLogsToDB(ccLogs);
							*/
							return jsonresponse;
						}

					} 
					else {
						/*
						 * error.setErrorcode("404"); error.
						 * setErrormessage("Oops, maybe it is us and not you, but we can’t seem to validate this MyKad number/name! Probably it was not in a correct format. For MyKad No, please key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin/Binti/ A/L / A/P and without any abbreviations."
						 * );
						 * 
						 * SavetoCreditCheckError(error,name,regexexpression); return error;
						 */
						CustomerSpendingLimitResponse jsonresponse = new CustomerSpendingLimitResponse();
						jsonresponse.setIsNricExist(false);
						jsonresponse.setIsNameNricMatched(false);
						jsonresponse.setIsRegistrationAllowed(false);
						jsonresponse.setMaximumAllowedInstallments(0);
						jsonresponse.setMaximumSpendingLimit(0);
						jsonresponse.setStatusCode("400");
						// jsonresponse.setErrorMessage(
						// "Oops, maybe it is us and not you, but we can’t seem to validate this MyKad
						// number/name! Probably it was not in a correct format. For MyKad No, please
						// key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name,
						// please ensure the name is keyed in exactly as per your MyKad i.e with
						// Bin/Binti/ A/L / A/P and without any abbreviations.");
						// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);
						jsonresponse.setErrorMessage("Invalid Input"); // 10-05
						SavetoCreditCheckError(jsonresponse.getStatusCode(), jsonresponse.getErrorMessage(), name,
								regexexpression, 0);
						
						//To add logs in DB
						/*
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(jsonresponse.toString());
						saveLogsToDB(ccLogs);
						*/
						return jsonresponse;
					}

				} else if(inputResponseName!= null && !inputResponseName.equals(userSearchRequest.getName())) {
					CustomerSpendingLimitResponse jsonresponse = new CustomerSpendingLimitResponse();
					jsonresponse.setIsNricExist(false);
					jsonresponse.setIsNameNricMatched(false);
					jsonresponse.setIsRegistrationAllowed(false);
					jsonresponse.setMaximumAllowedInstallments(0);
					jsonresponse.setMaximumSpendingLimit(0);
					jsonresponse.setStatusCode("404");
					// jsonresponse.setErrorMessage(
					// "Oops, maybe it is us and not you, but we can’t seem to validate this MyKad
					// number/name! Probably it was not in a correct format. For MyKad No, please
					// key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name,
					// please ensure the name is keyed in exactly as per your MyKad i.e with
					// Bin/Binti/ A/L / A/P and without any abbreviations.");
					// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);
					jsonresponse.setErrorMessage("Name mismatch"); // 10-05
					SavetoCreditCheckError(jsonresponse.getStatusCode(), jsonresponse.getErrorMessage(), name,
							regexexpression, 0);
					
					//To add logs in DB
					/*
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(jsonresponse.toString());
					saveLogsToDB(ccLogs);
					*/
					return jsonresponse;
				}else {
					/*
					 * error.setErrorcode("404"); error.setErrormessage(
					 * "Oops, maybe it is us and not you, but we can’t seem to validate this MyKad number/name! Probably it was not in a correct format. For MyKad No, please key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin/Binti/ A/L / A/P and without any abbreviations."
					 * ); SavetoCreditCheckError(error,name,regexexpression); return error;
					 */
					CustomerSpendingLimitResponse jsonresponse = new CustomerSpendingLimitResponse();
					jsonresponse.setIsNricExist(false);
					jsonresponse.setIsNameNricMatched(false);
					jsonresponse.setIsRegistrationAllowed(false);
					jsonresponse.setMaximumAllowedInstallments(0);
					jsonresponse.setMaximumSpendingLimit(0);
					jsonresponse.setStatusCode("400");
					// jsonresponse.setErrorMessage(
					// "Oops, maybe it is us and not you, but we can’t seem to validate this MyKad
					// number/name! Probably it was not in a correct format. For MyKad No, please
					// key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name,
					// please ensure the name is keyed in exactly as per your MyKad i.e with
					// Bin/Binti/ A/L / A/P and without any abbreviations.");
					// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);
					jsonresponse.setErrorMessage("Invalid input"); // 10-05
					SavetoCreditCheckError(jsonresponse.getStatusCode(), jsonresponse.getErrorMessage(), name,
							regexexpression, 0);
					
					//To add logs in DB
					/*
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(jsonresponse.toString());
					saveLogsToDB(ccLogs);
					*/
					return jsonresponse;
				}
			} else {
				Utility utilityEntities = new Utility();
				userSearchRequest.setName(name);
				if (retivalCount != null) {
					// utilityEntities = ccrisUnifiedService.getCcrisReport();

					utilityEntities = ccrisUnifiedService.getCcrisReport(userSearchRequest, reportFlag,
							triggersleeptime, triggerreconnectCount, retivalCount);

					log.info("coming inside controller retival count if block " + utilityEntities);
				} else {
					utilityEntities = ccrisUnifiedService.getCcrisReport(userSearchRequest, reportFlag,
							triggersleeptime, triggerreconnectCount, 0);
					log.info("coming inside controller retival count else block " + utilityEntities);
				}
				// utilityEntities = ccrisUnifiedService.getCcrisReport();
				customercreditreportrequest = utilityEntities.getCreditReportRequest();

				log.info("utilityEntities " + utilityEntities.toString());
				CustomerSpendingLimitResponse customerSpendingLimitResponse = new CustomerSpendingLimitResponse(); //

				if (utilityEntities.getInvalidUserFlag() != null && utilityEntities.getInvalidUserFlag() == false) {
					String caseSettled = customercreditreportrequest.getCasesettled();
					String casewithdraw = customercreditreportrequest.getCasewithdrawn();
					String paymentaging = customercreditreportrequest.getPaymentaging();
					boolean pendingflag = customercreditreportrequest.getPendingStatus();
					Integer legalsuitcount = customercreditreportrequest.getLegalstatusCount();
					Integer bankruptcycount = customercreditreportrequest.getBankruptcyCount();
					Boolean CrissFlag = customercreditreportrequest.isCriss();
					Integer tradeBureauCount = customercreditreportrequest.getTradeBureauCount();
					boolean entityKey = customercreditreportrequest.isEntityKey();
					boolean entityId = customercreditreportrequest.isEntityId();
					String specialAttentionAccount = customercreditreportrequest.getSpecialAttentionAccount();
					String facility = customercreditreportrequest.getFacility();
					log.info(CrissFlag + "checking the pending flagggggggggggg");
					checkcreditscoreResponse = ccrisUnifiedService.getCreditScore(
							customercreditreportrequest.getIScore(), caseSettled, casewithdraw, paymentaging,
							pendingflag, legalsuitcount, bankruptcycount, CrissFlag, tradeBureauCount, entityKey,
							entityId, specialAttentionAccount, facility);
					log.info("checking the credit score" + checkcreditscoreResponse.toString());
					if (checkcreditscoreResponse.getIsBelowscoreFlag() != null
							&& checkcreditscoreResponse.getIsBelowscoreFlag() == false) {
						boolean nricExist = checkcreditscoreResponse.getIsNricExist();
						boolean isnamenricmatched = checkcreditscoreResponse.getIsNameNricMatched();
						boolean isregistrationAllowed = checkcreditscoreResponse.getIsRegistrationAllowed();
						int maximumallowedinstall = checkcreditscoreResponse.getMaximumAllowedInstallments();
						int maximumspeedlimit = checkcreditscoreResponse.getMaximumSpendingLimit();
						String statuscode = checkcreditscoreResponse.getStatusCode();
						String errormessage = checkcreditscoreResponse.getErrorMessage();
						customerSpendingLimitResponse.setIsNricExist(nricExist);
						customerSpendingLimitResponse.setIsNameNricMatched(isnamenricmatched);
						customerSpendingLimitResponse.setIsRegistrationAllowed(isregistrationAllowed);
						customerSpendingLimitResponse.setMaximumAllowedInstallments(maximumallowedinstall);
						customerSpendingLimitResponse.setMaximumSpendingLimit(maximumspeedlimit);
						if (utilityEntities.getCodes() != null && utilityEntities.getCodes().contains("500")) {
							customerSpendingLimitResponse.setStatusCode(utilityEntities.getCodes());
							customerSpendingLimitResponse.setErrorMessage(ServerDownError);
						} else {
							customerSpendingLimitResponse.setStatusCode(statuscode);
							customerSpendingLimitResponse.setErrorMessage(errormessage);
						}

						log.info("added new customer to database" + customerSpendingLimitResponse);
						saveResponseToDB(customercreditreportrequest, customerSpendingLimitResponse, userSearchRequest,
								"", false, nricnumber, ispresent);
						log.info("added new customer to database1: " + customercreditreportrequest.getNric());
						
						//To add logs in DB
						/*
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(customerSpendingLimitResponse.toString());
						saveLogsToDB(ccLogs);
						*/
						return customerSpendingLimitResponse;
					} else if (CrissFlag != null && CrissFlag == true) {
						log.info("CrissFlag============================");
						System.out.println("CrissFlag============================");
						boolean nricExist = checkcreditscoreResponse.getIsNricExist();
						boolean isnamenricmatched = checkcreditscoreResponse.getIsNameNricMatched();
						boolean isregistrationAllowed = checkcreditscoreResponse.getIsRegistrationAllowed();
						int maximumallowedinstall = checkcreditscoreResponse.getMaximumAllowedInstallments();
						int maximumspeedlimit = checkcreditscoreResponse.getMaximumSpendingLimit();
						String statuscode = checkcreditscoreResponse.getStatusCode();
						String errormessage = checkcreditscoreResponse.getErrorMessage();
						customerSpendingLimitResponse.setIsNricExist(nricExist);
						customerSpendingLimitResponse.setIsNameNricMatched(isnamenricmatched);
						customerSpendingLimitResponse.setIsRegistrationAllowed(isregistrationAllowed);
						customerSpendingLimitResponse.setMaximumAllowedInstallments(maximumallowedinstall);
						customerSpendingLimitResponse.setMaximumSpendingLimit(maximumspeedlimit);
						customerSpendingLimitResponse.setStatusCode(statuscode);
						customerSpendingLimitResponse.setErrorMessage(errormessage);
						
						//To add logs in DB
						/*
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(customerSpendingLimitResponse.toString());
						saveLogsToDB(ccLogs);
						*/
						return customerSpendingLimitResponse;
					}

					else if (checkcreditscoreResponse.getLowScoreCheck() != null
							&& checkcreditscoreResponse.getLowScoreCheck() == true) {
						boolean nricExist = checkcreditscoreResponse.getIsNricExist();
						boolean isnamenricmatched = checkcreditscoreResponse.getIsNameNricMatched();
						boolean isregistrationAllowed = checkcreditscoreResponse.getIsRegistrationAllowed();
						int maximumallowedinstall = checkcreditscoreResponse.getMaximumAllowedInstallments();
						int maximumspeedlimit = checkcreditscoreResponse.getMaximumSpendingLimit();
						String statuscode = checkcreditscoreResponse.getStatusCode();
						String errormessage = checkcreditscoreResponse.getErrorMessage();
						customerSpendingLimitResponse.setIsNricExist(nricExist);
						customerSpendingLimitResponse.setIsNameNricMatched(isnamenricmatched);
						customerSpendingLimitResponse.setIsRegistrationAllowed(isregistrationAllowed);
						customerSpendingLimitResponse.setMaximumAllowedInstallments(maximumallowedinstall);
						customerSpendingLimitResponse.setMaximumSpendingLimit(maximumspeedlimit);
						customerSpendingLimitResponse.setStatusCode(statuscode);
						customerSpendingLimitResponse.setErrorMessage(errormessage);
						
						//To add logs in DB
						/*
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(customerSpendingLimitResponse.toString());
						saveLogsToDB(ccLogs);
						*/
						return customerSpendingLimitResponse;
					} else if (checkcreditscoreResponse.getIsBelowscoreFlag() == true) {

						checkcreditscoreResponse = ccrisUnifiedService.getCreditScore(
								customercreditreportrequest.getIScore(), caseSettled, casewithdraw, paymentaging,
								pendingflag, legalsuitcount, bankruptcycount, false, tradeBureauCount, entityKey,
								entityId, specialAttentionAccount, facility);

						error.setErrorcode("404");
						error.setErrormessage(checkcreditscoreResponse.getErrorMessage());
						customerSpendingLimitResponse.setIsNricExist(checkcreditscoreResponse.getIsNricExist());
						customerSpendingLimitResponse
								.setIsNameNricMatched(checkcreditscoreResponse.getIsNameNricMatched());
						customerSpendingLimitResponse
								.setIsRegistrationAllowed(checkcreditscoreResponse.getIsRegistrationAllowed());
						customerSpendingLimitResponse.setMaximumAllowedInstallments(
								checkcreditscoreResponse.getMaximumAllowedInstallments());
						customerSpendingLimitResponse
								.setMaximumSpendingLimit(checkcreditscoreResponse.getMaximumSpendingLimit());
						customerSpendingLimitResponse.setStatusCode(checkcreditscoreResponse.getStatusCode());
						customerSpendingLimitResponse.setErrorMessage(checkcreditscoreResponse.getErrorMessage());
						saveResponseToDB(customercreditreportrequest, customerSpendingLimitResponse, userSearchRequest,
								"", false, nricnumber, ispresent);
						// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);
						
						//To add logs in DB
						/*
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(customerSpendingLimitResponse.toString());
						saveLogsToDB(ccLogs);
						*/
						return customerSpendingLimitResponse;
					} else {
						error.setErrorcode(utilityEntities.getCodes());
						error.setErrormessage(utilityEntities.getErrorMsg());
						// SavetoCreditCheckError(error,name,regexexpression);
						
						//To add logs in DB
						/*
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(error.toString());
						saveLogsToDB(ccLogs);
						*/
						return error;
					}
				} else if (utilityEntities.getInvalidUserFlag() != null
						&& utilityEntities.getInvalidUserFlag() == true) {
					log.info("Inside else if to check InvalidUserFlag()");
					customerSpendingLimitResponse.setIsNricExist(false);
					customerSpendingLimitResponse.setIsNameNricMatched(false);
					customerSpendingLimitResponse.setIsRegistrationAllowed(false);
					customerSpendingLimitResponse.setMaximumAllowedInstallments(0);
					customerSpendingLimitResponse.setMaximumSpendingLimit(0);
					if (utilityEntities.getCodes() != null && utilityEntities.getCodes().contains("500")) {
						customerSpendingLimitResponse.setStatusCode(utilityEntities.getCodes());
						customerSpendingLimitResponse.setErrorMessage(ServerDownError);
					} else if(utilityEntities.getErrorMsg().equals("Invalid Input")){
							customerSpendingLimitResponse.setStatusCode("400");
					customerSpendingLimitResponse.setErrorMessage(utilityEntities.getErrorMsg());
							}else {
						customerSpendingLimitResponse.setStatusCode("404");
						customerSpendingLimitResponse.setErrorMessage(utilityEntities.getErrorMsg());
					}
					/*
					 * if(utilityEntities.getDBMessage()!=null) {
					 * customerSpendingLimitResponse.setErrorMessage(utilityEntities.getDBMessage())
					 * ; }else {
					 */

					// }
					// customerSpendingLimitResponse.setDBXML(utilityEntities.getDBMessage());
					SavetoCreditCheckErrorwithResponsefromExperian(utilityEntities, name, regexexpression, 0);
					
					//To add logs in DB
					/*
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(customerSpendingLimitResponse.toString());
					saveLogsToDB(ccLogs);
					*/
					return customerSpendingLimitResponse;

				} else if (utilityEntities.getExperianServerFlag() != null
						&& utilityEntities.getExperianServerFlag() == true) {
					log.info("controller Experian :");
					checkcreditscoreResponse = ccrisUnifiedService.ExperianServerDown();
					// int retrival=customercreditreportrequest.getRetrivalCount();
					boolean nricExist = checkcreditscoreResponse.getIsNricExist();
					boolean isnamenricmatched = checkcreditscoreResponse.getIsNameNricMatched();
					boolean isregistrationAllowed = checkcreditscoreResponse.getIsRegistrationAllowed();
					int maximumallowedinstall = checkcreditscoreResponse.getMaximumAllowedInstallments();
					int maximumspeedlimit = checkcreditscoreResponse.getMaximumSpendingLimit();
					String statuscode = checkcreditscoreResponse.getStatusCode();
					log.info("Experian Status code :" + statuscode);
					String errormessage = checkcreditscoreResponse.getErrorMessage();
					customerSpendingLimitResponse.setIsNricExist(nricExist);
					customerSpendingLimitResponse.setIsNameNricMatched(isnamenricmatched);
					customerSpendingLimitResponse.setIsRegistrationAllowed(isregistrationAllowed);
					customerSpendingLimitResponse.setMaximumAllowedInstallments(maximumallowedinstall);
					customerSpendingLimitResponse.setMaximumSpendingLimit(maximumspeedlimit);
					if (utilityEntities.getCodes() != null && utilityEntities.getCodes().contains("500")) {
						customerSpendingLimitResponse.setStatusCode(utilityEntities.getCodes());
						customerSpendingLimitResponse.setErrorMessage(ServerDownError);
					} else {
						customerSpendingLimitResponse.setStatusCode(statuscode);
						customerSpendingLimitResponse.setErrorMessage(errormessage);
					}

					// SavetoCreditCheckError(statuscode, errormessage, name, regexexpression, 0);
					// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);
					
					//To add logs in DB
					/*
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(customerSpendingLimitResponse.toString());
					saveLogsToDB(ccLogs);
					*/
					return customerSpendingLimitResponse;

				} else if (utilityEntities.getInvalidUsernameflag() != null
						&& utilityEntities.getInvalidUsernameflag() == true) {

					customerSpendingLimitResponse.setIsNricExist(false);
					customerSpendingLimitResponse.setIsNameNricMatched(false);
					customerSpendingLimitResponse.setIsRegistrationAllowed(false);
					customerSpendingLimitResponse.setMaximumAllowedInstallments(0);
					customerSpendingLimitResponse.setMaximumSpendingLimit(0);
					if (utilityEntities.getCodes() != null && utilityEntities.getCodes().contains("500")) {
						customerSpendingLimitResponse.setStatusCode(utilityEntities.getCodes());
						customerSpendingLimitResponse.setErrorMessage(ServerDownError);
					} else {
						customerSpendingLimitResponse.setStatusCode("404");
						customerSpendingLimitResponse.setErrorMessage(utilityEntities.getErrorMsg());
					}

					SavetoCreditCheckErrorwithResponsefromExperian(utilityEntities, name, regexexpression, 0);
					//To add logs in DB
					/*
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(customerSpendingLimitResponse.toString());
					saveLogsToDB(ccLogs);
					*/
					return customerSpendingLimitResponse;

				} else {
					log.info("errorcode=================================" + utilityEntities.getCodes());
					checkcreditscoreResponse = ccrisUnifiedService.errorMethodCalling();
					boolean nricExist = checkcreditscoreResponse.getIsNricExist();
					boolean isnamenricmatched = checkcreditscoreResponse.getIsNameNricMatched();
					boolean isregistrationAllowed = checkcreditscoreResponse.getIsRegistrationAllowed();
					int maximumallowedinstall = checkcreditscoreResponse.getMaximumAllowedInstallments();
					int maximumspeedlimit = checkcreditscoreResponse.getMaximumSpendingLimit();
					String statuscode = checkcreditscoreResponse.getStatusCode();
					String errormessage = checkcreditscoreResponse.getErrorMessage();
					customerSpendingLimitResponse.setIsNricExist(nricExist);
					customerSpendingLimitResponse.setIsNameNricMatched(isnamenricmatched);
					customerSpendingLimitResponse.setIsRegistrationAllowed(isregistrationAllowed);
					customerSpendingLimitResponse.setMaximumAllowedInstallments(maximumallowedinstall);
					customerSpendingLimitResponse.setMaximumSpendingLimit(maximumspeedlimit);
					if (utilityEntities.getCodes() != null && utilityEntities.getCodes().contains("500")) {
						customerSpendingLimitResponse.setStatusCode(utilityEntities.getCodes());
						customerSpendingLimitResponse.setErrorMessage(ServerDownError);
					} else {
						customerSpendingLimitResponse.setStatusCode(statuscode);
						customerSpendingLimitResponse.setErrorMessage(errormessage);
					}

					// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);
					
					//To add logs in DB
					/*
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(customerSpendingLimitResponse.toString());
					saveLogsToDB(ccLogs);
					*/
					return customerSpendingLimitResponse;
				}

			}
		} else {
			/*
			 * error.setErrorcode("404"); error.
			 * setErrormessage("Oops, maybe it is us and not you, but we can’t seem to validate this MyKad number/name! Probably it was not in a correct format. For MyKad No, please key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin/Binti/ A/L / A/P and without any abbreviations."
			 * ); //
			 * SavetoCreditCheckError(error,userSearchRequest.getName(),userSearchRequest.
			 * getEntityId()); return error;
			 */
			log.info("NRIC length is not 14");
			CustomerSpendingLimitResponse jsonresponse = new CustomerSpendingLimitResponse();
			jsonresponse.setIsNricExist(false);
			jsonresponse.setIsNameNricMatched(false);
			jsonresponse.setIsRegistrationAllowed(false);
			jsonresponse.setMaximumAllowedInstallments(0);
			jsonresponse.setMaximumSpendingLimit(0);
			jsonresponse.setStatusCode("404");
			jsonresponse.setErrorMessage(
					"Oops, maybe it is us and not you, but we can’t seem to validate this MyKad number/name! Probably it was not in a correct format. For MyKad No, please key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin/Binti/ A/L / A/P and without any abbreviations.");
			// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);
			// SavetoCreditCheckError(jsonresponse.getStatusCode(),jsonresponse.getErrorMessage(),name,regexexpression);
			
			//To add logs in DB
			/*
			CreditCheckerLogs ccLogs = new CreditCheckerLogs();
			ccLogs.setRequest(userSearchRequest.toString());
			ccLogs.setResponse(jsonresponse.toString());
			saveLogsToDB(ccLogs);
			*/
			return jsonresponse;
		}
		}
		log.info("Simulator response is null");
		CustomerSpendingLimitResponse jsonresponse = new CustomerSpendingLimitResponse();
		jsonresponse.setIsNricExist(false);
		jsonresponse.setIsNameNricMatched(false);
		jsonresponse.setIsRegistrationAllowed(false);
		jsonresponse.setMaximumAllowedInstallments(0);
		jsonresponse.setMaximumSpendingLimit(0);
		jsonresponse.setStatusCode("null");
		jsonresponse.setErrorMessage(
				"null");
		// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);
		// SavetoCreditCheckError(jsonresponse.getStatusCode(),jsonresponse.getErrorMessage(),name,regexexpression);
		
		//To add logs in DB
		/*
		CreditCheckerLogs ccLogs = new CreditCheckerLogs();
		ccLogs.setRequest(userSearchRequest.toString());
		ccLogs.setResponse(jsonresponse.toString());
		saveLogsToDB(ccLogs);
		*/
		return jsonresponse;

	}

	private void SavetoCreditCheckError(String statusCode, String errorMessage, String name, String regexexpression,
			int retrival) {
		log.info("Retival COunt: " + retrival);
		CustomerCreditError checkError = new CustomerCreditError();
		// int i=0;
		// checkError.setId(i++);
		System.out.println(String.valueOf(statusCode));
		checkError.setErrorCode(String.valueOf(statusCode));
		checkError.setErrorStatus(errorMessage);
		checkError.setName(name);
		checkError.setNric(regexexpression);
		checkError.setRetrivalCount(retrival++);
		checkError.setCreatedAt(new Date());
		checkError.setUpdatedAt(new Date());
		creditCheckErrorRepository.save(checkError);

	}

	/*
	 * private void SavetoCreditCheckError(Error error, String name, String
	 * regexexpression) { CreditCheckError checkError=new CreditCheckError();
	 * checkError.setErrorCode(error.getErrorcode());
	 * checkError.setErrorStatus(error.getErrormessage()); checkError.setName(name);
	 * checkError.setNric(regexexpression);
	 * creditCheckErrorRepository.save(checkError);
	 * 
	 * }
	 */

	@SuppressWarnings("null")
	private void SavetoCreditCheckErrorwithResponsefromExperian(Utility utilityEntities, String name,
			String regexexpression, int retrival) {

		try {
			/*
			 * CreditCheckError checkError=new CreditCheckError();
			 * log.info("Saving Error Database=============="+utilityEntities);
			 * checkError=creditCheckErrorRepository.findbyAll(regexexpression); // int i =
			 * 0;
			 * 
			 * 
			 * //checkError.setId(i+1); if(checkError!=null) {
			 * 
			 * DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd HH:mm:ss");
			 * LocalDateTime now = LocalDateTime.now(); String updatedDate=dtf.format(now);
			 * SimpleDateFormat sdfIn1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); Date
			 * date = sdfIn1.parse(updatedDate);
			 * log.info("Checking the user database==============");
			 * log.info("checking date"+date);
			 * creditCheckErrorRepository.updateRetivalCount(retrival,regexexpression,date);
			 * }else { log.info("adding the user database=============="); CreditCheckError
			 * checkError1=new CreditCheckError(); if(utilityEntities.getDBMessage()!=null){
			 * checkError1.setErrorStatus(utilityEntities.getDBMessage()); }else {
			 * 
			 * 
			 * log.info("i count=============="+retrival);
			 * checkError1.setErrorStatus(utilityEntities.getErrorMsg());
			 * log.info("New user database=============="+checkError1);
			 * checkError1.setErrorCode(utilityEntities.getCodes());
			 * checkError1.setName(name); checkError1.setNric(regexexpression);
			 * checkError1.setRetrivalCount(retrival); checkError1.setCreatedAt(new Date());
			 * checkError1.setUpdatedAt(new Date());
			 */

			// }
			// creditCheckErrorRepository.save(checkError1);
			// }
			CustomerCreditError checkError = new CustomerCreditError();
			checkError.setErrorCode(utilityEntities.getCodes());
			if (utilityEntities.getDBMessage() != null) {
				checkError.setErrorStatus(utilityEntities.getDBMessage());
			} else {
				checkError.setErrorStatus(utilityEntities.getErrorMsg());
			}
			checkError.setName(name);
			checkError.setNric(regexexpression);
			checkError.setRetrivalCount(retrival);
			checkError.setCreatedAt(new Date());
			checkError.setUpdatedAt(new Date());
			creditCheckErrorRepository.save(checkError);

		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}

	}

	private String NricRegchecking(String entityId) {
		StringBuffer buffer = new StringBuffer();
		if (entityId.length() == 14 && entityId.contains("-")) {
			log.info("nric with - validation" + entityId);
			return entityId;
		} else {
			if (entityId.length() == 12) {
				buffer.append(entityId.substring(0, 6));
				buffer.append("-");
				buffer.append(entityId.substring(6, 8));
				buffer.append("-");
				buffer.append(entityId.substring(8));
				log.info("nric without - validation" + buffer.toString());
			}
		}
		return buffer.toString();

	}

	private Object saveResponseToDB(CustomerCreditReportRequest customercreditreportrequest2,
			CustomerSpendingLimitResponse customerSpendingLimitResponse, UserSearchRequest userSearchRequest,
			String string, boolean reportFlag, String regexexpression, boolean isPresent)
			throws JsonProcessingException {
		customercreditreportrequest = customercreditreportrequest2;
		log.info("Saving to airapay" + customercreditreportrequest);
		System.out.println(customercreditreportrequest.getIScore() + "===================================");
		// String userName=userRequestRepository.findbyUserRequestName(regexexpression);
		// System.out.println(userName+"==================");
		try {
			if (reportFlag == false && isPresent == true) {
				ObjectMapper Obj = new ObjectMapper();
				String jsonStr = Obj.writeValueAsString(customerSpendingLimitResponse);
				System.out.println(customercreditreportrequest.getBankruptcyCount());
				CustomerCreditReports customerCreditReports = new CustomerCreditReports();
				customerCreditReports.setName(customercreditreportrequest.getName());
				System.out.println("Name");
				// customerCreditReports.setName(userName);
				customerCreditReports.setNric(customercreditreportrequest.getNric().replaceAll("-", ""));
				customerCreditReports.setBankruptcyCount(customercreditreportrequest.getBankruptcyCount());
				customerCreditReports.setLegalSuitCount(customercreditreportrequest.getLegalSuitCount());
				customerCreditReports.setIScore(customercreditreportrequest.getIScore());
				customerCreditReports.setBankruptcyCount(customercreditreportrequest.getBankruptcyCount());
				customerCreditReports.setCreatedAt(new Date());
				customerCreditReports.setUpdatedAt(new Date());
				customerCreditReports
						.setBankingCreditApprovedAmount(customercreditreportrequest.getBankingCreditApprovedAmount());
				customerCreditReports
						.setBankingCreditApprovedCount(customercreditreportrequest.getBankingCreditApprovedCount());
				customerCreditReports
						.setBankingCreditPendingAmount(customercreditreportrequest.getBankingCreditPendingAmount());
				customerCreditReports
						.setBankingCreditPendingCount(customercreditreportrequest.getBankingCreditPendingCount());
				customerCreditReports.setBorrowerOutstanding(customercreditreportrequest.getBorrowerOutstanding());
				customerCreditReports.setIScoreGradeFormat(customercreditreportrequest.getIScoreGradeFormat());
				customerCreditReports.setIScoreRiskGrade(customercreditreportrequest.getIScoreRiskGrade());
				customerCreditReports
						.setLegalActionBankingCount(customercreditreportrequest.getLegalActionBankingCount());
				customerCreditReports.setTradeBureauCount(customercreditreportrequest.getTradeBureauCount());
				customerCreditReports.setXmlString(customercreditreportrequest.getXmlString());
				customerCreditReports.setJsonString(jsonStr);
				log.info("Cliend id from request" + userSearchRequest.getClientId());
				customerCreditReports.setCustomerId(userSearchRequest.getClientId());
				customerCreditReports.setFilepath(customercreditreportrequest.getDownaloadfilepath());
				customerCreditReports.setBase64_pdf(customercreditreportrequest.getBase64_pdf());
				customerCreditReportsRepository.save(customerCreditReports);
				return null;
			} else if (reportFlag == true && isPresent == true) {
				/*
				 * ObjectMapper Obj = new ObjectMapper(); String jsonStr =
				 * Obj.writeValueAsString(customerSpendingLimitResponse);
				 */
				System.out.println(customercreditreportrequest.getIScore() + "=====================================");
				/*
				 * CustomerCreditReports customerCreditReports = new CustomerCreditReports();
				 * customerCreditReports.setName(customercreditreportrequest.getName());
				 * //customerCreditReports.setName(userName);
				 * customerCreditReports.setNric(customercreditreportrequest.getNric().
				 * replaceAll("-", ""));
				 * 
				 * customerCreditReports.setCreatedAt(new Date());
				 * customerCreditReports.setUpdatedAt(new Date());
				 * 
				 * customerCreditReports.setXmlString(null);
				 * customerCreditReports.setJsonString(null);
				 * log.info("Cliend id from request"+userSearchRequest.getClientId());
				 * customerCreditReports.setCustomerId(userSearchRequest.getClientId());
				 * customerCreditReports.setFilepath(customercreditreportrequest.
				 * getDownaloadfilepath());
				 * customerCreditReportsRepository.save(customerCreditReports);
				 */
				ObjectMapper Obj = new ObjectMapper();
				String jsonStr = Obj.writeValueAsString(customerSpendingLimitResponse);
				System.out.println(customercreditreportrequest.getBankruptcyCount());
				CustomerCreditReports customerCreditReports = new CustomerCreditReports();
				customerCreditReports.setName(customercreditreportrequest.getName());
				// customerCreditReports.setName(userName);
				customerCreditReports.setNric(customercreditreportrequest.getNric().replaceAll("-", ""));
				customerCreditReports.setBankruptcyCount(customercreditreportrequest.getBankruptcyCount());
				customerCreditReports.setLegalSuitCount(customercreditreportrequest.getLegalSuitCount());
				customerCreditReports.setIScore(customercreditreportrequest.getIScore());
				customerCreditReports.setBankruptcyCount(customercreditreportrequest.getBankruptcyCount());
				customerCreditReports.setCreatedAt(new Date());
				customerCreditReports.setUpdatedAt(new Date());
				customerCreditReports
						.setBankingCreditApprovedAmount(customercreditreportrequest.getBankingCreditApprovedAmount());
				customerCreditReports
						.setBankingCreditApprovedCount(customercreditreportrequest.getBankingCreditApprovedCount());
				customerCreditReports
						.setBankingCreditPendingAmount(customercreditreportrequest.getBankingCreditPendingAmount());
				customerCreditReports
						.setBankingCreditPendingCount(customercreditreportrequest.getBankingCreditPendingCount());
				customerCreditReports.setBorrowerOutstanding(customercreditreportrequest.getBorrowerOutstanding());
				customerCreditReports.setIScoreGradeFormat(customercreditreportrequest.getIScoreGradeFormat());
				customerCreditReports.setIScoreRiskGrade(customercreditreportrequest.getIScoreRiskGrade());
				customerCreditReports
						.setLegalActionBankingCount(customercreditreportrequest.getLegalActionBankingCount());
				customerCreditReports.setTradeBureauCount(customercreditreportrequest.getTradeBureauCount());
				customerCreditReports.setXmlString(customercreditreportrequest.getXmlString());
				customerCreditReports.setJsonString(jsonStr);
				log.info("Cliend id from request" + userSearchRequest.getClientId());
				customerCreditReports.setCustomerId(userSearchRequest.getClientId());
				customerCreditReports.setFilepath(customercreditreportrequest.getDownaloadfilepath());
				customerCreditReports.setBase64_pdf(customercreditreportrequest.getBase64_pdf());				
				customerCreditReportsRepository.save(customerCreditReports);
				return null;
			} else if (isPresent == false) {
				log.info("Inside isPresent = false in saveToDB() ");
				log.info("customercreditreportrequest2  " + customercreditreportrequest2);
				CustomerCreditReports customerCreditReports = new CustomerCreditReports();
				ObjectMapper Obj = new ObjectMapper();
				String jsonStr = Obj.writeValueAsString(customerSpendingLimitResponse);
				customerCreditReports.setName(customercreditreportrequest2.getName());
				// customerCreditReports.setName(userName);
				customerCreditReports.setNric(customercreditreportrequest2.getNric().replaceAll("-", ""));
				customerCreditReports.setBankruptcyCount(customercreditreportrequest2.getBankruptcyCount());
				customerCreditReports.setLegalSuitCount(customercreditreportrequest2.getLegalSuitCount());
				customerCreditReports.setIScore(customercreditreportrequest2.getIScore());
				customerCreditReports.setBankruptcyCount(customercreditreportrequest2.getBankruptcyCount());
				customerCreditReports.setCreatedAt(new Date());
				customerCreditReports.setUpdatedAt(new Date());
				customerCreditReports
						.setBankingCreditApprovedAmount(customercreditreportrequest2.getBankingCreditApprovedAmount());
				customerCreditReports
						.setBankingCreditApprovedCount(customercreditreportrequest2.getBankingCreditApprovedCount());
				customerCreditReports
						.setBankingCreditPendingAmount(customercreditreportrequest2.getBankingCreditPendingAmount());
				customerCreditReports
						.setBankingCreditPendingCount(customercreditreportrequest2.getBankingCreditPendingCount());
				customerCreditReports.setBorrowerOutstanding(customercreditreportrequest2.getBorrowerOutstanding());
				customerCreditReports.setIScoreGradeFormat(customercreditreportrequest2.getIScoreGradeFormat());
				customerCreditReports.setIScoreRiskGrade(customercreditreportrequest2.getIScoreRiskGrade());
				customerCreditReports
						.setLegalActionBankingCount(customercreditreportrequest2.getLegalActionBankingCount());
				customerCreditReports.setTradeBureauCount(customercreditreportrequest2.getTradeBureauCount());
				customerCreditReports.setXmlString(customercreditreportrequest2.getXmlString());
				customerCreditReports.setJsonString(jsonStr);
				log.info("JSON id from request" + customerCreditReports.getJsonString());
				customerCreditReports.setCustomerId(userSearchRequest.getClientId());
				customerCreditReports.setFilepath(customercreditreportrequest2.getDownaloadfilepath());
				customerCreditReports.setBase64_pdf(customercreditreportrequest2.getBase64_pdf());
				if (RetriveCustomerDetails(customerCreditReports.getNric())) {
					log.info("NRIC exist!! Updating table");
					customerCreditReportsRepository.updateTable(customerCreditReports.getName(),
							customerCreditReports.getNric(), customerCreditReports.getBankruptcyCount(),
							customerCreditReports.getCreatedAt(), customerCreditReports.getUpdatedAt(),
							customerCreditReports.getBankingCreditApprovedAmount(),
							customerCreditReports.getBankingCreditApprovedCount(),
							customerCreditReports.getBankingCreditPendingAmount(),
							customerCreditReports.getIScoreGradeFormat(), customerCreditReports.getIScoreRiskGrade(),
							customerCreditReports.getLegalActionBankingCount(),
							customerCreditReports.getTradeBureauCount(), customerCreditReports.getXmlString(),
							customerCreditReports.getJsonString(), customerCreditReports.getFilepath(),
							customerCreditReports.getIScore());

					// customerCreditReportsRepository.save(customerCreditReports);
					// customerCreditReportsRepository.updateTable(customerCreditReports.getName(),customerCreditReports.getNric(),
					// customerCreditReports.getBankruptcyCount(),
					// customerCreditReports.getCreatedAt(), customerCreditReports.getUpdatedAt());
					log.info("Data updated " + customerCreditReports.getNric());
				} else if (!RetriveCustomerDetails(customerCreditReports.getNric())) {
					log.info("Inserting into DB");
					customerCreditReportsRepository.save(customerCreditReports);
				}
				log.info("Updated iscore " + customerCreditReports.getIScore());
				// log.info("Bankcruptcy count " +customerCreditReports.getBankruptcyCount());
				return null;
			}
		} catch (Exception e) {
			String errormessage = "Already Customer Exit With Same NRIC !!!!!";
			customerSpendingLimitResponse.setStatusCode("1062");
			customerSpendingLimitResponse.setErrorMessage(errormessage);
			System.out.println("history already exist" + e);
			// EmailUtility emailUtility = new EmailUtility();
			// emailUtility.sentEmail(e.getLocalizedMessage());
			return customerSpendingLimitResponse;
		}
		return null;

	}

	private void saveRequestToDB(UserSearchRequest userSearchRequest) {
		log.info("Saved to database" + userSearchRequest);
		UserRequest userRequestEntity = new UserRequest();
		userRequestEntity.setEntity_id(userSearchRequest.getEntityId());
		userRequestEntity.setClientId(userSearchRequest.getClientId());
		userRequestEntity.setName_id(userSearchRequest.getName());
		userRequestEntity.setPurchaseAmount(userSearchRequest.getPurchaseAmount());
		userRequestEntity.setCreatedDate(new Date());
		userRequestEntity.setServicename(userSearchRequest.getServiceName());
		userRequestRepository.save(userRequestEntity);

	}

	private void saveResponseToDB(UserSearchRequest userSearchRequest, CreditCheckResponse creditCheckResponse) {
		log.info("Saving Response to database");
		ReportEntity reportEntity = new ReportEntity();
		reportEntity.setEntityId(userSearchRequest.getEntityId());
		reportEntity.setName(userSearchRequest.getName());
		reportEntity.setIsRegistrationAllowed(creditCheckResponse.getIsRegistrationAllowed());
		reportEntity.setIsNameNricMatched(creditCheckResponse.getIsNameNricMatched());
		reportEntity.setIsNricExist(creditCheckResponse.getIsNricExist());
		reportEntity.setMaximumAllowedInstallments(creditCheckResponse.getMaximumAllowedInstallments());
		reportEntity.setMaximumSpendingLimit(creditCheckResponse.getMaximumSpendingLimit());
		reportEntity.setCreatedDate(new Date());

		reportEntityRepository.save(reportEntity);
	}

	@SuppressWarnings({ "null", "unused" })
	@PostMapping(value = "/creditchecker/ExperianReport")
	public Object RequestdownloadFile(@RequestBody UserSearchRequest userSearchRequest) throws Exception {
		List<String> triggersleep = new LinkedList<String>();
		Error error = new Error();
		boolean reportFlag = false;
		String valuePresent = null;
		HashMap<String,String> dbvalues = dbconfig.getValueFromDB();
		CustomerSpendingLimitResponse customerSpendingLimitResponse = new CustomerSpendingLimitResponse();
		CreditCheckResponse checkcreditscoreResponse = null;
		ExperianReportResponse experianreportResponse = new ExperianReportResponse();
		log.info("Inside ExperianReport for user :" + userSearchRequest.getName() + "entity "
				+ userSearchRequest.getEntityId().trim());
		log.info("Request :" + userSearchRequest.toString());
		// String simulator = creditScoreConfigRepository.findValueFromName("simulator.call");
		simulator = dbvalues.get("simulator.call");
		String TokenMap = null;
		TokenMap = customerUserTokenRepository.findTokenByNric(userSearchRequest.getEntityId());
		triggersleep.add("experian-trigger-time");
		triggersleep.add("experian-trigger-count");
		triggersleep = experianPropertyRepository.findvalueandName(triggersleep);
		log.info("Experian trigger :" + triggersleep);
		String triggersleeptime = triggersleep.get(0);
		String triggerreconnectCount = triggersleep.get(1);
		System.out.println(triggersleeptime + "========" + triggerreconnectCount);
		Integer retivalCount = 0;
		Object simulatorResponse = null;
		if(simulator.equals("true")){
		if((userSearchRequest.getEntityId().contains("500101") || userSearchRequest.getEntityId().contains("501230") 
				|| userSearchRequest.getEntityId().contains("501231")) || (userSearchRequest.getName().contains("WRONG NAME") 
						|| userSearchRequest.getName().contains("ABDULLAH BIN MALIK") || userSearchRequest.getName().contains("LARRY HENG")
						|| userSearchRequest.getName().contains("BILL CLINTON") || userSearchRequest.getName().contains("DEVI THANAPAKIAM"))) {
			log.info("Calling Simulator");
			//public Object creditCheckerSimulator(@RequestBody JSONObject request) {
			JSONObject request = new JSONObject();
			request.put("entityId", userSearchRequest.getEntityId());
			request.put("name", userSearchRequest.getName());
			request.put("serviceName", userSearchRequest.getServiceName());
			
			experianreportResponse = creditCheckerSimulatorForReport(request);
			
			if(experianreportResponse.getResponseCode() != null) {
				log.info("Returning response from Simulator");
				//To add logs in DB
				/*
				CreditCheckerLogs ccLogs = new CreditCheckerLogs();
				ccLogs.setRequest(userSearchRequest.toString());
				ccLogs.setResponse(experianreportResponse.toString());
				saveLogsToDB(ccLogs);
				*/
				return experianreportResponse;
			}
			
		}}
		if(experianreportResponse != null && experianreportResponse.getResponseCode()== null){
			log.info("Normal flow as response is not available from simulator");
		String nricnumber = NricRegchecking(userSearchRequest.getEntityId());
		// Integer retivalCount =
		// creditCheckErrorRepository.findbynric(userSearchRequest.getEntityId());
		log.info("nricnumber " +nricnumber);
		log.info("nricnumber length " +nricnumber.length());
		System.out.println(retivalCount);
		if (nricnumber.length() == 14) {
			saveRequestToDB(userSearchRequest);
			String name = userSearchRequest.getName().toUpperCase().replaceAll("[ ]{2,}", " ");
			if (name.contains("BINTI")) {
				name = name.replaceAll("BINTI", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("BIN")) {
				name = name.replaceAll("BIN", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("Bin")) {
				name = name.replaceAll("Bin", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("BT")) {
				name = name.replaceAll("BT", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("bt")) {
				name = name.replaceAll("bt", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("BTE")) {
				name = name.replaceAll("BTE", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("bte")) {
				name = name.replaceAll("bte", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("BY")) {
				name = name.replaceAll("BY", "").trim().replaceAll("[ ]{2,}", " ");
			} else if (name.contains("by")) {
				name = name.replaceAll("by", "").trim().replaceAll("[ ]{2,}", " ");
			}

			/*
			 * else if(name.contains("B")) { name=name.replaceAll("B",
			 * "").trim().replaceAll("[ ]{2,}", " "); }else if(name.contains("b")) {
			 * name=name.replaceAll("b", "").trim().replaceAll("[ ]{2,}", " "); }
			 */
			else {
				name = name.replaceAll("Binti", "").trim().replaceAll("[ ]{2,}", " ");
			}
			userSearchRequest.setName(name);
			String Nric = userSearchRequest.getEntityId();
			String regexexpression = Nric.replaceAll("-", "");
			 ispresent = retrieveNricFromDB(regexexpression);
			/* valuePresent = customerCreditReportsRepository.findByDate(regexexpression);
			if(valuePresent != null) {
				ispresent = true;
			}*/
			log.info("ispresent value " + ispresent);
			if (ispresent == true) {
				String response = customerCreditReportsRepository.find(name, regexexpression);
				 String inputResponse = customerCreditReportsRepository.find(userSearchRequest.getName(),regexexpression);
				// Object inputResponseName = retrieveNameNricFromDB(regexexpression);
				 Object inputResponseName =  customerCreditReportsRepository.findByNricName(regexexpression);
				log.info("inputResponse" +inputResponse);
				if (response != null) {
					log.info("response value " + response);
					String splits[] = response.split(",");
					String responseName = splits[0].toString();
					String responseNric = splits[1].toString();
					if (responseName.equalsIgnoreCase(name) && responseNric.equalsIgnoreCase(regexexpression)) {
						String filepathResponse = customerCreditReportsRepository.findbydownloadpath(regexexpression);
						log.info("filepathResponse" + filepathResponse);
						String xmlPathResponse = customerCreditReportsRepository.findbyXMLpath(regexexpression);
						CustomerCreditReports cc = customerCreditReportsRepository.findbynric(regexexpression);
						log.info("xmlPathResponse" + xmlPathResponse);
						log.info("cc" + cc);
						boolean flag = filepathResponse.isEmpty() && filepathResponse != null;
						System.out.println("path" + flag);
						if (filepathResponse != null && flag == false && cc != null && xmlPathResponse != null) {
							experianreportResponse.setResponseCode("00");
							experianreportResponse.setResponseMsg("Success");
							experianreportResponse.setURL(filepathResponse);
							experianreportResponse.setBankruptcyCount(cc.getBankruptcyCount());
							experianreportResponse.setLegalSuitCount(cc.getLegalSuitCount());
							experianreportResponse.setTradeBureauCount(cc.getTradeBureauCount());
							experianreportResponse.setIScore(cc.getIScore());
							experianreportResponse.setIScoreRiskGrade(cc.getIScoreRiskGrade());
							experianreportResponse.setIScoreGradeFormat(cc.getIScoreGradeFormat());
							experianreportResponse.setLegalActionBankingCount(cc.getLegalActionBankingCount());
							experianreportResponse.setBorrowerOutstanding(cc.getBorrowerOutstanding());
							experianreportResponse.setBankingCreditApprovedCount(cc.getBankingCreditApprovedCount());
							experianreportResponse.setBankingCreditApprovedAmount(cc.getBankingCreditApprovedAmount());
							experianreportResponse.setBankingCreditPendingCount(cc.getBankingCreditPendingCount());
							experianreportResponse.setBankingCreditPendingAmount(cc.getBankingCreditPendingAmount());
							experianreportResponse.setRefxml(xmlPathResponse);
							experianreportResponse.setBase64_pdf(cc.getBase64_pdf());
							log.info("customer already exist so returning jsonsss response" + experianreportResponse);
							//To add logs in DB
							CreditCheckerLogs ccLogs = new CreditCheckerLogs();
							ccLogs.setRequest(userSearchRequest.toString());
							ccLogs.setResponse(experianreportResponse.toString());
						//	saveLogsToDB(ccLogs);
							return experianreportResponse;
						} else {

							XmlFormatter formatter = new XmlFormatter();
							System.out.println(xmlPathResponse + "------------------------------");
							String xmlResponse = formatter.format(xmlPathResponse);
							String nricNumber = StringUtils.substringBetween(xmlResponse, "<new_ic>", "</new_ic>");
							System.out.println(nricNumber + "============");
							String filepath = ccrisReportRetrievalService
									.FilepathdownloadforExisitingCustomer(xmlResponse, nricNumber);
							experianreportResponse.setResponseCode("00");
							experianreportResponse.setResponseMsg("Success");
							experianreportResponse.setURL(filepath);
							experianreportResponse.setRefxml(xmlResponse);
							//TODO
							experianreportResponse.setBase64_pdf(Base64.getEncoder().encodeToString(filepath.getBytes()));
							log.info("customer already exist but no file genrated" + experianreportResponse);
							Savedownloadpathforexistingcustomer(filepath, regexexpression);
							//To add logs in DB
							CreditCheckerLogs ccLogs = new CreditCheckerLogs();
							ccLogs.setRequest(userSearchRequest.toString());
							ccLogs.setResponse(experianreportResponse.toString());
							//saveLogsToDB(ccLogs);
							return experianreportResponse;
						}

					} else if (! responseName.equals(name)) {
						experianreportResponse.setResponseCode("404");
						experianreportResponse.setResponseMsg(
								"Name mismatch");
						experianreportResponse.setURL(null);
						experianreportResponse.setRefxml(null);
						experianreportResponse.setBankruptcyCount(0);
						experianreportResponse.setLegalSuitCount(0);
						experianreportResponse.setTradeBureauCount(0);
						experianreportResponse.setIScore(0);
						experianreportResponse.setIScoreRiskGrade(0);
						experianreportResponse.setIScoreGradeFormat(null);
						experianreportResponse.setLegalActionBankingCount(0);
						experianreportResponse.setBorrowerOutstanding(0);
						experianreportResponse.setBankingCreditApprovedCount(0);
						experianreportResponse.setBankingCreditApprovedAmount(0);
						experianreportResponse.setBankingCreditPendingCount(0);
						experianreportResponse.setBankingCreditPendingAmount(0);
						experianreportResponse.setBase64_pdf(null);
						
						SavetoCreditCheckErrors(experianreportResponse.getResponseCode(),
								experianreportResponse.getResponseMsg(), name, regexexpression, 0);
						// SavetoCreditCheckError(error,name,regexexpression);
						//To add logs in DB
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(experianreportResponse.toString());
						// saveLogsToDB(ccLogs);
						return experianreportResponse;
						
					}
					
						else {
						experianreportResponse.setResponseCode("404");
						experianreportResponse.setResponseMsg(
								"Oops, maybe it is us and not you, but we can’t seem to validate this MyKad number/name! Probably it was not in a correct format. For MyKad No, please key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin/Binti/ A/L / A/P and without any abbreviations.");
						experianreportResponse.setURL(null);
						experianreportResponse.setRefxml(null);
						experianreportResponse.setBankruptcyCount(0);
						experianreportResponse.setLegalSuitCount(0);
						experianreportResponse.setTradeBureauCount(0);
						experianreportResponse.setIScore(0);
						experianreportResponse.setIScoreRiskGrade(0);
						experianreportResponse.setIScoreGradeFormat(null);
						experianreportResponse.setLegalActionBankingCount(0);
						experianreportResponse.setBorrowerOutstanding(0);
						experianreportResponse.setBankingCreditApprovedCount(0);
						experianreportResponse.setBankingCreditApprovedAmount(0);
						experianreportResponse.setBankingCreditPendingCount(0);
						experianreportResponse.setBankingCreditPendingAmount(0);
						experianreportResponse.setBase64_pdf(null);
						SavetoCreditCheckErrors(experianreportResponse.getResponseCode(),
								experianreportResponse.getResponseMsg(), name, regexexpression, 0);
						// SavetoCreditCheckError(error,name,regexexpression);
						//To add logs in DB
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(experianreportResponse.toString());
						// saveLogsToDB(ccLogs);
						return experianreportResponse;
					}
				} 
				else if (inputResponseName != null) {
					
					if (!inputResponseName.equals(userSearchRequest.getName())) {
						experianreportResponse.setResponseCode("404");
						experianreportResponse.setResponseMsg(
								"Name mismatch");
						experianreportResponse.setURL(null);
						experianreportResponse.setRefxml(null);
						experianreportResponse.setBankruptcyCount(0);
						experianreportResponse.setLegalSuitCount(0);
						experianreportResponse.setTradeBureauCount(0);
						experianreportResponse.setIScore(0);
						experianreportResponse.setIScoreRiskGrade(0);
						experianreportResponse.setIScoreGradeFormat(null);
						experianreportResponse.setLegalActionBankingCount(0);
						experianreportResponse.setBorrowerOutstanding(0);
						experianreportResponse.setBankingCreditApprovedCount(0);
						experianreportResponse.setBankingCreditApprovedAmount(0);
						experianreportResponse.setBankingCreditPendingCount(0);
						experianreportResponse.setBankingCreditPendingAmount(0);
						experianreportResponse.setBase64_pdf(null);
						SavetoCreditCheckErrors(experianreportResponse.getResponseCode(),
								experianreportResponse.getResponseMsg(), name, regexexpression, 0);
						// SavetoCreditCheckError(error,name,regexexpression);
						//To add logs in DB
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(experianreportResponse.toString());
						// saveLogsToDB(ccLogs);
						return experianreportResponse;
					}else
					experianreportResponse.setResponseCode("404");
					experianreportResponse.setResponseMsg(
							"Oops, maybe it is us and not you, but we can’t seem to validate this MyKad number/name! Probably it was not in a correct format. For MyKad No, please key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin/Binti/ A/L / A/P and without any abbreviations.");
					experianreportResponse.setURL(null);
					experianreportResponse.setRefxml(null);
					experianreportResponse.setBankruptcyCount(0);
					experianreportResponse.setLegalSuitCount(0);
					experianreportResponse.setTradeBureauCount(0);
					experianreportResponse.setIScore(0);
					experianreportResponse.setIScoreRiskGrade(0);
					experianreportResponse.setIScoreGradeFormat(null);
					experianreportResponse.setLegalActionBankingCount(0);
					experianreportResponse.setBorrowerOutstanding(0);
					experianreportResponse.setBankingCreditApprovedCount(0);
					experianreportResponse.setBankingCreditApprovedAmount(0);
					experianreportResponse.setBankingCreditPendingCount(0);
					experianreportResponse.setBankingCreditPendingAmount(0);
					experianreportResponse.setBase64_pdf(null);
					SavetoCreditCheckErrors(experianreportResponse.getResponseCode(),
							experianreportResponse.getResponseMsg(), name, regexexpression, 0);
					// SavetoCreditCheckError(error,name,regexexpression);
					//To add logs in DB
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(experianreportResponse.toString());
					// saveLogsToDB(ccLogs);
					return experianreportResponse;
					
				}
				else {
					/*
					 * error.setErrorcode("404"); error.setErrormessage(
					 * "Oops, maybe it is us and not you, but we can’t seem to validate this MyKad number/name! Probably it was not in a correct format. For MyKad No, please key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin/Binti/ A/L / A/P and without any abbreviations."
					 * ); SavetoCreditCheckError(error,name,regexexpression); return error;
					 */
					experianreportResponse.setResponseCode("404");
					experianreportResponse.setResponseMsg(
							"Oops, maybe it is us and not you, but we can’t seem to validate this MyKad number/name! Probably it was not in a correct format. For MyKad No, please key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin/Binti/ A/L / A/P and without any abbreviations.");
					experianreportResponse.setURL(null);
					experianreportResponse.setRefxml(null);
					experianreportResponse.setBankruptcyCount(0);
					experianreportResponse.setLegalSuitCount(0);
					experianreportResponse.setTradeBureauCount(0);
					experianreportResponse.setIScore(0);
					experianreportResponse.setIScoreRiskGrade(0);
					experianreportResponse.setIScoreGradeFormat(null);
					experianreportResponse.setLegalActionBankingCount(0);
					experianreportResponse.setBorrowerOutstanding(0);
					experianreportResponse.setBankingCreditApprovedCount(0);
					experianreportResponse.setBankingCreditApprovedAmount(0);
					experianreportResponse.setBankingCreditPendingCount(0);
					experianreportResponse.setBankingCreditPendingAmount(0);
					experianreportResponse.setBase64_pdf(null);
					SavetoCreditCheckErrors(experianreportResponse.getResponseCode(),
							experianreportResponse.getResponseMsg(), name, regexexpression, 0);
					// SavetoCreditCheckError(error,name,regexexpression);
					//To add logs in DB
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(experianreportResponse.toString());
					// saveLogsToDB(ccLogs);
					return experianreportResponse;

				}
			} else {
				Utility utilityEntities = new Utility();
				reportFlag = true;

				if (retivalCount != null) {
					utilityEntities = ccrisUnifiedService.getCcrisReport(userSearchRequest, reportFlag,
							triggersleeptime, triggerreconnectCount, retivalCount);
				} else {
					utilityEntities = ccrisUnifiedService.getCcrisReport(userSearchRequest, reportFlag,
							triggersleeptime, triggerreconnectCount, 0);
				}

				// utilityEntities =
				// ccrisUnifiedService.getCcrisReport(userSearchRequest,reportFlag,retivalCount);
				// utilityEntities = ccrisUnifiedService.getCcrisReport();
				customercreditreportrequest = utilityEntities.getCreditReportRequest();
				log.info("customercreditreportrequest value## " + customercreditreportrequest);
				log.info("checking the error flafffff");

				if (utilityEntities.getInvalidUserFlag() != null && utilityEntities.getInvalidUserFlag() == false) {
					String caseSettled = customercreditreportrequest.getCasesettled();
					String casewithdraw = customercreditreportrequest.getCasewithdrawn();
					String paymentaging = customercreditreportrequest.getPaymentaging();
					boolean pendingflag = customercreditreportrequest.getPendingStatus();
					Integer legalsuitcount = customercreditreportrequest.getLegalstatusCount();
					Integer bankruptcycount = customercreditreportrequest.getBankruptcyCount();
					Integer tradeBureauCount = customercreditreportrequest.getTradeBureauCount();
					boolean entityKey = customercreditreportrequest.isEntityKey();
					boolean entityId = customercreditreportrequest.isEntityId();
					boolean CrissFlag = customercreditreportrequest.isCriss();
					String specialAttentionAccount = customercreditreportrequest.getSpecialAttentionAccount();
					String facility = customercreditreportrequest.getFacility();
					log.info(CrissFlag + "checking the pending Criss FLAG");
					checkcreditscoreResponse = ccrisUnifiedService.getCreditScore(
							customercreditreportrequest.getIScore(), caseSettled, casewithdraw, paymentaging,
							pendingflag, legalsuitcount, bankruptcycount, CrissFlag, tradeBureauCount, entityKey,
							entityId, specialAttentionAccount, facility);
					log.info("checking the credit score" + checkcreditscoreResponse.toString());

					if (checkcreditscoreResponse.getIsBelowscoreFlag() == false
							&& customercreditreportrequest.getDownaloadfilepath() != null
							&& customercreditreportrequest.getDownaloadfilepath().isEmpty() == false) {
						boolean nricExist = checkcreditscoreResponse.getIsNricExist();
						boolean isnamenricmatched = checkcreditscoreResponse.getIsNameNricMatched();
						boolean isregistrationAllowed = checkcreditscoreResponse.getIsRegistrationAllowed();
						int maximumallowedinstall = checkcreditscoreResponse.getMaximumAllowedInstallments();
						int maximumspeedlimit = checkcreditscoreResponse.getMaximumSpendingLimit();
						String statuscode = checkcreditscoreResponse.getStatusCode();
						String errormessage = checkcreditscoreResponse.getErrorMessage();
						customerSpendingLimitResponse.setIsNricExist(nricExist);
						customerSpendingLimitResponse.setIsNameNricMatched(isnamenricmatched);
						customerSpendingLimitResponse.setIsRegistrationAllowed(isregistrationAllowed);
						customerSpendingLimitResponse.setMaximumAllowedInstallments(maximumallowedinstall);
						customerSpendingLimitResponse.setMaximumSpendingLimit(maximumspeedlimit);
						customerSpendingLimitResponse.setStatusCode(statuscode);
						customerSpendingLimitResponse.setErrorMessage(errormessage);
						experianreportResponse.setResponseCode("00");
						experianreportResponse.setResponseMsg("Success");
						experianreportResponse.setURL(customercreditreportrequest.getDownaloadfilepath());
						experianreportResponse.setBankruptcyCount(customercreditreportrequest.getBankruptcyCount());
						experianreportResponse.setLegalSuitCount(customercreditreportrequest.getLegalSuitCount());
						experianreportResponse.setTradeBureauCount(customercreditreportrequest.getTradeBureauCount());
						experianreportResponse.setIScore(customercreditreportrequest.getIScore());
						experianreportResponse.setIScoreRiskGrade(customercreditreportrequest.getIScoreRiskGrade());
						experianreportResponse.setIScoreGradeFormat(customercreditreportrequest.getIScoreGradeFormat());
						experianreportResponse
								.setLegalActionBankingCount(customercreditreportrequest.getLegalActionBankingCount());
						experianreportResponse
								.setBorrowerOutstanding(customercreditreportrequest.getBorrowerOutstanding());
						experianreportResponse.setBankingCreditApprovedCount(
								customercreditreportrequest.getBankingCreditApprovedCount());
						experianreportResponse.setBankingCreditApprovedAmount(
								customercreditreportrequest.getBankingCreditApprovedAmount());
						experianreportResponse.setBankingCreditPendingCount(
								customercreditreportrequest.getBankingCreditPendingCount());
						experianreportResponse.setBankingCreditPendingAmount(
								customercreditreportrequest.getBankingCreditPendingAmount());
						experianreportResponse.setRefxml(customercreditreportrequest.getXmlString());
						experianreportResponse.setBase64_pdf(customercreditreportrequest.getBase64_pdf());
						log.info("added new customer to database" + experianreportResponse);
						saveResponseToDB(customercreditreportrequest, customerSpendingLimitResponse, userSearchRequest,
								"", reportFlag, nricnumber, ispresent);
						log.info("added new customer to database: " + customercreditreportrequest.getNric());
						return experianreportResponse;
					} else if (checkcreditscoreResponse.getIsBelowscoreFlag() == true
							&& customercreditreportrequest.getDownaloadfilepath() == null
							&& customercreditreportrequest.getDownaloadfilepath().isEmpty() == true) {

						log.info("Error 1==============");
						if (utilityEntities.getCodes() != null && utilityEntities.getCodes().contains("500")) {
							experianreportResponse.setResponseCode("500");
							experianreportResponse.setResponseMsg(ServerDownError);
						} else {
							experianreportResponse.setResponseCode("01");
							experianreportResponse.setResponseMsg("File Not Found For the Customer !!!");
						}

						experianreportResponse.setURL(null);
						experianreportResponse.setRefxml(null);
						experianreportResponse.setBankruptcyCount(0);
						experianreportResponse.setLegalSuitCount(0);
						experianreportResponse.setTradeBureauCount(0);
						experianreportResponse.setIScore(0);
						experianreportResponse.setIScoreRiskGrade(0);
						experianreportResponse.setIScoreGradeFormat(null);
						experianreportResponse.setLegalActionBankingCount(0);
						experianreportResponse.setBorrowerOutstanding(0);
						experianreportResponse.setBankingCreditApprovedCount(0);
						experianreportResponse.setBankingCreditApprovedAmount(0);
						experianreportResponse.setBankingCreditPendingCount(0);
						experianreportResponse.setBankingCreditPendingAmount(0);
						experianreportResponse.setBase64_pdf(null);
						// SavetoCreditCheckErrorwithResponsefromExperian(customerSpendingLimitResponse,name,regexexpression);
						//To add logs in DB
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(experianreportResponse.toString());
						// saveLogsToDB(ccLogs);
						return experianreportResponse;
					} else if (CrissFlag == true) {
						boolean nricExist = checkcreditscoreResponse.getIsNricExist();
						boolean isnamenricmatched = checkcreditscoreResponse.getIsNameNricMatched();
						boolean isregistrationAllowed = checkcreditscoreResponse.getIsRegistrationAllowed();
						int maximumallowedinstall = checkcreditscoreResponse.getMaximumAllowedInstallments();
						int maximumspeedlimit = checkcreditscoreResponse.getMaximumSpendingLimit();
						String statuscode = checkcreditscoreResponse.getStatusCode();
						String errormessage = checkcreditscoreResponse.getErrorMessage();
						customerSpendingLimitResponse.setIsNricExist(nricExist);
						customerSpendingLimitResponse.setIsNameNricMatched(isnamenricmatched);
						customerSpendingLimitResponse.setIsRegistrationAllowed(isregistrationAllowed);
						customerSpendingLimitResponse.setMaximumAllowedInstallments(maximumallowedinstall);
						customerSpendingLimitResponse.setMaximumSpendingLimit(maximumspeedlimit);
						customerSpendingLimitResponse.setStatusCode(statuscode);
						customerSpendingLimitResponse.setErrorMessage(errormessage);
						
						//To add logs in DB
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(experianreportResponse.toString());
						// saveLogsToDB(ccLogs);
						
						return customerSpendingLimitResponse;
					} else if (checkcreditscoreResponse.getIsBelowscoreFlag() != null
							&& checkcreditscoreResponse.getIsBelowscoreFlag() == true) {
						log.info("Error 2==============");
						experianreportResponse.setResponseCode("01");
						experianreportResponse.setResponseMsg(checkcreditscoreResponse.getErrorMessage());
						experianreportResponse.setURL(customercreditreportrequest.getDownaloadfilepath());
						experianreportResponse.setRefxml(customercreditreportrequest.getXmlString());
						experianreportResponse.setURL(customercreditreportrequest.getDownaloadfilepath());
						experianreportResponse.setBankruptcyCount(customercreditreportrequest.getBankruptcyCount());
						experianreportResponse.setLegalSuitCount(customercreditreportrequest.getLegalSuitCount());
						experianreportResponse.setTradeBureauCount(customercreditreportrequest.getTradeBureauCount());
						experianreportResponse.setIScore(customercreditreportrequest.getIScore());
						experianreportResponse.setIScoreRiskGrade(customercreditreportrequest.getIScoreRiskGrade());
						experianreportResponse.setIScoreGradeFormat(customercreditreportrequest.getIScoreGradeFormat());
						experianreportResponse
								.setLegalActionBankingCount(customercreditreportrequest.getLegalActionBankingCount());
						experianreportResponse
								.setBorrowerOutstanding(customercreditreportrequest.getBorrowerOutstanding());
						experianreportResponse.setBankingCreditApprovedCount(
								customercreditreportrequest.getBankingCreditApprovedCount());
						experianreportResponse.setBankingCreditApprovedAmount(
								customercreditreportrequest.getBankingCreditApprovedAmount());
						experianreportResponse.setBankingCreditPendingCount(
								customercreditreportrequest.getBankingCreditPendingCount());
						experianreportResponse.setBankingCreditPendingAmount(
								customercreditreportrequest.getBankingCreditPendingAmount());
						
						experianreportResponse.setBase64_pdf(customercreditreportrequest.getBase64_pdf());

						boolean nricExist = checkcreditscoreResponse.getIsNricExist();
						boolean isnamenricmatched = checkcreditscoreResponse.getIsNameNricMatched();
						boolean isregistrationAllowed = checkcreditscoreResponse.getIsRegistrationAllowed();
						int maximumallowedinstall = checkcreditscoreResponse.getMaximumAllowedInstallments();
						int maximumspeedlimit = checkcreditscoreResponse.getMaximumSpendingLimit();
						String statuscode = checkcreditscoreResponse.getStatusCode();
						String errormessage = checkcreditscoreResponse.getErrorMessage();
						customerSpendingLimitResponse.setIsNricExist(nricExist);
						customerSpendingLimitResponse.setIsNameNricMatched(isnamenricmatched);
						customerSpendingLimitResponse.setIsRegistrationAllowed(isregistrationAllowed);
						customerSpendingLimitResponse.setMaximumAllowedInstallments(maximumallowedinstall);
						customerSpendingLimitResponse.setMaximumSpendingLimit(maximumspeedlimit);
						customerSpendingLimitResponse.setStatusCode(statuscode);
						customerSpendingLimitResponse.setErrorMessage(errormessage);

						saveResponseToDB(customercreditreportrequest, customerSpendingLimitResponse, userSearchRequest,
								checkcreditscoreResponse.getErrorMessage(), reportFlag, regexexpression, ispresent);
						
						//To add logs in DB
						CreditCheckerLogs ccLogs = new CreditCheckerLogs();
						ccLogs.setRequest(userSearchRequest.toString());
						ccLogs.setResponse(experianreportResponse.toString());
						// saveLogsToDB(ccLogs);
						return experianreportResponse;
					} else {
						error.setErrorcode(utilityEntities.getCodes());
						error.setErrormessage(utilityEntities.getErrorMsg());
						// SavetoCreditCheckErrorR(error,name,regexexpression);
						return error;
					}
				} else if (utilityEntities.getInvalidUserFlag() != null
						&& utilityEntities.getInvalidUserFlag() == true) {
					log.info("Error 3==============");
					if (utilityEntities.getCodes() != null && utilityEntities.getCodes().contains("500")) {
						experianreportResponse.setResponseCode("500");
						experianreportResponse.setResponseMsg(ServerDownError);
					} else {
						experianreportResponse.setResponseCode("400");
						//experianreportResponse.setResponseMsg(utilityEntities.getErrorMsg());
						// 10-05 
						experianreportResponse.setResponseMsg("Invalid Input");
					}

					experianreportResponse.setURL(null);
					experianreportResponse.setRefxml(null);
					experianreportResponse.setBankruptcyCount(0);
					experianreportResponse.setLegalSuitCount(0);
					experianreportResponse.setTradeBureauCount(0);
					experianreportResponse.setIScore(0);
					experianreportResponse.setIScoreRiskGrade(0);
					experianreportResponse.setIScoreGradeFormat(null);
					experianreportResponse.setLegalActionBankingCount(0);
					experianreportResponse.setBorrowerOutstanding(0);
					experianreportResponse.setBankingCreditApprovedCount(0);
					experianreportResponse.setBankingCreditApprovedAmount(0);
					experianreportResponse.setBankingCreditPendingCount(0);
					experianreportResponse.setBankingCreditPendingAmount(0);
					experianreportResponse.setBase64_pdf(null);

					// log.info("Checking namemistach"+utilityEntities.getRetrivalCount());
					log.info("Checking namemistach==============" + utilityEntities.getRetrivalCount());
					SavetoCreditCheckErrorwithResponsefromExperian(utilityEntities, name, regexexpression, 0);
					
					//To add logs in DB
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(experianreportResponse.toString());
				//	saveLogsToDB(ccLogs);
					
					return experianreportResponse;

				} else if (utilityEntities.getExperianServerFlag() != null
						&& utilityEntities.getExperianServerFlag() == true) {
					log.info("Error 46==============" + utilityEntities.getRetrivalCount());
					checkcreditscoreResponse = ccrisUnifiedService.ExperianServerDown();
					// int retrival=customercreditreportrequest.getRetrivalCount();
					// log.info("Coming Inside Experian with total count"+retrival);
					// log.info("customer already exist so returning json response" + retrival);
					String errormessage = checkcreditscoreResponse.getErrorMessage();
					log.info("errormessage " + errormessage);
					if (utilityEntities.getCodes() != null && utilityEntities.getCodes().contains("500")) {
						experianreportResponse.setResponseCode("500");
						experianreportResponse.setResponseMsg(ServerDownError);
					} else {
						experianreportResponse.setResponseCode("102");
						experianreportResponse.setResponseMsg(errormessage);
					}
					experianreportResponse.setURL(null);
					experianreportResponse.setRefxml(null);
					experianreportResponse.setBankruptcyCount(0);
					experianreportResponse.setLegalSuitCount(0);
					experianreportResponse.setTradeBureauCount(0);
					experianreportResponse.setIScore(0);
					experianreportResponse.setIScoreRiskGrade(0);
					experianreportResponse.setIScoreGradeFormat(null);
					experianreportResponse.setLegalActionBankingCount(0);
					experianreportResponse.setBorrowerOutstanding(0);
					experianreportResponse.setBankingCreditApprovedCount(0);
					experianreportResponse.setBankingCreditApprovedAmount(0);
					experianreportResponse.setBankingCreditPendingCount(0);
					experianreportResponse.setBankingCreditPendingAmount(0);
					experianreportResponse.setBase64_pdf(null);

					// experianreportResponse.setURL(null);
					// experianreportResponse.setRefxml(customercreditreportrequest.getXmlString());

					SavetoCreditCheckErrorwithResponsefromExperian(utilityEntities, name, regexexpression,
							utilityEntities.getRetrivalCount());

					//To add logs in DB
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(experianreportResponse.toString());
					// saveLogsToDB(ccLogs);
					
					return experianreportResponse;

				} else if (utilityEntities.getInvalidUsernameflag() == true) {
					log.info("Error 4==============");
					if (utilityEntities.getCodes() != null && utilityEntities.getCodes().contains("500")) {
						experianreportResponse.setResponseCode("500");
						experianreportResponse.setResponseMsg(ServerDownError);
					} else {
						experianreportResponse.setResponseCode("02");
						experianreportResponse.setResponseMsg(utilityEntities.getErrorMsg());
					}
					experianreportResponse.setURL(null);
					experianreportResponse.setRefxml(null);
					experianreportResponse.setBankruptcyCount(0);
					experianreportResponse.setLegalSuitCount(0);
					experianreportResponse.setTradeBureauCount(0);
					experianreportResponse.setIScore(0);
					experianreportResponse.setIScoreRiskGrade(0);
					experianreportResponse.setIScoreGradeFormat(null);
					experianreportResponse.setLegalActionBankingCount(0);
					experianreportResponse.setBorrowerOutstanding(0);
					experianreportResponse.setBankingCreditApprovedCount(0);
					experianreportResponse.setBankingCreditApprovedAmount(0);
					experianreportResponse.setBankingCreditPendingCount(0);
					experianreportResponse.setBankingCreditPendingAmount(0);
					experianreportResponse.setBase64_pdf(null);
					SavetoCreditCheckErrorwithResponsefromExperian(utilityEntities, name, regexexpression, 0);
					
					//To add logs in DB
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(experianreportResponse.toString());
					// saveLogsToDB(ccLogs);
					
					return experianreportResponse;

				} else {
					log.info("Error 5==============");
					checkcreditscoreResponse = ccrisUnifiedService.errorMethodCalling();
					String errormessage = checkcreditscoreResponse.getErrorMessage();
					if (utilityEntities.getCodes() != null && utilityEntities.getCodes().contains("500")) {
						experianreportResponse.setResponseCode("500");
						experianreportResponse.setResponseMsg(ServerDownError);
					} else {
						experianreportResponse.setResponseCode("02");
						experianreportResponse.setResponseMsg(errormessage);
					}

					experianreportResponse.setURL(null);
					experianreportResponse.setRefxml(null);
					experianreportResponse.setBankruptcyCount(0);
					experianreportResponse.setLegalSuitCount(0);
					experianreportResponse.setTradeBureauCount(0);
					experianreportResponse.setIScore(0);
					experianreportResponse.setIScoreRiskGrade(0);
					experianreportResponse.setIScoreGradeFormat(null);
					experianreportResponse.setLegalActionBankingCount(0);
					experianreportResponse.setBorrowerOutstanding(0);
					experianreportResponse.setBankingCreditApprovedCount(0);
					experianreportResponse.setBankingCreditApprovedAmount(0);
					experianreportResponse.setBankingCreditPendingCount(0);
					experianreportResponse.setBankingCreditPendingAmount(0);
					experianreportResponse.setBase64_pdf(null);
					SavetoCreditCheckErrorwithResponsefromExperian(utilityEntities, name, regexexpression, 0);
					
					//To add logs in DB
					CreditCheckerLogs ccLogs = new CreditCheckerLogs();
					ccLogs.setRequest(userSearchRequest.toString());
					ccLogs.setResponse(experianreportResponse.toString());
				//	saveLogsToDB(ccLogs);
					
					return experianreportResponse;
				}

			}
		} else {
			// error.setErrorcode("404");
			// error.setErrormessage("Oops, maybe it is us and not you, but we can’t seem to
			// validate this MyKad number/name! Probably it was not in a correct format. For
			// MyKad No, please key in the 12 digits number (without any space/dash)
			// 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per
			// your MyKad i.e with Bin/Binti/ A/L / A/P and without any abbreviations.");
			// SavetoCreditCheckError(error,userSearchRequest.getName(),userSearchRequest.getEntityId());
			// return error;
			experianreportResponse.setResponseCode("01");
			experianreportResponse.setResponseMsg("Error");
			experianreportResponse.setURL(null);
			experianreportResponse.setRefxml(null);
			experianreportResponse.setBankruptcyCount(0);
			experianreportResponse.setLegalSuitCount(0);
			experianreportResponse.setTradeBureauCount(0);
			experianreportResponse.setIScore(0);
			experianreportResponse.setIScoreRiskGrade(0);
			experianreportResponse.setIScoreGradeFormat(null);
			experianreportResponse.setLegalActionBankingCount(0);
			experianreportResponse.setBorrowerOutstanding(0);
			experianreportResponse.setBankingCreditApprovedCount(0);
			experianreportResponse.setBankingCreditApprovedAmount(0);
			experianreportResponse.setBankingCreditPendingCount(0);
			experianreportResponse.setBankingCreditPendingAmount(0);
			experianreportResponse.setBase64_pdf(null);
			// SavetoCreditCheckErrors(experianreportResponse.getResponseCode(),experianreportResponse.getResponseMsg(),name,regexexpression);
			// SavetoCreditCheckError(error,name,regexexpression);
			
			//To add logs in DB
			CreditCheckerLogs ccLogs = new CreditCheckerLogs();
			ccLogs.setRequest(userSearchRequest.toString());
			ccLogs.setResponse(experianreportResponse.toString());
		//	saveLogsToDB(ccLogs);
			
			return experianreportResponse;
		}
		}experianreportResponse.setResponseCode("01");
		experianreportResponse.setResponseMsg(
				"Error");
		experianreportResponse.setURL(null);
		experianreportResponse.setRefxml(null);
		experianreportResponse.setBankruptcyCount(0);
		experianreportResponse.setLegalSuitCount(0);
		experianreportResponse.setTradeBureauCount(0);
		experianreportResponse.setIScore(0);
		experianreportResponse.setIScoreRiskGrade(0);
		experianreportResponse.setIScoreGradeFormat(null);
		experianreportResponse.setLegalActionBankingCount(0);
		experianreportResponse.setBorrowerOutstanding(0);
		experianreportResponse.setBankingCreditApprovedCount(0);
		experianreportResponse.setBankingCreditApprovedAmount(0);
		experianreportResponse.setBankingCreditPendingCount(0);
		experianreportResponse.setBankingCreditPendingAmount(0);
		experianreportResponse.setBase64_pdf(null);
		// SavetoCreditCheckErrors(experianreportResponse.getResponseCode(),experianreportResponse.getResponseMsg(),name,regexexpression);
		// SavetoCreditCheckError(error,name,regexexpression);
		
		//To add logs in DB
		CreditCheckerLogs ccLogs = new CreditCheckerLogs();
		ccLogs.setRequest(userSearchRequest.toString());
		ccLogs.setResponse(experianreportResponse.toString());
		// saveLogsToDB(ccLogs);
		
		return experianreportResponse;
	}

	private void SavetoCreditCheckErrors(String responseCode, String responseMsg, String name, String regexexpression,
			int retival) {
		try {
			CustomerCreditError checkError = new CustomerCreditError();
			/*
			 * checkErrors=creditCheckErrorRepository.findbyAll(regexexpression);
			 * if(checkErrors!=null) { DateTimeFormatter dtf =
			 * DateTimeFormatter.ofPattern("uuuu-MM-dd HH:mm:ss"); LocalDateTime now =
			 * LocalDateTime.now(); String updatedDate=dtf.format(now); SimpleDateFormat
			 * sdfIn1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); Date date =
			 * sdfIn1.parse(updatedDate);
			 * log.info("Checking the user database==============");
			 * log.info("checking date"+date);
			 * creditCheckErrorRepository.updateRetivalCount(retival,regexexpression,date);
			 */
			/*
			 * }else{ CreditCheckError checkError=new CreditCheckError();
			 */
			System.out.println(responseCode);
			checkError.setErrorCode(responseCode);
			checkError.setErrorStatus(responseMsg);
			checkError.setName(name);
			checkError.setNric(regexexpression);
			checkError.setRetrivalCount(retival);
			checkError.setCreatedAt(new Date());
			checkError.setUpdatedAt(new Date());
			creditCheckErrorRepository.save(checkError);

		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}

	}

	private void Savedownloadpathforexistingcustomer(String filepath, String nricnumber) {
		// CustomerCreditReports customerCreditReports = new CustomerCreditReports();
		List<CustomerCreditReports> customerCreditReport = customerCreditReportsRepository.findbynrics(nricnumber);
		for (CustomerCreditReports creditReports : customerCreditReport) {
			creditReports.setFilepath(filepath);
			System.out.println(creditReports.toString());
			customerCreditReportsRepository.save(creditReports);
		}

	}

	@GetMapping(value = "/creditchecker/DownloadExperianReport")
	public ResponseEntity<Object> downloadFile(@RequestParam(value = "fileName") final String keyName) {
		final byte[] data = awsService.downloadFile(keyName);
		String errorMessage = new String(data);

		if (errorMessage.contains("File Not Found For This Customer!!!!!!")) {

			return ResponseEntity.status(404).body(errorMessage);
		} else {
			final ByteArrayResource resource = new ByteArrayResource(data);
			return ResponseEntity.ok().contentLength(data.length).header("Content-type", "application/octet-stream")
					.header("Content-disposition", "attachment; filename=\"" + keyName + "\"").body(resource);
		}

	}

	@GetMapping(value = "/creditchecker/ping")
	public String pingServer() {
		return "Server is up";
	}

	
	@RequestMapping(value = { "/ekyc/initialize" }, method = RequestMethod.POST)
	public JSONObject realIdInit(@RequestBody JSONObject request) {

		log.info("Inside initialize request=" + request);
		JSONObject response = null;
		HashMap<String,String> dbvalues = dbconfig.getValueFromDB();
		
		//openApiClient = setValuesToOpenApi();
		openApiClient = ekycService.setValuesToOpenApiHardCoded(dbvalues);
		log.info("openApiClient " +openApiClient);
		log.info("merchantPublicKey set to openApi in initialize " + openApiClient.getOpenApiPublicKey());
		log.info("Host url set to openApi in initialize  " + openApiClient.getHostUrl());
		log.info("clientId set to openApi in initialize " + openApiClient.getClientId());
		initializeApi =  dbvalues.get("zolos.initialize");
		String apiRespStr = ekycService.callInitializeOpenApi(request, initializeApi);
		if (apiRespStr != null) {
			com.alibaba.fastjson.JSONObject apiResp = JSON.parseObject(apiRespStr);

			response = new JSONObject(apiResp);
			log.info("response=" + apiRespStr);
		} else {
			response = new JSONObject();
			response.put("errorMsg", "Zoloc response is null");

		}
		log.info("initialize request " + response);
		return response;
	}

	@RequestMapping(value = "/ekyc/checkresult", method = RequestMethod.POST)
	public JSONObject realIdCheck(@RequestBody JSONObject request) {
		JSONObject response = null;
		log.info("Inside checkresult =" + request);
		HashMap<String,String> dbvalues = dbconfig.getValueFromDB();
		// openApiClient = setValuesToOpenApi();
		openApiClient =	ekycService.setValuesToOpenApiHardCoded(dbvalues);
		
		String checkResultApi =  dbvalues.get("zolos.checkresult");
		log.info("openApiClient " +openApiClient);
		String apiRespStr = ekycService.callCheckStatusOpenApi(request, checkResultApi);

		if (apiRespStr != null) {
			com.alibaba.fastjson.JSONObject apiResp = JSON.parseObject(apiRespStr);

			response = new JSONObject(apiResp);
		} else {
			response.put("errorMsg", "Zoloc response is null");

		}
		log.info("response in checkresult =" + response);
		return response;
	}

	
	public CustomerSpendingLimitResponse creditCheckerSimulatorForSpendingLimit(JSONObject request) {
		log.info("Inside simulator " + request);
		ExperianReportResponse experianreportResponse = new ExperianReportResponse();
		CustomerSpendingLimitResponse response = new CustomerSpendingLimitResponse();
		String entityId = null;
		String name = null;
		boolean serviceReportFlag = false;
		Object finalResponse = null;
		try {
			if (request.getString("entityId") != null && request.getString("entityId") != "") {
				entityId = request.getString("entityId");
			}
			if (request.getString("name") != null && request.getString("name") != "") {
				name = request.getString("name");
			}
			if (request.getString("serviceName") != null && request.getString("serviceName").equals("GetReport")) {
				serviceReportFlag = true;
			}
			log.info("entityId " + entityId);

			if ((name.equals("WRONG NAME") || name.equals("ABDULLAH BIN MALIK") || name.equals("LARRY HENG")
					|| name.equals("BILL CLINTON") || name.equals("DEVI THANAPAKIAM"))) {
				String error = "Oops, maybe it is us and not you, but we can\\u2019t seem to validate this MyKad number\\/name! Probably it was not in a correct format. For MyKad No, please key in the 12 digits number (without any space\\/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin\\/Binti\\/ A\\/L \\/ A\\/P and without any abbreviations.";
					log.info("Inside validate name ");
					response.setIsRegistrationAllowed(false);
					response.setIsNricExist(false);
					response.setIsNameNricMatched(false);
					response.setMaximumAllowedInstallments(0);
					response.setMaximumSpendingLimit(0);
					response.setStatusCode("404");
					response.setErrorMessage(error);
					experianreportResponse = generateExperianReport(experianreportResponse, error,"404");
			} else if (entityId.contains("501230")) {
				Thread.sleep(25000);
				log.info("Thread sleeping for 25seconds");

				if(serviceReportFlag == false)
					response = (CustomerSpendingLimitResponse) validMykadForSpendingLimit(entityId, response,name,serviceReportFlag);
				if(serviceReportFlag == true)
					experianreportResponse = (ExperianReportResponse) validMykadForReport(entityId,name,serviceReportFlag);
					//experianreportResponse = generateExperianReportForSuccess(experianreportResponse, null,name,entityId); 

			} else if (entityId.contains("501231")) {
				String error = "We try to connect with Experian API 4 times if it is not connecting we will be throwing the status code.";
				Thread.sleep(25000);
				log.info("Thread sleeping for 25seconds");
					response.setIsRegistrationAllowed(false);
					response.setIsNricExist(false);
					response.setIsNameNricMatched(false);
					response.setMaximumAllowedInstallments(0);
					response.setMaximumSpendingLimit(0);
					response.setStatusCode("102");
					response.setErrorMessage(error);
					experianreportResponse = generateExperianReport(experianreportResponse, error,"102");
			} else {

				if(serviceReportFlag == false)
					response = (CustomerSpendingLimitResponse) validMykadForSpendingLimit(entityId, response,name,serviceReportFlag);
				if(serviceReportFlag == true)
					experianreportResponse = (ExperianReportResponse) validMykadForReport(entityId,name,serviceReportFlag);
					
					//experianreportResponse = generateExperianReportForSuccess(experianreportResponse, null,name,entityId); 
			}
			
			log.info("request.get(\"serviceName\") " +request.get("serviceName"));
			if (request.get("serviceName") == null) {
				log.info("building finalResponse for response " +response);
				finalResponse = response;
			} else if (request.get("serviceName") != null && request.get("serviceName").toString().equals("GetReport")) {
				log.info("building finalResponse for experianreportResponse " +experianreportResponse);
				finalResponse = experianreportResponse;
			}
		} catch (Exception e) {
			log.error("Exception in simulator " + e);
			response.setErrorMessage(e.getLocalizedMessage());
			return response;
		}
		
		//log.info("finalResponse " +finalResponse);
		return response;
	}
	
	
	public ExperianReportResponse creditCheckerSimulatorForReport(JSONObject request) {
		log.info("Inside simulator " + request);
		ExperianReportResponse experianreportResponse = new ExperianReportResponse();
		// CustomerSpendingLimitResponse response = new CustomerSpendingLimitResponse();
		String entityId = null;
		String name = null;
		boolean serviceReportFlag = false;
		Object finalResponse = null;
		try {
			if (request.getString("entityId") != null && request.getString("entityId") != "") {
				entityId = request.getString("entityId");
			}
			if (request.getString("name") != null && request.getString("name") != "") {
				name = request.getString("name");
			}
			if (request.getString("serviceName") != null && request.getString("serviceName").equals("GetReport")) {
				serviceReportFlag = true;
			}
			log.info("entityId " + entityId);

			if ((name.equals("WRONG NAME") || name.equals("ABDULLAH BIN MALIK") || name.equals("LARRY HENG")
					|| name.equals("BILL CLINTON") || name.equals("DEVI THANAPAKIAM"))) {
				String error = "Oops, maybe it is us and not you, but we can\\u2019t seem to validate this MyKad number\\/name! Probably it was not in a correct format. For MyKad No, please key in the 12 digits number (without any space\\/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin\\/Binti\\/ A\\/L \\/ A\\/P and without any abbreviations.";
					log.info("Inside validate name ");
					experianreportResponse = generateExperianReport(experianreportResponse, error,"404");
			} else if (entityId.contains("501230")) {
				Thread.sleep(25000);
				log.info("Thread sleeping for 25seconds");

				if(serviceReportFlag == true)
					experianreportResponse = (ExperianReportResponse) validMykadForReport(entityId,name,serviceReportFlag);
					//experianreportResponse = generateExperianReportForSuccess(experianreportResponse, null,name,entityId); 

			} else if (entityId.contains("501231")) {
				String error = "We try to connect with Experian API 4 times if it is not connecting we will be throwing the status code.";
				Thread.sleep(25000);
				log.info("Thread sleeping for 25seconds");
					experianreportResponse = generateExperianReport(experianreportResponse, error,"102");
			} else {

				if(serviceReportFlag == true)
					experianreportResponse = (ExperianReportResponse) validMykadForReport(entityId,name,serviceReportFlag);
					
					//experianreportResponse = generateExperianReportForSuccess(experianreportResponse, null,name,entityId); 
			}
			
			log.info("request.get(\"serviceName\") " +request.get("serviceName"));
		} catch (Exception e) {
			log.error("Exception in simulator " + e);
			experianreportResponse.setResponseMsg(e.getLocalizedMessage());
			return experianreportResponse;
		}
		
		return experianreportResponse;
	}

		
	 private ExperianReportResponse generateExperianReportForSuccess(String xml) {
		 log.info("Inside generateExperianReportForSuccess");	
		 ExperianReportResponse experianreportResponse = new ExperianReportResponse();
		 UserSearchRequest userSearchRequest = new UserSearchRequest();
		 userSearchRequest.setServiceName("GetReport");
		 String to = null;
		 try {
		 CustomerCreditReportRequest cc = ccrisReportRetrievalService.processReport( xml, false, true, userSearchRequest, 0,to);
		 log.info("CustomerCreditReportRequest " +cc);
		 experianreportResponse.setResponseCode("00");
			experianreportResponse.setResponseMsg("Success");
			experianreportResponse.setURL(cc.getDownaloadfilepath());
			experianreportResponse.setBankruptcyCount(cc.getBankruptcyCount());
			experianreportResponse.setLegalSuitCount(cc.getLegalSuitCount());
			experianreportResponse.setTradeBureauCount(cc.getTradeBureauCount());
			experianreportResponse.setIScore(cc.getIScore());
			experianreportResponse.setIScoreRiskGrade(cc.getIScoreRiskGrade());
			experianreportResponse.setIScoreGradeFormat(cc.getIScoreGradeFormat());
			experianreportResponse.setLegalActionBankingCount(cc.getLegalActionBankingCount());
			experianreportResponse.setBorrowerOutstanding(cc.getBorrowerOutstanding());
			experianreportResponse.setBankingCreditApprovedCount(cc.getBankingCreditApprovedCount());
			experianreportResponse.setBankingCreditApprovedAmount(cc.getBankingCreditApprovedAmount());
			experianreportResponse.setBankingCreditPendingCount(cc.getBankingCreditPendingCount());
			experianreportResponse.setBankingCreditPendingAmount(cc.getBankingCreditPendingAmount());
			experianreportResponse.setRefxml(cc.getXmlString());
			experianreportResponse.setBase64_pdf(cc.getBase64_pdf());
		 }
		 catch(Exception e) {
			 log.info("Exception in generateExperianReportForSuccess " +e );
			 experianreportResponse.setResponseMsg(e.getLocalizedMessage());
		 }
		 log.info("experianreportResponse " +experianreportResponse);
		return experianreportResponse;
	}

	private ExperianReportResponse generateExperianReport(ExperianReportResponse experianreportResponse,String error, String responseCd) {
		 experianreportResponse.setResponseCode(responseCd);
			experianreportResponse.setResponseMsg(error);
			experianreportResponse.setURL(null);
			experianreportResponse.setRefxml(null);
			experianreportResponse.setBankruptcyCount(0);
			experianreportResponse.setLegalSuitCount(0);
			experianreportResponse.setTradeBureauCount(0);
			experianreportResponse.setIScore(0);
			experianreportResponse.setIScoreRiskGrade(0);
			experianreportResponse.setIScoreGradeFormat(null);
			experianreportResponse.setLegalActionBankingCount(0);
			experianreportResponse.setBorrowerOutstanding(0);
			experianreportResponse.setBankingCreditApprovedCount(0);
			experianreportResponse.setBankingCreditApprovedAmount(0);
			experianreportResponse.setBankingCreditPendingCount(0);
			experianreportResponse.setBankingCreditPendingAmount(0);
			experianreportResponse.setBase64_pdf(null);
		return experianreportResponse;
	}

	public CustomerSpendingLimitResponse validMykadForSpendingLimit(String entityId, CustomerSpendingLimitResponse response,String name, boolean getReportflag) {
		log.info("inside validMykadForSpendingLimit");
		Object validateMyKad = null;
		ExperianReportResponse experianreportResponse = new ExperianReportResponse();
		if(entityId.contains("500101") || entityId.contains("501230")){
			
		 if (entityId.charAt(6) == '0' && entityId.charAt(7) == '7') {
				log.info("Inside entityId 500101{07}XXXX ");
				response.setIsRegistrationAllowed(false);
				response.setIsNricExist(false);
				response.setIsNameNricMatched(false);
				response.setMaximumAllowedInstallments(0);
				response.setMaximumSpendingLimit(0);
				response.setStatusCode("07");
				response.setErrorMessage("No Response");
			// 	experianreportResponse = generateExperianReport(experianreportResponse, "No Response","07");
			} else if (entityId.charAt(6) == '0' && entityId.charAt(7) == '5') {
				log.info("Inside entityId 500101{05}XXXX ");
				response.setIsRegistrationAllowed(true);
				response.setIsNricExist(true);
				response.setIsNameNricMatched(true);
				response.setMaximumAllowedInstallments(3);
				response.setMaximumSpendingLimit(150);
				response.setStatusCode("05");
				response.setErrorMessage("No Ccris Info found");
				
				// String xml = simulatorService.getXmlByErrorCode("05",name,entityId);
				// experianreportResponse = generateExperianReportForSuccess(xml);				 
			} else if (entityId.charAt(6) == '0' && entityId.charAt(7) == '6') {
				log.info("Inside entityId 500101{06}XXXX ");
				response.setIsRegistrationAllowed(false);
				response.setIsNricExist(true);
				response.setIsNameNricMatched(true);
				response.setMaximumAllowedInstallments(0);
				response.setMaximumSpendingLimit(0);
				response.setStatusCode("06");
				response.setErrorMessage("Low Credit Score");
				
				// String xml = simulatorService.getXmlByErrorCode("06",name,entityId);
				// experianreportResponse =  generateExperianReportForSuccess(xml);	
				 
			} else if (entityId.charAt(6) == '0' && entityId.charAt(7) == '1') {
				String error = "We are sorry,We are unable to provide AiraPay services to you. Upon our internal checks and verifications, we regret to inform you that you did not meet certain requirements we are looking for to enable the instalment payments under AiraPay for your account.";
				log.info("Inside entityId 500101{01}XXXX ");
				response.setIsRegistrationAllowed(false);
				response.setIsNricExist(true);
				response.setIsNameNricMatched(true);
				response.setMaximumAllowedInstallments(0);
				response.setMaximumSpendingLimit(0);
				response.setStatusCode("01");
				response.setErrorMessage(error);
				// experianreportResponse = generateExperianReport(experianreportResponse, error,"01");
			} else if (entityId.charAt(6) == '4' && entityId.charAt(7) == '0') {
				log.info("Inside entityId 500101{40}XXXX ");
				response.setIsRegistrationAllowed(false);
				response.setIsNricExist(false);
				response.setIsNameNricMatched(false);
				response.setMaximumAllowedInstallments(0);
				response.setMaximumSpendingLimit(0);
				response.setStatusCode("400");
				response.setErrorMessage("Invalid Input");
				experianreportResponse = generateExperianReport(experianreportResponse, "Invalid Input","400");
			} else if (entityId.charAt(6) == '4' && entityId.charAt(7) == '5') {
				log.info("Inside entityId 500101{45}XXXX ");
				response.setIsRegistrationAllowed(false);
				response.setIsNricExist(false);
				response.setIsNameNricMatched(false);
				response.setMaximumAllowedInstallments(0);
				response.setMaximumSpendingLimit(0);
				response.setStatusCode("405");
				response.setErrorMessage("Server error");
			//	experianreportResponse = generateExperianReport(experianreportResponse, "Server error","405");
			} else if (entityId.charAt(6) == '1' && entityId.charAt(7) == '3') {
				if (entityId.charAt(8) == '0') {
					log.info("Inside installment 3 success case ");
					response.setIsRegistrationAllowed(true);
					response.setIsNricExist(true);
					response.setIsNameNricMatched(true);
					response.setMaximumAllowedInstallments(3);
					response.setMaximumSpendingLimit(300);
					response.setStatusCode("00");
				//	 String xml = simulatorService.getXmlByErrorCode("0030",name,entityId);
				//	 experianreportResponse =  generateExperianReportForSuccess(xml);		
				} else if (entityId.charAt(8) == '1') {
					log.info("Inside installment 3 success case ");
					response.setIsRegistrationAllowed(true);
					response.setIsNricExist(true);
					response.setIsNameNricMatched(true);
					response.setMaximumAllowedInstallments(3);
					response.setMaximumSpendingLimit(500);
					response.setStatusCode("00");
					 String xml = simulatorService.getXmlByErrorCode("0031",name,entityId);
					 experianreportResponse =  generateExperianReportForSuccess(xml);	
				}
			} else if (entityId.charAt(6) == '1' && entityId.charAt(7) == '6') {
				if (entityId.charAt(8) == '0') {
					log.info("Inside installment 6 success case ");
					response.setIsRegistrationAllowed(true);
					response.setIsNricExist(true);
					response.setIsNameNricMatched(true);
					response.setMaximumAllowedInstallments(6);
					response.setMaximumSpendingLimit(1000);
					response.setStatusCode("00");
					// String xml = simulatorService.getXmlByErrorCode("0060",name,entityId);
				//	experianreportResponse = generateExperianReportForSuccess(xml);	
				} else if (entityId.charAt(8) == '1') {
					log.info("Inside installment 6 success case ");
					response.setIsRegistrationAllowed(true);
					response.setIsNricExist(true);
					response.setIsNameNricMatched(true);
					response.setMaximumAllowedInstallments(6);
					response.setMaximumSpendingLimit(1500);
					response.setStatusCode("00");
				//	String xml = simulatorService.getXmlByErrorCode("0061",name,entityId);
				//	experianreportResponse = generateExperianReportForSuccess(xml);	
				} else if (entityId.charAt(8) == '2') {
					log.info("Inside installment 6 success case ");
					response.setIsRegistrationAllowed(true);
					response.setIsNricExist(true);
					response.setIsNameNricMatched(true);
					response.setMaximumAllowedInstallments(6);
					response.setMaximumSpendingLimit(2000);
					response.setStatusCode("00");
				//	String xml = simulatorService.getXmlByErrorCode("0062",name,entityId);
				//	experianreportResponse = generateExperianReportForSuccess(xml);	
				} else if (entityId.charAt(8) == '3') {
					log.info("Inside installment 6 success case ");
					response.setIsRegistrationAllowed(true);
					response.setIsNricExist(true);
					response.setIsNameNricMatched(true);
					response.setMaximumAllowedInstallments(6);
					response.setMaximumSpendingLimit(2500);
					response.setStatusCode("00");
				//	String xml = simulatorService.getXmlByErrorCode("0063",name,entityId);
				//	experianreportResponse = generateExperianReportForSuccess(xml);	
				} else if (entityId.charAt(8) == '4') {
					log.info("Inside installment 6 success case ");
					response.setIsRegistrationAllowed(true);
					response.setIsNricExist(true);
					response.setIsNameNricMatched(true);
					response.setMaximumAllowedInstallments(6);
					response.setMaximumSpendingLimit(3000);
					response.setStatusCode("00");
				//	String xml = simulatorService.getXmlByErrorCode("0064",name,entityId);
				//	experianreportResponse = generateExperianReportForSuccess(xml);	
				}
			}
			}
		 /*	if(getReportflag == true) {
		 		validateMyKad = experianreportResponse;
		 	}
		 	else {
		 		validateMyKad = response;
		 	}*/
		 	return response;
	 }
	
	
	public ExperianReportResponse validMykadForReport(String entityId,String name, boolean getReportflag) {
		log.info("inside validMykadForSpendingLimit");
		Object validateMyKad = null;
		ExperianReportResponse experianreportResponse = new ExperianReportResponse();
		if(entityId.contains("500101") || entityId.contains("501230")){
			
		 if (entityId.charAt(6) == '0' && entityId.charAt(7) == '7') {
				log.info("Inside entityId 500101{07}XXXX ");
				experianreportResponse = generateExperianReport(experianreportResponse, "No Response","07");
			} else if (entityId.charAt(6) == '0' && entityId.charAt(7) == '5') {
				log.info("Inside entityId 500101{05}XXXX ");
				
				 String xml = simulatorService.getXmlByErrorCode("05",name,entityId);
				 experianreportResponse = generateExperianReportForSuccess(xml);				 
			} else if (entityId.charAt(6) == '0' && entityId.charAt(7) == '6') {
				log.info("Inside entityId 500101{06}XXXX ");
				
				 String xml = simulatorService.getXmlByErrorCode("06",name,entityId);
				 experianreportResponse =  generateExperianReportForSuccess(xml);	
				 
			} else if (entityId.charAt(6) == '0' && entityId.charAt(7) == '1') {
				String error = "We are sorry,We are unable to provide AiraPay services to you. Upon our internal checks and verifications, we regret to inform you that you did not meet certain requirements we are looking for to enable the instalment payments under AiraPay for your account.";
				log.info("Inside entityId 500101{01}XXXX ");
				experianreportResponse = generateExperianReport(experianreportResponse, error,"01");
			} else if (entityId.charAt(6) == '4' && entityId.charAt(7) == '0') {
				log.info("Inside entityId 500101{40}XXXX ");
				experianreportResponse = generateExperianReport(experianreportResponse, "Invalid Input","400");
			} else if (entityId.charAt(6) == '4' && entityId.charAt(7) == '5') {
				log.info("Inside entityId 500101{45}XXXX ");
				experianreportResponse = generateExperianReport(experianreportResponse, "Server error","405");
			} else if (entityId.charAt(6) == '1' && entityId.charAt(7) == '3') {
				if (entityId.charAt(8) == '0') {
					log.info("Inside installment 3 success case ");
					 String xml = simulatorService.getXmlByErrorCode("0030",name,entityId);
					 experianreportResponse =  generateExperianReportForSuccess(xml);		
				} else if (entityId.charAt(8) == '1') {
					log.info("Inside installment 3 success case ");
					 String xml = simulatorService.getXmlByErrorCode("0031",name,entityId);
					 experianreportResponse =  generateExperianReportForSuccess(xml);	
				}
			} else if (entityId.charAt(6) == '1' && entityId.charAt(7) == '6') {
				if (entityId.charAt(8) == '0') {
					log.info("Inside installment 6 success case ");
					String xml = simulatorService.getXmlByErrorCode("0060",name,entityId);
					experianreportResponse = generateExperianReportForSuccess(xml);	
				} else if (entityId.charAt(8) == '1') {
					log.info("Inside installment 6 success case ");
					String xml = simulatorService.getXmlByErrorCode("0061",name,entityId);
					experianreportResponse = generateExperianReportForSuccess(xml);	
				} else if (entityId.charAt(8) == '2') {
					log.info("Inside installment 6 success case ");
					String xml = simulatorService.getXmlByErrorCode("0062",name,entityId);
					experianreportResponse = generateExperianReportForSuccess(xml);	
				} else if (entityId.charAt(8) == '3') {
					log.info("Inside installment 6 success case ");
					String xml = simulatorService.getXmlByErrorCode("0063",name,entityId);
					experianreportResponse = generateExperianReportForSuccess(xml);	
				} else if (entityId.charAt(8) == '4') {
					log.info("Inside installment 6 success case ");
					String xml = simulatorService.getXmlByErrorCode("0064",name,entityId);
					experianreportResponse = generateExperianReportForSuccess(xml);	
				}
			}
			}
		 	return experianreportResponse;
	 }
	 
	public OpenApiClient setValuesToOpenApi() {
		log.info("Pulling from properties");
		HashMap<String,String> dbvalues = dbconfig.getValueFromDB();
		//log.info("CLIENTID VALUE VS " + creditScoreConfigRepository.findValueFromName("clientId"));
		
		hostUrl = dbvalues.get(GlobalConstants.ZOLO_SERVER);
		clientId = dbvalues.get(GlobalConstants.ZOLO_CLIENTID);
		merchantPrivatekey = dbvalues.get(GlobalConstants.ZOLO_MERCHANT_PRIVATE_KEY);
		merchantPublicKey = dbvalues.get(GlobalConstants.ZOLO_MERCHANT_PUBLIC_KEY);
		openApiClient.setHostUrl(hostUrl);
		openApiClient.setClientId(clientId);
		openApiClient.setMerchantPrivateKey(merchantPrivatekey);

		openApiClient.setOpenApiPublicKey(merchantPublicKey);

		openApiClient.setSigned(true);
		openApiClient.setEncrypted(true);

		log.info("Host url set to openApi " + openApiClient.getHostUrl());
		log.info("clientId set to openApi " + openApiClient.getClientId());
		log.info("merchantPrivatekey url set to openApi " + openApiClient.getMerchantPrivateKey());
		log.info("merchantPublicKey set to openApi " + openApiClient.getOpenApiPublicKey());

		return openApiClient;
	}
	
	/* public void saveLogsToDB(CreditCheckerLogs ccLogs) {
	    	String ipAddress = null;
	    	String clientName = null;
	    	String key = APIKeyAuthFilter.setKeyAndValue().get("headerKey");
	    	try {
	    		InetAddress inetAddress = InetAddress.getLocalHost();
	    		ipAddress = inetAddress.getHostAddress();
	    		}catch(Exception e) {
	    			log.info("Exception " +e);
	    		}
	    	log.info("key " +key);
	    	clientName = creditCheckerAuthRepository.findClientNameFromKey(key);
	    	ccLogs.setIp_address(ipAddress);
	    	ccLogs.setClient_id(clientName);
	    	log.info("clientName " +clientName);
	    	Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	    	ccLogs.setTimestamp(timestamp);  
	    	creditCheckerLogRepository.save(ccLogs);
	    }
	 */
	 
	 
	 @GetMapping(value = "/creditchecker/getBase64")
		public String getBase64() {
		 log.info("Inside getBlobFromPdf");
		 String returnStr = null;
		 List<CustomerCreditReports> customerCredit = customerCreditReportsRepository.findAll();
		 for (int i=0 ;i<customerCredit.size(); i++) { // for (int i=70 ;i<79; i++) {
			 
			 log.info("Nric  " +customerCredit.get(i).getNric());
			 if(customerCredit.get(i).getFilepath() != null) { 
				 
				 log.info("Nric final  " +customerCredit.get(i).getNric());
					try {
						String fileName = customerCredit.get(i).getFilepath();
						log.info("fileName " +fileName);
						if(fileName.contains("http://sandbox")){
							log.info("fileName# " +fileName);
							fileName = fileName.replace("http://sandbox", "https://sandbox");
							log.info("fileName## " +fileName);
							}
						//Path to be replaced to /var/tmp/creditChecker/pdfBlobTest in higher environments
						Files.copy(
							    new URL(fileName).openStream(),
							    Paths.get("/var/tmp/creditChecker/pdfbase64Test"+customerCredit.get(i).getNric()+ ".pdf"),StandardCopyOption.REPLACE_EXISTING);
						
						String filePath = "/var/tmp/creditChecker/pdfbase64Test"+customerCredit.get(i).getNric()+ ".pdf";
					    File pdfFile = new File(filePath);
					    byte[] encoded = Files.readAllBytes(Paths.get(pdfFile.getAbsolutePath()));
					    Base64.Encoder enc = Base64.getEncoder();
					    byte[] strenc = enc.encode(encoded);
					    String encode = new String(strenc, "UTF-8");
					    pdfFile.delete();
					    
						log.info("Before update");
						customerCreditReportsRepository.updateBase64(customerCredit.get(i).getNric(), encode);
						
						log.info("Updated Nric  " + customerCredit.get(i).getNric());
						returnStr = "Done";
					}catch(Exception e) {
					// log.info("Exception in getBlobFromPdf " +e);
						e.printStackTrace();
					 returnStr = e.getLocalizedMessage();
				 }
			 }
			}
		 
			return returnStr;
		}
}
