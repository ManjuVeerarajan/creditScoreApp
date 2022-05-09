package my.mobypay.ekyc.service;

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
import my.mobypay.ekyc.dao.CheckResultRequest;
import my.mobypay.ekyc.dao.CheckResultResponse;
import my.mobypay.ekyc.dao.InitializeRequest;
import my.mobypay.ekyc.dao.InitializeResponse;

@SuppressWarnings("unused")
@Slf4j
@Service
public class EkycService {
	
	
	
	 RestTemplate restTemplate = new RestTemplate();
	 private OpenApiClient openApiClient = new OpenApiClient();
	 
	 
	
		
		public void setValuesToOpenApiHardCoded() {
			openApiClient.setHostUrl("https://sg-sandbox-api.zoloz.com");
			openApiClient.setClientId("2188406896747744");
			openApiClient.setMerchantPrivateKey("MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDaDCXtZWWjlOoKiKMCAZ5M8WTpMcBaL0fY0XXW106SYeI9Ox4Q2lsWb6MJMv7U/fIF+1YwvNVHOjJJrPFE2UpNUbvOfG3AQDmlLJKZh5qWivnzeWqfFOTzuO3Z62uK6pizm9VuFreIZ8Xts5y8SYqaGhVQKqELOiEfZmdlo2ERXdaa0cLjaiDcCOWc5O2WqBOP6MkgOLg+prnIMaUUm+6BrVRUhaJizxLHTaeAxlho9K/jj4R4HONtGpVnKSDJRlV0L17l5lfzHNQBJu5lCna1X24oFAvy9sQUx7ICbO0cOf29fNDavxsRPHqYPhmwCO+JpMiQ5b/c429xk1bxUMKFAgMBAAECggEAWAV/ag38scRzlj0CUNUGalkoO1ryI3XiswwbXdccyMrq4Xzz7im3i58VWalUZfb9tJx5dsND9bTwh/1giEKPVBcikYB5bZp/qsYLiB7NsOf5bugcuotcwWZt3gLDLxj0+8x0pDRXcqExrXtMUlX9tafB4tLSoA2fQWW9Z7JEhRV1tVXOWcmOUbQVe3TgBv3zM6tQMWtFXyzGDKOwsri/g7ZKQTwJ1m1oXfbCLkf/4aTilGYdJlZR5iesrfBllRxJKTi976Tp5/LBQJs5YSUmQJTUzEp0yEgLPwjDuO7jWRsAKx/lqMjNSxjM13Z5K1H5JJES5WbCTZJeU1GTzKCoIQKBgQDyIMMB5Px8VOt3iIKA/t6VtldwCe0nOuIt0VwqLiwRcZdP2c77F+PJEaCg2kMhnyksYJiWwix8qbRfBGF8VqeWCgcp8kWHMKRDuJA86cLNQSkNDpQFPu9ZKFg88F19PzF0Gf9PugjPptnx1d1q0lreqh9IN3bfucLLP0kveSH2PwKBgQDmijPgMdSZWVdrTBkU7PWYTxfGRN0I0vpMFgOQ0q7a2ibCEJlI53Pag5lcru3nqGJs5R2ejZL2oMf0r8FWhLdhnbHaTIvmO6b/uUGtGq8+khA9ol72CIQEIUTG4M0hmbOHBlgbZwREQYexPjQ+IypErPNGsUd51au2VUfXIjZ+OwKBgFPjSez0Gw4wlcw6PYzXwOJ55F1q8wFug0KAkMAEczwv8M63leCk7ESTmOVh+XRCoo8/gF5rM+KVIWryJ5xeoX14R/ceezxVe/QCk+amztkyRDjD3kDbBy4Krleep6VnKYkiILTMrZTUKBqDkE0cSGNw6ZmprcPhpj2o1YBfJYcdAoGBAN3yM5slnh28a3L7IjKJJrBphOP2rC2woBPcJbapfnloCGRRAqGzYk/+3gjiyFt8OrXHpkpc1h3mEFs7UZDv2HR8ExutEgqnZ1FOkzIKPKiqikQsK+wFqsMnHEWzawlsJfBaZTyMYwkrZW14C2e/BxRyxQtL5RogYV36oF03rOq9AoGAaZ+ybU+Lbm3heZaSNoxrJhvoEtt+87P5Wx9DXigIm3Nt2HsTK2Mo4TUJDzv52tp1r8Wmsxfr+9OA39juqOJTRWKjyJhDcPVB10JDG4vZOhSvovaDziaJegLPebz0uG2LtfDZ8jv0fhSS2BBxuKIr+MaFueHkSkc5l2/X15kbtWQ=");
			openApiClient.setOpenApiPublicKey("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtFgisye0VApQLQ8E6rAZI6tzPH2s1Dut5Mzjipvg/swfSrQ2j8mxGbCixh+2peksAPa3k4iyoOLcsc9erlkTwyOy/eJEZlKzwtw5fsyUJngZGd3AnNLGNOwtCZxTS3QebipsPW0GIncm6H6ciGc3uS5OkJQEfkdzrvyfPwBGSIHYiT1GhWdV8RNte8X2byAc85BsHKhZQjGBMTLaXvLSw5QZySC0Zere0zLVbQalXrIZSUaLBOepzkatVxFWiPgLfRTOddKvR/tj8ZJyVB88a3vsJn1l0CUMXYHI+NkzKlByU2PWsPwvAgpxy85iMfgpuAlTf1o/xJuuddcWPcMG+wIDAQAB");
			openApiClient.setSigned(true);
			openApiClient.setEncrypted(true);
			
		}
		
		public String callInitializeOpenApi(JSONObject request,String url) {

	        JSONObject apiReq = new JSONObject();
			if (request.getString("bizId") != null) {
				String businessId = request.getString("bizId");
				apiReq.put("bizId", businessId);
			}
			if (request.getString("flowType") != null) {
				 String flowType =  request.getString("flowType");
	        apiReq.put("flowType", flowType);
			}
			if (request.getString("docType") != null) {
				 String docType =  request.getString("docType");
	        apiReq.put("docType", docType);
			}
			if (request.getString("pageConfig") != null) {
				 String pageConfig =  request.getString("pageConfig");
	        apiReq.put("pages", pageConfig);
			}
			if (request.getString("metaInfo") != null) {
				 String metaInfo = request.getString("metaInfo");
	        apiReq.put("metaInfo", metaInfo);
			}
			if (request.getString("userId") != null) {
				 String userId =  request.getString("userId");
	        apiReq.put("userId", userId);
			}
			if (request.getString("serviceLevel") != null) {
				String serviceLevel =  request.getString("serviceLevel");
	        apiReq.put("serviceLevel", serviceLevel);
			}
			if (request.getString("operationMode") != null) {
				 String operationMode =  request.getString("operationMode");
	        apiReq.put("operationMode", operationMode);
			}
	        log.info("apiReq " +apiReq);
			String apiRespStr = openApiClient.callOpenApi(url, JSON.toJSONString(apiReq));
			
			 log.info("apiRespStr " +apiRespStr);
			return apiRespStr;

		}

		public String callCheckStatusOpenApi(JSONObject request, String checkResultApi) {

		        JSONObject apiReq = new JSONObject();
		       
		        if (request.getString("bizId") != null) {
					String businessId = request.getString("bizId");
					apiReq.put("bizId", businessId);
				}
		        if (request.getString("transactionId") != null) {
					String transactionId = request.getString("transactionId");
					apiReq.put("transactionId", transactionId);
				}
		        

		        
			String apiRespStr = openApiClient.callOpenApi(checkResultApi, JSON.toJSONString(apiReq));
			return apiRespStr;
		}
	
}
