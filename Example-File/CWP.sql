-- create database
create database p4n_db2;
-- list of database 
show databases;
-- select database 
use p4n_db2;
-- create table 
create table employee(
	id int auto_increment primary key,
    name varchar(100),
    email varchar(100) unique key,
    city varchar(100),
    salary int
); 
-- show table
select * from employee;
-- insert record
insert into employee(name,email,city,salary)
values("joy","joy@p4n.in","mumbai",34000);
insert into employee(name,email,city,salary)
values("Toy","Toy@p4n.in","Pune",34000);
insert into employee(name,email,city,salary)
values("Roy","Roy@p4n.in","Surat",34000);
insert into employee(name,email,city,salary)
values("Koy","Koy@p4n.in","Bhuj",34000);
-- where 
-- select 
-- select only name and email 
select name,email from employee;
use sakila;
select * from payment;

select * from payment
where staff_id = 1;

select payment_id,customer_id,rental_id from payment
where amount = 0.0;

-- TOP
select * from payment
limit 10;

select * from payment
where payment_id <= 5;

-- SQL - Distinct Clause
use sakila;
select distinct amount from payment;
select * from payment;
select distinct staff_id from payment;
-- SQL - Order By Clause
select * from payment order by amount asc;
select * from payment order by amount desc;
-- SQL - Group By Clause
select amount from payment group by amount;
select amount, count(amount) as total_coustomers from payment group by amount;
-- SQL - Having Clause
select amount, count(amount) as total_coustomers from payment 
group by amount having count(amount) < 50;
-- SQL - AND & OR
select * from payment
where amount >= 0.0 and amount <= 2.99;

select * from payment
where amount = 0.0 or rental_id <= 100;
-- SQL - BOOLEAN (BIT) Operator

select * from payment
where amount between 0.00 and 2.00;

-- date = 17 oct 2023

-- SQL - LIKE Operator
use sakila;
select * from actor;

select * from actor 
where first_name like "a%";

select * from actor 
where first_name like "%a";

select * from actor 
where first_name like "%a%";

-- SQL - IN Operator
select * from payment;

select * from payment 
where amount in(2.99,0.99,5.99);

-- SQL - NOT Operator
use sakila;
select * from payment;

select * from payment 
where not amount = 0.00;

-- SQL - NOT EQUAL
select * from payment 
where amount != 2.99;

-- SQL - IS NULL
select * from address;
select * from address 
where address2 is null;

-- SQL - IS NOT NULL
select * from address 
where address2 is not null;


-- Date = 19 Oct 2023
use p4n_db;
-- drop table customers;
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

select * from customers;
select * from suppliers;

-- union 
SELECT Email FROM Customers
UNION
SELECT Email FROM Suppliers;

-- SQL Keys
-- SQL - Unique Key
CREATE TABLE Students (
    StudentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);
-- SQL - Primary Key:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);
-- SQL - Foreign Key
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- SQL - Composite Key
CREATE TABLE Sales (
    ProductID INT,
    StoreID INT,
    SaleDate DATE,
    PRIMARY KEY (ProductID, StoreID)
);
-- SQL - Alternate Key
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    SSN VARCHAR(20) UNIQUE,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- create  view 
use sakila;
select * from payment;
create view amount_grp as
select amount ,count(amount) as total_customer 
from payment
group by amount;

-- calling view 
select * from amount_grp;


-- Date - 26 Oct 2023 

-- FULL OUTER JOIN
use p4n_db2;
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


-- check table 
select * from Customers;
select * from Orders;

-- SELECT c.FirstName, c.LastName, o.OrderDate
-- FROM Customers AS c
-- LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID;

-- left join 
select customers.firstname, customers.email , 
orders.totalamount, orders.orderdate
from customers
left join orders 
on orders.customerid = customers.customerid; 

-- right join 
select customers.firstname, customers.email , 
orders.totalamount, orders.orderdate
from customers
right join orders 
on orders.customerid = customers.customerid; 


-- LEFT JOIN to get all customers and their orders
SELECT c.FirstName, c.LastName, o.OrderDate,o.totalamount
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID

UNION ALL

-- RIGHT JOIN to get all orders and their associated customers
SELECT c.FirstName, c.LastName, o.OrderDate,o.totalamount
FROM Customers AS c
RIGHT JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE c.CustomerID IS NULL;


-- Date : 31 oct 2023 

use p4n_db2;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE
);

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date)
VALUES
    (1, 'Rohit', 'Gupta', 'rohit@codeswithpankaj.com', '2022-01-15'),
    (2, 'Pankaj', 'Sharma', 'pankaj@codeswithpankaj.com', '2021-03-20'),
    (3, 'Nishant', 'Verma', 'nishant@codeswithpankaj.com', '2023-02-10'),
    (4, 'Neelam', 'Singh', 'neelam@codeswithpankaj.com', '2022-11-05'),
    (5, 'Tanvi', 'Patel', 'tanvi@codeswithpankaj.com', '2021-09-30'),
    (6, 'Kiran', 'Yadav', 'kiran@codeswithpankaj.com', '2022-08-14'),
    (7, 'Ruby', 'Jain', 'ruby@codeswithpankaj.com', '2023-04-25'),
    (8, 'Priti', 'Mehta', 'priti@codeswithpankaj.com', '2022-06-08'),
    (9, 'Aditi', 'Raj', 'aditi@codeswithpankaj.com', '2021-12-01'),
    (10, 'Kritek', 'Agarwal', 'kritek@codeswithpankaj.com', '2023-03-15');
    
-- select table 
select * from employees;

-- GETDATE()/CURRENT_TIMESTAMP()
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date)
VALUES
    (11, 'Joy', 'Jain', 'jain@codeswithpankaj.com', CURRENT_TIMESTAMP());
    
    

-- DATEADD()
SELECT DATE_ADD("2017-06-15", INTERVAL 10 DAY);

-- SELECT DATEADD(MONTH, 3, hire_date) AS three_months_later


-- DATEDIFF()
SELECT DATEDIFF("2023-10-31","1990-8-23");

-- YEAR(), MONTH(), DAY()
SELECT YEAR("2017-06-15");
SELECT MONTH("2017-06-15");
SELECT DAY("2017-06-15");

select year(hire_date) from employees;

select day(hire_date) from employees;

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date)
VALUES
    (12, 'toy', 'tain', 'tain@codeswithpankaj.com', 30-10-2023);
    
select * from employees;

SELECT *,CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

SELECT employee_id,email,hire_date,CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

SELECT UPPER(email) AS uppercase_email
FROM employees;

SELECT LOWER(email) AS lowercase_email
FROM employees;


SELECT LENGTH(email) AS email_length
FROM employees;

SELECT SUBSTRING(email, 1, 6) AS extracted_text
FROM employees;

use sakila;

select * from payment;

select sum(amount) as total_amount from payment;

--  INNER JOIN
SELECT c.FirstName, c.LastName, o.OrderDate
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID;

