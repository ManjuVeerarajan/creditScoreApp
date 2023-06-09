package my.mobypay.creditScore.dao;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "creditchecker_sysconfig")
@Data
public class Creditcheckersysconfig {

	@Id
	@Column(name = "name")
	private String name;
	@Column(name = "value",columnDefinition="varchar(2056)")
	private String value;
	@Column(name = "description")
	private String description;
	@Column(name = "createdAt")
	private Date createdAt;
	@Column(name = "updatedAt")
	private String updatedAt;
}
