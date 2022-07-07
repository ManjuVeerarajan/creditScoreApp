package my.mobypay.creditScore.dao;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "cc_tokensRequest")
@Data
public class TokensRequest {

	  @Id
	    @Column(name = "Name")
	    private String name;
	    @Column(name = "Nric")
	    private String nric;
	    @Column(name = "Token1")
	    private String token1;
	    @Column(name = "Token2")
	    private String token2;
	    @Column(name = "CreatedDate")
	    private Date createdDate;
	    @Column(name = "UpdatedDate")
	    private Date updatedDate;
}
