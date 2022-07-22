package my.mobypay.creditScore.repository;

import my.mobypay.creditScore.dao.ReportEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReportEntityRepository extends JpaRepository<ReportEntity, Integer > {
}
