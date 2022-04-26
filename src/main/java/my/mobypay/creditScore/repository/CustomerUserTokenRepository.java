package my.mobypay.creditScore.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import my.mobypay.creditScore.dao.CustomerTokenRequest;
@Repository
public interface CustomerUserTokenRepository extends JpaRepository<CustomerTokenRequest, Integer>  {

	@Query("SELECT f.token1,f.token2 FROM CustomerTokenRequest f WHERE DATE(createdDate) = CURDATE() and f.nric= :nric")
	  String findTokenByNric(@Param("nric") String paramString);
}
