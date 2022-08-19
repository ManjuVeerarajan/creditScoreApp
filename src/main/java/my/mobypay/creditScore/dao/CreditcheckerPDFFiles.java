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
@Table(name = "creditchecker_pdffiles")
@Data
public class CreditcheckerPDFFiles implements Serializable {
	private static final long serialVersionUID = 9876654321L;
	@Id
	@Column(name = "name")
	private String name;
	@Lob
	@Column(name = "value")
	private byte[] value;
	@Column(name = "description")
	private String description;
	@Column(name = "createdAt")
	private Date createdAt;
	@Column(name = "updatedAt")
	private String updatedAt;
}
