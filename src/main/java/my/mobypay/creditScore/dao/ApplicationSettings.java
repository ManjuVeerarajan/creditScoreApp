package my.mobypay.creditScore.dao;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
@Entity
@Table(name = "application_settings")
@Data
public class ApplicationSettings {

	  @Id
	    @Column(name = "name")
	    private String name;
	    @Column(name = "value")
	    private String value;
	    @Column(name = "description")
	    private String description;
	    @Column(name = "deleted_at")
	    private Date deletedAt;
	    @Column(name = "created_at")
	    private Date createdAt;
	    @Column(name = "updated_at")
	    private Date updatedAt;
}

