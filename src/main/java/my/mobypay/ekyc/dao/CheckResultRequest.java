package my.mobypay.ekyc.dao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CheckResultRequest {

	private String bizId;
	private String transactionId;
	private String isReturnImage;
	private Integer clientType;
}
