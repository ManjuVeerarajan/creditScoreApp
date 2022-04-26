package my.mobypay.creditScore.dao;

import lombok.Data;

@Data
public class ExperianReportResponse {

	
	private String responseCode;
    private String responseMsg;
    private String URL;
    private int BankruptcyCount;
    private int LegalSuitCount;
    private int TradeBureauCount;
    private int IScore;
    private int IScoreRiskGrade;
    private String IScoreGradeFormat;
    private int LegalActionBankingCount;
    private double BorrowerOutstanding;
    private int BankingCreditApprovedCount;
    private double BankingCreditApprovedAmount;
    private int BankingCreditPendingCount;
    private double BankingCreditPendingAmount;
    private String Refxml;
}
