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

-- date :  7/3/2024

-- show database
show databases;
-- Create Database
create database p4n_employees; 
-- drop Database
drop database p4n_employees;
-- select Database
use p4n_employees;
-- create table 

create table info(
	id int,
    name varchar(20),
    city varchar(20),
    salary int
);

-- show table

show tables;

-- select table 
select * from info;

-- insert query 
insert into info values(1,'joy','mumbai',25000);
insert into info values(2,'joy1','mumbai',25000);
insert into info values(3,'joy2','mumbai',25000);
insert into info values(4,'joy3','mumbai',25000);


-- Date : 9 March 2023 
-- insert query 

use p4n_employees;

create table client (
	client_id int primary key,
    name varchar(10),
    city varchar(10)
);

insert into client values(101,'joy','mumbai');

select * from client;

create table client1 (
	client_id int primary key auto_increment,
    name varchar(10),
    city varchar(10)
);

insert into client1 (name,city) values('joy','mumbai');

select * from client1;

-- where 

use sakila;
select * from payment;

select * from payment
where amount = 4.99;

-- and operator
select * from payment
where amount = 4.99 and staff_id = 1;

-- or operator

select * from payment
where amount = 4.99 or staff_id = 1;

-- update query 

update payment
set amount = 12.0
where payment_id = 1;

select * from payment 
where payment_id = 1;


-- Date : 12 march 2024 
-- delete 
use sakila;
select * from payment;

-- DELETE FROM payment
-- WHERE payment_id = 3;

-- like 

select * from actor;

select * from actor 
where first_name like 'nick';

select * from actor 
where first_name like 'a%';

select * from actor 
where first_name like '%a';

select * from actor 
where first_name like '%a%';

-- top - limit
select * from actor 
limit 5;

-- order by

select * from payment;

select * from payment 
order by amount asc;

select * from payment 
order by amount desc;

select * from actor 
order by first_name asc;

select * from actor 
order by first_name desc;

-- group by

select amount  from payment
group by amount;


select amount , count(amount) as total_customers  from payment
group by amount;

-- distinct keyword

select distinct amount  from payment;

-- Date : 14 March 2024 

-- unions claus

show databases;
use cwp;
show tables;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES
    (1, 'Pankaj', 'Sharma', 'pankaj@codeswithpankaj.com'),
    (2, 'Nishant', 'Patel', 'nishant@codeswithpankaj.com'),
    (3, 'Kiran', 'Desai', 'kiran@codeswithpankaj.com'),
    (4, 'Tanvi', 'Mehta', 'tanvi@codeswithpankaj.com'),
    (5, 'Kritek', 'Singh', 'kritek@codeswithpankaj.com');

INSERT INTO Suppliers (SupplierID, CompanyName, Email)
VALUES
    (101, 'ABC Inc.', 'abc@codeswithpankaj.com'),
    (102, 'XYZ Ltd.', 'xyz@codeswithpankaj.com'),
    (103, 'Company A', 'companya@p4n.in');


select email from customers
union all
select email from suppliers;

-- truncate table 

select * from customers;
truncate customers;

-- having

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SalespersonName VARCHAR(50),
    SaleAmount DECIMAL(10, 2)
);
INSERT INTO Sales (SaleID, SalespersonName, SaleAmount)
VALUES
    (1, 'Pankaj', 100.00),
    (2, 'Nishant', 150.00),
    (3, 'Kiran', 200.00),
    (4, 'Tanvi', 100.00),
    (5, 'Kritek', 250.00); 

SELECT SalespersonName, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY SalespersonName
HAVING SUM(SaleAmount) > 200;

use sakila;

select payment_id , sum(amount) as total from payment
group by payment_id
having sum(amount) > 5;

-- Date 16 march 2024

-- view
use sakila;

select * from payment;

create view extra_payment as
select payment_id , payment_date , amount , amount + 500 as extra_amount 
from payment; 


select * from extra_payment;

select * from actor_info;


-- join

create database cwp_join;
use cwp_join;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES
    (1, 'Pankaj', 'Sharma', 'pankaj@codeswithpankaj.com'),
    (2, 'Nishant', 'Patel', 'nishant@codeswithpankaj.com'),
    (3, 'Kiran', 'Desai', 'kiran@codeswithpankaj.com'),
    (4, 'Tanvi', 'Mehta', 'tanvi@codeswithpankaj.com'),
    (5, 'Kritek', 'Singh', 'kritek@codeswithpankaj.com');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2023-01-15', 250.00),
    (102, 2, '2023-02-20', 120.50),
    (103, 3, '2023-03-10', 320.75),
    (105, 4, '2023-05-12', 210.00);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (107, 7, '2026-01-15', 299.00);
 
select * from customers;
select * from orders;


select orders.orderdate , orders.totalamount , customers.firstname , customers.customerid, customers.email
from customers
inner join orders 
on customers.customerid = orders.customerid;


select orders.orderdate , orders.totalamount , customers.firstname , customers.customerid, customers.email
from customers
left join orders 
on customers.customerid = orders.customerid;

select orders.orderdate , orders.totalamount , customers.firstname , customers.customerid, customers.email
from customers
right join orders 
on customers.customerid = orders.customerid;


select orders.orderdate , orders.totalamount , customers.firstname , customers.customerid, customers.email
from customers
left join orders 
on customers.customerid = orders.customerid
union
select orders.orderdate , orders.totalamount , customers.firstname , customers.customerid, customers.email
from customers
right join orders 
on customers.customerid = orders.customerid;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ManagerID INT
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, ManagerID)
VALUES
    (1, 'Pankaj', 'Sharma', NULL), -- Pankaj is the top-level manager
    (2, 'Nishant', 'Patel', 1),    -- Nishant reports to Pankaj
    (3, 'Kiran', 'Desai', 1),      -- Kiran reports to Pankaj
    (4, 'Tanvi', 'Mehta', 2),      -- Tanvi reports to Nishant
    (5, 'Kritek', 'Singh', 2);     -- Kritek reports to Nishant

SELECT e.FirstName AS EmployeeFirstName, e.LastName AS EmployeeLastName,
       m.FirstName AS ManagerFirstName, m.LastName AS ManagerLastName
FROM Employees e
LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID;


-- 19 March 2023

-- truncate table 
-- having 
-- useful function

use cwp;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO employees(employee_id, first_name, last_name, email)
VALUES
    (1, 'Rohit', 'Gupta', 'rohit@codeswithpankaj.com'),
    (2, 'Pankaj', 'Sharma', 'pankaj@codeswithpankaj.com'),
    (3, 'Nishant', 'Verma', 'nishant@codeswithpankaj.com'),
    (4, 'Neelam', 'Singh', 'neelam@codeswithpankaj.com'),
    (5, 'Tanvi', 'Patel', 'tanvi@codeswithpankaj.com'),
    (6, 'Kiran', 'Yadav', 'kiran@codeswithpankaj.com'),
    (7, 'Ruby', 'Jain', 'ruby@codeswithpankaj.com'),
    (8, 'Priti', 'Mehta', 'priti@codeswithpankaj.com'),
    (9, 'Aditi', 'Raj', 'aditi@codeswithpankaj.com'),
    (10, 'Kritek', 'Agarwal', 'kritek@codeswithpankaj.com');
    

select * from employees;

-- Concatenates first and last names.
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

-- Converts email addresses to uppercase and lowercase.
SELECT UPPER(email) AS uppercase_email, LOWER(email) AS lowercase_email FROM employees;

-- Extracts the first three characters of the email

SELECT SUBSTRING(email, 1, 5) AS email_prefix FROM employees;

-- LENGTH(str) or CHAR_LENGTH(str):
SELECT first_name, LENGTH(first_name) AS name_length FROM employees;

-- TRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str)

SELECT TRIM(BOTH ' ' FROM email) AS trimmed_email FROM employees;

-- REPLACE(str, old_substring, new_substring):

SELECT REPLACE(email, 'codeswithpankaj.com', 'p4n.in') AS modified_email FROM employees;


use sakila;



-- ROUND(number, decimals)
SELECT amount, ROUND(amount) AS rounded_id FROM payment;

-- CEIL(number) and FLOOR(number):

SELECT CEIL(amount) AS ceil_id, FLOOR(amount) AS floor_id FROM payment;

-- ABS(number)
SELECT ABS(amount) AS absolute_id FROM payment;

-- RAND():

SELECT payment_id,  ROUND(RAND()*78) AS random_number FROM payment;

-- SQRT(number):
SELECT payment_id,  sqrt(amount)  FROM payment;


-- POWER(number, exponent):

SELECT amount,  power(amount,2)  FROM payment;

-- MOD(number, divisor):

SELECT payment_id,  mod(amount,2)  FROM payment;


select * from payment;
-- CURDATE():
SELECT CURDATE();
-- DATEDIFF(date1, date2):

SELECT payment_id, DATEDIFF( last_update,payment_date) AS days_until FROM payment;

SELECT payment_id, DATEDIFF( CURDATE(),payment_date) AS days_until FROM payment;


-- DATE_ADD(date, INTERVAL value unit):

-- Adds a specific interval to a date.
SELECT payment_id, payment_date, DATE_ADD(payment_date, INTERVAL 7 DAY) AS new_date FROM payment;

-- DATE_SUB(date, INTERVAL value unit):

-- Subtracts a specific interval from a date.
SELECT payment_id, payment_date, DATE_SUB(payment_date, INTERVAL 10 MONTH) AS new_date FROM payment;

SELECT payment_id, payment_date, DATE_SUB(payment_date, INTERVAL 10 year) AS new_date FROM payment;

SELECT payment_id, payment_date, DATE_ADD(payment_date, INTERVAL 10 year) AS new_date FROM payment;

-- DATE_FORMAT(date, format):

-- Formats a date as a string according to a specified format.
SELECT payment_id, DATE_FORMAT(payment_date, '%Y-%m-%d') AS formatted_date FROM payment;


SELECT NOW() AS current_datetime;
SELECT CURTIME()

