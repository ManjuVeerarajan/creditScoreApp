package my.mobypay.creditScore.repository;

import my.mobypay.creditScore.dao.CustomerCreditReports;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface CustomerCreditReportsRepository extends JpaRepository<CustomerCreditReports, Integer> {
  @Query("SELECT p.nric from CustomerCreditReports p WHERE  p.nric= :nric")
  String findByName(@Param("nric") String paramString);
  
  @Query("SELECT p.name,p.nric from CustomerCreditReports p WHERE p.name = :name and p.nric= :nric")
  String find(@Param("name") String paramString1, @Param("nric") String paramString2);
  
  @Query("SELECT p.jsonString from CustomerCreditReports p WHERE p.nric= :nric")
  String findbynameandnric(@Param("nric") String paramString2);

  @Query("SELECT p.filepath from CustomerCreditReports p WHERE p.nric= :nric")
  String findbydownloadpath(@Param("nric") String regexexpression);
  
  @Query("SELECT p.xmlString from CustomerCreditReports p WHERE p.nric= :nric")
   String findbyXMLpath(@Param("nric") String regexexpression);

  @Query("SELECT p from CustomerCreditReports p WHERE p.nric= :nric")
  List<CustomerCreditReports> findbynrics(@Param("nric")  String nricnumber);
 
  @Query("SELECT p from CustomerCreditReports p WHERE p.nric= :nric")
CustomerCreditReports findbynric(@Param("nric")  String nricnumber);
  
  @Query("SELECT p.bankruptcyCount from CustomerCreditReports p WHERE p.nric= :nric")
Integer findbybankruptcyCount(@Param("nric")  String regexexpression);

  /*
  @Query("UPDATE CustomerCreditReports p set p.name = :name,p.nric= :nric,p.bankruptcyCount = :bankruptcyCount,p.createdAt = :createdAt,p.updatedAt =:updatedAt, p.bankingCreditApprovedAmount = :bankingCreditApprovedAmount, p.bankingCreditApprovedCount =:bankingCreditApprovedCount,"
  		+ "p.bankingCreditPendingAmount = :bankingCreditPendingAmount, p.iScoreGradeFormat = :iScoreGradeFormat, p.iScoreRiskGrade = :iScoreRiskGrade, p.legalActionBankingCount = :legalActionBankingCount, p.tradeBureauCount = :tradeBureauCount, p.XmlString = :XmlString, p.JsonString = :JsonString,"
  		+ "p.Filepath = :Filepath")
void updateTable(@Param("name")  String name,String nric, Integer bankruptcyCount, Date createdAt, Date updatedAt, Double bankingCreditApprovedAmount, Integer bankingCreditApprovedCount, Double bankingCreditPendingAmount,
		String iScoreGradeFormat, Integer iScoreRiskGrade, Integer legalActionBankingCount, Integer tradeBureauCount,String XmlString, String JsonString, String Filepath);
		*/
  @Modifying
  @Transactional
  @Query("UPDATE CustomerCreditReports p set p.name = :name,p.nric= :nric,p.bankruptcyCount = :bankruptcyCount,p.createdAt = :createdAt,p.updatedAt =:updatedAt, p.bankingCreditApprovedAmount = :bankingCreditApprovedAmount, p.bankingCreditApprovedCount =:bankingCreditApprovedCount, p.bankingCreditPendingAmount = :bankingCreditPendingAmount, p.iScoreGradeFormat = :iScoreGradeFormat, p.iScoreRiskGrade = :iScoreRiskGrade, p.legalActionBankingCount = :legalActionBankingCount, p.tradeBureauCount = :tradeBureauCount, p.xmlString = :xmlString, p.jsonString = :jsonString,p.filepath = :filepath,p.iScore = :iScore WHERE p.nric= :nric")
  void updateTable(@Param("name")  String name,@Param("nric") String nric,@Param("bankruptcyCount") Integer bankruptcyCount,@Param("createdAt") Date createdAt, 
		  @Param("updatedAt")   Date updatedAt, @Param("bankingCreditApprovedAmount") Double bankingCreditApprovedAmount, @Param("bankingCreditApprovedCount") Integer bankingCreditApprovedCount,
		  @Param("bankingCreditPendingAmount") Double bankingCreditPendingAmount,
		  @Param("iScoreGradeFormat") String iScoreGradeFormat,@Param("iScoreRiskGrade") Integer iScoreRiskGrade, @Param("legalActionBankingCount") Integer legalActionBankingCount,
		  @Param("tradeBureauCount") Integer tradeBureauCount, @Param("xmlString") String xmlString,@Param("jsonString") String jsonString,@Param("filepath") String filepath, @Param("iScore") Integer iScore);
	/*
	 * @Query("SELECT p.IScore from CustomerCreditReports p WHERE  p.nric= :nric")
	 * public int findIscore(@Param("nric") String nric);
	 */
	//public  String findByName(String name);
}
