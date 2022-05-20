package my.mobypay.creditScore.dto;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;

import lombok.Data;

@Data
public class UserSearchRequest {

    private Integer clientId;
    private String name;
    private String entityId;
    private Double purchaseAmount;
    private String serviceName;
    private Date DOB;
    private String country;
    
    
  
  
}
