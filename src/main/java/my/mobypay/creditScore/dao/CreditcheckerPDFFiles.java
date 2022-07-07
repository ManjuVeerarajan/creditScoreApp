package my.mobypay.creditScore.dao;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "creditchecker_pdffiles")
@Data
public class CreditcheckerPDFFiles {

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
