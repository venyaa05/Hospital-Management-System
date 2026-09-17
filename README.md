<div align="center">

<!-- ========================================================= -->
<!--                    ANIMATED WHITE HEADER                  -->
<!-- ========================================================= -->

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:FFFFFF,50:F1F5F9,100:CBD5E1&height=300&section=header&text=HOSPITAL%20MANAGEMENT&fontSize=55&fontColor=111827&fontAlignY=40&desc=SQL%20%E2%80%A2%20Database%20Design%20%E2%80%A2%20Healthcare%20Data%20Analysis&descSize=19&descAlignY=62&animation=twinkling" width="100%">

<br>

# 🏥 HOSPITAL MANAGEMENT SYSTEM

### SQL • Database Management • Healthcare Data Analysis

<br>

<img src="https://img.shields.io/badge/MYSQL-FFFFFF?style=for-the-badge&logo=mysql&logoColor=111827">
<img src="https://img.shields.io/badge/SQL-F8FAFC?style=for-the-badge&logo=databricks&logoColor=111827">
<img src="https://img.shields.io/badge/DATABASE-E2E8F0?style=for-the-badge">
<img src="https://img.shields.io/badge/DATA%20ANALYSIS-CBD5E1?style=for-the-badge">

<br>

<img src="https://img.shields.io/badge/JOINS-FFFFFF?style=for-the-badge&labelColor=111827">
<img src="https://img.shields.io/badge/SUBQUERIES-FFFFFF?style=for-the-badge&labelColor=111827">
<img src="https://img.shields.io/badge/WINDOW%20FUNCTIONS-FFFFFF?style=for-the-badge&labelColor=111827">
<img src="https://img.shields.io/badge/CASE%20ANALYSIS-FFFFFF?style=for-the-badge&labelColor=111827">

<br><br>

<img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=700&size=21&duration=2800&pause=700&color=111827&center=true&vCenter=true&width=850&lines=Manage+Hospital+Data;Analyze+Patients+and+Doctors;Track+Appointments;Analyze+Billing+Data;Use+Advanced+SQL;Turn+Data+Into+Insights" alt="Typing Animation">

</div>

---

# ✨ Project Overview

**Hospital Management System** is a MySQL database project designed to manage and analyze structured hospital information.

The database is named `hospital_management` and contains multiple connected tables covering:

- 🧑‍⚕️ Patients
- 👨‍⚕️ Doctors
- 📅 Appointments
- 🏥 Medical Records
- 💳 Billing
- 🏢 Departments
- 🔗 Doctor-Department relationships

The project demonstrates SQL operations including:

- 🏗️ Database creation
- 📝 Table creation
- ➕ Data insertion
- ✏️ Data updates
- 🗑️ Data deletion
- 🔎 Data filtering
- 📊 Aggregation
- 🔗 Joins
- 🔍 Subqueries
- 📅 Date functions
- 📈 Window functions
- 🏷️ Conditional logic
- 🔤 String functions

---

# 🧠 Database at a Glance

| Component | Details |
|---|---|
| 🗄️ Database | `hospital_management` |
| 🧑‍⚕️ Patients | Patient information and registration |
| 👨‍⚕️ Doctors | Doctor profiles and specializations |
| 📅 Appointments | Patient-doctor appointments |
| 🏥 Medical Records | Diagnoses and treatments |
| 💳 Billing | Billing and payment information |
| 🏢 Departments | Hospital departments |
| 🔗 Doctor Department | Doctor-department mapping |
| 🔑 Primary Keys | Auto-increment IDs |
| 🔗 Foreign Keys | Relationships between tables |
| 📊 Analysis | Aggregations, joins and window functions |

---

# 🏗️ Database Architecture

```text
                       🏥 HOSPITAL MANAGEMENT
                                │
          ┌─────────────────────┼─────────────────────┐
          │                     │                     │
          ▼                     ▼                     ▼
   ┌──────────────┐      ┌──────────────┐      ┌──────────────┐
   │ 🧑‍⚕️ PATIENTS │      │ 👨‍⚕️ DOCTORS │      │ 🏢 DEPARTMENTS│
   └──────┬───────┘      └──────┬───────┘      └──────┬───────┘
          │                     │                     │
          │                     │                     │
          ▼                     ▼                     ▼
   ┌──────────────┐      ┌──────────────┐      ┌─────────────────┐
   │ 📅 APPOINTMENTS│◀────│ DOCTOR_DEPT  │─────▶│ DEPARTMENTS     │
   └──────┬───────┘      └──────────────┘      └─────────────────┘
          │
          ├──────────────────┐
          ▼                  ▼
   ┌──────────────┐   ┌──────────────┐
   │ 🏥 MEDICAL   │   │ 💳 BILLING   │
   │   RECORDS    │   │              │
   └──────────────┘   └──────────────┘
```

---

# 🔗 Table Relationships

| Parent | Relationship | Child |
|---|---|---|
| 🧑‍⚕️ Patients | `patient_id` | Appointments |
| 👨‍⚕️ Doctors | `doctor_id` | Appointments |
| 🧑‍⚕️ Patients | `patient_id` | Medical Records |
| 👨‍⚕️ Doctors | `doctor_id` | Medical Records |
| 🧑‍⚕️ Patients | `patient_id` | Billing |
| 📅 Appointments | `appointment_id` | Billing |
| 👨‍⚕️ Doctors | `doctor_id` | Doctor_Department |
| 🏢 Departments | `department_id` | Doctor_Department |

The SQL defines these tables and their primary/foreign-key relationships. :contentReference[oaicite:0]{index=0} :contentReference[oaicite:1]{index=1} :contentReference[oaicite:2]{index=2} :contentReference[oaicite:3]{index=3} :contentReference[oaicite:4]{index=4}

---

# 🧑‍⚕️ Patients

## 📋 Table Structure

| Column | Data Type | Key |
|---|---|---|
| `patient_id` | INT | 🔑 PRIMARY KEY |
| `name` | VARCHAR(100) | — |
| `dob` | DATE | — |
| `gender` | VARCHAR(10) | — |
| `phone_number` | VARCHAR(15) | — |
| `email` | VARCHAR(100) | — |
| `address` | VARCHAR(150) | — |
| `registration_date` | DATE | — |

The `Patients` table uses `patient_id` as its primary key. :contentReference[oaicite:5]{index=5}

## 👥 Patient Records

The SQL inserts patient records containing names, dates of birth, gender, phone numbers, email addresses, addresses and registration dates. :contentReference[oaicite:6]{index=6}

```sql
SELECT * FROM Patients;
```

### 📸 Screenshot 1 — Patient Records

<img src="./assets/patient-records.png" alt="Patient Records" width="95%">

---

# 💳 Patient Billing Analysis

The project calculates the total amount paid by patients and filters the results using `HAVING`.

```sql
SELECT p.name,
       SUM(b.amount) total_paid
FROM Patients p
JOIN Billing b
ON p.patient_id=b.patient_id
WHERE b.payment_status='Paid'
GROUP BY p.patient_id,p.name
HAVING SUM(b.amount)>1000
ORDER BY total_paid DESC
LIMIT 5;
```

:contentReference[oaicite:7]{index=7}

### 📸 Screenshot 2 — Patient Total Paid

<img src="./assets/patient-total-paid.png" alt="Patient Total Paid" width="70%">

---

# 👨‍⚕️ Doctors

## 📋 Table Structure

| Column | Data Type | Key |
|---|---|---|
| `doctor_id` | INT | 🔑 PRIMARY KEY |
| `name` | VARCHAR(100) | — |
| `specialization` | VARCHAR(50) | — |
| `phone_number` | VARCHAR(15) | — |
| `email` | VARCHAR(100) | — |
| `available_days` | VARCHAR(100) | — |
| `consultation_fee` | DECIMAL(10,2) | — |
| `experience_years` | INT | — |

The `Doctors` table stores doctor information including specialization, availability, consultation fees and experience. :contentReference[oaicite:0]{index=0}

## 👨‍⚕️ Doctor Records

```sql
SELECT * FROM Doctors;
```

### 📸 Screenshot 3 — Doctor Records

<img src="./assets/doctor-records.png" alt="Doctor Records" width="95%">

---

# 📅 Appointments

## 📋 Table Structure

| Column | Data Type | Key |
|---|---|---|
| `appointment_id` | INT | 🔑 PRIMARY KEY |
| `patient_id` | INT | 🔗 FOREIGN KEY |
| `doctor_id` | INT | 🔗 FOREIGN KEY |
| `appointment_date` | DATETIME | — |
| `status` | ENUM | — |

The appointment status is defined as `Scheduled`, `Completed`, or `Cancelled`. :contentReference[oaicite:1]{index=1}

## 🔎 Scheduled Dermatology Appointments

```sql
SELECT *
FROM Appointments
WHERE status='Scheduled'
AND doctor_id=3;
```

:contentReference[oaicite:2]{index=2}

---

# 📊 Doctor Patient Count

This query uses a `LEFT JOIN` and `COUNT()` to determine the number of appointment records associated with each doctor.

```sql
SELECT d.name,
       COUNT(a.patient_id) patient_count
FROM Doctors d
LEFT JOIN Appointments a
ON d.doctor_id=a.doctor_id
GROUP BY d.doctor_id,d.name;
```

:contentReference[oaicite:3]{index=3}

### 📸 Screenshot 4 — Doctor Patient Count

<img src="./assets/doctor-patient-count.png" alt="Doctor Patient Count" width="80%">

---

# 🏢 Department Revenue

The project calculates paid revenue for each department by connecting departments, doctors, appointments and billing records.

```sql
SELECT dept.department_name,
       SUM(b.amount) revenue
FROM Departments dept
JOIN Doctor_Department dd
ON dept.department_id=dd.department_id
JOIN Appointments a
ON dd.doctor_id=a.doctor_id
JOIN Billing b
ON a.appointment_id=b.appointment_id
WHERE b.payment_status='Paid'
GROUP BY dept.department_id;
```

:contentReference[oaicite:4]{index=4}

### 📸 Screenshot 5 — Department Revenue

<img src="./assets/department-revenue.png" alt="Department Revenue" width="75%">

---

# 💰 Billing Analysis

The database can calculate overall revenue statistics for paid bills.

```sql
SELECT SUM(amount) total_revenue,
       AVG(amount) average_bill,
       MAX(amount) maximum_bill,
       MIN(amount) minimum_bill,
       COUNT(*) total_bills
FROM Billing
WHERE payment_status='Paid';
```

:contentReference[oaicite:5]{index=5}

---

# 📅 Appointment Analysis

## 📊 Monthly Visits

```sql
SELECT MONTH(appointment_date) month,
       COUNT(*) visits
FROM Appointments
GROUP BY MONTH(appointment_date);
```

:contentReference[oaicite:6]{index=6}

## 🏆 Doctor With Most Visits

```sql
SELECT d.name,
       COUNT(a.appointment_id) visits
FROM Doctors d
JOIN Appointments a
ON d.doctor_id=a.doctor_id
GROUP BY d.doctor_id,d.name
ORDER BY visits DESC
LIMIT 1;
```

:contentReference[oaicite:7]{index=7}

---

# 🔗 Doctor & Department JOIN

The `Doctor_Department` table connects doctors with their corresponding hospital departments.

```sql
SELECT d.name,
       dept.department_name
FROM Doctors d
INNER JOIN Doctor_Department dd
ON d.doctor_id=dd.doctor_id
INNER JOIN Departments dept
ON dd.department_id=dept.department_id;
```

### 📸 Screenshot 6 — Doctor Department JOIN

<img src="./assets/doctor-department.png" alt="Doctor Department Join" width="80%">

---

# 🔄 JOIN Operations

The project demonstrates different SQL JOIN techniques for combining related hospital data.

## 1️⃣ INNER JOIN

```sql
SELECT d.name,
       dept.department_name
FROM Doctors d
INNER JOIN Doctor_Department dd
ON d.doctor_id=dd.doctor_id
INNER JOIN Departments dept
ON dd.department_id=dept.department_id;
```

---

## 2️⃣ LEFT JOIN

```sql
SELECT p.name,
       a.appointment_id,
       a.status
FROM Patients p
LEFT JOIN Appointments a
ON p.patient_id=a.patient_id;
```

---

## 3️⃣ RIGHT JOIN

```sql
SELECT a.appointment_id,
       b.invoice_id,
       b.payment_status
FROM Billing b
RIGHT JOIN Appointments a
ON b.appointment_id=a.appointment_id
WHERE b.invoice_id IS NULL;
```

---

## 4️⃣ FULL OUTER JOIN Using UNION

```sql
SELECT p.patient_id,
       p.name,
       a.appointment_id
FROM Patients p
LEFT JOIN Appointments a
ON p.patient_id=a.patient_id

UNION

SELECT p.patient_id,
       p.name,
       a.appointment_id
FROM Patients p
RIGHT JOIN Appointments a
ON p.patient_id=a.patient_id;
```

The SQL project uses `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and a FULL OUTER JOIN simulation using `UNION`. :contentReference[oaicite:0]{index=0}

---

# 🏆 Doctor Ranking

The `RANK()` window function is used to rank doctors according to the number of patients they have treated through appointments.

```sql
SELECT d.name,
       COUNT(a.patient_id) patients_treated,
       RANK() OVER(
           ORDER BY COUNT(a.patient_id) DESC
       ) doctor_rank
FROM Doctors d
LEFT JOIN Appointments a
ON d.doctor_id=a.doctor_id
GROUP BY d.doctor_id,d.name;
```

:contentReference[oaicite:1]{index=1}

### 📸 Screenshot 7 — Doctor Ranking

<img src="./assets/doctor-ranking.png" alt="Doctor Ranking" width="80%">

---

# 📈 Cumulative Revenue

The `SUM() OVER()` window function calculates cumulative paid revenue in payment-date order.

```sql
SELECT payment_date,
       amount,
       SUM(amount) OVER(
           ORDER BY payment_date
       ) cumulative_revenue
FROM Billing
WHERE payment_status='Paid';
```

:contentReference[oaicite:2]{index=2}

### 📸 Screenshot 8 — Cumulative Revenue

<img src="./assets/cumulative-revenue.png" alt="Cumulative Revenue" width="80%">

---

# 📊 Window Functions Used

| Function | Purpose |
|---|---|
| `RANK() OVER()` | Rank doctors based on patient count |
| `SUM() OVER()` | Calculate cumulative revenue |
| `COUNT() OVER()` | Perform count-based window analysis |

---

# 🧠 Patient Risk Classification

Patients are classified into different risk levels according to the number of medical records associated with them.

```sql
SELECT p.name,
       COUNT(m.record_id) records,
       CASE
           WHEN COUNT(m.record_id)>5 THEN 'High'
           WHEN COUNT(m.record_id) BETWEEN 3 AND 5 THEN 'Medium'
           ELSE 'Low'
       END AS Patient_Risk_Level
FROM Patients p
LEFT JOIN Medical_Records m
ON p.patient_id=m.patient_id
GROUP BY p.patient_id,p.name;
```

:contentReference[oaicite:0]{index=0}

### 📸 Screenshot 9 — Patient Risk Level

<img src="./assets/patient-risk.png" alt="Patient Risk Level" width="80%">

---

# 💼 Doctor Experience Classification

Doctors are classified according to their years of experience using a `CASE` expression.

```sql
SELECT name,
       experience_years,
       CASE
           WHEN experience_years>15 THEN 'Senior'
           WHEN experience_years BETWEEN 5 AND 15 THEN 'Mid-Level'
           ELSE 'Junior'
       END AS doctor_category
FROM Doctors;
```

:contentReference[oaicite:1]{index=1}

### 📸 Screenshot 10 — Doctor Experience Category

<img src="./assets/doctor-category.png" alt="Doctor Experience Category" width="80%">

---

# 🏥 Medical Records

## 📋 Table Structure

| Column | Data Type |
|---|---|
| `record_id` | INT PRIMARY KEY |
| `patient_id` | INT |
| `doctor_id` | INT |
| `diagnosis` | VARCHAR(150) |
| `prescription` | VARCHAR(150) |
| `treatment_date` | DATE |
| `admission_date` | DATE |
| `discharge_date` | DATE |

:contentReference[oaicite:2]{index=2}

---

# ⏳ Hospital Stay Analysis

The project calculates the number of days between admission and discharge.

```sql
SELECT record_id,
       DATEDIFF(
           discharge_date,
           admission_date
       ) hospital_stay_days
FROM Medical_Records;
```

:contentReference[oaicite:3]{index=3}

---

# 📅 Date Formatting

```sql
SELECT record_id,
       DATE_FORMAT(
           treatment_date,
           '%d-%m-%Y'
       ) formatted_date
FROM Medical_Records;
```

:contentReference[oaicite:4]{index=4}

---

# 🔤 String Functions

## 🔠 Uppercase Patient Names

```sql
SELECT UPPER(name) AS patient_name
FROM Patients;
```

## ✂️ Trim Doctor Names

```sql
SELECT TRIM(name) AS doctor_name
FROM Doctors;
```

## 📱 Handle Missing Phone Numbers

```sql
SELECT name,
       COALESCE(phone_number,'Not Available') phone
FROM Doctors;
```

:contentReference[oaicite:5]{index=5}

---

# 🔍 Subqueries

## 🚫 Patients Without Appointments

```sql
SELECT *
FROM Patients
WHERE NOT EXISTS
(
    SELECT 1
    FROM Appointments a
    WHERE a.patient_id=Patients.patient_id
);
```

:contentReference[oaicite:6]{index=6}

---

## 💰 Patient Spending the Most

```sql
SELECT p.name,
       SUM(b.amount) total_spent
FROM Patients p
JOIN Billing b
ON p.patient_id=b.patient_id
WHERE b.payment_status='Paid'
GROUP BY p.patient_id,p.name
ORDER BY total_spent DESC
LIMIT 1;
```

:contentReference[oaicite:7]{index=7}

---

# 🧪 SQL Techniques Demonstrated

| Category | SQL Concepts |
|---|---|
| 🏗️ Database | `CREATE DATABASE`, `USE` |
| 🏛️ Tables | `CREATE TABLE` |
| ➕ Data | `INSERT INTO` |
| 🔎 Retrieval | `SELECT` |
| 🎯 Filtering | `WHERE`, `NOT EXISTS` |
| 📊 Aggregation | `SUM`, `AVG`, `MAX`, `MIN`, `COUNT` |
| 🧩 Grouping | `GROUP BY`, `HAVING` |
| 📑 Sorting | `ORDER BY` |
| 🔗 Joins | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN` |
| 🔄 Join Simulation | `UNION` |
| 🔍 Subqueries | Nested queries |
| 📅 Date Functions | `MONTH`, `DATEDIFF`, `DATE_FORMAT` |
| 📈 Window Functions | `RANK() OVER`, `SUM() OVER` |
| 🏷️ Conditional Logic | `CASE` |
| 🔤 String Functions | `UPPER`, `TRIM`, `COALESCE` |

---

# 🔄 Data Analysis Workflow

```text
                 🏥 HOSPITAL DATA
                         │
                         ▼
                  🗃️ STORE DATA
                         │
                         ▼
                   🔎 QUERY DATA
                         │
             ┌───────────┼───────────┐
             ▼           ▼           ▼
          🔗 JOINS    🔍 FILTERS   📊 AGGREGATE
             │           │           │
             └───────────┼───────────┘
                         ▼
                  📈 WINDOW FUNCTIONS
                         │
                         ▼
                    🏷️ CLASSIFY
                         │
                         ▼
                   💡 INSIGHTS
```

---

# 🎯 Project Objectives

- 🏥 Build a structured hospital database
- 🧑‍⚕️ Manage patient information
- 👨‍⚕️ Manage doctor information
- 📅 Track appointments
- 🏥 Store medical records
- 💳 Analyze billing information
- 🏢 Manage departments
- 🔗 Understand relational database design
- 📊 Perform healthcare data analysis
- 🧠 Practice advanced SQL techniques

---

# 🛠️ Technologies Used

<div align="center">

<img src="https://img.shields.io/badge/MySQL-FFFFFF?style=for-the-badge&logo=mysql&logoColor=111827">

<img src="https://img.shields.io/badge/SQL-111827?style=for-the-badge">

<img src="https://img.shields.io/badge/RELATIONAL%20DATABASE-F8FAFC?style=for-the-badge&labelColor=111827">

<img src="https://img.shields.io/badge/DATA%20ANALYSIS-E2E8F0?style=for-the-badge&labelColor=111827">

</div>

---

# 📈 Skills Demonstrated

| Skill | Demonstrated |
|---|---|
| 🐬 MySQL | ⭐⭐⭐⭐⭐ |
| 🧠 SQL | ⭐⭐⭐⭐⭐ |
| 🗃️ Database Design | ⭐⭐⭐⭐⭐ |
| 🔗 SQL Joins | ⭐⭐⭐⭐⭐ |
| 🔍 Subqueries | ⭐⭐⭐⭐ |
| 📊 Aggregate Functions | ⭐⭐⭐⭐⭐ |
| 📈 Window Functions | ⭐⭐⭐⭐⭐ |
| 📅 Date Functions | ⭐⭐⭐⭐ |
| 🏷️ CASE Statements | ⭐⭐⭐⭐⭐ |
| 🔤 String Functions | ⭐⭐⭐⭐ |

---

# 🎯 Key Concepts Learned

### 🗃️ Relational Database Design

Understanding how multiple tables can be connected through primary and foreign keys.

### 🔗 SQL JOINs

Combining information from multiple tables using:

```text
INNER JOIN
LEFT JOIN
RIGHT JOIN
UNION
```

### 📊 Data Aggregation

Using:

```text
SUM()
AVG()
MAX()
MIN()
COUNT()
```

### 📈 Window Functions

Using:

```text
RANK() OVER()
SUM() OVER()
```

### 📅 Date Manipulation

Using:

```text
MONTH()
DATEDIFF()
DATE_FORMAT()
```

### 🏷️ Conditional Classification

Using `CASE` to create meaningful categories such as:

```text
High
Medium
Low
```

---

# 🚀 Future Improvements

- 📊 Create an interactive hospital dashboard
- 📈 Add monthly revenue analysis
- 🧑‍⚕️ Add doctor availability management
- 📅 Add appointment scheduling analysis
- 💳 Add payment tracking dashboards
- 🏥 Add department performance analysis
- 📊 Connect the database to Power BI
- 🔐 Add user roles and access control
- 📱 Build a hospital management interface
- 📈 Add advanced patient analytics

---

# 📁 Project Structure

```text
Hospital_Management/
│
├── SQL File.sql
├── README.md
│
└── assets/
    ├── patient-records.png
    ├── patient-total-paid.png
    ├── doctor-records.png
    ├── doctor-patient-count.png
    ├── department-revenue.png
    ├── doctor-department.png
    ├── doctor-ranking.png
    ├── cumulative-revenue.png
    ├── patient-risk.png
    └── doctor-category.png
```

---

# ▶️ How to Run

### 1️⃣ Install MySQL

Install MySQL and MySQL Workbench.

### 2️⃣ Open the SQL File

Open your hospital management SQL file in MySQL Workbench.

### 3️⃣ Create the Database

```sql
DROP DATABASE IF EXISTS hospital_management;

CREATE DATABASE hospital_management;

USE hospital_management;
```

### 4️⃣ Execute the SQL Script

Run the SQL statements from beginning to end.

### 5️⃣ Check the Tables

```sql
SHOW TABLES;
```

The database contains tables for:

```text
Patients
Doctors
Appointments
Medical_Records
Billing
Departments
Doctor_Department
```

---

# 📸 Project Screenshots

<div align="center">

### 🧑‍⚕️ Patient Records

<img src="./assets/patient-records.png" width="95%" alt="Patient Records">

<br><br>

### 💳 Patient Total Paid

<img src="./assets/patient-total-paid.png" width="70%" alt="Patient Total Paid">

<br><br>

### 👨‍⚕️ Doctor Records

<img src="./assets/doctor-records.png" width="95%" alt="Doctor Records">

<br><br>

### 📊 Doctor Patient Count

<img src="./assets/doctor-patient-count.png" width="80%" alt="Doctor Patient Count">

<br><br>

### 🏢 Department Revenue

<img src="./assets/department-revenue.png" width="75%" alt="Department Revenue">

<br><br>

### 🔗 Doctor Department JOIN

<img src="./assets/doctor-department.png" width="80%" alt="Doctor Department">

<br><br>

### 🏆 Doctor Ranking

<img src="./assets/doctor-ranking.png" width="80%" alt="Doctor Ranking">

<br><br>

### 📈 Cumulative Revenue

<img src="./assets/cumulative-revenue.png" width="80%" alt="Cumulative Revenue">

<br><br>

### 🧠 Patient Risk Level

<img src="./assets/patient-risk.png" width="80%" alt="Patient Risk Level">

<br><br>

### 💼 Doctor Experience Category

<img src="./assets/doctor-category.png" width="80%" alt="Doctor Experience Category">

</div>

---

# 🏁 Conclusion

**Hospital Management System** demonstrates how MySQL can be used to design a relational database and analyze structured hospital data.

The project covers:

- Patient management
- Doctor management
- Appointment tracking
- Medical records
- Billing analysis
- Department management
- SQL JOINs
- Subqueries
- Aggregate functions
- Date functions
- Window functions
- Conditional classification
- String transformation

This project provides practical experience in using SQL for structured data management and analysis.

---

<div align="center">

# 🤍 HOSPITAL MANAGEMENT SYSTEM

### SQL • Database Design • Healthcare Data Analysis

<br>

<img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=700&size=20&duration=3000&pause=800&color=111827&center=true&vCenter=true&width=800&lines=Manage+Data;Analyze+Data;Connect+Tables;Discover+Insights;Master+SQL" alt="Animated Footer">

<br><br>

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:CBD5E1,50:F1F5F9,100:FFFFFF&height=140&section=footer&animation=twinkling" width="100%">

</div>
