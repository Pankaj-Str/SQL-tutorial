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



-- date : 29 May 2025

-- group by

use classicmodels;
select * from customers;

select country from customers group by country;

-- count()
select country,count(country) as total_customers from customers group by country;


-- distinct keyword

select distinct country from customers;

-- Constraints(keys)

create database db01;

use db01;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

INSERT INTO Customers (CustomerID, FirstName, LastName)
VALUES
    (1, 'Pankaj', 'Sharma'),
    (2, 'Nishant', 'Patel'),
    (3, 'Parag', 'Patel'),
    (4, 'Khushbu', 'Jain');
    
select * from customers;    


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
    
select * from orders;  

INSERT INTO Customers (CustomerID, FirstName, LastName)
VALUES(20, 'joy', 'Jain');

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES(100, 20, '2023-02-20');  



-- Date : 31 May 2025
-- join
-- left join

create database cwpc12;
use cwpc12;

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
    (5, 'Kritek', 'Singh', 'kritek@codeswithpankaj.com'),
    (6, 'Joy', 'Singh', 'joy@codeswithpankaj.com'),
    (7, 'khushbu', 'roy', 'khushbu@codeswithpankaj.com'),
    (8, 'parag', 'Singh', 'parag@codeswithpankaj.com'),
    (9, 'mitesh', 'kumar', 'mitesh@codeswithpankaj.com'),
    (10, 'lakshya', 'jain', 'lakshya@codeswithpankaj.com');
    
select * from customers;    



INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2023-01-15', 250.00),
    (102, 2, '2023-02-20', 120.50),
    (103, 3, '2023-03-10', 320.75),
    (105, 4, '2023-05-12', 2102.00),
    (111, 11, '2023-05-21', 2170.00),
    (112, 12, '2023-05-2', 2107.00),
    (113, 13, '2023-05-22', 2107.00);
    
select * from orders;    
select * from customers; 


select customers.customerid , customers.firstname , customers.email,
orders.orderdate, orders.totalamount 
from customers left join orders
on customers.customerid = orders.customerid; 



-- right join

select customers.customerid , customers.firstname , customers.email,
orders.orderdate, orders.totalamount 
from customers right join orders
on customers.customerid = orders.customerid; 
-- inner join 

select customers.customerid , customers.firstname , customers.email,
orders.orderdate, orders.totalamount 
from customers inner join orders
on customers.customerid = orders.customerid; 

-- full join

select c.customerid , c.firstname , c.email,
o.orderdate, o.totalamount 
from customers as c left join orders as o
on c.customerid = o.customerid 
union
select customers.customerid , customers.firstname , customers.email,
orders.orderdate, orders.totalamount 
from customers right join orders
on customers.customerid = orders.customerid; 



-- unions claus
-- truncate table 
