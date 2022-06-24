package my.mobypay.creditScore.dto;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;

import lombok.Builder;
import lombok.Data;
import my.mobypay.creditScore.dto.response.Error;


@Data
@Builder
public class CustomerCreditReportRequest {

	
	private Integer id;
	private String name;
	private String nric;
	private Integer bankruptcyCount;
	private Integer legalSuitCount;
	private Integer tradeBureauCount;
	private Integer iScore;
	private Integer iScoreRiskGrade;
	private String iScoreGradeFormat;
	private Double borrowerOutstanding;
	private Integer legalActionBankingCount;
	private Integer bankingCreditApprovedCount;
	private Double bankingCreditApprovedAmount;
	private Integer bankingCreditPendingCount;
	private Double bankingCreditPendingAmount;
	private String xmlString;
	private String jsonString;
	private Date createdAt;
	private Date updatedAt;
    private String legalStatus;
    private String error;
   	private String code;
   	private String casesettled;
    private String casewithdrawn;
   	private String paymentaging;
   	private CreditCheckResponse checkResponse;
   	private Boolean PendingStatus;
   	private Integer LegalstatusCount;
   	private Boolean ExperianServerFlag;
   	private String downaloadfilepath;
     private Integer RetrivalCount;
     private boolean Criss;
     private boolean entityKey;
     private boolean entityId;
     private String specialAttentionAccount;
     private String facility;
     private Blob pdfBlob;
     private String base64_pdf;
   //	private Boolean InvalidUserFlag;
   
   	



}
