package my.mobypay.creditScore.service;

import lombok.extern.slf4j.Slf4j;
import my.mobypay.creditScore.DBConfig;
import my.mobypay.creditScore.controller.CcrisController;
import my.mobypay.creditScore.controller.EmailUtility;
import my.mobypay.creditScore.controller.GlobalConstants;
import my.mobypay.creditScore.dao.TokensRequest;
import my.mobypay.creditScore.dao.Creditcheckersysconfig;
import my.mobypay.creditScore.dao.CustomerCreditReports;
import my.mobypay.creditScore.dto.CreditCheckResponse;
import my.mobypay.creditScore.dto.CustomerCreditReportRequest;
import my.mobypay.creditScore.dto.UserConfirmCCRISEntityRequest;
import my.mobypay.creditScore.dto.UserSearchRequest;
import my.mobypay.creditScore.dto.UserTokensRequest;
import my.mobypay.creditScore.dto.Utility;
//import my.mobypay.creditScore.dto.request.CreditCheckerEmail;
import my.mobypay.creditScore.dto.request.EmailSending;
import my.mobypay.creditScore.dto.response.CcrisXml;
import my.mobypay.creditScore.dto.response.Item;
import my.mobypay.creditScore.dto.response.Report;
import my.mobypay.creditScore.dto.response.Tokens;
import my.mobypay.creditScore.repository.CustomerUserTokenRepository;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//@Slf4j
@Service
public class CcrisUnifiedService {
	private static Logger log = LoggerFactory.getLogger(CcrisUnifiedService.class);

	@Autowired
	CcrisSearchService ccrisSearchService;

	@Autowired
	CcrisReportRetrievalService ccrisReportRetrievalService;
	/*
	 * @Autowired EmailSendingRepository emailSendingRepository;
	 */

	@Autowired
	CustomerUserTokenRepository customerUserTokenRepository;

	@Autowired
	DBConfig dbconfig;
	
	
	private void delay(long l) {
		try {
			Thread.sleep(l);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unused")
	public CreditCheckResponse getCreditScore(Integer iscore, String caseSettled, String casewithdraw,
			String paymentaging, boolean pendingflag, Integer legalsuitcount, Integer bankruptcycount,
			boolean crissFlag, Integer tradeBureauCount,boolean entityKey, boolean entityId,String specialAttentionAccount, String facility) {
		log.info("Inside getCreditScore ");
		log.info("caseSettled " +caseSettled);
		log.info("casewithdraw " +casewithdraw);
		log.info("paymentaging " +paymentaging);
		log.info("pendingflag " +pendingflag);
		log.info("legalsuitcount " +legalsuitcount);
		log.info("bankruptcycount " +bankruptcycount);
		log.info("crissFlag " +crissFlag);
		log.info("tradeBureauCount " +tradeBureauCount);
		log.info("entityKey " +entityKey);
		log.info("entityId " +entityId);
		log.info("specialAttentionAccount " +specialAttentionAccount);
		log.info("facility " +facility);
		
		System.out.println(paymentaging);
		Integer maximumAllowedInstallments = 0;
		Integer maximumSpendingLimit = 0;
		boolean registrationallowed = false;
		boolean isNricExist = false;
		boolean creditscoreless = false;
		Boolean flag = false;
		boolean lowcreditScore = false;
		String messageStatus = null;
		int paymentAmountcalculation = 0;
		
		String Message = null;
		CreditCheckResponse credit = null;
		if (paymentaging != null) {
			paymentAmountcalculation = PaymentAgingvalidation(paymentaging);
			if (paymentAmountcalculation == 1) {
				paymentaging = "DEFAULTED / ACCOUNT TERMINATED";
			}
		}
		log.info("paymentAmountcalculation " +paymentAmountcalculation);
		if (iscore == null) {
			return getZeroCreditScore();
		}

		// Spending limit algorithm based on iScore

		if (bankruptcycount == 0
				&& ((caseSettled != null && caseSettled.equalsIgnoreCase("Y"))
						|| (casewithdraw != null && casewithdraw.equalsIgnoreCase("Y")) || pendingflag == false)
				&& paymentaging == null 
				 && (specialAttentionAccount == null || specialAttentionAccount.equals("N")) ) {
			log.info("Inside caseSettled != null ");
			// spendinglimitAlgorithm(entityId,entityKey,iscore,facility);
			if ((iscore == 0 || iscore == null) && entityId == false  && entityKey == false) {
				log.info("criss info condition with iscore = = 0");
				System.out.println("iscore = = 0");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 150;
				registrationallowed = true;
				isNricExist = true;
				creditscoreless = true;
				messageStatus = "No Ccris Info found";
			} else if ((iscore == 0 || iscore == null) && entityId == true  && entityKey == true && facility != null && facility.equals("NHEDFNCE")) {
				log.info("criss info condition with iscore = = 0");
				System.out.println("iscore = = 0");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 150;
				registrationallowed = true;
				isNricExist = true;
				creditscoreless = true;
				messageStatus = "No Ccris Info found";
			} else if (iscore <= 420 && entityId == true  && entityKey == true) {
				log.info("iscore <= 420");
				maximumAllowedInstallments = 0;
				maximumSpendingLimit = 0;
				registrationallowed = false;
				isNricExist = true;
				messageStatus = "Low Credit Score";
				lowcreditScore = true;
			} else if (iscore >= 421 && iscore <= 460 && entityId == true  && entityKey == true) {
				log.info("iscore >= 421 && iscore <= 460");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 300;
				registrationallowed = true;
				isNricExist = true;
			} else if (iscore >= 461 && iscore <= 540 && entityId == true  && entityKey == true) {
				log.info("iscore >= 461 && iscore <= 540");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 500;
				registrationallowed = true;
				isNricExist = true;

			} else if ((iscore >= 541) && (iscore <= 580) && entityId == true  && entityKey == true) {
				log.info("iscore >= 541) && (iscore <= 580");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 1500;
				registrationallowed = true;
				isNricExist = true;

			} else if ((iscore >= 581) && (iscore <= 620) && entityId == true  && entityKey == true) {
				log.info("iscore >= 581) && (iscore <= 620");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 2000;
				registrationallowed = true;
				isNricExist = true;

			} else if ((iscore >= 621) && (iscore <= 660) && entityId == true  && entityKey == true) {
				log.info("iscore >= 621) && (iscore <= 660");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 2500;
				registrationallowed = true;
				isNricExist = true;

			} else if ((iscore >= 661) && (iscore <= 700) && entityId == true  && entityKey == true) {
				log.info("iscore >= 661) && (iscore <= 700");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 3000;
				registrationallowed = true;
				isNricExist = true;
			} else if (iscore >= 701 && (iscore <= 740) && entityId == true  && entityKey == true) {
				log.info("iscore >= 701 && iscore >= 740");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 5000;
				registrationallowed = true;
				isNricExist = true;
			} else if (iscore >= 741 && entityId == true  && entityKey == true) {
				log.info("iscore >= 741");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 5000;
				registrationallowed = true;
				isNricExist = true;
			}else if (iscore > 0 && entityId == false  && entityKey == false) {
				log.info("iscore > 0 && entityId == false  && entityKey == false");
				System.out.println("iscore > = 0");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 150;
				registrationallowed = true;
				isNricExist = true;
				creditscoreless = true;
				messageStatus = "No Ccris Info found";
			}
		}
		else if (bankruptcycount == 0
				&& legalsuitcount == 0 && caseSettled == null && casewithdraw == null && pendingflag == false
				&& paymentaging == null 
				&& (specialAttentionAccount == null || specialAttentionAccount.equals("N")) ) {
			log.info("Inside (caseSettled == null) || (casewithdraw == null) ");
			// spendinglimitAlgorithm(entityId,entityKey,iscore,facility);
			if ((iscore == 0 || iscore == null) && entityId == false  && entityKey == false) {
				log.info("criss info condition with iscore = = 0");
				System.out.println("iscore = = 0");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 150;
				registrationallowed = true;
				isNricExist = true;
				creditscoreless = true;
				messageStatus = "No Ccris Info found";
			} else if ((iscore == 0 || iscore == null) && entityId == true  && entityKey == true && facility != null && facility.equals("NHEDFNCE")) {
				log.info("criss info condition with iscore = = 0");
				System.out.println("iscore = = 0");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 150;
				registrationallowed = true;
				isNricExist = true;
				creditscoreless = true;
				messageStatus = "No Ccris Info found";
			} else if (iscore <= 420 && entityId == true  && entityKey == true) {
				log.info("iscore <= 420");
				maximumAllowedInstallments = 0	;
				maximumSpendingLimit = 0;
				registrationallowed = false;
				isNricExist = true;
				messageStatus = "Low Credit Score";
				lowcreditScore = true;
			} else if (iscore >= 421 && iscore <= 460 && entityId == true  && entityKey == true) {
				log.info("iscore >= 421 && iscore <= 460");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 300;
				registrationallowed = true;
				isNricExist = true;
			} else if (iscore >= 461 && iscore <= 540 && entityId == true  && entityKey == true) {
				log.info("iscore >= 461 && iscore <= 540");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 500;
				registrationallowed = true;
				isNricExist = true;

			} else if ((iscore >= 541) && (iscore <= 580) && entityId == true  && entityKey == true) {
				log.info("iscore >= 541) && (iscore <= 580");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 1500;
				registrationallowed = true;
				isNricExist = true;

			} else if ((iscore >= 581) && (iscore <= 620) && entityId == true  && entityKey == true) {
				log.info("iscore >= 581) && (iscore <= 620");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 2000;
				registrationallowed = true;
				isNricExist = true;

			} else if ((iscore >= 621) && (iscore <= 660) && entityId == true  && entityKey == true) {
				log.info("iscore >= 621) && (iscore <= 660");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 2500;
				registrationallowed = true;
				isNricExist = true;

			} else if ((iscore >= 661) && (iscore <= 700) && entityId == true  && entityKey == true) {
				log.info("iscore >= 661) && (iscore <= 700");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 3000;
				registrationallowed = true;
				isNricExist = true;
			}else if (iscore >= 701 && (iscore <= 740)  && entityId == true  && entityKey == true) {
				log.info("iscore >= 701  && (iscore <= 740");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 5000;
				registrationallowed = true;
				isNricExist = true;
			}  else if (iscore >= 741 && entityId == true  && entityKey == true) {
				log.info("iscore >= 741");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 5000;
				registrationallowed = true;
				isNricExist = true;
			} else if (iscore > 0 && entityId == false  && entityKey == false) {
				log.info("iscore > 0 && entityId == false  && entityKey == false");
				System.out.println("iscore > = 0");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 150;
				registrationallowed = true;
				isNricExist = true;
				creditscoreless = true;
				messageStatus = "No Ccris Info found";
			}
		} else if (bankruptcycount == 0
				&& (caseSettled == null
						&& casewithdraw == null && pendingflag == false)
				&& paymentaging == null
				&& (specialAttentionAccount == null || specialAttentionAccount.equals("N")) ) {
			log.info("Inside caseSettled == null ");
			// spendinglimitAlgorithm(entityId,entityKey,iscore,facility);
			if ((iscore == 0 || iscore == null) && entityId == false  && entityKey == false) {
				log.info("criss info condition with iscore = = 0");
				System.out.println("iscore = = 0");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 150;
				registrationallowed = true;
				isNricExist = true;
				creditscoreless = true;
				messageStatus = "No Ccris Info found";
			} else if ((iscore == 0 || iscore == null) && entityId == true  && entityKey == true && facility != null && facility.equals("NHEDFNCE")) {
				log.info("criss info condition with iscore = = 0");
				System.out.println("iscore = = 0");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 150;
				registrationallowed = true;
				isNricExist = true;
				creditscoreless = true;
				messageStatus = "No Ccris Info found";
			} else if (iscore <= 420 && entityId == true  && entityKey == true) {
				log.info("iscore <= 420");
				maximumAllowedInstallments = 0;
				maximumSpendingLimit = 0;
				registrationallowed = false;
				isNricExist = true;
				messageStatus = "Low Credit Score";
				lowcreditScore = true;
			} else if (iscore >= 421 && iscore <= 460 && entityId == true  && entityKey == true) {
				log.info("iscore >= 421 && iscore <= 460");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 300;
				registrationallowed = true;
				isNricExist = true;
			} else if (iscore >= 461 && iscore <= 540 && entityId == true  && entityKey == true) {
				log.info("iscore >= 461 && iscore <= 540");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 500;
				registrationallowed = true;
				isNricExist = true;

			} else if ((iscore >= 541) && (iscore <= 580) && entityId == true  && entityKey == true) {
				log.info("iscore >= 541) && (iscore <= 580");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 1500;
				registrationallowed = true;
				isNricExist = true;

			} else if ((iscore >= 581) && (iscore <= 620) && entityId == true  && entityKey == true) {
				log.info("iscore >= 581) && (iscore <= 620");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 2000;
				registrationallowed = true;
				isNricExist = true;

			} else if ((iscore >= 621) && (iscore <= 660) && entityId == true  && entityKey == true) {
				log.info("iscore >= 621) && (iscore <= 660");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 2500;
				registrationallowed = true;
				isNricExist = true;

			} else if ((iscore >= 661) && (iscore <= 700) && entityId == true  && entityKey == true) {
				log.info("iscore >= 661) && (iscore <= 700");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 3000;
				registrationallowed = true;
				isNricExist = true;
			} else if (iscore >= 701 &&  (iscore <= 740) && entityId == true  && entityKey == true) {
				log.info("iscore >= 701 &&  (iscore <= 740)");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 5000;
				registrationallowed = true;
				isNricExist = true;
			}else if (iscore >= 741 && entityId == true  && entityKey == true) {
				log.info("iscore >= 741");
				maximumAllowedInstallments = 6;
				maximumSpendingLimit = 5000;
				registrationallowed = true;
				isNricExist = true;
			} else if (iscore > 0 && entityId == false  && entityKey == false) {
				log.info("iscore > 0 && entityId == false  && entityKey == false");
				System.out.println("iscore > = 0");
				maximumAllowedInstallments = 3;
				maximumSpendingLimit = 150;
				registrationallowed = true;
				isNricExist = true;
				creditscoreless = true;
				messageStatus = "No Ccris Info found";
			}
		}else if (paymentaging != null
				&& paymentAmountcalculation <= 90 && iscore > 421) {
			log.info("Inside paymentAmountcalculation <= 90 && iscore > 421");
			maximumAllowedInstallments = 3;
			maximumSpendingLimit = 300;
			registrationallowed = true;
			isNricExist = true;
		} else if (bankruptcycount == 0
				&& (legalsuitcount == 0 || (caseSettled != null && caseSettled.equalsIgnoreCase("Y"))
						|| (casewithdraw != null && casewithdraw.equalsIgnoreCase("Y")) || pendingflag == true)
				&& paymentaging != null && paymentaging.equalsIgnoreCase("DEFAULTED / ACCOUNT TERMINATED")
				&& iscore > 421) {
			log.info("Inside DEFAULTED / ACCOUNT TERMINATED && iscore > 421");
			maximumAllowedInstallments = 0;
			maximumSpendingLimit = 0;
			messageStatus = "We are sorry,We are unable to provide AiraPay/MobyPay services to you. Upon our internal checks and verifications, we regret to inform you that you did not meet certain requirements we are looking for to enable the instalment payments under AiraPay/MobyPay for your account.";
			flag = true;
			registrationallowed = false;
			isNricExist = true;
		} else if (paymentAmountcalculation >= 120 && iscore > 0) {
			log.info("Inside paymentAmountcalculation >= 120 " + paymentAmountcalculation);
			maximumAllowedInstallments = 0;
			maximumSpendingLimit = 0;
			messageStatus = "We are sorry,We are unable to provide AiraPay/MobyPay services to you. Upon our internal checks and verifications, we regret to inform you that you did not meet certain requirements we are looking for to enable the instalment payments under AiraPay/MobyPay for your account.";
			flag = true;
			registrationallowed = false;
			isNricExist = true;
		} else {
			log.info("Inside else loop  ");
			maximumAllowedInstallments = 0;
			maximumSpendingLimit = 0;
			messageStatus = "We are sorry,We are unable to provide AiraPay/MobyPay services to you. Upon our internal checks and verifications, we regret to inform you that you did not meet certain requirements we are looking for to enable the instalment payments under AiraPay/MobyPay for your account.";
			flag = true;
			registrationallowed = false;
			isNricExist = true;
		}

		if (flag == true) {
			log.info("Inside flag== true condition");
			credit = CreditCheckResponse.builder().isNameNricMatched(true).isNricExist(isNricExist)
					.isRegistrationAllowed(registrationallowed).maximumAllowedInstallments(maximumAllowedInstallments)
					.maximumSpendingLimit(maximumSpendingLimit).statusCode("01").errorMessage(messageStatus)
					.Score(iscore).PendingFlag(pendingflag).isBelowscoreFlag(flag).LowScoreCheck(creditscoreless)
					.build();
		} else if (creditscoreless == true) {
			log.info("Inside creditscoreless==true condition");
			credit = CreditCheckResponse.builder().isNameNricMatched(true).isNricExist(isNricExist)
					.isRegistrationAllowed(registrationallowed).maximumAllowedInstallments(maximumAllowedInstallments)
					.maximumSpendingLimit(maximumSpendingLimit).statusCode("05").errorMessage(messageStatus)
					.Score(iscore).PendingFlag(pendingflag).isBelowscoreFlag(flag).LowScoreCheck(creditscoreless)
					.build();
		} else if (lowcreditScore == true) {
			log.info("Inside lowcreditScore==true condition");
			credit = CreditCheckResponse.builder().isNameNricMatched(true).isNricExist(isNricExist)
					.isRegistrationAllowed(registrationallowed).maximumAllowedInstallments(maximumAllowedInstallments)
					.maximumSpendingLimit(maximumSpendingLimit).statusCode("06").errorMessage(messageStatus)
					.Score(iscore).PendingFlag(pendingflag).isBelowscoreFlag(flag).LowScoreCheck(lowcreditScore)
					.build();
		} else {
			log.info("Inside else consition");
			credit = CreditCheckResponse.builder().isNameNricMatched(true).isNricExist(isNricExist)
					.isRegistrationAllowed(registrationallowed).maximumAllowedInstallments(maximumAllowedInstallments)
					.maximumSpendingLimit(maximumSpendingLimit).statusCode("00").errorMessage(messageStatus)
					.Score(iscore).PendingFlag(pendingflag).isBelowscoreFlag(flag).LowScoreCheck(creditscoreless)
					.build();
		}
		return credit;
	}


	public static int PaymentAgingvalidation(String paymentaging) {
		if (paymentaging.equalsIgnoreCase("DEFAULTED / ACCOUNT TERMINATED")) {
			return 1;
		} else {
			if (paymentaging.length() <= 12) {
				String check = paymentaging.substring(paymentaging.length() + 5 - 12, paymentaging.length() - 5).trim();
				Integer value = Integer.parseInt(check);
				log.info("paymentaging <=12 : " + value);
				return value;
			} else {
				String check = paymentaging.replaceAll("OVER", "");
				check = check.replaceAll("DAYS", "").replaceAll(" ", "");
				int value = Integer.parseInt(check);
				log.info("paymentaging " + value);
				return value;

			}

		}
	}

	private CreditCheckResponse getZeroCreditScore() {
		CreditCheckResponse zeroCredit = CreditCheckResponse.builder().isNameNricMatched(false).isNricExist(false)
				.isRegistrationAllowed(false).maximumAllowedInstallments(0).maximumSpendingLimit(0).build();

		return zeroCredit;
	}

	/*
	 * private CreditCheckResponse getLowestCreditScore() { Boolean flag = true;
	 * String messageStatus =
	 * "We are unable to provide AiraPay services to you. Upon our internal checks and verifications, we regret to inform you that you did not meet certain requirements we are looking for to enable the instalment payments under AiraPay for your account."
	 * ;;
	 * 
	 * CreditCheckResponse lowestCredit =
	 * CreditCheckResponse.builder().isNameNricMatched(true).isNricExist(false)
	 * .isRegistrationAllowed(true).maximumAllowedInstallments(3).
	 * maximumSpendingLimit(300)
	 * .errorMessage(messageStatus).isBelowscoreFlag(flag).build();
	 * 
	 * return lowestCredit;
	 * 
	 * }
	 */

	@SuppressWarnings("unused")
	public Utility getCcrisReport(UserSearchRequest userSearchRequest, boolean reportFlag, String triggersleeptime,
			String triggerreconnectCount, Integer retivalCount) throws Exception {
		Creditcheckersysconfig expErrCCFromRedis = dbconfig.getDataFromRedis(GlobalConstants.EXP_ERRMAIL_CC);
		HashMap<String, String> valueFromDB = dbconfig.getValueFromDB();
		String key = "experian-erroremail-cc";
		String emailSending = null;
		if (expErrCCFromRedis != null) {
			emailSending = expErrCCFromRedis.getValue();
		}else {
			emailSending = valueFromDB.get(GlobalConstants.EXP_ERRMAIL_CC);
			System.out.println("*****************************Redis Not Read***********************************");
		}
		System.out.println(emailSending + "=========");
	
		CcrisXml ccrisXml = ccrisSearchService.ccrisSearch(userSearchRequest, emailSending);

		Utility utilityEntities = new Utility();
		boolean InvalidFlag = false; // boolean InvalidUsernameflag=false;
		String TokenMap = null;
		boolean Errorcode500 = ccrisXml.getCode() != null;
		// log.info(ccrisXml.toString() + "user-request xml string");
		CustomerCreditReportRequest report;
		if (ccrisXml.getError() != null && !ccrisXml.getCode().contains("500")) {

			log.info("Getting error*************************1");
			String code = ccrisXml.getCode();

			String error = ccrisXml.getError();
			utilityEntities.setCodes(code);
			utilityEntities.setErrorMsg(error);
			utilityEntities.setInvalidUserFlag(true);
			utilityEntities.setDBMessage(ccrisXml.getDBMessage());
			utilityEntities.setRetrivalCount(retivalCount);
			log.info(utilityEntities + "checking error code and message");

		} else if (ccrisXml != null && ccrisXml.getCode() != null && ccrisXml.getCode().contains("500")) {
			log.info("getting the errorcode:" + ccrisXml.getCode());
			String code = ccrisXml.getCode();

			String error = ccrisXml.getError();
			String removeinvalid = error.substring(0, error.length() - 1);
			utilityEntities.setCodes(code);
			utilityEntities.setErrorMsg(removeinvalid);
			utilityEntities.setInvalidUserFlag(true);
			utilityEntities.setDBMessage(ccrisXml.getDBMessage());
			utilityEntities.setRetrivalCount(retivalCount);

		} else {
			String names = "";
			String CrefId = "";
			String Entitykey = "";
			for (int i = 0; i < ccrisXml.getItemList().size(); i++) {
				names = ccrisXml.getItemList().get(i).getEntityName();
				CrefId = ccrisXml.getItemList().get(i).getCRefId();
				Entitykey = ccrisXml.getItemList().get(i).getEntityKey(); //

			}

			/*
			 * Item item = ccrisXml.getItemList().stream() .filter(item1 ->
			 * (item1.getEntityName().equalsIgnoreCase(userSearchRequest.getName()))).
			 * findFirst() .orElse(null); // Item // item // =
			 */

			// item.setEntityName(name);
			if (names.equalsIgnoreCase(userSearchRequest.getName())) {
				UserConfirmCCRISEntityRequest userConfirmCCRISEntityRequest = UserConfirmCCRISEntityRequest.builder()
						.refId(CrefId).entityKey(Entitykey).mobileNo("12345").emailAddress("sssssss")
						.lastKnownAddress("asdas").consentGranted("Y").enquiryPurpose("REVIEW").build();
				UserTokensRequest userTokensRequest;

				TokensRequest checkToken = new TokensRequest();
				TokensRequest customerTokenRequest = new TokensRequest();
				TokenMap = customerUserTokenRepository.findTokenByNric(userSearchRequest.getEntityId());

				// checkToken=customerUserTokenRepository.findTokenByNric(userSearchRequest.getEntityId());
				String token1, token2 = "";
				if (TokenMap == null) {
					Tokens tokens = ccrisSearchService.ccrisConfirm(userConfirmCCRISEntityRequest, emailSending); //
					if (tokens.getError() != null) {
						InvalidFlag = true;
						String code = tokens.getCode();
						String error = tokens.getError();
						String DBMessage = tokens.getDataBaseMessage();
						utilityEntities.setInvalidUserFlag(InvalidFlag);
						utilityEntities.setCodes(code);
						utilityEntities.setErrorMsg(error);
						utilityEntities.setDBMessage(DBMessage);
						utilityEntities.setRetrivalCount(retivalCount);
						// log.info(utilityEntities + "tokingggggggggggggggggggggggggggggggg");
						return utilityEntities;
					} else {
						token1 = tokens.getToken1();
						token2 = tokens.getToken2();
						customerTokenRequest.setNric(userSearchRequest.getEntityId());
						customerTokenRequest.setName(names);
						customerTokenRequest.setToken1(token1);
						customerTokenRequest.setToken2(token2);
						customerTokenRequest.setCreatedDate(new Date());
						customerTokenRequest.setUpdatedDate(new Date());
						customerUserTokenRepository.save(customerTokenRequest);
					}
				} else {
					// token1=checkToken.getToken1();
					String split[] = TokenMap.split(",");
					String token11 = split[0].toString();
					String token12 = split[1].toString();
					token1 = token11;
					token2 = token12;
				}

				userTokensRequest = UserTokensRequest.builder().token1(token1).token2(token2).build();

				/*
				 * else { userTokensRequest =
				 * UserTokensRequest.builder().token1(tokens.getToken1())
				 * .token2(tokens.getToken2()).build(); }
				 */
				log.info("Wait for report retrieval API");
				int triggertime = Integer.parseInt(triggersleeptime);
				log.info("getting triggertimeeeeeeeeee" + triggertime);
				delay(triggertime);
				report = ccrisReportRetrievalService.retrieveReport(userTokensRequest, reportFlag, userSearchRequest,
						triggerreconnectCount, triggersleeptime, emailSending); // //
				log.info("report.getError()" + report.getError());
				log.info("EXPERIAN FLAG IS PRESENT" + report.getExperianServerFlag());
				if (report.getError() != null && report.getExperianServerFlag() == false) {
					log.info("returning the error code");
					utilityEntities.setInvalidUserFlag(true);
					utilityEntities.setCodes(report.getCode());
					utilityEntities.setErrorMsg(report.getError());
					utilityEntities.setRetrivalCount(report.getRetrivalCount());
					log.info(" email to be sent");
					// EmailUtility emailUtility=new EmailUtility();
					// emailUtility.sentEmail(utilityEntities.getErrorMsg()+","+utilityEntities.getCodes());

					return utilityEntities;
				} else if (report.getError() != null && report.isCriss() == true) {
					log.info("isCriss "+ report.isCriss());
					String code = report.getCode();
					String error = report.getError();
					int retrival = report.getRetrivalCount();
					//Updated to check ccris flag based on entity_id and entity_key
					boolean Crissflag = false;
					if(report.isEntityId() && report.isEntityKey()) {
						Crissflag = true;
					}else
					{
						Crissflag = false;
					}
				//	boolean Crissflag = report.isCriss();
					utilityEntities.setCrissInfo(Crissflag);
					utilityEntities.setCodes(code);
					utilityEntities.setErrorMsg(error);
					utilityEntities.setRetrivalCount(retrival);
				} else if (report.getError() != null && report.getExperianServerFlag() == true) {
					log.info("EXPERIAN FLAG IS PRESENT===============================================");
					log.info("total count in retival service class" + report.getRetrivalCount());
					String code = report.getCode();
					String error = report.getError();
					int retrival = report.getRetrivalCount();
					boolean Expflag = report.getExperianServerFlag();
					utilityEntities.setExperianServerFlag(Expflag);
					utilityEntities.setCodes(code);
					utilityEntities.setErrorMsg(error);
					utilityEntities.setRetrivalCount(retrival);
					log.info("Experian returning the error code");

					// log.info("Email Class setting"+emailSending.get(0));
					// EmailUtility emailUtility=new EmailUtility();
					// emailUtility.sentEmail(utilityEntities.getErrorMsg(),emailSending);

					return utilityEntities;
				} else {

					utilityEntities.setInvalidUserFlag(false);
					utilityEntities.setExperianServerFlag(false);
					utilityEntities.setCreditReportRequest(report);
					// utilityEntities.setRetrivalCount(retrival++);
					// log.info("getting the code from response" + utilityEntities);

					return utilityEntities;
				}

			} else {

				utilityEntities.setInvalidUserFlag(true);
				utilityEntities.setExperianServerFlag(false);
				utilityEntities.setInvalidUsernameflag(true);
				utilityEntities.setCodes("404-Name mistmatch !!");
				utilityEntities.setErrorMsg(
						"Oops, maybe it is us and not you, but we can’t seem to validate this MyKad number/name! Probably it was not in a correct format. For MyKad No, please key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin/Binti/ A/L / A/P and without any abbreviations.");
				log.info("getting the code from response" + utilityEntities.getErrorMsg() + ","
						+ utilityEntities.getCodes());
				utilityEntities.setRetrivalCount(retivalCount);
				// EmailUtility emailUtility=new EmailUtility();
				// emailUtility.sentEmail(utilityEntities.getErrorMsg()+","+utilityEntities.getCodes());

				return utilityEntities;
			}
		}
		return utilityEntities;
	}

	/*
	 * public Utility getCcrisReport() throws Exception { // CcrisXml ccrisXml =
	 * 
	 * Utility utilityEntities = new Utility(); boolean InvalidFlag = false;
	 * CcrisReportRetrievalService ccrisReportRetrievalService = new
	 * CcrisReportRetrievalService(); log.info("Wait for report retrieval API");
	 * delay(10000); CustomerCreditReportRequest report =
	 * ccrisReportRetrievalService.retrieveReport(); if (report.getError() != null
	 * && report.getExperianServerFlag() == false) { InvalidFlag = true; String code
	 * = report.getCode(); String error = report.getError();
	 * utilityEntities.setInvalidUserFlag(InvalidFlag);
	 * utilityEntities.setCodes(code); utilityEntities.setErrorMsg(error);
	 * log.info(utilityEntities + "returning the error code"); return
	 * utilityEntities; } else if (report.getError() != null &&
	 * report.getExperianServerFlag() == true) { log.
	 * info("EXPERIAN FLAG IS PRESENT==============================================="
	 * ); String code = report.getCode(); String error = report.getError(); boolean
	 * Expflag = report.getExperianServerFlag();
	 * utilityEntities.setExperianServerFlag(Expflag);
	 * utilityEntities.setCodes(code); utilityEntities.setErrorMsg(error);
	 * log.info(utilityEntities + "returning the error code"); return
	 * utilityEntities; } else { boolean Crissflag = report.isCriss();
	 * utilityEntities.setCrissInfo(Crissflag);
	 * utilityEntities.setInvalidUserFlag(false);
	 * utilityEntities.setExperianServerFlag(false);
	 * utilityEntities.setCreditReportRequest(report);
	 * log.info("getting the code from response" + utilityEntities);
	 * 
	 * return utilityEntities; }
	 * 
	 * }
	 */

	public CreditCheckResponse errorMethodCalling() {
		CreditCheckResponse credit = CreditCheckResponse.builder().isNameNricMatched(false).isNricExist(false)
				.isRegistrationAllowed(false).maximumAllowedInstallments(0).maximumSpendingLimit(0).statusCode("400")
				.errorMessage(
						"Oops, maybe it is us and not you, but we can’t seem to validate this MyKad number/name! Probably it was not in a correct format. For MyKad No, please key in the 12 digits number (without any space/dash) 95XXXXXXXXXX. For name, please ensure the name is keyed in exactly as per your MyKad i.e with Bin/Binti/ A/L / A/P and without any abbreviations.")
				.Score(0).build();

		return credit;
	}

	public CreditCheckResponse ExperianServerDown() {
		log.info("Experian is downnnnnnnnn");
		CreditCheckResponse credit = CreditCheckResponse.builder().isNameNricMatched(false).isNricExist(false)
				.isRegistrationAllowed(false).maximumAllowedInstallments(0).maximumSpendingLimit(0).statusCode("102")
				.errorMessage("Experian API connection issue")
		//				"we are unable to process your application as our 3rd party services provider is not available at the moment. Please try again later.")
						
				.Score(0).build();

		return credit;
	}

	public String calculateExpiryTime() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -30); // I just want date before 90 days. you can give that you want.

		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); // you can specify your format here...
		String daysBefore = s.format(new Date(cal.getTimeInMillis()));
		log.info("Date before 30 Days: " + daysBefore);

		return daysBefore;
	}
}
