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



-- Date 12 March 2026

-- show list of database 
show databases;

-- create database
create database cwpc10;

-- select database 
use cwpc10;

-- delete database
-- drop database cpwc10;


-- create table 
create table employee(
	id int,
    name varchar(100),
    city varchar(100)
);

-- show table 
select * from employee;

-- Date 14 March 2026
-- create table 
create table info(
	id int primary key,
    name varchar(100),
    dob date,
    salary int,
    mobile varchar(100),
    dept enum('it','sales','hr','other'),
    city varchar(100),
    height float
);

-- show all table list 
show tables;

-- show table records 
select * from info;

-- insert record into table 
insert into info (id,name,dob,salary,mobile,dept,city,height)
value(101,'Sejal','1990-02-23',25000,'9876543210','sales','mumbai',5.6);
insert into info (id,name,dob,salary,mobile,dept,city,height)
value(102,'raj','1990-02-23',25000,'9876543210','sales','mumbai',5.6);
insert into info (id,name,dob,salary,mobile,dept,city,height)
value(103,'ashwin','1990-02-23',25000,'9876543210','hr','mumbai',5.6);
insert into info (id,name,dob,salary,mobile,dept,city,height)
value(104,'Afab','1990-02-23',25000,'9876543210','it','mumbai',5.6);


insert into info (id,name,dob,salary,dept,city,height)
value(105,'Joy','1990-02-23',25000,'it','mumbai',5.6);












