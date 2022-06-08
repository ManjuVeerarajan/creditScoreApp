package my.mobypay.creditScore;

import static org.junit.Assert.assertEquals;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import my.mobypay.creditScore.service.PropertyServiceForJasyptSimple;

@SpringBootTest
class CreditScoreApplicationTests {

/*	 @Autowired
	    private ApplicationContext applicationContext;
	 */
	 @Autowired
	    private PropertyServiceForJasyptSimple service;
	 
	@Test
	public void whenDecryptedPasswordNeeded_GetFromService() {
	    System.setProperty("jasypt.encryptor.password", "Moby1234");
	   // PropertyServiceForJasyptSimple service = applicationContext.getBean(PropertyServiceForJasyptSimple.class);
	 
	    assertEquals("admin123qwe", service.getProperty());
	}

}
