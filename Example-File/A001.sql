-- show database list

show databases;

-- create database 
create database p4n45;

-- delete database 
drop database p4n45;

-- select database
use p4n45;

create table employee(
	id int,
    name varchar(20),
    city varchar(20),
    salary bigint
);

-- list of table
show tables;

-- show table 

select * from employee;


-- insert record 
insert into employee values(101,'Nishant','Mumbai',880000);



-- 2nd ways

create table employee1(
	id int primary key,
    name varchar(20),
    city varchar(20),
    salary bigint
);

-- show table 

select * from employee1;


-- insert record 
insert into employee1 values(101,'Nishant','Mumbai',880000);


-- 2nd ways

create table employee2(
	id int primary key auto_increment,
    name varchar(20),
    city varchar(20),
    salary bigint,
    email varchar(40)
);
-- show table 
select * from employee2;
-- insert record 
insert into employee2 (name,city,salary,email) values('Nishant','Mumbai',880000,'nishant@gmail.com');

-- empty
truncate employee2;
