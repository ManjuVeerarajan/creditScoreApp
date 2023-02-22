package my.mobypay.ekyc.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zoloz.api.sdk.client.OpenApiClient;

import lombok.extern.slf4j.Slf4j;
import my.mobypay.creditScore.DBConfig;
import my.mobypay.creditScore.controller.GlobalConstants;
import my.mobypay.creditScore.dao.Creditcheckersysconfig;
import my.mobypay.ekyc.dao.CheckResultRequest;
import my.mobypay.ekyc.dao.CheckResultResponse;
import my.mobypay.ekyc.dao.InitializeRequest;
import my.mobypay.ekyc.dao.InitializeResponse;

@SuppressWarnings("unused")
@Slf4j
@Service
public class EkycService {
	
	@Autowired
	DBConfig dbConfig;

	RestTemplate restTemplate = new RestTemplate();

	private OpenApiClient openApiClient = new OpenApiClient();
	
	public static Logger logger;
	
	static {
		try {
			boolean append = true;
			SimpleDateFormat format = new SimpleDateFormat("M-d_HHmmss");
			FileHandler fh = new FileHandler("LogFile_" + format.format(Calendar.getInstance().getTime()) + ".log",
					append);
			fh.setFormatter(new SimpleFormatter());
			logger = Logger.getLogger("LogFile_" + format.format(Calendar.getInstance().getTime()));
			logger.addHandler(fh);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	public OpenApiClient setValuesToOpenApiHardCoded(HashMap<String,String> dbvalues) {
		openApiClient.setHostUrl(dbvalues.get(GlobalConstants.ZOLO_SERVER));
		openApiClient.setClientId(dbvalues.get(GlobalConstants.ZOLO_CLIENTID));
		openApiClient.setMerchantPrivateKey(dbvalues.get(GlobalConstants.ZOLO_MERCHANT_PRIVATE_KEY));
		openApiClient.setOpenApiPublicKey(dbvalues.get(GlobalConstants.ZOLO_MERCHANT_PUBLIC_KEY));
		openApiClient.setSigned(true);
		openApiClient.setEncrypted(true);

		log.info("Host url set to openApi " + openApiClient.getHostUrl());
		log.info("clientId set to openApi " + openApiClient.getClientId());
		log.info("merchantPrivatekey url set to openApi " + openApiClient.getMerchantPrivateKey());
		log.info("merchantPublicKey set to openApi " + openApiClient.getOpenApiPublicKey());
		logger.info("Host url set to openApi " + openApiClient.getHostUrl());
		logger.info("clientId set to openApi " + openApiClient.getClientId());
		logger.info("merchantPrivatekey url set to openApi " + openApiClient.getMerchantPrivateKey());
		logger.info("merchantPublicKey set to openApi " + openApiClient.getOpenApiPublicKey());

		return openApiClient;
	}

	public OpenApiClient setValuesToOpenApiHardCoded1(String hostUrl, String clientId, String merchantPrivatekey,
			String merchantPublicKey) {
		log.info("Hard coded111.!!");
		openApiClient.setHostUrl(hostUrl);
		openApiClient.setClientId(clientId);
		openApiClient.setMerchantPrivateKey(merchantPrivatekey);

		openApiClient.setOpenApiPublicKey(merchantPublicKey);

		openApiClient.setSigned(true);
		openApiClient.setEncrypted(true);
		return openApiClient;
	}

	public String callInitializeOpenApi(JSONObject request, String url) {
		logger.info("In [EkycService:callInitializeOpenApi] - ZOLOZ initialize Request " + request);
		log.info("In [EkycService:callInitializeOpenApi] - ZOLOZ initialize Request  " + request);
		JSONObject apiReq = new JSONObject();
		if (request.getString("bizId") != null) {
			String businessId = request.getString("bizId");
			apiReq.put("bizId", businessId);
		}
		if (request.getString("flowType") != null) {
			String flowType = request.getString("flowType");
			apiReq.put("flowType", flowType);
		}
		if (request.getString("docType") != null) {
			String docType = request.getString("docType");
			apiReq.put("docType", docType);
		}
		if (request.getString("pageConfig") != null) {
			String pageConfig = request.getString("pageConfig");
			apiReq.put("pages", pageConfig);
		}
		if (request.getString("metaInfo") != null) {
			String metaInfo = request.getString("metaInfo");
			apiReq.put("metaInfo", metaInfo);
		}
		if (request.getString("userId") != null) {
			String userId = request.getString("userId");
			apiReq.put("userId", userId);
		}
		if (request.getString("serviceLevel") != null) {
			String serviceLevel = request.getString("serviceLevel");
			apiReq.put("serviceLevel", serviceLevel);
		}
		if (request.getString("operationMode") != null) {
			String operationMode = request.getString("operationMode");
			apiReq.put("operationMode", operationMode);
		}
		if (request.getString("productConfig") != null) {
			JSONObject operationMode = request.getJSONObject("productConfig");
			apiReq.put("productConfig", operationMode);
		}
		String apiRespStr = openApiClient.callOpenApi(url, JSON.toJSONString(apiReq));

//		log.info("In [EkycService:callInitializeOpenApi] -ZOLOZ Response " + apiRespStr);
//		logger.info("In [EkycService:callInitializeOpenApi] -ZOLOZ Response " + apiRespStr);
		return apiRespStr;

	}

	public String callCheckStatusOpenApi(JSONObject request, String checkResultApi) {
		logger.info("In [EkycService:callCheckStatusOpenApi] -ZOLOZ checkResult Request " + request);
		log.info("In [EkycService:callCheckStatusOpenApi] -ZOLOZ checkResult Request " + request);
		JSONObject apiReq = new JSONObject();

		if (request.getString("bizId") != null) {
			String businessId = request.getString("bizId");
			apiReq.put("bizId", businessId);
		}
		if (request.getString("transactionId") != null) {
			String transactionId = request.getString("transactionId");
			apiReq.put("transactionId", transactionId);
		}
		if (request.getString("isReturnImage") != null) {
			String isReturnImage = request.getString("isReturnImage");
			apiReq.put("isReturnImage", isReturnImage);
		}

		String apiRespStr = openApiClient.callOpenApi(checkResultApi, JSON.toJSONString(apiReq));
//		logger.info("In [EkycService:callCheckStatusOpenApi] -ZOLOZ checkResult Response "+apiRespStr);
//		log.info("In [EkycService:callCheckStatusOpenApi] -ZOLOZ checkResult Response "+apiRespStr);
		return apiRespStr;
	}

}
