package my.mobypay.creditScore;

import com.zoloz.api.sdk.client.OpenApiClient;

import my.mobypay.creditScore.controller.CcrisController;

public class DBCheck {

	public static void main(String[] args) {
		CcrisController controller = new CcrisController();
		OpenApiClient openApiClient = new OpenApiClient();
		
		openApiClient = controller.setValuesToOpenApi();
	System.out.println("openApiClient " +openApiClient);
	}
	
	
	

}
