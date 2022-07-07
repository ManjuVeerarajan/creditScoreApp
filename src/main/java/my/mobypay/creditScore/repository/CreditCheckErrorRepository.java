package my.mobypay.creditScore.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import my.mobypay.creditScore.dto.CustomerCreditError;

@Repository
@Transactional 
public interface CreditCheckErrorRepository extends JpaRepository<CustomerCreditError, Integer >  {

	
	 
	 
	@Query("SELECT DISTINCT p.retrivalCount from CustomerCreditError p WHERE p.nric= :nric")
	Integer findbynric(@Param("nric") String nricnumber);
	
	/*
	 * @Query("SELECT p from CreditCheckError p WHERE p.nric= :nric")
	 * CreditCheckError findbyAll(@Param("nric") String nricnumber);
	 */
	
	

	@Modifying
   @Query("update CustomerCreditError f set f.retrivalCount= :retrivalCount,f.updatedAt = :updatedAt  WHERE f.nric= :nric and f.ErrorCode= :ErrorCode")
    void updateRetivalCount(@Param("retrivalCount") int retivalCount, @Param("nric") String nricnumber,@Param("updatedAt") Date updatedAt,@Param("ErrorCode") String ErrorCode);

	 @Query("SELECT p from CustomerCreditError p WHERE p.nric= :nric and p.ErrorCode= :ErrorCode")
	 CustomerCreditError findbyErrorcode(@Param("nric")  String nricnumber,@Param("ErrorCode") String ErrorCode);

	//String updateRetivalCount(String valueOf);
	
	 
}
