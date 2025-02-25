-- cerate database
create database cwpc;
-- list of database 
show databases;
-- delete database 
-- drop database cwpc;
-- select database 
use cwpc;

-- create table 
-- column name 
-- Datatype

-- example 

create table Employee(
	id int,
    name varchar(50),
    age int,
    city varchar(50),
    dob date,
    salary decimal(5,2)
);

-- show tables list 
show tables;

-- show table
select * from Employee;

-- insert record into table
insert into Employee values(101,"Nishant",23,"Mumbai","1990-8-23",50.00);
insert into Employee values(102,"Rohan",56,"Pune","1991-8-23",80.00);
insert into Employee values(103,"Hitesh",96,"Surat","1956-8-23",78.00);
insert into Employee values(104,"Riya",52,"Jaipur","1996-8-23",56.00);
