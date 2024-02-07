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






