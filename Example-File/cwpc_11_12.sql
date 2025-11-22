-- show list of database
show databases;
-- create new database
create database School;
-- select database from list 
use school;

-- int	varchar	int	varchar	date	enum(java,c++,go,sql,python,r)
-- id	Name	Marks	City	DOB	Subject

create table students(
	student_id int,
    name varchar(50),
    marks int,
    city varchar(50),
    date_of_birth date,
    subject enum("java","c++","go","sql","python")
);

-- show list of the table from database
show tables;

-- show record from this tables 
select * from students;

-- insert record 
insert into students(student_id,name,marks,city,date_of_birth,subject) 
values(1,"joy",40,"Mumbai","1990-10-12","java");



-- show list of database
show databases;
-- create new database
create database School;
-- select database from list 
use school;

-- int	varchar	int	varchar	date	enum(java,c++,go,sql,python,r)
-- id	Name	Marks	City	DOB	Subject

create table students(
	student_id int,
    name varchar(50),
    marks int,
    city varchar(50),
    date_of_birth date,
    subject enum("java","c++","go","sql","python")
);

-- show list of the table from database
show tables;

-- show record from this tables 
select * from students;

-- insert record 
insert into students(student_id,name,marks,city,date_of_birth,subject) 
values(1,"joy",40,"Mumbai","1990-10-12","java");












-- Date : 08 - 11 - 2025 



-- show database list
show databases;
-- create a new database
create database cwpc09;
-- select database
use cwpc09;

-- create a new table
create table Employee(
		id int primary key,
        name varchar(20),
        city varchar(30),
        salary int
);

-- show table record 
select * from Employee;
-- insert record 
insert into Employee (id,name,city,salary) values(2,"joy","Mumbai",80000);


-- create a new table
create table Employee1(
		id int primary key auto_increment,
        name varchar(20),
        city varchar(30),
        salary int
);

-- show table record 
select * from Employee1;
-- insert record 
insert into Employee1 (id,name,city,salary) values(101,"joy","Mumbai",80000);

insert into Employee1 (name,city) values("joy","Mumbai");


-- empty table 
truncate Employee1;

-- delete table 
drop table Employee1;



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

show databases; 

-- date : 15 Nov 2025

use classicmodels;

-- where
show tables;
select * from customers;

select customername,city,country,creditlimit from customers;

select customername,city,country,creditlimit from customers where country = "USA";

select * from customers where state = "NY";





-- and operator

select * from customers where country = "USA" and creditlimit >= 100000;

-- or operator

select * from customers where country = "USA" or creditlimit >= 100000;

select * from customers where country = "USA" or country = "Australia";

-- count()
select count(customername) from customers where country = "USA" or country = "Australia";

select sum(creditlimit) from customers;
select sum(creditlimit) from customers where country = "USA";

-- update query 
-- delete 


-- Date : 22 nov 2025

use classicmodels;

select * from customers;

-- update query 

update customers set creditlimit = 175000 where customernumber = 114;
select * from customers where customernumber = 114;
-- delete 
-- delete from customers where customernumber = 114;

-- like 

select * from customers where customername like "p%";
select * from customers where customername like "%pp%";
select * from customers where customername like "%e";


-- top (limit)
select * from customers limit 5;

-- order by
select * from customers order by creditlimit asc;
select * from customers order by creditlimit desc;

select * from customers order by customername asc;
select * from customers order by customername desc;

-- group by

select country from customers group by country;
select country,count(country) from customers group by country;








