/*
 * Copyright (c) 2019 ZOLOZ PTE.LTD.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

package my.mobypay.ekyc.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.ParserConfig;

import com.zoloz.api.sdk.util.AESUtil;
import com.zoloz.api.sdk.util.GenSignUtil;
import com.zoloz.api.sdk.util.OpenApiData;
import com.zoloz.api.sdk.util.RSAUtil;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * OpenApiClient
 *
 * @author Zhongyang MA
 */
@Data
public class OpenApiClient {
    private static final Logger logger = LoggerFactory.getLogger(OpenApiClient.class);

    private static String hostUrl = "https://sg-sandbox-api.zoloz.com";

    private static String clientId = "2188406896747744";

    private static String merchantPrivateKey = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDaDCXtZWWjlOoKiKMCAZ5M8WTpMcBaL0fY0XXW106SYeI9Ox4Q2lsWb6MJMv7U/fIF+1YwvNVHOjJJrPFE2UpNUbvOfG3AQDmlLJKZh5qWivnzeWqfFOTzuO3Z62uK6pizm9VuFreIZ8Xts5y8SYqaGhVQKqELOiEfZmdlo2ERXdaa0cLjaiDcCOWc5O2WqBOP6MkgOLg+prnIMaUUm+6BrVRUhaJizxLHTaeAxlho9K/jj4R4HONtGpVnKSDJRlV0L17l5lfzHNQBJu5lCna1X24oFAvy9sQUx7ICbO0cOf29fNDavxsRPHqYPhmwCO+JpMiQ5b/c429xk1bxUMKFAgMBAAECggEAWAV/ag38scRzlj0CUNUGalkoO1ryI3XiswwbXdccyMrq4Xzz7im3i58VWalUZfb9tJx5dsND9bTwh/1giEKPVBcikYB5bZp/qsYLiB7NsOf5bugcuotcwWZt3gLDLxj0+8x0pDRXcqExrXtMUlX9tafB4tLSoA2fQWW9Z7JEhRV1tVXOWcmOUbQVe3TgBv3zM6tQMWtFXyzGDKOwsri/g7ZKQTwJ1m1oXfbCLkf/4aTilGYdJlZR5iesrfBllRxJKTi976Tp5/LBQJs5YSUmQJTUzEp0yEgLPwjDuO7jWRsAKx/lqMjNSxjM13Z5K1H5JJES5WbCTZJeU1GTzKCoIQKBgQDyIMMB5Px8VOt3iIKA/t6VtldwCe0nOuIt0VwqLiwRcZdP2c77F+PJEaCg2kMhnyksYJiWwix8qbRfBGF8VqeWCgcp8kWHMKRDuJA86cLNQSkNDpQFPu9ZKFg88F19PzF0Gf9PugjPptnx1d1q0lreqh9IN3bfucLLP0kveSH2PwKBgQDmijPgMdSZWVdrTBkU7PWYTxfGRN0I0vpMFgOQ0q7a2ibCEJlI53Pag5lcru3nqGJs5R2ejZL2oMf0r8FWhLdhnbHaTIvmO6b/uUGtGq8+khA9ol72CIQEIUTG4M0hmbOHBlgbZwREQYexPjQ+IypErPNGsUd51au2VUfXIjZ+OwKBgFPjSez0Gw4wlcw6PYzXwOJ55F1q8wFug0KAkMAEczwv8M63leCk7ESTmOVh+XRCoo8/gF5rM+KVIWryJ5xeoX14R/ceezxVe/QCk+amztkyRDjD3kDbBy4Krleep6VnKYkiILTMrZTUKBqDkE0cSGNw6ZmprcPhpj2o1YBfJYcdAoGBAN3yM5slnh28a3L7IjKJJrBphOP2rC2woBPcJbapfnloCGRRAqGzYk/+3gjiyFt8OrXHpkpc1h3mEFs7UZDv2HR8ExutEgqnZ1FOkzIKPKiqikQsK+wFqsMnHEWzawlsJfBaZTyMYwkrZW14C2e/BxRyxQtL5RogYV36oF03rOq9AoGAaZ+ybU+Lbm3heZaSNoxrJhvoEtt+87P5Wx9DXigIm3Nt2HsTK2Mo4TUJDzv52tp1r8Wmsxfr+9OA39juqOJTRWKjyJhDcPVB10JDG4vZOhSvovaDziaJegLPebz0uG2LtfDZ8jv0fhSS2BBxuKIr+MaFueHkSkc5l2/X15kbtWQ=";

    private static String openApiPublicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtFgisye0VApQLQ8E6rAZI6tzPH2s1Dut5Mzjipvg/swfSrQ2j8mxGbCixh+2peksAPa3k4iyoOLcsc9erlkTwyOy/eJEZlKzwtw5fsyUJngZGd3AnNLGNOwtCZxTS3QebipsPW0GIncm6H6ciGc3uS5OkJQEfkdzrvyfPwBGSIHYiT1GhWdV8RNte8X2byAc85BsHKhZQjGBMTLaXvLSw5QZySC0Zere0zLVbQalXrIZSUaLBOepzkatVxFWiPgLfRTOddKvR/tj8ZJyVB88a3vsJn1l0CUMXYHI+NkzKlByU2PWsPwvAgpxy85iMfgpuAlTf1o/xJuuddcWPcMG+wIDAQAB";

    private static boolean signed = true;

    private static boolean encrypted = false;

    /**
     * default constructor with signature and encryption
     */
    public OpenApiClient() {
        ParserConfig parserConfig = ParserConfig.getGlobalInstance();
        parserConfig.setSafeMode(true);

        this.signed = true;
        this.encrypted = true;
    }

    /**
     * invoke API gateway with the optional signature and encryption processes
     * @param apiName the name of API
     * @param request the request content in json string format
     * @return the response content in json string format
     */
    public static String callOpenApi(String apiName, String request) {

        String encryptKey = null;
        byte[] key = null;
        try {
            if (encrypted) {
                // Generate aes key
                key = AESUtil.generateKey(128);
                // encrypt content
                request = AESUtil.encrypt(key, request);
                // encrypt aes key
                encryptKey = RSAUtil.encrypt(openApiPublicKey, key);
            }
        } catch (Exception e) {
            logger.error("encrypt key fail.", e);
        }
        String resultContent = null;
        try {
            // 1. sign the signature
            String reqTime = ZonedDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ssZ"));
            String signature = null;
            if (signed) {
                signature = sign(merchantPrivateKey, apiName, clientId, reqTime, request);
            }
            // 2. Send data and receive response
            String url = hostUrl + "/api/" + apiName.replaceAll("\\.", "/");
            if (logger.isInfoEnabled()) {
                logger.info("API URL = " + url);
            }
            OpenApiData data = post(url, encryptKey, clientId, reqTime, signature, request);
            for (String k : data.getHeader().keySet()) {
                if (logger.isInfoEnabled()) {
                    if (k == null) {
                        logger.info(data.getHeader().get(k).get(0));
                    } else {
                        logger.info(k + "=" + data.getHeader().get(k).get(0));
                    }
                }
            }

            // 3. Check Signature
            if (data.getHeader().get("Signature") != null) {
                Map<String, String> responseSign = splitEncryptOrSignature(data.getHeader().get("Signature").get(0));
                String toSignContent = buildResponseSignatureContent(apiName, clientId, data.getHeader().get("Response-Time").get(0),
                        data.getContent());
                boolean checkSignResult = GenSignUtil.verify(openApiPublicKey, toSignContent,
                        URLDecoder.decode(responseSign.get("signature"), "UTF-8"));
                if (logger.isInfoEnabled()) {
                    logger.info("check response signature " + checkSignResult);
                }
            }

            resultContent = data.getContent();
            // 4. decrypt
            if (encrypted) {
                if (data.getHeader().get("Encrypt") != null) {
                    Map<String, String> encrypt = splitEncryptOrSignature(data.getHeader().get("Encrypt").get(0));
                    if (encrypt != null && encrypt.get("symmetricKey") != null) {
                        byte[] decryptedAESKey = RSAUtil.decrypt(merchantPrivateKey,
                                URLDecoder.decode(encrypt.get("symmetricKey"), StandardCharsets.UTF_8.name()));
                        resultContent = AESUtil.decrypt(decryptedAESKey, resultContent);
                    }
                }
            }
        } catch (Exception e) {
            logger.error("failed to get response.", e);
        }
        return resultContent;
    }


    private static String sign(String merchantPrivateKey, String api, String clientId, String reqTime, String request) throws Exception {
        StringBuffer sb = new StringBuffer(request.length() + 256);
        sb.append("POST ").append("/api/").append(api.replaceAll("\\.", "/")).append("\n");
        sb.append(clientId).append(".").append(reqTime).append(".").append(request);
        String str = sb.toString();
        return GenSignUtil.sign(merchantPrivateKey, str);
    }

    //Test
    
    public static void main(String args[]) throws Exception {
    	/* String metaInfo = "MOB_H5";
        String businessId = "dummy_bizid_" + System.currentTimeMillis();
        String userId = "dummy_userid_" + System.currentTimeMillis();

        JSONObject apiReq = new JSONObject();
        apiReq.put("bizId", businessId);
        apiReq.put("flowType", "REALIDLITE_KYC");
        apiReq.put("docType", "00000001003");
        apiReq.put("pages", "1");
        apiReq.put("metaInfo", metaInfo);
        apiReq.put("userId", userId);
       */
    	String req = "{\n"
    			+ "    \"clientType\":1,\n"
    			+ "    \"bizId\": \"2017839040588699\",\n"
    			+ "    \"flowType\": \"REALIDLITE_KYC\",   \n"
    			+ "    \"userId\": \"123456abcd\",\n"
    			+ "    \"docType\": \"08520000001\",\n"
    			+ "    \"pageConfig\":{\n"
    			+ "      \"urlFaceGuide\":\"http://url-to-face-guide-page.htm\"\n"
    			+ "    },\n"
    			+ "    \"serviceLevel\": \"REALID0001\",\n"
    			+ "    \"operationMode\": \"STANDARD\",\n"
    			+ "    \"metaInfo\": \"MOB_H5\"\n"
    			+ "}";
    	JSONObject request = JSON.parseObject(req);
    	
    	String businessId = request.getString("bizId");
        String flowType =  request.getString("flowType");
        String userId =  request.getString("userId");
        String docType =  request.getString("docType");
        String serviceLevel =  request.getString("serviceLevel");
        String operationMode =  request.getString("operationMode");
        String metaInfo = request.getString("metaInfo");
        String pageConfig =  request.getString("pageConfig");

        JSONObject apiReq = new JSONObject();
        apiReq.put("bizId", businessId);
        apiReq.put("flowType", flowType);
        apiReq.put("docType", docType);
        apiReq.put("pageConfig", pageConfig);
        apiReq.put("metaInfo", metaInfo);
        apiReq.put("userId", userId);
        apiReq.put("serviceLevel", serviceLevel);
        apiReq.put("operationMode", operationMode);
        
    	String res = callOpenApi("v1/zoloz/realid/initialize", JSON.toJSONString(apiReq));
    	
    	System.out.println("#### res " +res);
    }
    
    
    private static OpenApiData post(String baseUrl, String encryptKey, String clientId, String reqTime, String signature, String request) {
        OpenApiData data = new OpenApiData();
        OutputStreamWriter out = null;
        BufferedReader in = null;
        StringBuffer result = new StringBuffer(1024 * 20);

        try {
            URL realUrl = new URL(baseUrl);
            URLConnection conn = realUrl.openConnection();
            if (encryptKey != null) {
                conn.setRequestProperty("Content-Type", "text/plain; charset=UTF-8");
            } else {
                conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            }
            conn.setRequestProperty("Client-Id", clientId);
            conn.setRequestProperty("Request-Time", reqTime);
            if (signature != null) {
                conn.setRequestProperty("Signature",
                        "algorithm=RSA256, signature=" + URLEncoder.encode(signature, StandardCharsets.UTF_8.name()));
            }
            if (encryptKey != null) {
                conn.setRequestProperty("Encrypt",
                        "algorithm=RSA_AES, symmetricKey=" + URLEncoder.encode(encryptKey, StandardCharsets.UTF_8.name()));
            }
            if (logger.isInfoEnabled()) {
                for (String key : conn.getRequestProperties().keySet()) {
                    logger.info(key + "=" + conn.getRequestProperties().get(key).get(0));
                }
            }
            conn.setDoOutput(true);
            conn.setDoInput(true);
            out = new OutputStreamWriter(conn.getOutputStream(), StandardCharsets.UTF_8.name());
            out.write(request);
            out.flush();
            in = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8.name()));
            String line;
            while ((line = in.readLine()) != null) {
                result.append(line);
            }
            data.setContent(result.toString());
            data.setHeader(conn.getHeaderFields());
        } catch (Exception e) {
            logger.error("failed to do request:{}.", request, e);
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                logger.error("close io fail.", ex);
            }
        }
        return data;
    }

    private static Map<String, String> splitEncryptOrSignature(String value) {
        if (value == null) {
            return null;
        }
        Map<String, String> map = new HashMap<>();
        String[] pairs = value.split(",");
        if (pairs == null) {
            return map;
        }
        for (String pair : pairs) {
            if (pair == null) {
                continue;
            }
            String[] kv = pair.trim().split("=");
            if (kv != null && kv.length == 2 && kv[0] != null) {
                map.put(kv[0].trim(), kv[1].trim());
            }
        }
        return map;
    }

    private static String buildResponseSignatureContent(String apiName, String clientId, String responseTime, String response) {
        StringBuffer sb = new StringBuffer(response.length() + 256);
        sb.append("POST ").append("/api").append("/").append(apiName.replaceAll("\\.", "/")).append("\n");
        sb.append(clientId).append(".").append(responseTime).append(".").append(response);
        return sb.toString();
    }

}
