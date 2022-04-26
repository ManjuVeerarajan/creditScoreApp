package my.mobypay.creditScore.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Report {

    
	private Integer iScore;
    private Integer bankruptcyCount;
    private Integer legalSuitCount;
    private String legalStatus;
    
}
