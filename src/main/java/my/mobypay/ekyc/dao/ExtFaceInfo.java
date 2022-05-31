package my.mobypay.ekyc.dao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExtFaceInfo {

	
	private String ekycResultFace;
	private Double faceScore;
	private String faceImg;
	private Double faceQuality;
	private String faceLivenessResult;
}
