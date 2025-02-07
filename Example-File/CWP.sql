create database cwpc;
use cwpc;

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


select * from p4n_emp;

-- delete 

delete from p4n_emp
where EmployeeID = 3;

-- update 

update p4n_emp
set Salary = 45000
where EmployeeID = 4;


-- check database
show databases;


-- where 

use classicmodels;

select * from customers;

show tables;

select * from customers where country = "USA";

-- and 
select * from customers where country = "USA" and state = "NY";
-- or 
select * from customers where country = "USA" or creditlimit > 100000;

select * from customers where country = "USA" and creditlimit > 100000;

select * from customers where city = "NYC" and creditlimit < 100000;


select customerName,city,state,country,creditlimit, creditlimit+50000 as update_creditlimit
from customers where city = "NYC" ;

-- limit
select * from customers
limit 5;

-- ORDER BY

select * from customers order by creditlimit asc; 
select * from customers order by creditlimit desc; 

select * from customers order by customername asc; 
select * from customers order by customername desc;




-- Introduction to SQL
-- Create, Drop and Select Database
-- CREATE OR DROP TABLE
-- SQL INSERT Query
-- SQL SELECT Query
-- SQL WHERE Clause
-- SQL AND and OR Operators
-- SQL UPDATE Query
-- SQL DELETE Query

-- SQL LIKE Clause

use classicmodels;
select * from customers;

select * from customers where customername like "a%";
select * from customers where customername like "%a%";
select * from customers where customername like "%e";

-- SQL TOP Clause - limit

select * from customers limit 5;
-- SQL ORDER BY Clause
select * from customers order by creditlimit asc;
select * from customers order by creditlimit desc;
-- SQL Group By
-- count()

select Country from customers group by country;

select country , count(Country) as total_country from customers group by country;
 
-- SQL Distinct Keyword

select distinct country from customers;

-- SQL Constraints (key)
	-- Unique Key
    -- Primary Key
    -- Foreign Key
-- SQL HAVING CLAUSE

select country, sum(creditlimit) as total_sum
from customers group by country;

select country, sum(creditlimit) as total_sum
from customers group by country having sum(creditlimit) > 200000;

-- SQL Joins
-- SQL Unions Clause
-- SQL TRUNCATE TABLE -- epmty table
-- SQL Transactions





