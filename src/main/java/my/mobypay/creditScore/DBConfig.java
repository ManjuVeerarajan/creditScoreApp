package my.mobypay.creditScore;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.extern.slf4j.Slf4j;
import my.mobypay.creditScore.dao.CreditScoreConfigRepository;


@Slf4j
@Configuration
public class DBConfig {

	@Autowired
	CreditScoreConfigRepository creditScoreConfigRepository;
	
	@Bean
	public HashMap<String,String> getValueFromDB() {
		//List<CreditScoreConfig> configValues = creditScoreConfigRepository.findAll();
		String s3bucket = creditScoreConfigRepository.findValueFromName("aws.s3.bucket");
		log.info("##### value s3 bucket " +s3bucket);
		HashMap<String,String> dbValuesMap = new HashMap<String,String>();
		dbValuesMap.put("aws.s3.bucket" ,creditScoreConfigRepository.findValueFromName("aws.s3.bucket"));
		
		return dbValuesMap;
	}
}
