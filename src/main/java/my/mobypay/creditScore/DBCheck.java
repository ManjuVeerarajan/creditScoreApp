package my.mobypay.creditScore;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import my.mobypay.creditScore.dao.CustomerCreditReports;

public class DBCheck {

	public static void main(String[] args) {
		System.out.println("Inside main");
	Object response =	retrieveNameNricFromDB ("610213065114");
System.out.println("Response " +response);
	}
	
	
	public static Object retrieveNameNricFromDB(String nric) {
		boolean ispresent = false;

		Session session = null;
		Object dbResponse = null;
		Transaction transaction = null;
		try {
			// SessionFactory factory = HibernateUtil.getSessionFactory();
			// SessionFactory factory = new
			// AnnotationConfiguration().configure().buildSessionFactory();
			Configuration config = new Configuration();
			config.configure();
			
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
			String hqlQuery = "SELECT p.name,p.nric from CustomerCreditReports p WHERE p.nric= "+nric;
			org.hibernate.query.Query query = session.createSQLQuery(hqlQuery);
			System.out.println("Query Response" + query.getResultList());
			if (!query.getResultList().isEmpty()) {
				System.out.println("Query Response not NUll");
				ispresent = true;
				 List<Object[]> response = query.getResultList();
					System.out.println("dbResponse " + response.get(0));
					dbResponse =  response.get(0);
				System.out.println("dbResponse " + dbResponse);
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
			System.out.println("Session not null");
			 session.close();
			}
		}
		return dbResponse;
	}

	
}
