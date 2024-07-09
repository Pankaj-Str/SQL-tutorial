-- show list of databases
show databases;
-- create database

create database p4n;
-- delete database 
-- drop database p4n;
-- select database 
use p4n;

-- column
-- row
-- heading column

create table employee(
	id int,
    emp_name varchar(100),
    salary bigint,
    city varchar(100)
);

-- show table 
select * from employee;

-- enter single record into data table
insert into employee values(1,"joy",59800,"mumbai");

-- enter multipal
insert into employee values(1,"joy",59800,"mumbai") , (2,"toy",98800,"pune");


create table employee1(
	id int primary key,
    emp_name varchar(100),
    salary bigint,

    city varchar(100)
);

-- show table 
select * from employee1;

-- enter single record into data table
insert into employee1 values(1,"joy",59800,"mumbai");
