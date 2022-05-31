package my.mobypay.creditScore;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.zoloz.api.sdk.client.OpenApiClient;

import my.mobypay.creditScore.controller.CcrisController;
import my.mobypay.creditScore.dao.CustomerCreditReports;

public class DBCheck {

	public static void main(String[] args) {
	System.out.println("openApiClient " +retrieveNricFromDB("770325016934"));
	}
	
	
	public static boolean retrieveNricFromDB(String nric) {
		boolean ispresent = false;

		Session session = null;
		Transaction transaction = null;
		try {
			// SessionFactory factory = HibernateUtil.getSessionFactory();
			// SessionFactory factory = new
			// AnnotationConfiguration().configure().buildSessionFactory();
			// Configuration config = new Configuration();
			 // config.configure();
			// local SessionFactory bean created
			// SessionFactory sessionFactory = config.buildSessionFactory();
			SessionFactory factory = new Configuration().configure("hibernate.cfg.xml")
					.addAnnotatedClass(CustomerCreditReports.class).buildSessionFactory();
			session = factory.openSession();
			transaction = session.beginTransaction();
			// TODO
			// List<ApplicationSettings> inputDays = appSettings.findAll();
			// ApplicationSettings expireDays = inputDays.get(6);
			// String daysExpire = expireDays.getValue();
			String daysExpire = "30 DAY";

			System.out.println("daysExpire " + daysExpire);
			String hqlQuery = "SELECT p.nric from CustomerCreditReports p WHERE p.nric = " + nric
					+ " AND p.UpdatedAt >= date_sub(now(),interval " + daysExpire + ")";
			org.hibernate.query.Query query = session.createSQLQuery(hqlQuery);
			System.out.println("Query Response" + query.getResultList());
			if (!query.getResultList().isEmpty()) {
				System.out.println("Query Response not NUll");
				ispresent = true;
			} else if (query.getResultList().isEmpty()) {
				System.out.println("Query Response NUll");
				ispresent = false;
			}

			transaction.commit();
		} catch (Exception e) {
			System.out.println("exception " + e);
		}
		finally {
		if(session != null) {
			System.out.println("session " +session.toString());
			session.close();
			//	session.disconnect();
			System.out.println("session after close" +session.toString());
		}
		}
		return ispresent;
	}

}
