-- show list of databases
show databases;
-- create database

create database p4n;
-- delete database 
-- drop database p4n;
-- select database 
use p4n;

-- column
-- row
-- heading column

create table employee(
	id int,
    emp_name varchar(100),
    salary bigint,
    city varchar(100)
);

-- show table 
select * from employee;

-- enter single record into data table
insert into employee values(1,"joy",59800,"mumbai");

-- enter multipal
insert into employee values(1,"joy",59800,"mumbai") , (2,"toy",98800,"pune");


create table employee1(
	id int primary key,
    emp_name varchar(100),
    salary bigint,

    city varchar(100)
);

-- show table 
select * from employee1;

-- enter single record into data table
insert into employee1 values(1,"joy",59800,"mumbai");



-- Date 20 july 2024
-- show list of databases
show databases;
-- create database

create database p4n;
-- delete database 
-- drop database p4n;
-- select database 
use p4n;

-- column
-- row
-- heading column

create table employee(
	id int,
    emp_name varchar(100),
    salary bigint,
    city varchar(100)
);

-- show table 
select * from employee;

-- enter single record into data table
insert into employee values(1,"joy",59800,"mumbai");

-- enter multipal
insert into employee values(1,"joy",59800,"mumbai") , (2,"toy",98800,"pune");


create table employee1(
	id int primary key,
    emp_name varchar(100),
    salary bigint,

    city varchar(100)
);

-- show table 
select * from employee1;

-- enter single record into data table
insert into employee1 values(1,"joy",59800,"mumbai");




-- Update Query

show databases;

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



select * from p4n_emp;
-- Update the position and salary for EmployeeID 2
UPDATE p4n_emp
SET Position = 'Senior Software Engineer', Salary = 90000.00
WHERE EmployeeID = 2;

update p4n_emp set Salary = 10000 where firstname = "John";
-- SET SQL_SAFE_UPDATES = 0;
-- Delete Query

-- DELETE FROM table_name
-- WHERE condition;

delete from p4n_emp where employeeid = 1;
-- Sorting Results

show tables;

SELECT * from customers;

select * from customers order by creditlimit asc;

select * from customers order by creditlimit desc;


# sum()

select sum(creditlimit) from customers;


# and 

select * from customers where country = "USA" and creditlimit < 50000;

select sum(creditlimit) from customers where country = "USA" and creditlimit < 50000;


# or 
select * from customers where country = "USA" or creditlimit < 50000;

-- SQL - IS NOT NULL and
 -- NULL

select * from customers where state is null;

select * from customers where state is not null;

# count()

select count(customername) as total_customers from customers where state is null;
select count(customername) as total_customers from customers where state is not null;





-- https://github.com/Pankaj-Str/Front-end-Development-Tutorial/blob/main/MySQL/Dummy_DataBase.sql


use sakila;

-- show table 
show tables;
-- order by
-- asc

select * from payment order by amount asc;
-- desc
select * from payment order by amount desc;
-- update 
update payment set amount = 500 where payment_id = 3146;
-- where 
select * from payment where payment_id = 3146;
-- is null 
show tables;
select * from address where address2 is null;
-- is not null
select * from address where address2 is not null;
-- delete
-- cout()
select count(amount)  from payment;
select count(amount)  from payment where amount = 0.0;
-- sum()
select sum(amount) from payment;

-- and 
use classicmodels;
select * from customers;
select * from customers where country = "USA" and creditlimit > 50000;
select count(creditlimit) from customers where country = "USA" and creditlimit > 50000;
select * from customers where country = "USA" and creditlimit > 50000 
order by creditlimit desc;

select sum(creditlimit) from customers where country = "USA" and creditlimit > 50000;
-- or 
select customername , city , country , state , creditlimit, creditlimit+500 as total_amount 
from customers 
where country = "USA" and creditlimit > 50000;
-- Distinct
select distinct city from customers;
select distinct count(city) from customers;


-- Group by
-- Having
-- in 
-- like  
-- union 
-- limit/top
-- not 



