package my.mobypay.creditScore.dto;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ExperianApplicationProperty {

	
	private String ExperianTriggerTime;
	private String ExperianTriggerCount;
}
