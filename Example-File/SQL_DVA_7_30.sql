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

-- date :  7/3/2024

-- show database
show databases;
-- Create Database
create database p4n_employees; 
-- drop Database
drop database p4n_employees;
-- select Database
use p4n_employees;
-- create table 

create table info(
	id int,
    name varchar(20),
    city varchar(20),
    salary int
);

-- show table

show tables;

-- select table 
select * from info;

-- insert query 
insert into info values(1,'joy','mumbai',25000);
insert into info values(2,'joy1','mumbai',25000);
insert into info values(3,'joy2','mumbai',25000);
insert into info values(4,'joy3','mumbai',25000);


-- Date : 9 March 2023 
-- insert query 

use p4n_employees;

create table client (
	client_id int primary key,
    name varchar(10),
    city varchar(10)
);

insert into client values(101,'joy','mumbai');

select * from client;

create table client1 (
	client_id int primary key auto_increment,
    name varchar(10),
    city varchar(10)
);

insert into client1 (name,city) values('joy','mumbai');

select * from client1;

-- where 

use sakila;
select * from payment;

select * from payment
where amount = 4.99;

-- and operator
select * from payment
where amount = 4.99 and staff_id = 1;

-- or operator

select * from payment
where amount = 4.99 or staff_id = 1;

-- update query 

update payment
set amount = 12.0
where payment_id = 1;

select * from payment 
where payment_id = 1;


-- Date : 12 march 2024 
-- delete 
use sakila;
select * from payment;

-- DELETE FROM payment
-- WHERE payment_id = 3;

-- like 

select * from actor;

select * from actor 
where first_name like 'nick';

select * from actor 
where first_name like 'a%';

select * from actor 
where first_name like '%a';

select * from actor 
where first_name like '%a%';

-- top - limit
select * from actor 
limit 5;

-- order by

select * from payment;

select * from payment 
order by amount asc;

select * from payment 
order by amount desc;

select * from actor 
order by first_name asc;

select * from actor 
order by first_name desc;

-- group by

select amount  from payment
group by amount;


select amount , count(amount) as total_customers  from payment
group by amount;

-- distinct keyword

select distinct amount  from payment;

-- Date : 14 March 2024 

-- unions claus

show databases;
use cwp;
show tables;

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


select email from customers
union all
select email from suppliers;

-- truncate table 

select * from customers;
truncate customers;

-- having

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SalespersonName VARCHAR(50),
    SaleAmount DECIMAL(10, 2)
);
INSERT INTO Sales (SaleID, SalespersonName, SaleAmount)
VALUES
    (1, 'Pankaj', 100.00),
    (2, 'Nishant', 150.00),
    (3, 'Kiran', 200.00),
    (4, 'Tanvi', 100.00),
    (5, 'Kritek', 250.00); 

SELECT SalespersonName, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY SalespersonName
HAVING SUM(SaleAmount) > 200;

use sakila;

select payment_id , sum(amount) as total from payment
group by payment_id
having sum(amount) > 5;

