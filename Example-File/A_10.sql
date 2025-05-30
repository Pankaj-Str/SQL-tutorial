-- show database
show databases;
-- create database 
create database cwpc10;
-- select database 
use cwpc10;
-- delete database
-- drop database cwpc10;

-- cerate table 

create table employee(
	id int,
    name varchar(50),
    city varchar(50),
    dob date,
    salary int
);

-- show tables into database 

show tables;

-- open table str
select * from employee;

-- Date : 14 - 05 - 2025
-- Insert data into table 

use cwpc10;

show tables;

select * from employee;

-- insert data into table

insert into employee (id,name,city,dob,salary) 
value(1,"joy","mumbai","1990-12-23",450000);

-- use primary key

create table employee1(
	id int primary key,
    name varchar(50),
    city varchar(50),
    dob date,
    salary int,
    mobile_no varchar(50)
);

select * from employee1;
insert into employee1 (id,name,city,dob,salary,mobile_no) 
value(2,"joy","mumbai","1990-12-23",450000,"925266000");


create table employee2(
	id int primary key auto_increment,
    name varchar(50),
    city varchar(50),
    dob date,
    salary int,
    mobile_no varchar(50) unique key,
    dept ENUM('sale', 'hr', 'it')
);

select * from employee2;
insert into employee2 (name,city,dob,salary,mobile_no,dept) 
value("joy","mumbai","1990-12-23",450000,"925636000","hr");

insert into employee2 (id,name,city,dob,salary,mobile_no) 
value(101,"joy","mumbai","1990-12-23",450000,"922666000");

-- delete all record from table 

truncate employee2;

-- delete table 

drop table employee2;



-- Date : 19 - 05 - 2025 
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


-- Topic : 
-- -- where 

show databases;
use classicmodels;

-- list of tables 
show tables;

select * from customers;

select * from customers where country = "USA";

select * from customers where creditlimit > 100000;

-- -- and operator
select * from customers where creditlimit > 100000 and country = "USA";
-- -- or operator
select * from customers where creditlimit > 100000 or country = "USA";

select * from customers where creditlimit = 0.0;

-- sum()
select sum(creditlimit) from customers where country = "USA";
select sum(creditlimit) from customers;


-- count()
select count(country) from customers where country = "USA";


-- date : 28 May 2025

-- where 

use classicmodels;
show tables;

select * from customers;
-- and operator
select * from customers where country = "USA" and creditlimit <50000;
-- or operator
select * from customers where country = "USA" or creditlimit <50000;
-- update query
update customers
set  creditlimit = 450000 where customernumber = 125; 

select * from customers where customernumber = 125;

-- delete 

-- like 

select * from customers where customername like "aut%";
select * from customers where customername like "%a%";
select * from customers where customername like "%e";

-- top (Limit)

select * from customers limit 5;
-- order by
select customername , creditlimit from customers order by creditlimit asc;
select customername , creditlimit from customers order by creditlimit desc;
select customername , creditlimit from customers order by customername desc;
select customername , creditlimit from customers order by customername asc; 



-- group by

use classicmodels;
select * from customers;

select country from customers group by country;

-- count()
select country , count(country) as total_customer from customers group by country;
-- sum()
select sum(creditlimit) as total_credit_limit from customers where country = "USA";

-- distinct keyword
select distinct country from customers;

-- Constraints (key)

-- Foreign Key

create database db009;
use db009;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Inserting records into the "Customers" and "Orders" tables
INSERT INTO Customers (CustomerID, FirstName, LastName)
VALUES
    (1, 'Pankaj', 'Sharma'),
    (2, 'Nishant', 'Patel');
    
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
    
select * from customers;    
select * from orders;    


INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES(100, 10, '2023-01-16');

INSERT INTO Customers (CustomerID, FirstName, LastName)
VALUES(10, 'Joy', 'jain');

