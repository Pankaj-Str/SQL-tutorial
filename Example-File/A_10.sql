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


-- -- update query 
-- -- delete 






