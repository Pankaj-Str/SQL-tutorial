-- create database
create database p4n_02;
-- list of database
show databases;
-- drop database
drop database p4n_02;
-- select database
use p4n_02;

-- create table

create table employee(
	id int,
    name varchar(50),
    city varchar(50),
    salary int
); 

-- show table 
select * from employee;

insert into employee values(1,"joy","pune",35000); 

-- create table

create table employee1(
	id int primary key,
    name varchar(50),
    city varchar(50),
    salary int
); 

-- show table 
select * from employee1;

insert into employee1 values(2,"joy","pune",35000); 

create table employee3(
	id int primary key auto_increment,
    name varchar(50),
    city varchar(50),
    salary int
); 

-- show table 
select * from employee3;

insert into employee3 (name,city,salary) values("joy","pune",35000); 

-- empty table
truncate table employee3;

-- delete table
drop table employee3;

-- list of table 
show tables;

-- rename table 
ALTER TABLE employee2 RENAME TO emp;

-- update query

CREATE TABLE p4n_emp (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Email VARCHAR(255),
    Phone VARCHAR(15),
    Address VARCHAR(255),
    DepartmentID INT,
    Position VARCHAR(255),
    Salary DECIMAL(10, 2)
);

select* from p4n_emp;

-- Inserting the first record
INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position, Salary)
VALUES
(1, 'John', 'Doe', '1990-05-15', 'Male', 'johndoe@example.com', '555-555-5555', '123 Main St, City, State', 101, 'Manager', 75000.00);

-- Inserting the second record
INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position, Salary)
VALUES
(2, 'Jane', 'Smith', '1985-08-20', 'Female', 'janesmith@example.com', '555-555-5556', '456 Oak St, City, State', 102, 'Sales Representative', 60000.00);

-- Inserting the third record
INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position, Salary)
VALUES
(3, 'Michael', 'Johnson', '1992-03-10', 'Male', 'michael@example.com', '555-555-5557', '789 Elm St, City, State', 103, 'Software Engineer', 80000.00);

-- Inserting the fourth record
INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position, Salary)
VALUES
(4, 'Emily', 'Wilson', '1988-11-25', 'Female', 'emily@example.com', '555-555-5558', '101 Pine St, City, State', 102, 'Sales Manager', 90000.00);

-- Inserting the fifth record
INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position, Salary)
VALUES
(5, 'David', 'Brown', '1995-07-05', 'Male', 'david@example.com', '555-555-5559', '222 Cedar St, City, State', 104, 'HR Specialist', 65000.00);


-- Update the position and salary for EmployeeID 2
-- UPDATE p4n_emp
-- SET Position = 'Senior Software Engineer', Salary = 90000.00;

-- when show error
SET SQL_SAFE_UPDATES = 0;

-- show table 
select * from p4n_emp;

truncate table p4n_emp;

update p4n_emp
set salary = 10000
where employeeid = 1;


-- date : 7 feb 2024

show databases;
use sakila;
-- show table list 
show tables;
select * from payment;

-- where 
-- find data from table 
select * from payment
where amount = 2.99;

select payment_id,customer_id,amount from payment
where amount = 2.99;

-- and
select * from payment 
where amount = 2.99 AND customer_id < 50;
-- or 
select * from payment 
where amount = 2.99 or customer_id < 4;
-- not 
select * from payment 
where  not amount  = 2.99; 
-- DISTINCT
select distinct amount from payment; 
-- in

select * from payment
where amount in (2.99,0.00);

-- between
select * from payment 
where amount between 0.00 and 2.99;

-- date : 9 feb 2024

-- limit top , fatch first 
use sakila;

select * from payment;

select * from payment 
limit 3;

-- group by 

select amount from payment;

select amount from payment
group by amount;

-- count()

select amount , count(amount) as total_numbers 
from payment
group by amount;

-- like 


select * from actor
where first_name like 'zero';

select * from actor
where first_name like 'a%';

select * from actor
where first_name like '%a';

select * from actor
where first_name like '%a%';



-- order by 
select * from payment
order by amount asc;

select * from payment
order by amount desc;

select * from actor;

select * from actor
order by first_name asc;

select * from actor
order by first_name desc;

-- date : 13 feb 2024
# UNION

create database company;
use company;

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
    
INSERT INTO Suppliers (SupplierID, CompanyName, Email)
VALUES(104, 'ABC Inc1.', 'abc@codeswithpankaj.com');

SELECT Email FROM Customers
UNION
SELECT Email FROM Suppliers;

SELECT Email FROM Customers
UNION all
SELECT Email FROM Suppliers;

# Subquery

-- SELECT *
-- FROM Customers
-- WHERE age = (
-- SELECT min(age)
-- FROM Customers);
select * from payment where 
amount = (
select min(amount) from payment	
);

select * from payment where 
amount = (
select max(amount) from payment	
);

# HAVING
# MIN() and MAX()

use sakila;

select * from payment;

select min(amount) as min_amount from payment;
select max(amount)  from payment;

# SUM() AND AVG()
select sum(amount) from payment;
select avg(amount)  from payment;


-- date : 15 Feb 2023
-- 1	Full Join
create database db1;
use db1;

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
    
    
select * from customers;
select * from orders;    

-- full join
-- LEFT JOIN to get all customers and their orders
SELECT c.FirstName, c.LastName, o.OrderDate
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID
UNION ALL
-- RIGHT JOIN to get all orders and their associated customers
SELECT c.FirstName, c.LastName, o.OrderDate
FROM Customers AS c
RIGHT JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE c.CustomerID IS NULL;

-- 2	Inner Join
SELECT c.FirstName, c.LastName, o.OrderDate
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID;

-- 3	Left Join

select orders.totalamount,customers.firstname,customers.email
from customers
left join orders
on orders.customerid = customers.customerid;

-- 4	Right Join

select orders.totalamount,customers.firstname,customers.email
from customers
right join orders
on orders.customerid = customers.customerid;


-- having
use sakila;

SELECT COUNT(amount), amount
FROM payment
GROUP BY amount
HAVING COUNT(amount) > 1000;

select * from payment;

