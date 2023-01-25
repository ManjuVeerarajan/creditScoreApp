package my.mobypay.creditScore.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



import lombok.Data;

@Entity
@Table(name = "cc_customerCreditError")
@Data
public class CustomerCreditError {
	
	
	   @Id
	    @Column(name = "name")
	    private String Name;
	    @Column(name = "Nric")
	    private String nric;
	    @Column(name = "errorcode")
	    private String ErrorCode;
	    @Column(name = "errorstatus")
	    private String ErrorStatus;
	    @Column(name = "retrivalCount")
	    private int retrivalCount;
	    @Column(name = "CreatedAt")
	    private Date createdAt;
	    @Temporal(TemporalType.TIMESTAMP)
	    @Column(name = "UpdatedAt")
	    private Date updatedAt;
	    @Lob
	    @Column(name = "experianRequest")
	    private String experianRequest;

}
