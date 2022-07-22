package my.mobypay.creditScore.dao;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "c_report_response")
@Data
public class ReportEntity {

    @Id
    @Column(name = "entity_id")
    private String entityId;
    @Column(name = "name_id")
    private String name;
    @Column(name = "is_registration_allowed")
    private Boolean isRegistrationAllowed;
    @Column(name = "is_nric_exist")
    private Boolean isNricExist;
    @Column(name = "is_name_nric_matched")
    private Boolean isNameNricMatched;
    @Column(name = "maximum_allowed_installments")
    private Integer maximumAllowedInstallments;
    @Column(name = "maximum_spending_limit")
    private Integer maximumSpendingLimit;
    @Column(name = "status_code")
    private Integer statusCode;
    @Column(name = "error_message")
    private String errorMessage;
    @Column(name = "created_date")
    private Date createdDate;
}
