-- show list of Database ....
show databases;
-- create database
create database p4n001;
-- select database
use p4n001;
-- table
-- table name 
-- column name 
-- data
-- type

-- create table 
create table employee(
	id int,
    name varchar(100),
    city varchar(100),
    salary int,
    dept varchar(100)
);
-- show table 
select * from employee;

-- enter record 
insert into employee (id,name,city,salary,dept) value(101,"Joy","Mumbai",34000,"IT");


-- primary key 
-- auto increments 


-- cerate a new table 

create table creditcard(
	id int primary key auto_increment,
    customer_name varchar(100),
    card_number bigint,
    creditlimit bigint,
    bank_name varchar(100),
    city varchar(100)
);

select * from creditcard;

insert into creditcard (customer_name,card_number,creditlimit,bank_name,city) 
values("Nishant",100340005544,9000000,"SBI","Mumbai"),
("Nishant",100340005544,560000,"HDFC","pune"),
("Joy",100340005544,784440,"ICICI","suart"),
("Nilesh",100340005544,560000,"IDFC","bhuj"),
("Trupti",100340005544,780000,"IOB","Delhi");


create table creditcard1(
	id int primary key auto_increment,
    customer_name varchar(100),
    card_number bigint unique key,
    creditlimit bigint,
    bank_name varchar(100),
    city varchar(100)
);

select * from creditcard1;

insert into creditcard1 (customer_name,card_number,creditlimit,bank_name,city) 
values("Nishant",200340005544,9000000,"SBI","Mumbai"),
("Nishant",100440005544,560000,"HDFC","pune"),
("Joy",100340055544,784440,"ICICI","suart"),
("Nilesh",100360005544,560000,"IDFC","bhuj"),
("Trupti",100370005544,780000,"IOB","Delhi");

-- empty table 
truncate creditcard1;

-- delete table 
drop table creditcard1;

-- update 

update creditcard1
set creditlimit = 1990000
where id = 3;

-- delete 

delete from creditcard1 where id = 2;

select * from creditcard1;

select * from creditcard1 where id = 4;

-- select column

select customer_name,card_number, bank_name from creditcard1;

-- date : 16 Nov 2024

-- 1	SQL - Where Clause
use classicmodels;
-- show table list 
show tables;
select * from customers;

select * from customers where customernumber = 103;
select * from customers where creditlimit > 50000;
select * from customers where creditlimit < 50000;

-- 2	SQL - Top Clause (limit)
select * from customers limit 5;
-- 3	SQL - Distinct Clause
select country from customers;
select distinct country from customers;

-- count()
select distinct count(country) from customers; 

-- 4	SQL - Group By Clause

select country from customers group by country;

select country , count(country) as total_country from customers group by country;

-- sum()
select sum(creditlimit) as total_creditlimit from customers;

-- 6	SQL - AND & OR
select * from customers where creditlimit < 50000 or country = "USA";
select * from customers where creditlimit < 50000 and country = "USA";


-- 5	SQL - Having Clause
-- 8	SQL - LIKE Operator

use classicmodels;

select * from customers;

select * from customers where customername like "A%";
select * from customers where customername like "%A%";
select * from customers where customername like "%e";

-- 9	SQL - IN Operator
-- 13	SQL - NOT Operator

select * from customers where not country = "USA";

-- 14	SQL - NOT EQUAL

select * from customers where  country != "USA";

-- 15	SQL - IS NOT NULL and NULL


select * from customers where  state is null;	
-- count()
select count(customername) as total_null from customers where state is null;

select * from customers where  state is not null;	
-- count()

select count(customername) as total_null from customers where state is not null;


-- 16	SQL - UNION And UNION ALL
-- 18	SQL - Aliases

select * from customers ;

select customername,city,state,country, creditlimit from customers where country = "USA";
  
select customername,city,state,country, creditlimit from customers where country = "USA" and creditlimit > 25000;  

select customername,city,state,country, creditlimit, 
(creditlimit*5/100) as update_tax ,
creditlimit+(creditlimit*5/100) as update_creditlimit 
from customers where country = "USA" and creditlimit > 25000;


-- Date 23 Dec 2024
create database p4n01;

use p4n01;


create table customers(
	customerid int primary key,
    firstname varchar(50),
    lastname varchar(50)
);

select * from customers;

create table orders(
	orderid int primary key,
    customerid int,
    orderdate date,
    foreign key (customerid) references customers(customerid)
    
);

select * from customers;
select * from orders;

-- yyymmdd
insert into orders (orderid,customerid,orderdate) value (1,101,'2024-01-15');
insert into customers (customerid,firstname,lastname) value (101,'joy','kumar');



