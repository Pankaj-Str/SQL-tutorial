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


-- Date - 18 April 2025
-- show list of database 
show databases;
-- Create Database 
create database cwpc01;
-- drop Database
drop database cwpc01;
-- select Database
use cwpc01;
-- create table 
-- column name  
-- data 
-- table name 
create table Employee(
	id int, 
    name varchar(50),
    salary int,
    city varchar(50)
);

-- show list of table
show tables;

-- show table 
select * from Employee;
 


-- Date 23 - April - 2025
-- show list of database
show databases;
-- create database
create database Company;
-- drop database (delete database)
-- drop database Company;
-- select database 
use Company;
-- create table 
create table employee(
	id int,
    name varchar(50),
    dob date,
    salary int,
    dept enum('sales','hr','it','other'),
    city varchar(50),
    email varchar(50)
);

-- show list of table
show tables;

-- open table and show record
select * from employee;

delete from employee where id = 2;

-- insert record into table 
insert into employee (id,name,dob,salary,dept,city,email) 
value(1,'Joy','1990-05-23',34000,'sales','mumbai','joy@cwpc.in');

-- insert multipal records
insert into employee (id,name,dob,salary,dept,city,email) 
values (2,'Toy','1990-05-13',56000,'hr','pune','toy@cwpc.in'),
(3,'Rohan','1985-05-13',55000,'hr','pune','rohan@cwpc.in'),
(4,'Tina','1958-05-13',51000,'sales','surat','tina@cwpc.in'),
(5,'Nir','1963-05-13',52000,'other','bhuj','nir@cwpc.in'),
(6,'Yuo','2000-05-13',50000,'hr','goa','yuo@cwpc.in');




-- use primary key

create table employee1(
	id int primary key,
    name varchar(50),
    dob date,
    salary int,
    dept enum('sales','hr','it','other'),
    city varchar(50),
    email varchar(50)
);

-- show list of table
show tables;

-- open table and show record
select * from employee1;

-- insert record into table 
insert into employee1 (id,name,dob,salary,dept,city,email) 
value(2,'Joy','1990-05-23',34000,'sales','mumbai','joy@cwpc.in');



-- Date 25 April 2025

show databases;

use classicmodels;

-- show list of tables
show tables;

select * from customers;

-- where 

select * from customers where state  = "CA";
select * from customers where creditlimit  > 70000;

-- and operator

select * from customers where state = "CA" and creditlimit  > 70000;

-- or operator
select * from customers where state = "CA" or creditlimit  > 70000;
-- update query 
select customername,state ,phone,creditlimit from customers where state = "CA";
select customername,state ,phone,creditlimit , creditlimit+500 as update_creditLimit from customers where state = "CA";
-- delete 
select * from customers where contactlastName = "King";

-- SET SQL_SAFE_UPDATES = 0;


-- 28 April 2025
-- like 

use classicmodels;

show tables;
-- select table customers
select * from customers;

select * from customers where customername like "a%";
select * from customers where customername like "%a%";
select * from customers where customername like "%e";
select * from customers where customername like "mini%";


-- top (limit)

select * from customers limit 5;

-- order by

select customername , creditlimit from customers order by creditlimit asc;
select customername , creditlimit from customers order by creditlimit desc;

select customername , creditlimit from customers order by customername desc;
select customername , creditlimit from customers order by customername asc;

select customername , creditlimit from customers order by creditlimit asc limit 5;

-- group by
select country , count(country) as total_customers from customers group by country;

-- distinct keyword
select distinct country from customers;

-- count()
select distinct count(country) from customers;


-- sum() 

select sum(creditlimit) as total_cd from customers  where country = "USA";

-- Date : 30 April 2025
-- Constraints
create database cwpc009;

use cwpc009;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

-- Inserting records into the "Students" table
INSERT INTO Students (FirstName, LastName, Email)
VALUES
    ('Pankaj', 'Sharma', 'pankaj@codeswithpankaj.com'),
    ('Nishant', 'Patel', 'nishant@codeswithpankaj.com'),
    ('Kiran', 'Desai', 'kiran@codeswithpankaj.com');
    
select * from students;    

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    mobile VARCHAR(50) unique
);

-- Inserting records into the "Customers" and "Orders" tables
INSERT INTO Customers (CustomerID, FirstName, mobile)
VALUES
    (1, 'Pankaj', '78789714'),
    (2, 'Nishant', '44789465');
    
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
); 

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
    (101, 1, '2023-01-15'),
    (102, 2, '2023-02-20');   


INSERT INTO Customers (CustomerID, FirstName, mobile)
VALUES
    (3, 'Joy', '79789714');

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
    (105, 3, '2023-01-15');

select * from orders;
select * from customers;

-- unions claus


CREATE TABLE Customers1 (
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

INSERT INTO Customers1 (CustomerID, FirstName, LastName, Email)
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
    
    
select * from customers1;    
select * from suppliers;    


SELECT Email FROM Customers1
UNION
SELECT Email FROM Suppliers;

-- truncate table 

truncate table customers;
