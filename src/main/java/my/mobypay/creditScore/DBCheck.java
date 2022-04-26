package my.mobypay.creditScore;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import my.mobypay.creditScore.controller.CcrisController;
import my.mobypay.creditScore.dao.CustomerCreditReports;

public class DBCheck {

	public static void main(String[] args) {
		boolean ispresent = false;
		CcrisController cont = new CcrisController();
		ispresent = retrieveNricFromDB("971203025630");
		
		System.out.println("ispresent" +ispresent);
	}
	
	public static boolean retrieveNricFromDB(String nric) {
		boolean ispresent = false;
		
		Session session = null;
		Transaction transaction = null;
		try {
			// SessionFactory factory = HibernateUtil.getSessionFactory();
			//SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
			Configuration config = new Configuration();
			  config.configure();
			  // local SessionFactory bean created
			 //  SessionFactory sessionFactory = config.buildSessionFactory();
			  SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(CustomerCreditReports.class)
		                .buildSessionFactory();
			session = factory.openSession();
			transaction = session.beginTransaction();
			String hqlQuery = "UPDATE CustomerCreditReports  set name = 'NNXXXX XXX XXXXX' WHERE nric = 610213065114";
			// String hqlQuery = "SELECT name FROM CustomerCreditReports WHERE nric = 571218135450";
			org.hibernate.query.Query query = session.createQuery(hqlQuery);
			// System.out.println("Query Response" +query.getResultList().get(0));
		//	ispresent = query.getResultList() !=null;
			System.out.println("ispresent" +ispresent);
			
			transaction.commit();
		} catch (Exception e) {
			System.out.println("exception " +e);
		}
		/** Closing Session */
		//session.close();
		return ispresent;
	}
}
