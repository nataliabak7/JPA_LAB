--Patient → Address (Jednostronna od strony "Patient")
ALTER TABLE PATIENT ADD COLUMN ADDRESS_ID INT;
ALTER TABLE PATIENT
    ADD CONSTRAINT FK_PATIENT_ADDRESS
        FOREIGN KEY (ADDRESS_ID)
            REFERENCES ADDRESS(ID)
            ON DELETE SET NULL;

--Doctor → Address (Jednostronna od strony "Doctor")
ALTER TABLE DOCTOR ADD COLUMN ADDRESS_ID INT;

ALTER TABLE DOCTOR
    ADD CONSTRAINT FK_DOCTOR_ADDRESS
        FOREIGN KEY (ADDRESS_ID)
            REFERENCES ADDRESS(ID)
            ON DELETE SET NULL;

--Visit → Doctor (Jednostronna od strony "Visit")
ALTER TABLE VISIT ADD COLUMN DOCTOR_ID INT;
ALTER TABLE VISIT
    ADD CONSTRAINT FK_VISIT_DOCTOR
        FOREIGN KEY (DOCTOR_ID)
            REFERENCES DOCTOR(ID)
            ON DELETE CASCADE;

--Visit → Patient (Jednostronna od strony "Visit")
ALTER TABLE VISIT ADD COLUMN PATIENT_ID INT;
ALTER TABLE VISIT
    ADD CONSTRAINT FK_VISIT_PATIENT
        FOREIGN KEY (PATIENT_ID)
            REFERENCES PATIENT(ID)
            ON DELETE CASCADE;

--Medical_Treatment → Visit (Jednostronna od strony "MedicalTreatment")
ALTER TABLE MEDICAL_TREATMENT ADD COLUMN VISIT_ID INT;
ALTER TABLE MEDICAL_TREATMENT
    ADD CONSTRAINT FK_MEDICAL_TREATMENT_VISIT
        FOREIGN KEY (VISIT_ID)
            REFERENCES VISIT(ID)
            ON DELETE CASCADE;

--Relacja między dwustronna pacjentem a lekarzem przez wizyty
ALTER TABLE PATIENT ADD COLUMN DOCTOR_ID INT;
ALTER TABLE PATIENT
    ADD CONSTRAINT FK_PATIENT_DOCTOR
        FOREIGN KEY (DOCTOR_ID)
            REFERENCES DOCTOR(ID)
            ON DELETE SET NULL;

ALTER TABLE DOCTOR ADD COLUMN PATIENT_ID INT;
ALTER TABLE DOCTOR
    ADD CONSTRAINT FK_DOCTOR_PATIENT
        FOREIGN KEY (PATIENT_ID)
            REFERENCES PATIENT(ID)
            ON DELETE SET NULL;





--dodanie adresów
INSERT INTO ADDRESS (ID, CITY, ADDRESS_LINE1, POSTAL_CODE)
VALUES
    (1, 'Warszawa', 'ul. Klonowa 12', '00-123'),
    (2, 'Kraków', 'ul. Dębowa 5', '30-456'),
    (3, 'Gdańsk', 'ul. Morska 8', '80-123'),
    (4, 'Wrocław', 'ul. Słoneczna 15', '50-789');

--dodanie pacjentów
INSERT INTO PATIENT (ID, FIRST_NAME, LAST_NAME, EMAIL, TELEPHONE_NUMBER, PATIENT_NUMBER, DATE_OF_BIRTH, ADDRESS_ID)
VALUES
    (1, 'Jan', 'Kowalski', 'jan.kowalski@email.com', '123456789', 'P001', '1980-05-12', 1),
    (2, 'Anna', 'Nowak', 'anna.nowak@email.com', '987654321', 'P002', '1992-11-23', 2),
    (3, 'Tomasz', 'Wiśniewski', 'tomasz.w@email.com', '555111222', 'P003', '1975-07-30', NULL);

--dodanie lekarzy

INSERT INTO DOCTOR (ID, FIRST_NAME, LAST_NAME, EMAIL, TELEPHONE_NUMBER, DOCTOR_NUMBER, SPECIALIZATION, ADDRESS_ID)
VALUES
    (1, 'Marek', 'Zieliński', 'marek.z@email.com', '444222111', 'D001', 'SURGEON', 3),
    (2, 'Ewa', 'Rogowska', 'ewa.r@email.com', '777888999', 'D002', 'DERMATOLOGIST', 4);

--dodanie wizyt
INSERT INTO VISIT (ID, TIME, DESCRIPTION, DOCTOR_ID, PATIENT_ID)
VALUES
    (1, '2025-03-20 10:00:00', 'EKG', 1, 1),
    (2, '2025-03-21 14:30:00', 'USG', 2, 2),
    (3, '2025-03-22 09:15:00', 'RTG', 1, 3);

--dodanie zabiegów
INSERT INTO MEDICAL_TREATMENT (ID, DESCRIPTION, TYPE)
VALUES
    (1, 'Badanie EKG wykonane podczas wizyty', 'EKG'),
    (2, 'Badanie USG wykonane podczas wizyty', 'USG'),
    (3, 'Badanie RTG wykonane podczas wizyty', 'RTG');
