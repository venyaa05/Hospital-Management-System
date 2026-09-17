DROP DATABASE IF EXISTS hospital_management;
CREATE DATABASE hospital_management;
USE hospital_management;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100), dob DATE, gender VARCHAR(10),
    phone_number VARCHAR(15), email VARCHAR(100),
    address VARCHAR(150), registration_date DATE
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100), specialization VARCHAR(50),
    phone_number VARCHAR(15), email VARCHAR(100),
    available_days VARCHAR(100),
    consultation_fee DECIMAL(10,2), experience_years INT
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT, doctor_id INT, appointment_date DATETIME,
    status ENUM('Scheduled','Completed','Cancelled'),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT, doctor_id INT, diagnosis VARCHAR(150),
    prescription VARCHAR(150), treatment_date DATE,
    admission_date DATE, discharge_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Billing (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT, appointment_id INT, amount DECIMAL(10,2),
    payment_status ENUM('Paid','Pending','Cancelled'),
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50)
);

CREATE TABLE Doctor_Department (
    doctor_id INT, department_id INT,
    PRIMARY KEY (doctor_id,department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Patients
(name,dob,gender,phone_number,email,address,registration_date) VALUES
('Aarav Patel','2000-05-15','Male','9876543210','aarav@gmail.com','Vadodara','2025-01-10'),
('Diya Shah','2002-08-20','Female','9876543211','diya@gmail.com','Surat','2025-05-15'),
('Rohan Mehta','1998-03-12','Male',NULL,'rohan@gmail.com','Ahmedabad','2026-01-20'),
('Ananya Desai','2001-11-25','Female','9876543213','ananya@gmail.com','Vadodara','2026-02-05'),
('Vivaan Joshi','1995-07-18','Male','9876543214','vivaan@gmail.com','Surat','2026-03-12');

INSERT INTO Doctors
(name,specialization,phone_number,email,available_days,consultation_fee,experience_years) VALUES
('Dr. Rajesh Kumar','Cardiology','9000000001','rajesh@hospital.com','Mon,Wed,Fri',1500,18),
('Dr. Neha Sharma','Neurology','9000000002','neha@hospital.com','Tue,Thu,Sat',1800,12),
('Dr. Amit Shah','Dermatology','9000000003','amit@hospital.com','Mon,Tue,Fri',1200,7),
('Dr. Priya Patel','Pediatrics','9000000004','priya@hospital.com','Mon,Wed',1000,4),
('Dr. Karan Mehta','Orthopedics','9000000005','karan@hospital.com','Tue,Thu',1400,16);

INSERT INTO Departments(department_name) VALUES
('Cardiology'),('Neurology'),('Dermatology'),('Pediatrics'),('Orthopedics');

INSERT INTO Doctor_Department VALUES
(1,1),(2,2),(3,3),(4,4),(5,5);

INSERT INTO Appointments
(patient_id,doctor_id,appointment_date,status) VALUES
(1,1,'2026-01-10 10:00:00','Completed'),
(2,2,'2026-01-15 11:00:00','Completed'),
(3,3,'2026-02-05 12:00:00','Scheduled'),
(4,4,'2026-02-10 09:30:00','Completed'),
(5,5,'2026-03-12 14:00:00','Cancelled'),
(1,3,'2026-03-15 10:00:00','Completed');

INSERT INTO Medical_Records
(patient_id,doctor_id,diagnosis,prescription,treatment_date,admission_date,discharge_date) VALUES
(1,1,'Hypertension','Amlodipine','2026-01-10','2026-01-10','2026-01-12'),
(2,2,'Migraine','Tablet','2026-01-15','2026-01-15','2026-01-16'),
(3,3,'Acne','Cream','2026-02-05','2026-02-05','2026-02-07'),
(4,4,'Fever','Paracetamol','2026-02-10','2026-02-10','2026-02-11'),
(1,3,'Skin Infection','Antibiotic','2026-03-15','2026-03-15','2026-03-18');

INSERT INTO Billing
(patient_id,appointment_id,amount,payment_status,payment_date) VALUES
(1,1,1500,'Paid','2026-01-10'),
(2,2,1800,'Paid','2026-01-15'),
(3,3,1200,'Pending',NULL),
(4,4,1000,'Paid','2026-02-10'),
(5,5,1400,'Cancelled',NULL),
(1,6,1200,'Paid','2026-03-15');

INSERT INTO Patients
(name,dob,gender,address,registration_date)
VALUES ('Test Patient','2000-01-01','Female','Surat',CURDATE());

UPDATE Patients SET address='Ahmedabad' WHERE patient_id=6;
SELECT * FROM Patients;
DELETE FROM Patients WHERE patient_id=6;

SELECT * FROM Patients
WHERE registration_date >= DATE_SUB(CURDATE(),INTERVAL 1 YEAR);

SELECT p.name,SUM(b.amount) total_paid
FROM Patients p JOIN Billing b ON p.patient_id=b.patient_id
WHERE b.payment_status='Paid'
GROUP BY p.patient_id,p.name
HAVING SUM(b.amount)>1000
ORDER BY total_paid DESC LIMIT 5;


SELECT * FROM Appointments
WHERE status='Scheduled' AND doctor_id=3;

SELECT * FROM Doctors
WHERE specialization='Cardiology' OR specialization='Neurology';

SELECT * FROM Patients
WHERE NOT EXISTS
(SELECT 1 FROM Appointments a WHERE a.patient_id=Patients.patient_id);

SELECT * FROM Doctors ORDER BY specialization;

SELECT d.name,COUNT(a.patient_id) patient_count
FROM Doctors d LEFT JOIN Appointments a ON d.doctor_id=a.doctor_id
GROUP BY d.doctor_id,d.name;

SELECT dept.department_name,SUM(b.amount) revenue
FROM Departments dept
JOIN Doctor_Department dd ON dept.department_id=dd.department_id
JOIN Appointments a ON dd.doctor_id=a.doctor_id
JOIN Billing b ON a.appointment_id=b.appointment_id
WHERE b.payment_status='Paid'
GROUP BY dept.department_id;

SELECT SUM(amount) total_revenue,
       AVG(amount) average_bill,
       MAX(amount) maximum_bill,
       MIN(amount) minimum_bill,
       COUNT(*) total_bills
FROM Billing WHERE payment_status='Paid';

SELECT d.name,COUNT(a.appointment_id) visits
FROM Doctors d JOIN Appointments a ON d.doctor_id=a.doctor_id
GROUP BY d.doctor_id,d.name ORDER BY visits DESC LIMIT 1;

SELECT AVG(consultation_fee) average_consultation_fee FROM Doctors;

-- INNER JOIN
SELECT d.name,dept.department_name
FROM Doctors d
INNER JOIN Doctor_Department dd ON d.doctor_id=dd.doctor_id
INNER JOIN Departments dept ON dd.department_id=dept.department_id;

-- LEFT JOIN
SELECT p.name,a.appointment_id,a.status
FROM Patients p LEFT JOIN Appointments a
ON p.patient_id=a.patient_id;

-- RIGHT JOIN: appointments without payment
SELECT a.appointment_id,b.invoice_id,b.payment_status
FROM Billing b RIGHT JOIN Appointments a
ON b.appointment_id=a.appointment_id
WHERE b.invoice_id IS NULL;

-- FULL OUTER JOIN simulation in MySQL
SELECT p.patient_id,p.name,a.appointment_id
FROM Patients p LEFT JOIN Appointments a
ON p.patient_id=a.patient_id
UNION
SELECT p.patient_id,p.name,a.appointment_id
FROM Patients p RIGHT JOIN Appointments a
ON p.patient_id=a.patient_id;

SELECT * FROM Doctors
WHERE doctor_id IN
(SELECT doctor_id FROM Appointments
 GROUP BY doctor_id HAVING COUNT(DISTINCT patient_id)>50);

SELECT p.name,SUM(b.amount) total_spent
FROM Patients p JOIN Billing b ON p.patient_id=b.patient_id
WHERE b.payment_status='Paid'
GROUP BY p.patient_id,p.name
ORDER BY total_spent DESC LIMIT 1;

SELECT * FROM Appointments
WHERE doctor_id IN
(SELECT doctor_id FROM Doctors WHERE specialization='Dermatology');

SELECT MONTH(appointment_date) month,COUNT(*) visits
FROM Appointments GROUP BY MONTH(appointment_date);

SELECT record_id,
DATEDIFF(discharge_date,admission_date) hospital_stay_days
FROM Medical_Records;

SELECT record_id,DATE_FORMAT(treatment_date,'%d-%m-%Y') formatted_date
FROM Medical_Records;

SELECT UPPER(name) AS patient_name FROM Patients;

SELECT TRIM(name) AS doctor_name FROM Doctors;

SELECT name,COALESCE(phone_number,'Not Available') phone
FROM Doctors;

SELECT d.name,COUNT(a.patient_id) patients_treated,
RANK() OVER(ORDER BY COUNT(a.patient_id) DESC) doctor_rank
FROM Doctors d LEFT JOIN Appointments a
ON d.doctor_id=a.doctor_id
GROUP BY d.doctor_id,d.name;

SELECT payment_date,amount,
SUM(amount) OVER(ORDER BY payment_date) cumulative_revenue
FROM Billing WHERE payment_status='Paid';

SELECT appointment_id,appointment_date,
COUNT(*) OVER(ORDER BY appointment_date) running_appointments
FROM Appointments;

SELECT p.name,COUNT(m.record_id) records,
CASE
WHEN COUNT(m.record_id)>5 THEN 'High'
WHEN COUNT(m.record_id) BETWEEN 3 AND 5 THEN 'Medium'
ELSE 'Low'
END AS Patient_Risk_Level
FROM Patients p LEFT JOIN Medical_Records m
ON p.patient_id=m.patient_id
GROUP BY p.patient_id,p.name;

SELECT name,experience_years,
CASE
WHEN experience_years>15 THEN 'Senior'
WHEN experience_years BETWEEN 5 AND 15 THEN 'Mid-Level'
ELSE 'Junior'
END AS doctor_category
FROM Doctors;