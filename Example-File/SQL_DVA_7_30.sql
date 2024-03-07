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






