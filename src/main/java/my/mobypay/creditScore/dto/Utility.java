package my.mobypay.creditScore.dto;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data

public class Utility {
	
	
	private CustomerCreditReportRequest creditReportRequest;
	private String codes; 
	private String errorMsg; 
	private Boolean InvalidUserFlag;
	 private Boolean ExperianServerFlag;
	 private Boolean InvalidUsernameflag;
	 private String DBMessage;
	 private Integer RetrivalCount;
	 private boolean CrissInfo;
}
