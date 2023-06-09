package my.mobypay.creditScore.service;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import lombok.extern.slf4j.Slf4j;
import my.mobypay.creditScore.DBConfig;
import my.mobypay.creditScore.dao.CreditScoreConfigRepository;
import my.mobypay.creditScore.dto.UserConfirmCCRISEntityRequest;
import my.mobypay.creditScore.dto.UserSearchRequest;
import my.mobypay.creditScore.dto.request.CcrisRequestXml;
import my.mobypay.creditScore.dto.request.CcrisSearchRequest;
import my.mobypay.creditScore.dto.request.ConfirmCcrisEntityRequest;
import my.mobypay.creditScore.dto.response.CcrisXml;
import my.mobypay.creditScore.dto.response.Item;
import my.mobypay.creditScore.dto.response.Tokens;
import my.mobypay.creditScore.repository.UserRequestEntityRepository;
import my.mobypay.creditScore.utility.EmailUtility;
import my.mobypay.creditScore.utility.ParserUtility;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

//@Slf4j
@Service
public class CcrisSearchService {

	private static Logger log = LoggerFactory.getLogger(CcrisSearchService.class);
    RestTemplate restTemplate  = new RestTemplate();
/*
    @Autowired
	CreditScoreConfigRepository creditScoreConfigRepository;
    */
    
    @Autowired
	DBConfig dbconfig;
    
    // private String experianUrl = "https://b2buat.experian.com.my/index.php/moby/report";
     // private String experianUrl = "C:\\Users\\Admin\\Documents\\creditScore\\src\\main\\resources\\Item.xml";
	/*
	 * ReadPropertyFile file=new ReadPropertyFile(); Properties prop = new
	 * Properties(); boolean propertyFlag;
	 */
 	// @Value("${ExperianURLReport}")
 	protected String ExperianURLReport = null;
 	
 	//@Value("${ExperianUsername}")
 	protected String ExperianUsername  = null;
	
	//@Value("${ExperianPassword}")
 	protected String ExperianPassword  = null;
    
	 String message="Oops, maybe it is us and not you, but we can’t seem to validate this MyKad number/name! e 12 digits number (without any space/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin/Binti/ A/L / A/P and without any abbreviations.";
			
	public CcrisXml ccrisSearch(UserSearchRequest userSearchRequest, String emailSending) throws Exception {
		HashMap<String,String> dbvalues = dbconfig.getValueFromDB();
		
		ExperianUsername = dbvalues.get("ExperianUsername");
		ExperianPassword = dbvalues.get("ExperianPassword");
		System.out.println(ExperianUsername+"========"+ExperianPassword);
		//ResponseEntity<String> response = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_XML);
		headers.setBasicAuth(ExperianUsername, ExperianPassword);

		String xmlRequest = null;
		try {
			XmlMapper xmlMapper = new XmlMapper();

			CcrisSearchRequest ccrisSearchRequest = CcrisSearchRequest.builder().ProductType("CCRIS_SEARCH")
					.GroupCode("11").EntityName(userSearchRequest.getName()).EntityId(userSearchRequest.getEntityId())
					.Country("MY").DOB("2022-01-11").build();

			CcrisRequestXml ccrisXml = new CcrisRequestXml();
			ccrisXml.setRequest(ccrisSearchRequest);

			xmlRequest = xmlMapper.writeValueAsString(ccrisXml);
			System.out.println("***********request**************");
			System.out.println(xmlRequest);
			log.info("Experian ccris search request:" + xmlRequest);
		} catch (Exception e) {
			// e.printStackTrace();
	            log.info("coming inside token catch------------------:"+xmlRequest);
	            CcrisXml ccrisXml=new CcrisXml();
				 ccrisXml.setCode("401");
				 ccrisXml.setError(message);
			EmailUtility emailUtility=new EmailUtility();
			emailUtility.sentEmail(e.getLocalizedMessage(),emailSending);
			 
	    		return ccrisXml;
		}

		HttpEntity<String> request = new HttpEntity<String>(xmlRequest, headers);
		/*
		 * propertyFlag=false; String user = file.getvaluefromproperty(propertyFlag);
		 */
		try {
			ExperianURLReport = dbvalues.get("ExperianURLReport");
			 ResponseEntity<String> response =  restTemplate.postForEntity(ExperianURLReport,request,String.class);
		    	String responsess=response.getBody().trim().replaceAll("[ ]{2,}", " ");
		    	   if(responsess.contains("BINTI")) {
		    		   responsess=responsess.replaceAll("BINTI", "").trim().replaceAll("[ ]{2,}", " "); 
		    	   }else if(responsess.contains("BIN")) {
		    		   responsess=responsess.replaceAll("BIN", "").trim().replaceAll("[ ]{2,}", " "); 
		    	   }else if(responsess.contains("Bin")) {
		    		   responsess=responsess.replaceAll("Bin", "").trim().replaceAll("[ ]{2,}", " "); 
		    	   }else if(responsess.contains("BT")) {
		    		   responsess=responsess.replaceAll("BT", "").trim().replaceAll("[ ]{2,}", " "); 
		    	   }else if(responsess.contains("bt")) {
		    		   responsess=responsess.replaceAll("bt", "").trim().replaceAll("[ ]{2,}", " "); 
		    	   }else if(responsess.contains("BTE")) {
		    		   responsess=responsess.replaceAll("BTE", "").trim().replaceAll("[ ]{2,}", " "); 
		    	   }else if(responsess.contains("bte")) {
		    		   responsess=responsess.replaceAll("bte", "").trim().replaceAll("[ ]{2,}", " "); 
					} else if(responsess.contains("BY")) {
			    		   responsess=responsess.replaceAll("BY", "").trim().replaceAll("[ ]{2,}", " "); 
			    	   }else if(responsess.contains("by")) {
			    		   responsess=responsess.replaceAll("by", "").trim().replaceAll("[ ]{2,}", " "); 
			    	   }
		    	   
		    	   
		    	   
		    	   /*
						 * else if(responsess.contains("B")) { responsess=responsess.replaceAll("B",
						 * "").trim().replaceAll("[ ]{2,}", " "); }else if(responsess.contains("b")) {
						 * responsess=responsess.replaceAll("b", "").trim().replaceAll("[ ]{2,}", " ");
						 * }
						 */
		    	   
		    	   
		    	   else {
		    		   responsess=responsess.replaceAll("Binti", "").trim().replaceAll("[ ]{2,}", " ");  
		    	   }
			
			 CcrisXml responses= ParserUtility.xml2Pojo(responsess, CcrisXml.class);
	         log.info("Experian Token response=========:"+responsess.toString());
		//response = restTemplate.postForEntity(ExperianURLReport, request, String.class);
	
		  
		  log.info("Experian ccrisXml response:" + response.getBody());
		 if(response.getBody().contains("Invalid Input")) {
			 CcrisXml ccrisXml=new CcrisXml();
			 ccrisXml.setCode("401");
			 ccrisXml.setError(message);
			 ccrisXml.setDBMessage(response.getBody());
	    		return ccrisXml;
	        
	        }else {
	        	  return responses;
	        }
		
		}catch (Exception e) {
		// e.printStackTrace();
		 System.out.println(e.getMessage()+"ccris search request -----");
		 CcrisXml ccrisXml=new CcrisXml();
		 ccrisXml.setCode("401");
		 ccrisXml.setError(message);
		 ccrisXml.setDBMessage(e.getMessage());
		 log.info("Experian ccrisXml:"+ccrisXml);
		 System.out.println("Experian ccrisXml:"+ccrisXml);
		 EmailUtility emailUtility=new EmailUtility();
			emailUtility.sentEmail(e.getLocalizedMessage(),emailSending);
		  //emailUtility.sentEmail(e.getLocalizedMessage());
	 
		 return ccrisXml;
		}
		
		  
			/*
			 * System.out.println(request.toString()); ResponseEntity<String> response =
			 * restTemplate.postForEntity(experianUrl,request,String.class);
			 * System.out.println("***********response**************");
			 * System.out.println(response.getBody());
			 * log.info("Experian ccris search response:"+response.getBody());
			 * 
			 * return ParserUtility.xml2Pojo(response.getBody(), CcrisXml.class);
			 */
		  
		  }
		 

    public Tokens ccrisConfirm(UserConfirmCCRISEntityRequest userConfirmCCRISEntityRequest, String to) throws Exception{
    	HashMap<String,String> dbvalues = dbconfig.getValueFromDB();
    	
    	ExperianUsername = dbvalues.get("ExperianUsername");
		ExperianPassword = dbvalues.get("ExperianPassword");
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_XML);
       // headers.setBasicAuth("MOBYUAT1","Mobyuat.1");
        headers.setBasicAuth(ExperianUsername, ExperianPassword);


        String xmlRequest = null;
        try {
            XmlMapper xmlMapper = new XmlMapper();

            ConfirmCcrisEntityRequest confirmCcrisEntityRequest = ConfirmCcrisEntityRequest.builder()
                    .ProductType("IRISS")
                    .CRefId(userConfirmCCRISEntityRequest.getRefId())
                    .EntityKey(userConfirmCCRISEntityRequest.getEntityKey())
                    .MobileNo(userConfirmCCRISEntityRequest.getMobileNo())
                    .EmailAddress(userConfirmCCRISEntityRequest.getEmailAddress())
                    .LastKnownAddress(userConfirmCCRISEntityRequest.getLastKnownAddress())
                    .ConsentGranted(userConfirmCCRISEntityRequest.getConsentGranted())
                    .EnquiryPurpose(userConfirmCCRISEntityRequest.getEnquiryPurpose())
                    .build();

            CcrisRequestXml ccrisXml = new CcrisRequestXml();
            ccrisXml.setRequest(confirmCcrisEntityRequest);

            xmlRequest = xmlMapper.writeValueAsString(ccrisXml);
            System.out.println("***********request**************");
            System.out.println(xmlRequest);
            log.info("Experian ccris confirm requestsssssssssssssssss:"+xmlRequest);
        } catch (Exception e) {
            e.printStackTrace();
            log.info("coming inside token catch------------------:"+xmlRequest);
            Tokens tokens=new Tokens();
    		tokens.setCode("401");
    		tokens.setError(message);
    	 EmailUtility emailUtility=new EmailUtility();
    		emailUtility.sentEmail(e.getLocalizedMessage(),to);
			//  emailUtility.sentEmail(e.getLocalizedMessage());
		 
    		return tokens;
        }

        HttpEntity<String> request = new HttpEntity<String>(xmlRequest, headers);

        System.out.println(request.toString());
		/*
		 * propertyFlag=false; String user = file.getvaluefromproperty(propertyFlag);
		 */
    	try {
        ResponseEntity<String> response =  restTemplate.postForEntity(ExperianURLReport,request,String.class);
         Tokens responses= ParserUtility.xml2Pojo(response.getBody(), Tokens.class);
         log.info("Experian Token response:"+response.getBody());
       // log.info("Token responssssssssssssssssss:"+response.getBody().contains("Invalid Input"));
        if(response.getBody().contains("Invalid Input")) {   
        	Tokens tokens=new Tokens();
    		tokens.setCode("400");
    		// tokens.setError("Name mismatch"); //10-05
    		tokens.setError("Invalid Input");
    		tokens.setDataBaseMessage(response.getBody());
    		return tokens;
        }else {
        	  return responses;
        }
       
      
    	}catch (Exception e) {
    		 log.info(e.getMessage()+"ccris confirm error");
		Tokens tokens=new Tokens();
		tokens.setCode("401");
		tokens.setError(message);
		tokens.setDataBaseMessage(e.getMessage());
		EmailUtility emailUtility=new EmailUtility();
		emailUtility.sentEmail(e.getLocalizedMessage(),to);
		//  emailUtility.sentEmail(e.getLocalizedMessage());
	 
		return tokens;
		}
		
    }

	/*
	 * public CcrisXml ccrisSearch(String requestbody) { // TODO Auto-generated
	 * method stub return null; }
	 */

//    private void saveRequestToDB(UserSearchRequest userSearchRequest){
//        log.info("Saving Request to database");
//        UserRequestEntity userRequestEntity = UserRequestEntity.builder()
//                .entityId(userSearchRequest.getEntityId())
//                .clientId(userSearchRequest.getClientId())
//                .name(userSearchRequest.getName())
//                .purchaseAmount(userSearchRequest.getPurchaseAmount())
//                .createdDate(new Date())
//                .build();
//        userRequestRepository.save(userRequestEntity);
//    }
}
