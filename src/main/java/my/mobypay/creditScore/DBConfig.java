package my.mobypay.creditScore;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.RedisTemplate;

import lombok.extern.slf4j.Slf4j;
import my.mobypay.creditScore.dao.CreditCheckerAuthDao;
import my.mobypay.creditScore.dao.CreditScoreConfigRepository;
import my.mobypay.creditScore.dao.CreditScorepPDFFilesrepo;
import my.mobypay.creditScore.dao.CreditcheckerPDFFiles;
import my.mobypay.creditScore.dao.Creditcheckersysconfig;
import my.mobypay.creditScore.repository.CreditCheckerAuthRepository;

@Slf4j
@Configuration
@Order(1)
public class DBConfig {

	@Autowired
	CreditScoreConfigRepository creditScoreConfigRepository;

	@Autowired
	CreditScorepPDFFilesrepo pPDFFilesrepo;
	
	@Autowired
	CreditCheckerAuthRepository creditCheckerAuthRepo;

	@Autowired
	private RedisTemplate<String, Creditcheckersysconfig> redisTemplate;

	@Autowired
	private RedisTemplate<String, CreditcheckerPDFFiles> redisTemplateForFiles;
	
//	@Autowired
//	private RedisTemplate<String, CreditCheckerAuthDao> redisTemplateForAuth;

	@Bean
	public HashMap<String, String> getValueFromDB() {
		HashMap<String, String> dbValuesMap = new HashMap<String, String>();
		List<Creditcheckersysconfig> configValues = creditScoreConfigRepository.findAll();
		Creditcheckersysconfig conf = new Creditcheckersysconfig();
		for (int i = 0; i < configValues.size(); i++) {
			dbValuesMap.put(configValues.get(i).getName(), configValues.get(i).getValue());
		}
		String s3bucket = creditScoreConfigRepository.findValueFromName("aws.s3.bucket");

		// dbValuesMap.put("aws.s3.bucket"
		// ,creditScoreConfigRepository.findValueFromName("aws.s3.bucket"));

		return dbValuesMap;
	}

	@Bean
	public HashMap<String, byte[]> getFilesFromDB() {
		HashMap<String, byte[]> dbValuesMap = new HashMap<String, byte[]>();
		List<CreditcheckerPDFFiles> expReportFiles = pPDFFilesrepo.findAll();
		CreditcheckerPDFFiles conf = new CreditcheckerPDFFiles();
		for (int i = 0; i < expReportFiles.size(); i++) {
			dbValuesMap.put(expReportFiles.get(i).getName(), expReportFiles.get(i).getValue());
		}
		return dbValuesMap;
	}
	
	public HashMap<String, String> getcreditCheckerAuthFromDB() {
		HashMap<String, String> dbValuesMap = new HashMap<String, String>();
		List<CreditCheckerAuthDao> configValues = creditCheckerAuthRepo.findAll();
		for (int i = 0; i < configValues.size(); i++) {
			dbValuesMap.put(configValues.get(i).getId(), configValues.get(i).getClient_name());
		}
		return dbValuesMap;
	}
//	
//	@Bean
//	public void setAuthDataToRedis() {
//		List<CreditCheckerAuthDao> configValues = creditCheckerAuthRepo.findAll();
//		for (int i = 0; i < configValues.size(); i++) {
//			redisTemplateForAuth.opsForValue().set("creditChecker/"+configValues.get(i).getId(), configValues.get(i));
//		}
//	}

	@Bean
	public void setDataToRedis() {
		List<Creditcheckersysconfig> configValues = creditScoreConfigRepository.findAll();
		for (int i = 0; i < configValues.size(); i++) {
			redisTemplate.opsForValue().set("creditChecker/"+configValues.get(i).getName(), configValues.get(i));
		}
	}

	public Creditcheckersysconfig getDataFromRedis(String key) {
		Creditcheckersysconfig creditcheckersysconfigFromRedis = redisTemplate.opsForValue().get("creditChecker/"+key);
		return creditcheckersysconfigFromRedis;
	}

	@Bean
	public void setPdfDataToRedis() {
		List<CreditcheckerPDFFiles> expReportFiles = pPDFFilesrepo.findAll();
		for (int i = 0; i < expReportFiles.size(); i++) {
			redisTemplateForFiles.opsForValue().set("creditChecker/"+expReportFiles.get(i).getName(), expReportFiles.get(i));
		}

	}

	public CreditcheckerPDFFiles getpdfFilesFromRedis(String key) {
		CreditcheckerPDFFiles exportFilesFromRedis = redisTemplateForFiles.opsForValue().get("creditChecker/"+key);
		return exportFilesFromRedis;
	}

}
