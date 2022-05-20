package my.mobypay.creditScore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository

public interface ApplicationSettingsRepository extends JpaRepository<ApplicationSettings, Integer >{

	@Query( value = "SELECT p.value from application_settings p where p.name = :name", nativeQuery = true)
	 String findValueFromName(@Param("name") String string);
}
