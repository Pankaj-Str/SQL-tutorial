-- 1	Create Database
CREATE DATABASE p4n;
-- 2	Show Databases
show DATABASES;
-- 3	Drop Database
DROP DATABASE p4n;
-- 4	Rename Database
-- ALTER DATABASE old_database_name RENAME TO new_database_name;
-- 5	Select Database
use p4n;

-- create table 
CREATE TABLE p4n_employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    Email VARCHAR(255),
    Phone VARCHAR(15),
    Address TEXT,
    DepartmentID INT,
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE,
    TerminationDate DATE,
    ManagerID INT,
    SocialSecurityNumber VARCHAR(20)
);

-- show table 
select * from employees;

DESC employees;

-- DELETE from employees;

-- DROP TABLE employees;

TRUNCATE TABLE employees;

ALTER TABLE p4n_employee RENAME TO employees;

-- Date 11 nov 2023

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

-- check table 
select * from p4n_emp;
-- insert records 

INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position, Salary)
VALUES
(1, 'John', 'Doe', '1990-05-15', 'Male', 'johndoe@example.com', '555-555-5555', '123 Main St, City, State', 101, 'Manager', 75000.00);

INSERT INTO p4n_emp VALUES
(2, 'Joy', 'John', '1990-05-15', 'Male', 'johndoe@p4n.com', '555-555-5556', '123 Main St, City, State', 101, 'Manager', 75000.00);

INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position)
VALUES (3, 'Joy', 'John', '1990-05-15', 'Male', 'johndoe@p4n.com', '555-555-5556', '123 Main St, City, State', 101, 'Manager');

INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Phone, Address, DepartmentID, Position, Salary)
VALUES
(5, 'John', 'Doe', '1990-05-15', 'Male','555-555-5555', '123 Main St, City, State', 101, 'Manager', 75000.00);


CREATE TABLE p4n_emp1 (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
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
INSERT INTO p4n_emp1 VALUES (1,'Joy', 'John', '1990-05-15', 'Male', 'johndoe@p4n.com', '555-555-5556', '123 Main St, City, State', 101, 'Manager', 75000.00);

INSERT INTO p4n_emp1 (FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position, Salary)
VALUES('John', 'Doe', '1990-05-15', 'Male', 'johndoe@example.com', '555-555-5555', '123 Main St, City, State', 101, 'Manager', 75000.00);

select * from p4n_emp1;

TRUNCATE TABLE p4n_emp1;


-- date 14 nov 2023
use p4n;

select * from p4n_emp;

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
-- update data from table 
UPDATE p4n_emp
set email = "xyz@p4n.in";

-- check table 

select * from p4n_emp;

-- TRUNCATE TABLE p4n_emp;

update p4n_emp
set email = "David@p4n.in"
where employeeid = 5;

update p4n_emp
set email = "john@p4n.in" , salary = 56000
where employeeid = 1;

DELETE FROM p4n_emp
where employeeid = 5;

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

-- Inserting records into the "Customers" and "Orders" tables
INSERT INTO Customers (CustomerID, FirstName, LastName)
VALUES
    (1, 'Pankaj', 'Sharma'),
    (2, 'Nishant', 'Patel');

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
    (101, 1, '2023-01-15'),
    (102, 2, '2023-02-20');
    
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES (103, 4, '2023-10-12');

select * from customers;
select * from orders;

select customers.firstname,customers.lastname, orders.orderDate
from customers , orders
where customers.customerid  = orders.customerid;

update customers
set customerid = 4
where firstname = "nishant";

select * from customers 
where customerid = 1;
select * from orders 
where customerid = 1;


-- date 16 Nov 2023
use p4n01;

--  SELECT statement

SELECT * from customers;

SELECT customername,phone,customernumber,city,creditlimit
from customers; 

SELECT customername,phone,customernumber,city,creditlimit, 
creditlimit*2 as update_credit_limit
from customers;

-- function call in select 
SELECT min(creditlimit) as low_credit
from customers;

SELECT max(creditlimit) as h_credit
from customers;

--  WHERE clause search condition

SELECT customername,phone,customernumber,city,creditlimit
from customers
WHERE creditlimit < 20000; 

--  Arithmetic, Comparison and Logical operator

SELECT customername,phone,customernumber,city,creditlimit
from customers
WHERE creditlimit < 50000 and creditlimit > 0; 

--  Range operator
SELECT customername,phone,customernumber,city,creditlimit
from customers
WHERE creditlimit BETWEEN 1 and 40000;

--  List operator (SHOW TABLES)
SHOW tables;
SHOW full tables;

-- ORDER BY ASC

SELECT customername,phone,customernumber,city,creditlimit
from customers
ORDER BY creditlimit asc;

SELECT customername,phone,customernumber,city,creditlimit
from customers
ORDER BY customername asc;

-- orderby DESC

SELECT customername,phone,customernumber,city,creditlimit
from customers
ORDER BY customername desc;

-- DISTINCT
SELECT DISTINCT creditlimit
from customers;

-- TOP , LIMIT

select * from customers;
SELECT *
FROM Customers
ORDER BY Customernumber desc
LIMIT 5;


-- example 

show tables;
SELECT * from payments;
SELECT DISTINCT customernumber, count(customernumber) as total_customer
from payments
GROUP BY customernumber;

--  Like operator
use p4n01;
show tables;
select * from customers;

-- like %_ , _% , %_%
-- _%
select * from customers
where customername 
like "a%";

-- %_
select * from customers
where customername 
like "%e";

-- %_%
select * from customers
where customername 
like "%a%";

select * from customers
where customername 
like "%a_";

select * from customers
where customername 
like "__a%";

select * from customers
where contactlastname 
like "_____l";

select * from customers
where customername 
like "___tr__%";


--  Using IS NULL and IS NOT NULL

select * from customers
where state is null and addressline2 is null;

select * from customers
where state is not null;

-- Various other clauses (Views,union)

CREATE view find_data as
select * from customers
where customername 
like "___tr__%";

select * from find_data;

-- union

show tables;

select * from orders;
select * from payments;
 
select customernumber,ordernumber from orders
union
select customernumber,amount from payments;
 
select customernumber,ordernumber from orders
union all
select customernumber,amount from payments;
 




    


