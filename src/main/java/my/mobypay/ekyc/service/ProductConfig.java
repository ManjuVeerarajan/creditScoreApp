package my.mobypay.ekyc.service;

import lombok.Data;

@Data
public class ProductConfig {

	public String cropDocImage;
	public LandmarkCheck[] landmarkCheck;
	public LandmarkCheck[] hologramCheck;
	public LandmarkCheck[] pageInfoCheck;
	public String preciseTamperCheck;
}
