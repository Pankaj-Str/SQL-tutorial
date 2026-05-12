SQL Multiple Table JOIN – Step by Step TutorialWhat is Multiple Table JOIN?

A Multiple Table JOIN is used when data is stored in different tables and we want to combine them into a single result.

Example:

students table → student details

courses table → course details

enrollments table → which student joined which course

Using JOIN, we can fetch complete information together.

Step 1: Create DatabaseCREATE DATABASE college_db; USE college_db; Step 2: Create Tables1. Students TableCREATE TABLE students ( student_id INT PRIMARY KEY, student_name VARCHAR(100), city VARCHAR(50) ); 2. Courses TableCREATE TABLE courses ( course_id INT PRIMARY KEY, course_name VARCHAR(100), fees INT ); 3. Enrollments TableCREATE TABLE enrollments ( enroll_id INT PRIMARY KEY, student_id INT, course_id INT, join_date DATE ); Step 3: Insert Sample DataInsert into StudentsINSERT INTO students VALUES (1, 'Amit', 'Delhi'), (2, 'Neha', 'Mumbai'), (3, 'Rahul', 'Pune'), (4, 'Priya', 'Indore'); Insert into CoursesINSERT INTO courses VALUES (101, 'Java', 15000), (102, 'Python', 12000), (103, 'Data Science', 25000); Insert into EnrollmentsINSERT INTO enrollments VALUES (1, 1, 101, '2025-01-10'), (2, 2, 102, '2025-01-15'), (3, 3, 103, '2025-01-20'), (4, 1, 103, '2025-02-01'); Step 4: Understand Table Relationshipstudents | | student_id | enrollments | | course_id | courses 

students.student_id = enrollments.student_id

courses.course_id = enrollments.course_id

Step 5: INNER JOIN Two TablesGet Student Names with Enrollment DateSELECT students.student_name, enrollments.join_date FROM students INNER JOIN enrollments ON students.student_id = enrollments.student_id; Outputstudent_namejoin_dateAmit2025-01-10Neha2025-01-15Rahul2025-01-20Amit2025-02-01Step 6: JOIN Three TablesGet Student Name + Course Name + FeesSELECT students.student_name, courses.course_name, courses.fees, enrollments.join_date FROM enrollments INNER JOIN students ON enrollments.student_id = students.student_id INNER JOIN courses ON enrollments.course_id = courses.course_id; Outputstudent_namecourse_namefeesjoin_dateAmitJava150002025-01-10NehaPython120002025-01-15RahulData Science250002025-01-20AmitData Science250002025-02-01Step 7: Use Table Aliases

Aliases make queries shorter and easier.

SELECT s.student_name, c.course_name, c.fees, e.join_date FROM enrollments e INNER JOIN students s ON e.student_id = s.student_id INNER JOIN courses c ON e.course_id = c.course_id; Step 8: Add WHERE ConditionStudents with Fees Greater than 15000SELECT s.student_name, c.course_name, c.fees FROM enrollments e INNER JOIN students s ON e.student_id = s.student_id INNER JOIN courses c ON e.course_id = c.course_id WHERE c.fees > 15000; Step 9: LEFT JOIN Example

Show all students even if they are not enrolled.

SELECT s.student_name, c.course_name FROM students s LEFT JOIN enrollments e ON s.student_id = e.student_id LEFT JOIN courses c ON e.course_id = c.course_id; Step 10: Count Courses per StudentSELECT s.student_name, COUNT(e.course_id) AS total_courses FROM students s LEFT JOIN enrollments e ON s.student_id = e.student_id GROUP BY s.student_name; Important JOIN TypesJOIN TypeDescriptionINNER JOINReturns matching recordsLEFT JOINReturns all left table recordsRIGHT JOINReturns all right table recordsFULL JOINReturns all matching and non-matching recordsReal-Life ExampleTablePurposecustomersCustomer detailsordersOrder detailsproductsProduct information

Using JOINs, companies generate invoices, reports, dashboards, and analytics.

Final Combined QuerySELECT s.student_id, s.student_name, s.city, c.course_name, c.fees, e.join_date FROM students s INNER JOIN enrollments e ON s.student_id = e.student_id INNER JOIN courses c ON e.course_id = c.course_id; Summary

In this tutorial you learned:

Creating multiple tables

Inserting data

INNER JOIN

LEFT JOIN

Joining 3 tables

Using aliases

Filtering data with WHERE

GROUP BY with JOIN

This is one of the most important SQL concepts used in real projects and interviews.

