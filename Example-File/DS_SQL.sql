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

-- date : 18 sep 2025
-- list of database 
show databases;
-- create a database
create database CWPC11;
-- select database
use CWPC11;
-- delete 
-- drop database CWPC11;
-- Date : 30 Sep 2025

-- create a table

create table Employee(
	id int,
    name varchar(100),
    salary int,
    city varchar(100),
    dept enum('sales','hr','other'),
    dob date
);

-- show list tables
show tables;
-- show table record 
select * from employee;

-- insert record into table 
insert into employee (id,name,salary,city,dept,dob) 
value(101,'Joy',25000,'Mumbai','sales','1990-12-01'),
(102,'toy',45000,'pune','other','1995-12-01'),
(103,'roy',65000,'surat','hr','1991-12-01'),
(104,'koy',75000,'goa','sales','1992-12-01'),
(105,'boy',95000,'bhuj','sales','1993-12-01');
 







-- 2nd way

create table Employee1(
	id int primary key,
    name varchar(100),
    salary int,
    city varchar(100),
    dept enum('sales','hr','other'),
    dob date
);

-- show table record 
select * from employee1;

-- insert record into table 
insert into employee1 (id,name,salary,city,dept,dob) 
value(101,'Joy',25000,'Mumbai','sales','1990-12-01'),
(102,'toy',45000,'pune','other','1995-12-01'),
(103,'roy',65000,'surat','hr','1991-12-01'),
(104,'koy',75000,'goa','sales','1992-12-01'),
(105,'boy',95000,'bhuj','sales','1993-12-01');


-- 04 Oct 2025
-- list of database 
show databases;

-- select database 
use classicmodels;

-- list of tables
show tables; 

-- select tables 
select * from customers;

-- count()
select count(customernumber) from customers;

-- where
-- count only USA customers 
select count(customernumber) from customers where country = "USA";
-- print all usa customers
select * from customers where country = "USA";
-- -- print all usa customers from state NY
select * from customers where country = "USA" and state = "NY";

