package com.jpacourse.service;
import com.jpacourse.dto.PatientTO;
import com.jpacourse.dto.VisitTO;
import com.jpacourse.persistance.dao.DoctorRepository;
import com.jpacourse.persistance.dao.PatientRepository;
import com.jpacourse.persistance.dao.VisitRepository;
import com.jpacourse.persistance.entity.PatientEntity;
import com.jpacourse.persistance.entity.VisitEntity;
import com.jpacourse.persistance.entity.DoctorEntity;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
public class PatientServiceTest {
    @Autowired
    private PatientService patientService;

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private VisitRepository visitRepository;

    @Autowired
    private DoctorRepository doctorRepository;

    // Test: Usunięcie pacjenta powoduje usunięcie jego wizyt, ale nie usuwa doktorów
    @Test
    @Transactional
    public void testShouldDeletePatientAndCascadeDeleteVisitsButKeepDoctors() {
        // given
        PatientEntity patient = patientRepository.findAll().stream()
                .filter(p -> !p.getVisits().isEmpty())
                .findFirst()
                .orElseThrow(() -> new IllegalStateException("Brak pacjentów z wizytami w bazie!"));

        Long patientId = patient.getId();
        List<VisitEntity> visitsBefore = visitRepository.findAll();
        List<DoctorEntity> doctorsBefore = doctorRepository.findAll();

        int visitsForPatient = patient.getVisits().size();

        // when
        patientRepository.deleteById(patientId);

        // then
        Optional<PatientEntity> deletedPatient = patientRepository.findById(patientId);
        assertThat(deletedPatient).isEmpty();

        List<VisitEntity> visitsAfter = visitRepository.findAll();
        assertThat(visitsAfter.size()).isEqualTo(visitsBefore.size() - visitsForPatient);

        List<DoctorEntity> doctorsAfter = doctorRepository.findAll();
        assertThat(doctorsAfter.size()).isEqualTo(doctorsBefore.size());
    }
    @Test
    public void shouldReturnPatientWithVisitsAndDetails() {
        // given
        Long patientId = 11L;

        // when
        PatientTO patient = patientService.getPatientById(patientId);

        // then
        assertThat(patient).isNotNull();
        assertThat(patient.getId()).isEqualTo(patientId);
        assertThat(patient.getDateOfBirth()).isEqualTo(LocalDate.of(1990, 5, 10));

        List<VisitTO> visits = patient.getVisits();
        assertThat(visits).isNotEmpty();

        VisitTO visit = visits.get(0);
        assertThat(visit.getDate()).isNotNull();
        assertThat(visit.getDoctorFirstName()).isNotBlank();
        assertThat(visit.getDoctorLastName()).isNotBlank();

        assertThat(visit.getTreatments()).isNotNull();
        assertThat(visit.getTreatments().size()).isGreaterThan(0);
        assertThat(visit.getTreatments().get(0).getType()).isNotBlank();
    }
}
