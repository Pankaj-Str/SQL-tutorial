

create database p4n;
use p4n;
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
-- 1	Insert Query
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
-- 2	Select Query

select * from p4n_emp;
-- 5	Update Query
-- Update the position and salary for EmployeeID 2
UPDATE p4n_emp
SET Position = 'Senior Software Engineer', Salary = 90000.00
WHERE EmployeeID = 2;
-- 6	Delete Query
delete from p4n_emp
where employeeid = 3;

-- where 

use sakila;

select * from payment;

select * from payment 
where amount = 2.99;

select payment_id,amount,payment_date,rental_id from payment
where amount = 2.99;

-- =
-- >
select payment_id,amount,payment_date,rental_id from payment
where amount > 2.99;
-- <
select payment_id,amount,payment_date,rental_id from payment
where amount < 2.99;
-- <=
select payment_id,amount,payment_date,rental_id from payment
where amount <= 2.99;
-- >=
select payment_id,amount,payment_date,rental_id from payment
where amount >= 2.99;

-- AND & OR

select payment_id,amount,payment_date,rental_id from payment
where amount > 2.99 and amount < 4.99;


select payment_id,amount,payment_date,rental_id from payment
where amount < 2.99 and rental_id < 5000;


select payment_id,amount,payment_date,rental_id from payment
where amount < 2.99 or rental_id < 5000;

-- top 

select * from payment 
limit 5;


-- ORDER BY

select * from payment 
order by amount asc;

select * from payment 
order by amount desc;

select * from actor
order by first_name asc;

select * from actor 
order by first_name desc;


-- SQL - Distinct Clause

use sakila;

select * from payment;

-- count()

select count(payment_id) as total_row from payment;

select * from payment 
where amount = 2.99;


select count(amount) as total_customers from payment 
where amount = 2.99;

select amount from payment;

select distinct amount from payment;

-- SQL - Group By Clause

select amount , count(amount) as total_customers from payment
group by amount;

-- sum()
select sum(amount) as total from payment;

select sum(amount) as total_customer 
from payment 
where amount = 2.99;

-- SQL - LIKE Operator

select * from actor;

select * from actor 
where first_name = "Nick";


select * from actor where first_name like "A%";

select * from actor where first_name like "%A%";

select * from actor where first_name like "%A";

select * from actor where first_name like "G%A%";

select * from actor where first_name like "a__%";

-- is null 

select * from address
where address2 is null;

select * from address
where address2 is not null;

DESC address;

show tables;

-- SQL - Having Clause

-- SQL - IN Operator
-- SQL - NOT Operator
-- SQL - NOT EQUAL
-- SQL - IS NOT NULL and NULL
-- SQL - UNION And UNION ALL


-- list of database 
show databases;
-- create database
create database p4n_01;
-- select database
use p4n_01;
-- create table
create table employee(
	id int,
    name varchar(20),
    city varchar(20),
    salary bigint
);

-- list of table 
show tables;

-- select table 
select * from employee;

-- enter record into table 

insert into employee (id,name,city,salary) values(103,"joy4","mumbai",34000);
insert into employee (id,name,city,salary) values(102,"joy3","pune",45677);
insert into employee (id,name,city,salary) values(104,"joy2","surat",80000);
insert into employee (id,name,salary) values(105,"joy1",34000);

-- where
use sakila;
show tables;

select * from payment;
-- step 1 
select payment_id, rental_id, amount from payment;
-- step 2
select payment_id, rental_id, amount from payment 
where amount <= 3.00;
-- step 3
select payment_id, rental_id, amount , amount + 100  as update_amount from payment 
where amount <= 3.00;
-- step 4
select payment_id, rental_id, amount , ((amount*18/100)+100)+amount  as update_amount_WithGST from payment 
where amount <= 3.00;

-- Date : 24 April 2023

-- SQL - UNION And UNION ALL

show databases;

use p4n;

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
union   
select email from suppliers;


-- in operator

use sakila;


select * from payment
where amount in (2.99,0.99);

-- View

create view amount_01 as 
select amount,payment_id,rental_id , amount+100 as total_amount 
from payment where amount in (2.99,3.99);

-- calling view
select * from amount_01;



    
 






