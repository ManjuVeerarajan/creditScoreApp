package my.mobypay.creditScore.dao;

import lombok.Builder;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "user_request")
@Data
public class UserRequest {

	   @Id
	    @Column(name = "entity_id")
	    private String Entity_id;
	    @Column(name = "client_id")
	    private Integer clientId;
	    @Column(name = "name_id")
	    private String Name_id;
	    @Column(name = "purchase_amount")
	    private Double purchaseAmount;
	    @Column(name = "created_date")
	    private Date createdDate;
	    @Column(name = "service_name")
	    private String servicename;
}
