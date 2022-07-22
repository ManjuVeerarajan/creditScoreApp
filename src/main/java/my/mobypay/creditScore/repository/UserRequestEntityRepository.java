package my.mobypay.creditScore.repository;

import my.mobypay.creditScore.dao.UserRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRequestEntityRepository extends JpaRepository<UserRequest, Integer > {
	
	
	  @Query("SELECT p.Name_id from UserRequest p WHERE p.Entity_id= :Entity_id")
	  String findbyUserRequestName(@Param("Entity_id") String regexexpression);
	  
	 
	 
}
