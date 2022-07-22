package my.mobypay.creditScore.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserConfirmCCRISEntityRequest {

	private String refId;
	private String entityKey;
	private String mobileNo;
	private String emailAddress;
	private String lastKnownAddress;
	private String consentGranted;
	private String enquiryPurpose;
}
