package my.mobypay.creditScore.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Builder;
import lombok.Data;

@Data

public class Error {

	@JsonProperty("Errorcode")
	private String Errorcode;
	@JsonProperty("Errormessage")
	private String Errormessage;

}
