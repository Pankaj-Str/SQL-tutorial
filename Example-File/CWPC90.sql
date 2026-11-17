-- show database list 
show databases;
-- create database 
create database cwpc;
-- delete database
-- drop database cwpc;
-- Select database
use cwpc;
-- create table  
create table students(
	student_id int,
    name varchar(50),
    mobile varchar(20),
    city varchar(50),
    dob date,
    marks int,
    subject enum("java","c","python","sql")
);
-- show table list form seleted database 
show tables;
-- show table records 
select * from students;
-- add record into table 
insert into students 
values(101,"prachi","987654321","Mumbai","2008-10-23",98,"java");



-- introduction of Database 
-- intro - Sql
-- Create Database 
-- drop Database
-- select Database

-- Date 05 - 11 - 1990
-- create table 

create table employee(
	emp_id int primary key,
    name varchar(100),
    dept enum("HR","Sales","IT"),
    email varchar(100) unique key,
    mobile varchar(100) unique,
    age int
);

-- show table 
select * from employee;

-- method 1
insert into employee value(101,"prachi","IT","prachi@cwpc.in","1236549877",23);

-- method 2
insert into employee (emp_id,name,dept,email,mobile) 
value(102,"Nishant","Sales","nishant@cwpc.in","1236549856");

-- final way to create a table 

create table employee1(
	emp_id int primary key auto_increment,
    name varchar(100),
    dept enum("HR","Sales","IT"),
    email varchar(100) unique key,
    mobile varchar(100) unique,
    age int
);

insert into employee1 (name,dept,email,mobile,age) 
value("Nishant","Sales","nishant@cwpc.in","1236549856",24);

select * from employee1;

insert into employee1 (emp_id,name,dept,email,mobile,age) 
value(101,"aryan","IT","aryan@cwpc.in","1236547851",45);

insert into employee1 (name,dept,email,mobile,age) 
value("aryan1","IT","aryan1@cwpc.in","11236547851",45);

-- insert query 

-- Date 12 - 11 - 2026

-- where 
use classicmodels;
-- show list of tables 
show tables;
-- select customers tables 
select * from customers;

-- where
select * from customers where country = "Italy";
select * from customers where country = "USA";
select * from customers where creditlimit = 0.0;

-- and operator

select * from customers where creditlimit = 0.0 and Country = "USA";
-- or operator
select * from customers where creditlimit = 0.0 or Country = "USA";
  
-- Date 17 Nov 2026
-- update query 
use classicmodels;
select * from customers;
-- select customers 103 
select * from customers where customernumber = 103;
-- now use update creditlimit
update customers set creditlimit = 100000 where customernumber = 103;
-- delete data from table 
select * from customers where customernumber = 112;
delete from customers where customernumber = 112;
-- like 
select * from customers where customername like "%ge";
select * from customers where customername like "aus%";
select * from customers where customername like "%Gift%";
-- top (limit)
select * from customers limit 5;

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
