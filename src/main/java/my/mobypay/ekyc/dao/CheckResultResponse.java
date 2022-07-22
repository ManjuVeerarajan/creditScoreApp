package my.mobypay.ekyc.dao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CheckResultResponse {

	Result result;
	private String ekycResult;
	ExtBasicInfo extBasicInfo;
	ExtFaceInfo extFaceInfo;
	ExtIdInfo extIdInfo;
	ExtRiskInfo extRiskInfo;
	
}
