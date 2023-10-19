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




