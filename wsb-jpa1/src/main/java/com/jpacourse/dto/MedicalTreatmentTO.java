package com.jpacourse.dto;

public class MedicalTreatmentTO {
    private Long id;
    private String description;
    private String type;  // Zmieniony na String, bo typ w `MedicalTreatmentTO` powinien być tekstowy

    public MedicalTreatmentTO(Long id, String description, String type) {
        this.id = id;
        this.description = description;
        this.type = type;
    }

    // Gettery i Settery
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
