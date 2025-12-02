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


-- create a new database
create database cwpc901;
-- list of database 
show databases;
-- delete database 
drop database cwpc901;
-- select database
use cwpc901;
-- create a table 
create table employee(	
    id int,
    name varchar(100),
    job_id varchar(100),
    salary int,
    city varchar(100)
);
-- show tables 
select * from employee;
-- insert data into table 
insert into employee (id,name,job_id,salary,city) 
values (101,"joy","A1001",56000,"mumbai"); 


-- Date : 27 Nov 2025

create database cwpc93;
-- select database
use cwpc93;


create table employee(
	id int,
    name varchar(50),
    salary int,
    dob date,
    dept enum("sales","hr","it","other"),
    city varchar(50)
);
select * from employee;

insert into employee (id,name,salary,dob,dept,city) 
value(101,"joy",45000,"2000-02-23","hr","mumbai"),
(102,"neev",45000,"2000-02-23","sales","mumbai"),
(103,"riya",45000,"2000-02-23","it","mumbai"),
(104,"toy",45000,"2000-02-23","sales","mumbai");

-- other way 
create table employee1(
	id int primary key,
    name varchar(50),
    salary int,
    dob date,
    dept enum("sales","hr","it","other"),
    city varchar(50)
);
select * from employee1;

insert into employee1 (id,name,salary,dob,dept,city) 
value(101,"joy",45000,"2000-02-23","hr","mumbai"),
(102,"neev",45000,"2000-02-23","sales","mumbai"),
(103,"riya",45000,"2000-02-23","it","mumbai"),
(104,"toy",45000,"2000-02-23","sales","mumbai");

-- other way 

-- other way 
create table employee2(
	id int primary key auto_increment,
    name varchar(50),
    salary int,
    dob date,
    dept enum("sales","hr","it","other"),
    city varchar(50),
    email varchar(100) unique key
);
select * from employee2;

insert into employee2 (name,salary,dob,dept,city,email) 
value("joy",45000,"2000-02-23","hr","mumbai","joy@cwpc.in"),
("neev",45000,"2000-02-23","sales","mumbai","neev@cwpc.in"),
("riya",45000,"2000-02-23","it","mumbai","riya@cwpc.in"),
("toy",45000,"2000-02-23","sales","mumbai","toy@cwpc.in");

insert into employee2 (id,name,salary,dob,dept,city,email) 
value(101,"Rohan",45000,"2000-02-23","hr","mumbai","rohan@cwpc.in");

insert into employee2 (name,salary,dob,dept,city,email) 
value("heena",45000,"2000-02-23","hr","mumbai","heena@cwpc.in"),
("jeet",45000,"2000-02-23","sales","mumbai","jeet@cwpc.in"),
("karan",45000,"2000-02-23","it","mumbai","karan@cwpc.in"),
("nishant",45000,"2000-02-23","sales","mumbai","nishant@cwpc.in");

insert into employee2 (name,dob,dept,city,email) 
value("sumit","2000-02-23","hr","mumbai","sumit@cwpc.in");

-- empty table 
truncate employee2;

-- delete table 
drop table employee2;

-- Date : 2 Dec 2025
-- where 
-- and operator
-- or operator
-- update query 
-- delete 

use classicmodels;
-- show list of tables 
show tables;

select * from customers;
-- find customers - Country USA 
select * from customers where country = "USA";
-- select column 
select customerName,city,creditlimit,Country from customers 
where country = "USA";
-- find the customer credit 1,00,000/-
select customerName,city,creditlimit,Country from customers 
where creditlimit > 100000;

select customerName,city,creditlimit,Country from customers 
where creditlimit < 50000;

select customerName,city,creditlimit,Country from customers 
where creditlimit = 0;

-- and operator
-- or operator

select customerName,city,creditlimit,Country from customers 
where creditlimit = 0 and country = "Germany";

select customerName,city,creditlimit,Country from customers 
where creditlimit = 0 or country = "Germany";


-- operation 
select customerName,city,Country, creditlimit , 
creditlimit+1000 as update_new_creditLimit 
from customers 
where creditlimit = 0;

-- count()
select count(creditlimit) from customers 
where creditlimit = 0;

select count(customername) from customers 
where country = "USA";

-- sum()
select sum(creditlimit) from customers 
where country = "USA";


