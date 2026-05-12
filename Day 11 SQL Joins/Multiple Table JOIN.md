# SQL Multiple Table JOIN

## What is Multiple Table JOIN?

A Multiple Table JOIN is used when data is stored in different tables and we want to combine them into a single result.

Example:

* `students` table → student details
* `courses` table → course details
* `enrollments` table → which student joined which course

Using JOIN, we can fetch complete information together.

---

# Step 1: Create Database

```sql
CREATE DATABASE college_db;

USE college_db;
```

---

# Step 2: Create Tables

## 1. Students Table

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    city VARCHAR(50)
);
```

---

## 2. Courses Table

```sql
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    fees INT
);
```

---

## 3. Enrollments Table

```sql
CREATE TABLE enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    join_date DATE
);
```

---

# Step 3: Insert Sample Data

## Insert into Students

```sql
INSERT INTO students VALUES
(1, 'Amit', 'Delhi'),
(2, 'Neha', 'Mumbai'),
(3, 'Rahul', 'Pune'),
(4, 'Priya', 'Indore');
```

---

## Insert into Courses

```sql
INSERT INTO courses VALUES
(101, 'Java', 15000),
(102, 'Python', 12000),
(103, 'Data Science', 25000);
```

---

## Insert into Enrollments

```sql
INSERT INTO enrollments VALUES
(1, 1, 101, '2025-01-10'),
(2, 2, 102, '2025-01-15'),
(3, 3, 103, '2025-01-20'),
(4, 1, 103, '2025-02-01');
```

---

# Step 4: Understand Table Relationship

```text
students
    |
    | student_id
    |
enrollments
    |
    | course_id
    |
courses
```

* `students.student_id = enrollments.student_id`
* `courses.course_id = enrollments.course_id`

---

# Step 5: INNER JOIN Two Tables

## Get Student Names with Enrollment Date

```sql
SELECT students.student_name,
       enrollments.join_date
FROM students
INNER JOIN enrollments
ON students.student_id = enrollments.student_id;
```

---

## Output

| student_name | join_date  |
| ------------ | ---------- |
| Amit         | 2025-01-10 |
| Neha         | 2025-01-15 |
| Rahul        | 2025-01-20 |
| Amit         | 2025-02-01 |

---

# Step 6: JOIN Three Tables

## Get Student Name + Course Name + Fees

```sql
SELECT students.student_name,
       courses.course_name,
       courses.fees,
       enrollments.join_date
FROM enrollments
INNER JOIN students
ON enrollments.student_id = students.student_id
INNER JOIN courses
ON enrollments.course_id = courses.course_id;
```

---

# Output

| student_name | course_name  | fees  | join_date  |
| ------------ | ------------ | ----- | ---------- |
| Amit         | Java         | 15000 | 2025-01-10 |
| Neha         | Python       | 12000 | 2025-01-15 |
| Rahul        | Data Science | 25000 | 2025-01-20 |
| Amit         | Data Science | 25000 | 2025-02-01 |

---

# Step 7: Use Table Aliases

Aliases make queries shorter and easier.

```sql
SELECT s.student_name,
       c.course_name,
       c.fees,
       e.join_date
FROM enrollments e
INNER JOIN students s
ON e.student_id = s.student_id
INNER JOIN courses c
ON e.course_id = c.course_id;
```

---

# Step 8: Add WHERE Condition

## Students with Fees Greater than 15000

```sql
SELECT s.student_name,
       c.course_name,
       c.fees
FROM enrollments e
INNER JOIN students s
ON e.student_id = s.student_id
INNER JOIN courses c
ON e.course_id = c.course_id
WHERE c.fees > 15000;
```

---

# Step 9: LEFT JOIN Example

Show all students even if they are not enrolled.

```sql
SELECT s.student_name,
       c.course_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id;
```

---

# Step 10: Count Courses per Student

```sql
SELECT s.student_name,
       COUNT(e.course_id) AS total_courses
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY s.student_name;
```

---

# Important JOIN Types

| JOIN Type  | Description                                   |
| ---------- | --------------------------------------------- |
| INNER JOIN | Returns matching records                      |
| LEFT JOIN  | Returns all left table records                |
| RIGHT JOIN | Returns all right table records               |
| FULL JOIN  | Returns all matching and non-matching records |

---

# Real-Life Example

| Table     | Purpose             |
| --------- | ------------------- |
| customers | Customer details    |
| orders    | Order details       |
| products  | Product information |

Using JOINs, companies generate invoices, reports, dashboards, and analytics.

---

# Final Combined Query

```sql
SELECT 
    s.student_id,
    s.student_name,
    s.city,
    c.course_name,
    c.fees,
    e.join_date
FROM students s
INNER JOIN enrollments e
    ON s.student_id = e.student_id
INNER JOIN courses c
    ON e.course_id = c.course_id;
```

---



