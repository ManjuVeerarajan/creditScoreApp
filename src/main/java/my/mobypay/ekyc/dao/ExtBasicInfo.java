package my.mobypay.ekyc.dao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExtBasicInfo {

	private String certType;
	private String certNo;
	private String certName;
	
}
