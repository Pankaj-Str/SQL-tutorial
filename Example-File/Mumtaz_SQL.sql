-- introduction of Database 
-- intro - Sql
-- Create Database 
-- drop Database
-- select Database
-- create table 
-- insert query 
-- where 
-- and operator
-- or operator
-- update query 
-- delete 
-- like 
-- top
-- order by
-- group by
-- distinct keyword
-- Constraints
-- join
-- unions claus
-- truncate table 
-- having 
-- view 
-- useful function



-- Show database list 
show databases;
-- create database 
create database cwpc01;
-- select database
use cwpc01;

-- Date 14 aug 2025
-- drop Database
drop database cwpc01;
-- select Database
use cwpc01;
-- create table 

-- column Name 
-- datatype

# SQL data types

-- 1. **INT (Integer)**:
--    - Represents whole numbers.
--    - Examples:
--      ```sql
--      CREATE TABLE Students (
--          student_id INT PRIMARY KEY,
--          age INT
--      );
--      ```

-- 2. **VARCHAR (Variable-Length Character)**:
--    - Stores variable-length character strings.
--    - Examples:
--      ```sql
--      CREATE TABLE Employees (
--          employee_id INT PRIMARY KEY,
--          first_name VARCHAR(50),
--          last_name VARCHAR(50)
--      );
--      ```

-- 3. **DATE**:
--    - Stores date values in the format 'YYYY-MM-DD'.
--    - Examples:
--      ```sql
--      CREATE TABLE Orders (
--          order_id INT PRIMARY KEY,
--          order_date DATE
--      );
--      ```

-- 4. **TIME**:
--    - Stores time values in the format 'HH:MM:SS'.
--    - Examples:
--      ```sql
--      CREATE TABLE Appointments (
--          appointment_id INT PRIMARY KEY,
--          appointment_time TIME
--      );
--      ```

-- 5. **DATETIME**:
--    - Stores date and time values in the format 'YYYY-MM-DD HH:MM:SS'.
--    - Examples:
--      ```sql
--      CREATE TABLE Events (
--          event_id INT PRIMARY KEY,
--          event_datetime DATETIME
--      );
--      ```

-- 6. **CHAR (Fixed-Length Character)**:
--    - Stores fixed-length character strings.
--    - Examples:
--      ```sql
--      CREATE TABLE Products (
--          product_id INT PRIMARY KEY,
--          product_code CHAR(10)
--      );
--      ```

-- 7. **FLOAT**:
--    - Stores floating-point numbers.
--    - Examples:
--      ```sql
--      CREATE TABLE Stock (
--          stock_id INT PRIMARY KEY,
--          price FLOAT
--      );
--      ```

-- 8. **BOOLEAN (or BOOL)**:
--    - Stores true/false or 1/0 values.
--    - Examples:
--      ```sql
--      CREATE TABLE Tasks (
--          task_id INT PRIMARY KEY,
--          is_completed BOOLEAN
--      );
--      ```

-- 9. **TEXT**:
--    - Stores large text data.
--    - Examples:
--      ```sql
--      CREATE TABLE Comments (
--          comment_id INT PRIMARY KEY,
--          comment_text TEXT
--      );
--      ```

-- 10. **BLOB (Binary Large Object)**:
--     - Stores binary data, such as images or files.
--     - Examples:
--       ```sql
--       CREATE TABLE Images (
--           image_id INT PRIMARY KEY,
--           image_data BLOB
--       );
--       ```

-- 11. **ENUM**:
--     - Defines a list of enumerated values.
--     - Examples:
--       ```sql
--       CREATE TABLE DaysOfWeek (
--           day_id INT PRIMARY KEY,
--           day_name ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')
--       );
--       ```


-- example create table 

create table employee(
	id int primary key,
    emp_name varchar(100),
    city varchar(100),
    salary int,
    dob date, -- YYYY-MM-DD
    dept enum('sales','hr','it','other')
);


-- show table 
select * from employee;

-- insert query 

insert into employee (id,emp_name,city,salary,dob,dept) 
values (1,'mumtaz','mumbai',67000,'2024-05-23','it'),
(2,'joy','pune',57000,'2024-05-23','other'),
(3,'heena','mumbai',7000,'2021-05-25','sales'),
(4,'nishant','surat',97000,'2020-05-26','hr'),
(5,'chetan','goa',37000,'2024-07-17','it');


-- Date #21-8-2025
-- select sakila DataBase
use sakila;
-- show all table 
show tables;
-- show table record 
select * from payment;
-- where 
select * from payment where amount > 4;
-- and operator
select * from payment where amount < 4 and amount > 2;

-- or operator
select * from payment where amount > 4 or rental_id > 10000;
-- update query 
select * from payment where rental_id = 2308;  
update payment set amount = 10.99 where rental_id = 2308;
-- delete 
delete from payment where rental_id = 2308;
-- like 
select * from customer;
select * from customer where first_name like 'a%';
select * from customer where first_name like '%a%';
select * from customer where first_name like '%a';
select * from customer where first_name like 'pat%';