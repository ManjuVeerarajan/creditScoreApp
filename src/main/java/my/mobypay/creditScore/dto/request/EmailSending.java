package my.mobypay.creditScore.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class EmailSending {
	
	private String To;
	private String CC;

}
