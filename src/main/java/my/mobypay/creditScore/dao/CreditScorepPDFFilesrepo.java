package my.mobypay.creditScore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository

public interface CreditScorepPDFFilesrepo extends JpaRepository<CreditcheckerPDFFiles, Integer >{

	CreditcheckerPDFFiles findByName(String name);
	
}
