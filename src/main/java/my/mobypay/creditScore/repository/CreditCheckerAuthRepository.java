package my.mobypay.creditScore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import my.mobypay.creditScore.dao.CreditCheckerAuthDao;


@Repository
public interface CreditCheckerAuthRepository extends JpaRepository<CreditCheckerAuthDao, Integer >{

	@Query( value = "SELECT p.client_name from creditchecker_auth p where p.api_key = :api_key", nativeQuery = true)
	 String findClientNameFromKey(@Param("api_key") String string);
}