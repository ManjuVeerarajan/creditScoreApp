package my.mobypay.creditScore.utility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



import net.sargue.mailgun.Configuration;
import net.sargue.mailgun.Mail;

public class EmailUtility {
	private static final Logger log = LoggerFactory.getLogger(EmailUtility.class);
    public static void sentEmail(String message, String to){
    	log.info("Inside EmailUtility");     
    	try {
            Configuration configuration = new Configuration()
                    .domain("mg2.airapay.my")
                    .apiKey("b61574e1f0e8b8d81e767fdd1c9481af-9776af14-e1d40911")
                    .from("CreditChecker Error Log", "noreply@airapay.my");

            Mail.using(configuration)
                    .to(to)
                    .subject("CreditChecker Error Log")
                    .text(message)
                    .build()
                    .send();
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
        }

    }
}
