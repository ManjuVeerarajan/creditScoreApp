package my.mobypay.creditScore.dao;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;



@Entity
@Table(name = "AWSS3Details")
@Data
public class AWSS3Details {
	
	   @Id
	    @Column(name = "name")
	    private String name;
	    @Column(name = "value")
	    private String value;
}