package my.mobypay.creditScore;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;

import my.mobypay.creditScore.controller.GlobalConstants;
import my.mobypay.creditScore.dao.CreditCheckerAuthDao;
import my.mobypay.creditScore.dao.CreditScoreConfigRepository;
import my.mobypay.creditScore.dao.Creditcheckersysconfig;
import my.mobypay.creditScore.repository.CreditCheckerAuthRepository;

@EnableWebSecurity
@Order(1)
public class APISecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	CreditCheckerAuthRepository creditCheckerAuthRepository;

	@Autowired
	CreditScoreConfigRepository creditScoreConfigRepository;

	@Override
	public void configure(HttpSecurity httpSecurity) throws Exception {
		// APIKeyAuthFilter filter = new APIKeyAuthFilter(principalRequestHeader);
		APIKeyAuthFilter filter = new APIKeyAuthFilter(getKeyValueFromDBString(), getKeySecretValueFromDB());
		filter.setAuthenticationManager(new AuthenticationManager() {
//        	getAuthEnableDetailsFromDB();

			@Override
			public Authentication authenticate(Authentication authentication) throws BadCredentialsException {
				String authEnableDetailsFromDB = getAuthEnableDetailsFromDB();
				if (StringUtils.equalsIgnoreCase(getAuthEnableDetailsFromDB(), "1")) {
					String principal = (String) authentication.getPrincipal();

					String[] secretfromDb = getSecretValueFromDB();
					List<String> secretList = Arrays.asList(secretfromDb);

					if (!secretList.contains(principal)) {
						throw new BadCredentialsException("401");
					}
					/*
					 * if (!principalRequestValue.equals(principal)) { throw new
					 * BadCredentialsException("401"); }
					 */
					authentication.setAuthenticated(true);
					return authentication;
				} else {
					authentication.setAuthenticated(true);
					return authentication;
				}
			}
		});
		httpSecurity.antMatcher("/**").csrf().disable().sessionManagement()
				.sessionCreationPolicy(SessionCreationPolicy.STATELESS).and().addFilter(filter).authorizeRequests()
				.anyRequest().authenticated();
	}

	public HashMap<String, String> getKeySecretValueFromDB() {
		HashMap<String, String> keyMap = new HashMap<String, String>();
		List<CreditCheckerAuthDao> configValues = creditCheckerAuthRepository.findAll();
		String[] keyfromDb = new String[configValues.size() + 1];
		System.out.println("Size " + configValues.size());
		for (int i = 0; i < configValues.size(); i++) {
			keyMap.put(configValues.get(i).getApi_key().toLowerCase(), configValues.get(i).getApi_secret());
		}
		return keyMap;
	}

	public String[] getKeyValueFromDBString() {
		HashMap<String, String> keyMap = new HashMap<String, String>();

		List<CreditCheckerAuthDao> configValues = creditCheckerAuthRepository.findAll();
		String[] keyfromDb = new String[configValues.size() + 1];
		System.out.println("Size " + configValues.size());
		for (int i = 0; i < configValues.size(); i++) {
			keyfromDb[i] = configValues.get(i).getApi_key().toLowerCase();
		}
		System.out.println("keyfromDb " + keyfromDb);

		return keyfromDb;
	}

	public String[] getSecretValueFromDB() {
		HashMap<String, String> keyMap = new HashMap<String, String>();

		List<CreditCheckerAuthDao> configValues = creditCheckerAuthRepository.findAll();
		String[] secretfromDb = new String[configValues.size() + 1];
		System.out.println("Size " + configValues.size());
		for (int i = 0; i < configValues.size(); i++) {
			secretfromDb[i] = configValues.get(i).getApi_secret();
		}
		System.out.println("secretfromDb " + secretfromDb);

		return secretfromDb;
	}

	public String getAuthEnableDetailsFromDB() {
		String configValues = creditScoreConfigRepository.findValueFromName(GlobalConstants.PLATFORM_AUTH);
		return configValues;

	}

}