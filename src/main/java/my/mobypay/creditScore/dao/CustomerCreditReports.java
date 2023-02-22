package my.mobypay.creditScore.dao;

import lombok.Builder;
import lombok.Data;
import my.mobypay.creditScore.dto.response.Report;

import javax.persistence.*;

import java.sql.Blob;
import java.util.Date;

@Entity
@Table(name = "cc_customerCreditReports")
@Data
public class CustomerCreditReports {

    
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @Column(name = "Name")
    private String name;
    @Column(name = "Nric")
    private String nric;
    @Column(name = "BankruptcyCount")
    private Integer bankruptcyCount;
    @Column(name = "LegalSuitCount")
    private Integer legalSuitCount;
    @Column(name = "TradeBureauCount")
    private Integer tradeBureauCount;
    @Column(name = "IScore")
    private Integer iScore;
    @Column(name = "IScoreRiskGrade")
    private Integer iScoreRiskGrade;
    @Column(name = "IScoreGradeFormat")
    private String iScoreGradeFormat;
    @Column(name = "BorrowerOutstanding")
    private Double borrowerOutstanding;
    @Column(name = "LegalActionBankingCount")
    private Integer legalActionBankingCount;
    @Column(name = "BankingCreditApprovedCount")
    private Integer bankingCreditApprovedCount;
    @Column(name = "BankingCreditApprovedAmount")
    private Double bankingCreditApprovedAmount;
    @Column(name = "BankingCreditPendingCount")
    private Integer bankingCreditPendingCount;
    @Column(name = "BankingCreditPendingAmount")
    private Double bankingCreditPendingAmount;
    @Lob
    @Column(name = "XmlString")
    private String xmlString;
    @Lob
    @Column(name = "JsonString")
    private String jsonString;
    @Column(name = "CreatedAt")
    private Date createdAt;
    @Column(name = "UpdatedAt")
    private Date updatedAt;
    @Column(name = "CustomerId")
    private Integer customerId;
    @Column(name = "FilePath")
    private String filepath;
    @Column(name = "pdfBlob")
    private Blob pdfBlob;
    @Lob
    @Column(name = "base64_pdf")
    private String base64_pdf;
    @Lob
    @Column(name = "experianRequest")
    private String experianRequest;
}
