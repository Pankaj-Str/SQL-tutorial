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


-- Date : 26 Feb 2025
create table Employee1(
	id int primary key,
    name varchar(50),
    age int,
    city varchar(50),
    dob date,
    salary decimal(10,2)
);

select * from employee1;

insert into employee1 values(102,"Nisha",20,"Pune","1990-11-23",56000.00);

-- final tables 
use cwpc;
create table cwpc_emp(
	id int primary key auto_increment,
    name varchar(50),
    age int,
    city varchar(50),
    dob date,
    salary decimal(10,2),
    email varchar(20) unique key,
    mobile varchar(30) unique key
);
select * from cwpc_emp;

insert into cwpc_emp (name,age,city,dob,salary,email,mobile) 
values("Tina",20,"Pune","2002-11-23",56000.00,"tina@p4n.in","7896541233"),
("Rohan",15,"mumbai","2005-11-23",45000.00,"rohan@p4n.in","4585698785"),
("Shubham",20,"mumbai","2000-11-23",5000.00,"shubham@p4n.in","4561236985"),
("Riya",45,"bhuj","1990-05-23",89000.00,"riya@p4n.in","4569874585");

-- empty table 
truncate cwpc_emp;
-- delete table 
drop table cwpc_emp;

-- delete query 
delete from cwpc_emp where id = 4;

-- update query

update cwpc_emp
set Salary = 96000.00 
where id = 1;

-- check records
select * from cwpc_emp;

-- Example 

insert into cwpc_emp (name,age,city,dob,salary,mobile) 
values("heena",20,"Surat","1998-11-23",45000.00,"7856987455");



-- Date : 27 Feb 2025

-- 1. Introduction to Database
-- 2. Introduction to SQL
-- 3. Create, Drop and Select Database
-- 4. CREATE OR DROP TABLE
-- 5. SQL INSERT Query
-- 6. SQL SELECT Query
-- 7. SQL WHERE Clause
-- 9. SQL UPDATE Query
-- 10. SQL DELETE Query

show databases;
use classicmodels;
-- list of tables
show tables;
select * from customers;

-- find the customer from usa
-- = 
select * from customers where country = "USA";
-- < , >
select * from customers where creditlimit > 50000;
select * from customers where creditlimit < 50000;

-- 8. SQL AND, OR Operators

select * from customers where creditlimit < 50000 and country = "USA";

select * from customers where creditlimit < 50000 or country = "USA";

-- count()
select count(customername) from customers where creditlimit < 50000 and country = "USA";

-- Example Country USA credit limit - 1500
select customername,city,state,country,creditlimit from customers;

select customername,city,state,country,creditlimit , creditlimit - 1500 as Update_amount 
from customers where country = "USA" and city = "NYC";

-- 11. SQL LIKE Clause

-- 12. SQL TOP Clause

-- 13. SQL ORDER BY Clause

-- 14. SQL Group By

-- 15. SQL Distinct Keyword

-- 16. SQL Constraints

-- 17. SQL Joins

-- 18. SQL Unions Clause

-- 19. SQL TRUNCATE TABLE

-- 20. SQL HAVING Clause

-- 21. SQL Transactions

-- 22. SQL View

-- 23. SQL Useful Functions
