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
