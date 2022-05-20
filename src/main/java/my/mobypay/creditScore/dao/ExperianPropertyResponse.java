package my.mobypay.creditScore.dao;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import my.mobypay.creditScore.dto.CreditCheckError;
@Entity
@Table(name = "application_settings")
@Data
public class ExperianPropertyResponse {
	 @Id
	    @Column(name = "name")
	    private String Name;
	    @Column(name = "value")
	    private String Value;
	    @Column(name = "description")
	    private String Desc;
	    @Column(name = "deleted_at")
	    private String DeleteAt;
	    @Column(name = "created_at")
	    private String CreatedAt;
	    @Column(name = "updated_at")
	    private String UpdatedAt;
	    
	    
}
