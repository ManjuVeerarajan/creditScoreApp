package my.mobypay.creditScore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import my.mobypay.creditScore.dto.CreditCheckError;

@Repository
public interface AWSS3Repository extends JpaRepository<AWSS3Details, Integer >{

	// @Query("SELECT * from AWSS3Details ")
	// String findS3Details();
}
