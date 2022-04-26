package my.mobypay.creditScore.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import my.mobypay.creditScore.dao.CustomerCreditReports;
import my.mobypay.creditScore.dto.CreditCheckError;

@Repository
@Transactional 
public interface CreditCheckErrorRepository extends JpaRepository<CreditCheckError, Integer >  {

	
	 
	 
	@Query("SELECT DISTINCT  p.RetrivalCount from CreditCheckError p WHERE p.nric= :nric")
	Integer findbynric(@Param("nric") String nricnumber);
	
	/*
	 * @Query("SELECT p from CreditCheckError p WHERE p.nric= :nric")
	 * CreditCheckError findbyAll(@Param("nric") String nricnumber);
	 */
	
	

	@Modifying
   @Query("update CreditCheckError f set f.RetrivalCount= :RetrivalCount,f.updatedAt = :updatedAt  WHERE f.nric= :nric and f.ErrorCode= :ErrorCode")
    void updateRetivalCount(@Param("RetrivalCount") int retivalCount, @Param("nric") String nricnumber,@Param("updatedAt") Date updatedAt,@Param("ErrorCode") String ErrorCode);

	 @Query("SELECT p from CreditCheckError p WHERE p.nric= :nric and p.ErrorCode= :ErrorCode")
	CreditCheckError findbyErrorcode(@Param("nric")  String nricnumber,@Param("ErrorCode") String ErrorCode);

	//String updateRetivalCount(String valueOf);
	
	 
}
