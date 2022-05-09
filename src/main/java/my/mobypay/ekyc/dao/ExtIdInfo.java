package my.mobypay.ekyc.dao;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExtIdInfo {

	private String ekycResultDoc;
	private Integer docEdition;
	private String frontPageImg;
	private String backPageImg;
	private Map ocrResult;
	private Map spoofResult;
	private Map securityFeaturesResult;
	private String docErrorDetails;
	
}
