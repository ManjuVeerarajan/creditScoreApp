package my.mobypay.creditScore.dao;

import lombok.Builder;
import lombok.Data;


@Data
//@Builder
public class CustomerSpendingLimitResponse {
	
	
    public CustomerSpendingLimitResponse() {
		// TODO Auto-generated constructor stub
	}
	private Boolean isRegistrationAllowed;
    private Boolean isNricExist;
    private Boolean isNameNricMatched;
    private Integer maximumAllowedInstallments;
    private Integer maximumSpendingLimit;
    private String statusCode;
    private String errorMessage;
	/*
	 * private Integer responseCode; private String responseMsg; private String URL;
	 * private String Refxml;
	 */
   // private String DBXML;

}
