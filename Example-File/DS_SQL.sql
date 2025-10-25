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


-- Date : 25 oct 2025

-- Constraints (key)
-- primary key 
-- Example 
create database cwpc090;
use cwpc090;

create table students( 
studentId int primary key,
Name varchar(50),
age int);

insert into students(studentId,name,age) values (101,"Rohan",55);

insert into students(studentId,name,age) values (102,"Joy",75);

select * from students;

-- Foreign key
create table course(
	courseid int primary key,
    coursename varchar(100)
);

create table enrollments(
	enrollmentid int primary key,
    studentID int,
    courseid int,
    foreign key(courseid) references course(courseid)
);

insert into course(courseid,coursename) values(1,"maths");
insert into course(courseid,coursename) values(2,"java");
insert into enrollments(enrollmentid,studentid,courseid) values (101,1005,1);
insert into enrollments(enrollmentid,studentid,courseid) values (102,1004,2);

-- unique key



create table students1( 
studentId int primary key,
Name varchar(50),
age int,
email varchar(100) unique key);

insert into students1(studentId,name,age,email) values (101,"Rohan",55,"rohan@cwpc.in");

insert into students1(studentId,name,age,email) values (102,"Joy",75,"Joy@cwpc.in");

select * from students1;

