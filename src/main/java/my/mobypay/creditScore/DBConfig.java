package my.mobypay.creditScore;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.extern.slf4j.Slf4j;
import my.mobypay.creditScore.dao.CreditScoreConfigRepository;
import my.mobypay.creditScore.dao.CreditScorepPDFFilesrepo;
import my.mobypay.creditScore.dao.CreditcheckerPDFFiles;
import my.mobypay.creditScore.dao.Creditcheckersysconfig;

@Slf4j
@Configuration
public class DBConfig {

	@Autowired
	CreditScoreConfigRepository creditScoreConfigRepository;

	@Autowired
	CreditScorepPDFFilesrepo pPDFFilesrepo;

	@Bean
	public HashMap<String, String> getValueFromDB() {
		HashMap<String, String> dbValuesMap = new HashMap<String, String>();
		List<Creditcheckersysconfig> configValues = creditScoreConfigRepository.findAll();
		log.info("configValues " + configValues);
		log.info("configValues 1" + configValues.get(0).getName());
		Creditcheckersysconfig conf = new Creditcheckersysconfig();
		log.info("conf " + conf.getValue());
		log.info("Size " + configValues.size());
		for (int i = 0; i < configValues.size(); i++) {
			dbValuesMap.put(configValues.get(i).getName(), configValues.get(i).getValue());
		}
		String s3bucket = creditScoreConfigRepository.findValueFromName("aws.s3.bucket");
		log.info("##### value s3 bucket " + s3bucket);
		log.info("dbValuesMap " + dbValuesMap);

		// dbValuesMap.put("aws.s3.bucket"
		// ,creditScoreConfigRepository.findValueFromName("aws.s3.bucket"));

		return dbValuesMap;
	}

	@Bean
	public HashMap<String, byte[]> getFilesFromDB() {
		HashMap<String, byte[]> dbValuesMap = new HashMap<String, byte[]>();
		List<CreditcheckerPDFFiles> expReportFiles = pPDFFilesrepo.findAll();
		log.info("configValues " + expReportFiles);
		log.info("configValues 1" + expReportFiles.get(0).getName());
		CreditcheckerPDFFiles conf = new CreditcheckerPDFFiles();
		log.info("conf " + conf.getValue());
		log.info("Size " + expReportFiles.size());
		for (int i = 0; i < expReportFiles.size(); i++) {
			dbValuesMap.put(expReportFiles.get(i).getName(), expReportFiles.get(i).getValue());
		}
		log.info("dbValuesMap " + dbValuesMap);
		return dbValuesMap;
	}
}
