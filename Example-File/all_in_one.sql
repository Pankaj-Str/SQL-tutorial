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


-- Date - 18 April 2025
-- show list of database 
show databases;
-- Create Database 
create database cwpc01;
-- drop Database
drop database cwpc01;
-- select Database
use cwpc01;
-- create table 
-- column name  
-- data 
-- table name 
create table Employee(
	id int, 
    name varchar(50),
    salary int,
    city varchar(50)
);

-- show list of table
show tables;

-- show table 
select * from Employee;
 


-- Date 23 - April - 2025
-- show list of database
show databases;
-- create database
create database Company;
-- drop database (delete database)
-- drop database Company;
-- select database 
use Company;
-- create table 
create table employee(
	id int,
    name varchar(50),
    dob date,
    salary int,
    dept enum('sales','hr','it','other'),
    city varchar(50),
    email varchar(50)
);

-- show list of table
show tables;

-- open table and show record
select * from employee;

delete from employee where id = 2;

-- insert record into table 
insert into employee (id,name,dob,salary,dept,city,email) 
value(1,'Joy','1990-05-23',34000,'sales','mumbai','joy@cwpc.in');

-- insert multipal records
insert into employee (id,name,dob,salary,dept,city,email) 
values (2,'Toy','1990-05-13',56000,'hr','pune','toy@cwpc.in'),
(3,'Rohan','1985-05-13',55000,'hr','pune','rohan@cwpc.in'),
(4,'Tina','1958-05-13',51000,'sales','surat','tina@cwpc.in'),
(5,'Nir','1963-05-13',52000,'other','bhuj','nir@cwpc.in'),
(6,'Yuo','2000-05-13',50000,'hr','goa','yuo@cwpc.in');




-- use primary key

create table employee1(
	id int primary key,
    name varchar(50),
    dob date,
    salary int,
    dept enum('sales','hr','it','other'),
    city varchar(50),
    email varchar(50)
);

-- show list of table
show tables;

-- open table and show record
select * from employee1;

-- insert record into table 
insert into employee1 (id,name,dob,salary,dept,city,email) 
value(2,'Joy','1990-05-23',34000,'sales','mumbai','joy@cwpc.in');



-- Date 25 April 2025

show databases;

use classicmodels;

-- show list of tables
show tables;

select * from customers;

-- where 

select * from customers where state  = "CA";
select * from customers where creditlimit  > 70000;

-- and operator

select * from customers where state = "CA" and creditlimit  > 70000;

-- or operator
select * from customers where state = "CA" or creditlimit  > 70000;
-- update query 
select customername,state ,phone,creditlimit from customers where state = "CA";
select customername,state ,phone,creditlimit , creditlimit+500 as update_creditLimit from customers where state = "CA";
-- delete 
select * from customers where contactlastName = "King";

-- SET SQL_SAFE_UPDATES = 0;








