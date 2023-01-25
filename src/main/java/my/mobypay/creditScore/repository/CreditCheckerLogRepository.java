package my.mobypay.creditScore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import my.mobypay.creditScore.dao.CreditCheckerLogs;


@Repository
public interface CreditCheckerLogRepository extends JpaRepository<CreditCheckerLogs, Integer > {
	
	 @Query("SELECT p from CreditCheckerLogs p WHERE p.nric= :nric")
	 List<CreditCheckerLogs> findbyNric(@Param("nric") String nric);
	
}