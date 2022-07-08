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
}
