package my.mobypay.creditScore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ApplicationSettingsRepository extends JpaRepository<ApplicationSettings, Integer >{

	// @Query("SELECT * from AWSS3Details ")
	// String findS3Details();
}
