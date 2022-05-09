package my.mobypay.ekyc.dao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class InitializeRequest {

	private String bizId;
	private String metaInfo;
	private String flowType;
	private String docType;
	private String userId;
	private String sceneCode;
	private String serviceLevel;
	private String operationMode;
	private Object pageConfig;
	private Object h5ModeConfig;
	private Integer clientType;
}
