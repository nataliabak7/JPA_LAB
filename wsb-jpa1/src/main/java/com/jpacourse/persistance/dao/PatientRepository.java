package com.jpacourse.persistance.dao;

import com.jpacourse.persistance.entity.PatientEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PatientRepository extends JpaRepository<PatientEntity, Long> {
    @Query("SELECT p FROM PatientEntity p LEFT JOIN FETCH p.visits WHERE p.id = :id")
    Optional<PatientEntity> findByIdWithVisits(@Param("id") Long id);
}
