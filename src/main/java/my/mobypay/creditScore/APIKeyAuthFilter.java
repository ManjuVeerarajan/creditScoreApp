package my.mobypay.creditScore;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.web.authentication.preauth.AbstractPreAuthenticatedProcessingFilter;

import my.mobypay.creditScore.repository.CreditCheckerAuthRepository;


public class APIKeyAuthFilter  extends AbstractPreAuthenticatedProcessingFilter {

	private final String ERROR_CUSTOM = "403 Forbidden";
	
	@Autowired
	CreditCheckerAuthRepository creditCheckerAuthRepository;
	
	private String principalRequestHeader;
	private static String keyInput;
	private String[] key;
	private HashMap<String, String> keySecretMap = new HashMap<>();
	
	public APIKeyAuthFilter() {}
	
	public APIKeyAuthFilter(String[] key,HashMap<String, String> keySecretMap ) {
	    this.key = key;
	    this.keySecretMap = keySecretMap;
	}

	@Override
	protected Object getPreAuthenticatedPrincipal(HttpServletRequest request) throws BadCredentialsException {
		Object returnValue = null;
		String ipAddress = null;
		
		if(request.getHeaderNames().asIterator().hasNext()) {
			
			 principalRequestHeader = request.getHeaderNames().asIterator().next();
		} 
		
		List<String> keyList = Arrays.asList(key);
		if (!keyList.contains(principalRequestHeader) ) {
			returnValue = ERROR_CUSTOM ;
		} else if (keyList.contains(principalRequestHeader)) {
			
			if (keySecretMap.get(principalRequestHeader).equalsIgnoreCase(request.getHeader(principalRequestHeader))) {
				returnValue = request.getHeader(principalRequestHeader);
				keyInput = principalRequestHeader;
				setKeyAndValue();
			}
		}else {
			returnValue = ERROR_CUSTOM;
		}
	    return returnValue;
	}

	public static HashMap<String,String> setKeyAndValue() {
		HashMap<String,String> keyValueMap = new HashMap<String,String>();
		keyValueMap.put("headerKey", keyInput);
		System.out.println("keyValueMap " +keyValueMap);
		return keyValueMap;
		
	}

	@Override
	protected Object getPreAuthenticatedCredentials(HttpServletRequest request) {
	    return "N/A";
	}
}
