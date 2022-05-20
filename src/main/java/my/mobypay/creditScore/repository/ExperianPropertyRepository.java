package my.mobypay.creditScore.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import my.mobypay.creditScore.dao.ExperianPropertyResponse;

public interface ExperianPropertyRepository extends JpaRepository<ExperianPropertyResponse, Integer>  {

	@Query("SELECT p.Value from ExperianPropertyResponse p where p.Name IN (:Name)")
	List<String> findvalueandName(@Param("Name") List<String> string);
	
	@Query("SELECT p.Value from ExperianPropertyResponse p where p.Name IN (:Name)")
    String findemailIdbyName(@Param("Name") String string);

}
