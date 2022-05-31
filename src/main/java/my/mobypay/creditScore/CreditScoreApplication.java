package my.mobypay.creditScore;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import lombok.extern.slf4j.Slf4j;
import my.mobypay.creditScore.dao.CustomerCreditReports;
import my.mobypay.creditScore.dto.request.CcrisRequestXml;
import my.mobypay.creditScore.dto.request.CcrisSearchRequest;
import my.mobypay.creditScore.dto.response.CcrisXml;
import my.mobypay.creditScore.dto.response.Item;
import my.mobypay.creditScore.dto.response.Tokens;
import my.mobypay.creditScore.utility.ParserUtility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.util.ResourceUtils;
import org.springframework.web.client.RestTemplate;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.io.StringReader;
import java.nio.file.Files;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
// @EnableJpaRepositories("my.mobypay.creditScore.repository")
// @EntityScan("my.mobypay.creditScore.dao")
@SpringBootApplication
public class CreditScoreApplication {
	private static Logger logger = LoggerFactory.getLogger(CreditScoreApplication.class);
	public static void main(String[] args) {
		logger.info("Running the Application");
		SpringApplication.run(CreditScoreApplication.class, args);

	}
	@Bean
	public RestTemplate getRestTemplate() {
		return new RestTemplate();
	}

	static void Xml2Pojo() {
		try {

			File file = ResourceUtils.getFile("classpath:ccrissearch.xml");

			//Read File Content
			String content = new String(Files.readAllBytes(file.toPath()));
			System.out.println(content);

			CcrisXml ccrisXml = ParserUtility.xml2Pojo(content, CcrisXml.class);

			Item item = ccrisXml.getItemList().stream().filter(item1 -> (
                        item1.getEntityId().equals("890227-04-2111") && item1.getEntityName().equals("XXXX XXXXXXX XIN HAMZAH")))
                .findFirst().orElse(null);
			
			System.out.println(item.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	static <T> T Xml2Pojo1() {
		try {

			File file = ResourceUtils.getFile("classpath:tokens.xml");

			//Read File Content
			String content = new String(Files.readAllBytes(file.toPath()));
			System.out.println(content);
			ParserUtility.xml2Pojo(content, Tokens.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	static void Pojo2Xml(){

		try {
			XmlMapper xmlMapper = new XmlMapper();

			CcrisSearchRequest  ccrisSearchRequest = CcrisSearchRequest.builder()
					.ProductType("CCRIS_SEARCH")
					.GroupCode("11")
					.EntityName("XXXXXXXXX XXNTI YAAKOB")
					.EntityId("551122-10-1111")
					.Country("MY")
					.DOB("1955-11-22")
					.build();


			CcrisRequestXml ccrisXml = new CcrisRequestXml();
			ccrisXml.setRequest(ccrisSearchRequest);

			String xml = xmlMapper.writeValueAsString(ccrisXml);
			System.out.println(xml);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}