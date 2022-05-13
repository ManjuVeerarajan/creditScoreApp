package my.mobypay.creditScore;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import my.mobypay.creditScore.controller.CcrisController;
import my.mobypay.creditScore.dao.CustomerCreditReports;

public class DBCheck {

	public static void main(String[] args) {
		System.out.println("Inside main");
		DBConfig db = new DBConfig();
	//	List<CreditScoreConfig> configValues = db.getValueFromDB();
		 
	//	 System.out.println("configValues " +configValues);
	}
	
}
