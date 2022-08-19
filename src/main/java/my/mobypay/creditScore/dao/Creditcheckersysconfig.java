package my.mobypay.creditScore.dao;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.springframework.data.redis.core.RedisHash;

import lombok.Data;

@Entity
@Table(name = "creditchecker_sysconfig")
@Data
public class Creditcheckersysconfig implements Serializable{

	private static final long serialVersionUID = 1L;
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
