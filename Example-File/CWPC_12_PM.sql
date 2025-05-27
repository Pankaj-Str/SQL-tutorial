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




-- create database 
create database cwpc;
use cwpc;

-- create table 

create table employee(
	id int primary key auto_increment,
    name varchar(50),
    dob date,
    dept enum("sales","hr","it","other"),
    email varchar(50) unique key,
    mobile varchar(40) unique key,
    salary int
);

-- show table record 
select * from employee;

-- insert record 
insert into employee (name,dob,dept,email,mobile,salary)
values("joy","1990-11-14","sales","joy@cwpc.in","78585547",56000),
("toy","1990-11-14","hr","toy@cwpc.in","78785547",45000),
("roy","1990-11-14","hr","roy@cwpc.in","78581547",89000),
("koy","1990-11-14","other","koy@cwpc.in","73185547",90000);




use classicmodels;

show tables;

select * from customers;

-- where 
select * from customers where country = "USA";

select * from customers where creditlimit > 50000;

-- and operator

select * from customers 
where country = "USA" and creditlimit > 50000;
-- or operator

select * from customers 
where country = "USA" or creditlimit > 100000;



-- SQL Date : 27 May 2025

use classicmodels;

show tables;
select * from orders;
select * from orderdetails;

select orderdetails.productcode ,orderdetails.priceEach,
orders.orderdate, orders.customernumber from orders,orderdetails;



-- update query 
select * from orderdetails;
select * from orderdetails where productcode = "S18_2248";

update orderdetails 
set priceeach = 500 
where productcode = "S18_2248";

-- delete 

create database p4n;
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

-- Delete the employee with EmployeeID 3
DELETE FROM p4n_emp
WHERE EmployeeID = 3;


-- Update the position and salary for EmployeeID 2
UPDATE p4n_emp
SET Position = 'Senior Software Engineer', Salary = 90000.00
WHERE EmployeeID = 2;

-- like 

use classicmodel;
select * from customers  where  customername  like  "a%";
select * from customers  where  customername  like  "roy%";
select * from customers  where  customername  like  "%a%";
select * from customers  where  customername  like  "%e";

-- top (limit)

select * from customers limit 5;

-- order by
select customername,creditlimit from customers order by creditlimit asc;
select customername,creditlimit from customers order by creditlimit desc;

select customername,creditlimit from customers order by customername asc;
select customername,creditlimit from customers order by customername desc;







