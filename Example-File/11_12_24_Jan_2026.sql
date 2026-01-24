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

-- Date : 22 jan 2026
-- show database list
show databases;
-- create database 
create database cwpc100;
-- select database
use cwpc100;

-- create table
create table Employee(
	id int,
	emp_name varchar(100),
    city varchar(100),
    job_id varchar(100)
    
); 

-- show table list
show tables;

-- insert record 

insert into employee value(101,"Joy","Mumbai","A1");

-- show table data
select * from employee;
