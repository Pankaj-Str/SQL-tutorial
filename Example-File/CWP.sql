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

----------- ******

-- Subquery

use sakila;

-- SELECT *
-- FROM Customers
-- WHERE age = (
--   SELECT min(age)
--   FROM Customers
-- );

select * from payment;

-- subquery
select * from payment
where amount = (
	select min(amount) from payment
);

select payment_id,rental_id,amount from payment
where amount = (
	select min(amount) from payment
);

select payment_id,rental_id,amount from payment
where amount = (
	select max(amount) from payment
);

select * from payment 
where amount = 0.0;

select amount ,count(amount) as total_amount 
from payment
group by amount
having count(amount) > 2000;

-- Sum()
select sum(amount)
from payment; 


-- date 02 Nav 2023  
-- CASE

use sakila;

select * from payment;

-- SELECT customer_id, first_name,
-- CASE
-- WHEN age >= 18 THEN 'Allowed'
-- END AS can_vote
-- FROM Customers;

select rental_id,amount,payment_id,
case
when amount = 0.99 then 'Due Payment'
when amount = 2.99 then 'Payment Reject'
ELSE 'Done(y) Payment'
end as Amount_Due
from payment;



------ 

-- Date() 
use cwp;

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(50),
    event_date DATE
);

INSERT INTO events(event_id, event_name, event_date)
VALUES
    (1, 'Meeting', '2023-01-15'),
    (2, 'Conference', '2023-02-20'),
    (3, 'Training', '2023-03-25'),
    (4, 'Workshop', '2023-04-10'),
    (5, 'Seminar', '2023-05-05');

select * from events;

SELECT CURDATE();

INSERT INTO events(event_id, event_name, event_date)
VALUES (6, 'Exam', CURDATE());

-- DATEDIFF(date1, date2):
SELECT event_name, DATEDIFF(event_date, CURDATE()) AS days_until_event FROM events;

-- DATE_ADD(date, INTERVAL value unit):
SELECT event_name, event_date, DATE_ADD(event_date, INTERVAL 7 DAY) AS new_date FROM events;

-- DATE_SUB(date, INTERVAL value unit):
SELECT event_name, event_date, DATE_SUB(event_date, INTERVAL 3 MONTH) AS new_date FROM events;

SELECT event_name, event_date, DATE_SUB(event_date, INTERVAL 3 year) AS new_date FROM events;
SELECT event_name, event_date, DATE_SUB(event_date, INTERVAL 3 day) AS new_date FROM events;
-- DATE_FORMAT(date, format)
SELECT event_name, DATE_FORMAT(event_date, '%d-%m-%y') AS formatted_date FROM events;
-- time()
-- NOW() 
SELECT NOW() AS current_datetime;
SELECT CURTIME();
-- Aggregate Function
select * from employees;

-- COUNT():
use p4n01;
select * from customers;
select count(creditlimit) as total_credit from customers;

SELECT COUNT(*) AS total_records
FROM employees;

-- SUM():
select sum(creditlimit) as total_credit from customers;

-- AVG():
select AVG(creditlimit) as total_credit from customers;

-- MIN():
select min(creditlimit) as min from customers;
-- max();
select max(creditlimit) as min from customers;

-- GROUP BY clause 
select * from customers;

select country,count(country) as total_country 
from customers
GROUP BY country;

select sum(creditlimit) as total_credit 
from customers
where country = "usa";

-- HAVING
SELECT city, SUM(creditlimit) AS TotalSales
FROM customers
GROUP BY city
HAVING SUM(creditlimit) > 50000;
 
SELECT city , sum(creditlimit) as total
FROM customers
GROUP BY city
HAVING SUM(creditlimit) > 0.0;

-- Joins
Create DATABASE codeswithpankaj;
use codeswithpankaj;

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
    (107, 7, '2023-01-19', 2900.00);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (108, 8, '2023-01-19', 2900.00);
    
Select * from customers;
Select * from orders;
-- SELECT c.FirstName, c.LastName, o.OrderDate
-- FROM Customers AS c
-- LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID;

select orders.orderid,orders.totalamount, 
customers.firstname,customers.email
from customers join orders
on customers.customerid = orders.customerid;

select orders.orderid,orders.totalamount, 
customers.firstname,customers.email
from customers 
left join orders
on customers.customerid = orders.customerid;

select orders.orderid,orders.totalamount, 
customers.firstname,customers.email
from customers 
right join orders
on customers.customerid = orders.customerid;

select orders.orderid,orders.totalamount, 
customers.firstname,customers.email
from customers 
INNER join orders
on customers.customerid = orders.customerid;


select orders.orderid,orders.totalamount, 
customers.firstname,customers.email
from customers 
left join orders
on customers.customerid = orders.customerid
UNION
select orders.orderid,orders.totalamount, 
customers.firstname,customers.email
from customers 
right join orders
on customers.customerid = orders.customerid;

-- SELECT *
-- FROM Customers
-- WHERE age = (
--   SELECT min(age)
--   FROM Customers
-- );

select * from orders
where totalamount =(
select max(totalamount)
from orders
);
