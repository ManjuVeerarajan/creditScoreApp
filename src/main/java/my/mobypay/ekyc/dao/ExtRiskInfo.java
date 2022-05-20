package my.mobypay.ekyc.dao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExtRiskInfo {
	private String ekycResultRisk;
	private String strategyPassResult;
	private String idNetworkDetails;

}
