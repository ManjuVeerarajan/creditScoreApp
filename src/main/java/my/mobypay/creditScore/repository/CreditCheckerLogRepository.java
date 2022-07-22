package my.mobypay.creditScore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import my.mobypay.creditScore.dao.CreditCheckerLogs;


@Repository
public interface CreditCheckerLogRepository extends JpaRepository<CreditCheckerLogs, Integer > {
}