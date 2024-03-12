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

-- date :  7/3/2024

-- show database
show databases;
-- Create Database
create database p4n_employees; 
-- drop Database
drop database p4n_employees;
-- select Database
use p4n_employees;
-- create table 

create table info(
	id int,
    name varchar(20),
    city varchar(20),
    salary int
);

-- show table

show tables;

-- select table 
select * from info;

-- insert query 
insert into info values(1,'joy','mumbai',25000);
insert into info values(2,'joy1','mumbai',25000);
insert into info values(3,'joy2','mumbai',25000);
insert into info values(4,'joy3','mumbai',25000);


-- Date : 9 March 2023 
-- insert query 

use p4n_employees;

create table client (
	client_id int primary key,
    name varchar(10),
    city varchar(10)
);

insert into client values(101,'joy','mumbai');

select * from client;

create table client1 (
	client_id int primary key auto_increment,
    name varchar(10),
    city varchar(10)
);

insert into client1 (name,city) values('joy','mumbai');

select * from client1;

-- where 

use sakila;
select * from payment;

select * from payment
where amount = 4.99;

-- and operator
select * from payment
where amount = 4.99 and staff_id = 1;

-- or operator

select * from payment
where amount = 4.99 or staff_id = 1;

-- update query 

update payment
set amount = 12.0
where payment_id = 1;

select * from payment 
where payment_id = 1;


-- Date : 12 march 2024 
-- delete 
use sakila;
select * from payment;

-- DELETE FROM payment
-- WHERE payment_id = 3;

-- like 

select * from actor;

select * from actor 
where first_name like 'nick';

select * from actor 
where first_name like 'a%';

select * from actor 
where first_name like '%a';

select * from actor 
where first_name like '%a%';

-- top - limit
select * from actor 
limit 5;

-- order by

select * from payment;

select * from payment 
order by amount asc;

select * from payment 
order by amount desc;

select * from actor 
order by first_name asc;

select * from actor 
order by first_name desc;

-- group by

select amount  from payment
group by amount;


select amount , count(amount) as total_customers  from payment
group by amount;

-- distinct keyword

select distinct amount  from payment;


