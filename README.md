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

The `Patients` table uses `patient_id` as its primary key.

## 👥 Patient Records

The SQL inserts patient records containing names, dates of birth, gender, phone numbers, email addresses, addresses and registration dates.

```sql
SELECT * FROM Patients;
```

### 📸 Screenshot 1 — Patient Records

<img width="850" height="175" alt="Screenshot 01" src="https://github.com/user-attachments/assets/8edf4008-4bd8-41ff-92e9-24f3280acb1b" />


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



### 📸 Screenshot 2 — Patient Total Paid

<img width="226" height="82" alt="Screenshot 3" src="https://github.com/user-attachments/assets/9f18c9b6-5ab5-4681-9fa4-8e1c38a3fce1" />


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

The `Doctors` table stores doctor information including specialization, availability, consultation fees and experience.

## 👨‍⚕️ Doctor Records

```sql
SELECT * FROM Doctors;
```

### 📸 Screenshot 3 — Doctor Records

<img width="1000" height="201" alt="Screenshot 5" src="https://github.com/user-attachments/assets/854905d1-5312-40d7-be47-d6c9933af2e5" />


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

The appointment status is defined as `Scheduled`, `Completed`, or `Cancelled`. 

## 🔎 Scheduled Dermatology Appointments

```sql
SELECT *
FROM Appointments
WHERE status='Scheduled'
AND doctor_id=3;
```

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


### 📸 Screenshot 4 — Doctor Patient Count

<img width="282" height="157" alt="Screenshot 6" src="https://github.com/user-attachments/assets/34a4578b-df1e-48b0-9452-519010a853cd" />


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


### 📸 Screenshot 5 — Department Revenue

<img width="255" height="130" alt="Screenshot 7" src="https://github.com/user-attachments/assets/4bbeecb6-e054-47be-b2fb-512458bdad4d" />


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


---

# 📅 Appointment Analysis

## 📊 Monthly Visits

```sql
SELECT MONTH(appointment_date) month,
       COUNT(*) visits
FROM Appointments
GROUP BY MONTH(appointment_date);
```



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

<img width="307" height="165" alt="Screenshot 8" src="https://github.com/user-attachments/assets/e4f82c71-8243-4a27-8771-e9acfead8467" />


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

The SQL project uses `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and a FULL OUTER JOIN simulation using `UNION`.

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



### 📸 Screenshot 7 — Doctor Ranking

<img width="422" height="151" alt="Screenshot 14" src="https://github.com/user-attachments/assets/842e2f5b-0721-4854-80f2-10b0ecf3087f" />


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



### 📸 Screenshot 8 — Cumulative Revenue

<img width="367" height="112" alt="Screenshot 15" src="https://github.com/user-attachments/assets/8d20fe16-6eb6-4c2e-94a2-36d7c77b689c" />


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



### 📸 Screenshot 9 — Patient Risk Level
<img width="351" height="165" alt="Screenshot 17" src="https://github.com/user-attachments/assets/02f7d445-fb49-4649-8edf-c13dfad24dfd" />


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



### 📸 Screenshot 10 — Doctor Experience Category

<img width="427" height="185" alt="Screenshot 18" src="https://github.com/user-attachments/assets/7aa3d743-e8b6-45c6-8d45-2de82e0e3d16" />


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

<img width="850" height="175" alt="Screenshot 01" src="https://github.com/user-attachments/assets/ee7633a7-d1d4-4d9e-a213-c8be32b1dfd0" />


<br><br>

### 💳 Patient Total Paid
<img width="226" height="82" alt="Screenshot 3" src="https://github.com/user-attachments/assets/da1391c6-88ed-45d1-aa91-242648ef89af" />


<br><br>

### 👨‍⚕️ Doctor Records
<img width="1000" height="201" alt="Screenshot 5" src="https://github.com/user-attachments/assets/7ee387b1-f50a-4843-bdd0-0ef894577b20" />


<br><br>

### 📊 Doctor Patient Count

<img width="282" height="157" alt="Screenshot 6" src="https://github.com/user-attachments/assets/605f476c-e914-4eed-8af6-c1d948627fb3" />


<br><br>

### 🏢 Department Revenue

<img width="255" height="130" alt="Screenshot 7" src="https://github.com/user-attachments/assets/473c26fa-bf67-4591-90fa-53b5e8071cf8" />

<br><br>

### 🔗 Doctor Department JOIN

<img width="307" height="165" alt="Screenshot 8" src="https://github.com/user-attachments/assets/3876b86f-126c-41cc-a852-aa3ec3ac9b46" />


<br><br>

### 🏆 Doctor Ranking

<img width="422" height="151" alt="Screenshot 14" src="https://github.com/user-attachments/assets/10e3c139-9b9e-4d1d-93c0-61fc94c0b278" />


<br><br>

### 📈 Cumulative Revenue

<img width="367" height="112" alt="Screenshot 15" src="https://github.com/user-attachments/assets/b5f48d6a-a8de-4204-9e39-a34c645f500e" />

<br><br>

### 🧠 Patient Risk Level

<img width="351" height="165" alt="Screenshot 17" src="https://github.com/user-attachments/assets/c2fa0737-eb5b-4deb-96a0-72cee67db616" />


<br><br>

### 💼 Doctor Experience Category

<img width="427" height="185" alt="Screenshot 18" src="https://github.com/user-attachments/assets/4af897ff-502c-4fe4-a376-db383e1ad86a" />


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
