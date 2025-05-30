package com.jpacourse.dto;

import java.time.LocalDate;
import java.util.List;

public class PatientTO {
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String telephoneNumber;
    private String patientNumber;
    private LocalDate dateOfBirth;
    private int age; // odwzorowanie nowego pola
    private List<VisitTO> visits;

    public PatientTO(Long id, String firstName, String lastName, String email,
                     String telephoneNumber, String patientNumber,
                     LocalDate dateOfBirth, int age, List<VisitTO> visits) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.telephoneNumber = telephoneNumber;
        this.patientNumber = patientNumber;
        this.dateOfBirth = dateOfBirth;
        this.age = age;
        this.visits = visits;
    }
    public Long getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getTelephoneNumber() {
        return telephoneNumber;
    }

    public String getPatientNumber() {
        return patientNumber;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public int getAge() {
        return age;
    }

    public List<VisitTO> getVisits() {
        return visits;
    }

}
