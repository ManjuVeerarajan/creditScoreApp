package my.mobypay.creditScore.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CreditCheckResponse {

    private Boolean isRegistrationAllowed;
    private Boolean isNricExist;
    private Boolean isNameNricMatched;
    private Integer maximumAllowedInstallments;
    private Integer maximumSpendingLimit;
    private String statusCode;
    private String errorMessage;
    private Integer Score;
    private Boolean isBelowscoreFlag;
    private Boolean PendingFlag;
    private String caseSettled;
    private String casewithdraw;
    private String paymentaging ;
    private Boolean pendingflag;
    private Integer legalsuitcount;
    private Boolean ErrorFlag;
    private Boolean LowScoreCheck;
   
}
