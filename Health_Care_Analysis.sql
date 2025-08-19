USE sql_assignment;

## Create a table for patients
CREATE TABLE patients (
patient_id INT PRIMARY KEY NOT NULL,
name VARCHAR(50) NOT NULL,
age INT NOT NULL,
gender VARCHAR(50) NOT NULL,
state VARCHAR(50) NOT NULL
);

## Create a table for doctors
CREATE TABLE doctors (
doctor_id INT PRIMARY KEY KEY NOT NULL,
name VARCHAR(50) NOT NULL,
speciality VARCHAR(50) NOT NULL,
state VARCHAR(50) NOT NULL
);

## Create table for appointments
CREATE TABLE appointments (
appointments_id INT PRIMARY KEY KEY NOT NULL,
patient_id INT NOT NULL,
FOREIGN KEY (patient_id) 
REFERENCES patients(patient_id),
doctor_id INT NOT NULL,
FOREIGN KEY (doctor_id) 
REFERENCES doctors(doctor_id),
date DATE NOT NULL,
status VARCHAR(50) NOT NULL
);

## Insert data into our patients table
INSERT INTO patients (patient_id, name, age, gender, state)
VALUES
(10001, 'Jonathan Aminu', 34, 'Male', 'Jigawa'),
(10110, 'Abubakar Sani', 45, 'Male', 'Kano'),
(10111, 'Kangyang Bot', 27, 'Female', 'Plateau'),
(11111, 'John Adamu', 35, 'Male', 'Fct Abuja'),
(12003, 'Kemi Adebayo', 57, 'Female', 'Ogun'),
(11320, 'Esther Ugo', 28, 'Female', 'Anambra'),
(34352, 'Agatha Umar', 37, 'Female', 'Bayelsa'),
(45789, 'Mike Udo', 45, 'Male', 'Akwa Ibom');

## Insert data into our doctors table
INSERT INTO doctors (doctor_id, name, speciality, state)
VALUES
(32011, 'Dr. John Olu', 'Cardiology', 'Nasarawa'),
(32013, 'Dr. Baker John', 'Neurology ', 'Cross River'),
(32014, 'Dr. Aminu Abdul', 'Orthopedics', 'Sokoto'),
(32015, 'Dr. Anita Chinedu', 'Dermatology', 'Abia'),
(32016, 'Dr. Esther Job', 'Ophtalmology', 'Ekiti');

## Insert data into our appointments table
INSERT INTO appointments (appointments_id, patient_id, doctor_id, date, status)
VALUES
(20101, 12003, 32013, '2024-12-10', 'Confirmed'),
(20102, 10111, 32013, '2024-11-30', 'Confirmed'), 
(20103, 34352, 32015, '2025-01-24', 'Pending'),
(20107, 11111, 32015, '2024-12-05', 'Confirmed'),
(20109, 12003, 32014, '2025-02-09', 'Pending'),   
(20106, 11320, 32011, '2025-01-06', 'Pending');   

## Write a query to find all the patients in the state “Fct Abuja”, ”Plateau”.
SELECT name, age, gender, state 
FROM patients
WHERE state = 'Fct Abuja' OR state = 'Plateau'
GROUP BY patient_id;

## Retrieve the total number of male and female patients.
SELECT gender, COUNT(*) AS total
FROM patients
GROUP BY gender;


## Write a query to list doctors and their specialties in state where confirmed appointments exist.
SELECT DISTINCT d.doctor_id, d.name, d.speciality, d.state
FROM appointments a
JOIN doctors d
ON a.doctor_id = d.doctor_id
WHERE a.status = 'Confirmed';








