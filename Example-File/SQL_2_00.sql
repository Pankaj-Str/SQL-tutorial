-- cerate database
create database cwpc;
-- list of database 
show databases;
-- delete database 
-- drop database cwpc;
-- select database 
use cwpc;

-- create table 
-- column name 
-- Datatype

-- example 

create table Employee(
	id int,
    name varchar(50),
    age int,
    city varchar(50),
    dob date,
    salary decimal(5,2)
);

-- show tables list 
show tables;

-- show table
select * from Employee;

-- insert record into table
insert into Employee values(101,"Nishant",23,"Mumbai","1990-8-23",50.00);
insert into Employee values(102,"Rohan",56,"Pune","1991-8-23",80.00);
insert into Employee values(103,"Hitesh",96,"Surat","1956-8-23",78.00);
insert into Employee values(104,"Riya",52,"Jaipur","1996-8-23",56.00);


-- Date : 26 Feb 2025
create table Employee1(
	id int primary key,
    name varchar(50),
    age int,
    city varchar(50),
    dob date,
    salary decimal(10,2)
);

select * from employee1;

insert into employee1 values(102,"Nisha",20,"Pune","1990-11-23",56000.00);

-- final tables 
use cwpc;
create table cwpc_emp(
	id int primary key auto_increment,
    name varchar(50),
    age int,
    city varchar(50),
    dob date,
    salary decimal(10,2),
    email varchar(20) unique key,
    mobile varchar(30) unique key
);
select * from cwpc_emp;

insert into cwpc_emp (name,age,city,dob,salary,email,mobile) 
values("Tina",20,"Pune","2002-11-23",56000.00,"tina@p4n.in","7896541233"),
("Rohan",15,"mumbai","2005-11-23",45000.00,"rohan@p4n.in","4585698785"),
("Shubham",20,"mumbai","2000-11-23",5000.00,"shubham@p4n.in","4561236985"),
("Riya",45,"bhuj","1990-05-23",89000.00,"riya@p4n.in","4569874585");

-- empty table 
truncate cwpc_emp;
-- delete table 
drop table cwpc_emp;

-- delete query 
delete from cwpc_emp where id = 4;

-- update query

update cwpc_emp
set Salary = 96000.00 
where id = 1;

-- check records
select * from cwpc_emp;

-- Example 

insert into cwpc_emp (name,age,city,dob,salary,mobile) 
values("heena",20,"Surat","1998-11-23",45000.00,"7856987455");



-- Date : 27 Feb 2025

-- 1. Introduction to Database
-- 2. Introduction to SQL
-- 3. Create, Drop and Select Database
-- 4. CREATE OR DROP TABLE
-- 5. SQL INSERT Query
-- 6. SQL SELECT Query
-- 7. SQL WHERE Clause
-- 9. SQL UPDATE Query
-- 10. SQL DELETE Query

show databases;
use classicmodels;
-- list of tables
show tables;
select * from customers;

-- find the customer from usa
-- = 
select * from customers where country = "USA";
-- < , >
select * from customers where creditlimit > 50000;
select * from customers where creditlimit < 50000;

-- 8. SQL AND, OR Operators

select * from customers where creditlimit < 50000 and country = "USA";

select * from customers where creditlimit < 50000 or country = "USA";

-- count()
select count(customername) from customers where creditlimit < 50000 and country = "USA";

-- Example Country USA credit limit - 1500
select customername,city,state,country,creditlimit from customers;

select customername,city,state,country,creditlimit , creditlimit - 1500 as Update_amount 
from customers where country = "USA" and city = "NYC";

-- Date : 28 Feb 2025
-- 11. SQL LIKE Clause
use classicmodels;
select * from customers where customername like "a%";
select * from customers where customername like "%a%";
select * from customers where customername like "%s";

-- 12. SQL TOP Clause - Limit 

select * from customers limit 5;

-- 13. SQL ORDER BY Clause

select * from customers order by customername asc;
select * from customers order by customername desc;
select * from customers order by creditlimit desc;
select * from customers order by creditlimit asc;

-- 14. SQL Group By

select country from customers group by country;

-- count()
select country , count(country) as total_number from customers group by country;
select country , count(country)  as total_number from customers group by country order by count(country) desc;

-- sum()
select sum(creditlimit) as total from customers;


select country , count(country) as total_number , sum(creditlimit) from customers group by country;

-- 15. SQL Distinct Keyword

select distinct country from customers;

-- 16. SQL Constraints key


use cwpc;

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
    
select * from customers;    
select * from orders;    

-- 17. SQL Joins

-- 17. SQL Joins

-- Date : 04 March 2025
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
    (6, 'Riya', 'Jain', 'riya@codeswithpankaj.com');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2023-01-15', 250.00),
    (102, 2, '2023-02-20', 120.50),
    (103, 3, '2023-03-10', 320.75),
    (105, 4, '2023-05-12', 210.00),
    (107, 7, '2023-10-11', 510.00),
    (108, 8, '2023-08-15', 910.00);
    
select * from customers;    
select * from orders; 
-- left join
select customers.firstname,customers.email,orders.totalamount, orders.orderdate
from customers left join orders
on customers.customerid = orders.customerid;
   
-- right join
select customers.firstname,customers.email,orders.totalamount, orders.orderdate
from customers right join orders
on customers.customerid = orders.customerid;

-- inner join
select customers.firstname,customers.email,orders.totalamount, orders.orderdate
from customers inner join orders
on customers.customerid = orders.customerid;

-- full join
select customers.firstname,customers.email,orders.totalamount, orders.orderdate
from customers left join orders
on customers.customerid = orders.customerid
union
select customers.firstname,customers.email,orders.totalamount, orders.orderdate
from customers right join orders
on customers.customerid = orders.customerid;

-- 18. SQL Unions Clause

-- 19. SQL TRUNCATE TABLE

-- 20. SQL HAVING Clause

-- 21. SQL Transactions

-- 22. SQL View

-- 23. SQL Useful Functions
