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


-- Date : 20 - May - 2025 
-- show list of database 

show databases;
-- create database
create database cwpc22;
-- select database 
use cwpc22;
-- delete database
drop database cwpc22;

-- cerate table 
-- Table Name 	Employee					
-- Column Name	id	Salary	name	city	DOB	dept.
-- DataType 	int	int	varchar(30)	varchar(30)	Date	varchar(30)


create table employee(
	
    id int,
    salary int,
    name varchar(50),
    city varchar(30),
    DOB date,
    dept varchar(30)
);

-- show table 
show tables;

-- open table and view record
select * from employee;














