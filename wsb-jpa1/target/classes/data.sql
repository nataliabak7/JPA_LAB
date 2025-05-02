-- Wstawianie adresów
INSERT INTO ADDRESS (id, city, address_line1, address_line2, postal_code) VALUES
(1, 'Warszawa', 'Marszałkowska 1', NULL, '00-001'),
(2, 'Kraków', 'Floriańska 15', NULL, '31-001'),
(3, 'Wrocław', 'Rynek 5', 'Mieszkanie 2', '50-001'),
(4, 'Gdańsk', 'Długa 20', NULL, '80-001');

-- Wstawianie lekarzy
INSERT INTO DOCTOR (id, first_name, last_name, email, telephone_number, doctor_number, specialization, address_id) VALUES
(1, 'Jan', 'Kowalski', 'jan.kowalski@example.com', '123456789', 'D001', 'GP', 1),
(2, 'Anna', 'Nowak', 'anna.nowak@example.com', '987654321', 'D002', 'SURGEON', 2),
(3, 'Piotr', 'Wiśniewski', 'piotr.wisniewski@example.com', '111222333', 'D003', 'OCULIST', 3),
(4, 'Maria', 'Lewandowska', 'maria.lewandowska@example.com', '444555666', 'D004', 'DERMATOLOGIST', 4);

-- Wstawianie pacjentów (z dodatkowym polem registration_date)
INSERT INTO PATIENT (id, first_name, last_name, email, telephone_number, patient_number, date_of_birth, address_id, age, registration_date) VALUES
(1, 'Adam', 'Jankowski', 'adam.jankowski@example.com', '600700800', 'P001', '1985-03-15', 1, 39, '2023-12-15'),
(2, 'Ewa', 'Kaczmarek', 'ewa.kaczmarek@example.com', '700800900', 'P002', '1992-07-22', 2, 32, '2024-01-20'),
(3, 'Tomasz', 'Lis', 'tomasz.lis@example.com', '800900000', 'P003', '1978-11-05', 3, 25, '2025-02-05'),
(4, 'Karolina', 'Zawadzka', 'karolina.zawadzka@example.com', '900000111', 'P004', '2000-01-30', 4, 41, '2025-03-10');


-- Wstawianie wizyt
INSERT INTO VISIT (id, doctor_id, patient_id, time, description) VALUES
(1, 1, 1, '2025-03-29 10:00:00', 'Konsultacja chirurgiczna przed operacją wyrostka robaczkowego'),
(2, 2, 2, '2025-03-30 14:30:00', 'Wizyta kontrolna u lekarza rodzinnego – badanie ogólne'),
(3, 3, 3, '2025-04-02 09:00:00', 'Badanie dermatologiczne – ocena zmian skórnych'),
(4, 4, 4, '2025-04-05 16:45:00', 'Badanie okulistyczne – ocena ostrości wzroku i ciśnienia śródgałkowego'),
(5, 1, 1, '2025-04-10 10:30:00', 'Kontrolna wizyta po operacji wyrostka'),
(6, 1, 1, '2025-04-20 09:15:00', 'Dalsze badania kontrolne – wyniki EKG'),
(7, 2, 2, '2025-04-25 11:00:00', 'Dalsze badanie po rentgenie'),
(8, 2, 2, '2025-04-30 13:00:00', 'Wizyta kontrolna – plan leczenia');

-- Wstawianie medical_treatment
INSERT INTO MEDICAL_TREATMENT (id, visit_id, description, type) VALUES
(1, 1, 'Elektrokardiografia (EKG) w celu oceny pracy serca', 'EKG'),
(2, 2, 'Rentgen klatki piersiowej po operacji', 'RTG'),
(3, 3, 'Ultrasonografia oka w celu wykrycia schorzeń siatkówki', 'USG'),
(4, 4, 'Kontrolne EKG dla pacjenta dermatologicznego', 'EKG'),
(5, 5, 'Badanie krwi kontrolne', 'EKG'),
(6, 6, 'Tomografia komputerowa jamy brzusznej', 'RTG'),
(7, 7, 'RTG ponowne', 'RTG'),
(8, 8, 'Konsultacja specjalistyczna', 'USG');
