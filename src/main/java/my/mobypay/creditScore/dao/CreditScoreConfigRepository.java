package my.mobypay.creditScore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import my.mobypay.creditScore.dao.Creditcheckersysconfig;

@Repository

public interface CreditScoreConfigRepository extends JpaRepository<Creditcheckersysconfig, Integer >{

	@Query( value = "SELECT p.value from creditchecker_sysconfig p where p.name = :name", nativeQuery = true)
	 String findValueFromName(@Param("name") String string);
}
