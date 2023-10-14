-- create database
create database p4n_db2;
-- list of database 
show databases;
-- select database 
use p4n_db2;
-- create table 
create table employee(
	id int auto_increment primary key,
    name varchar(100),
    email varchar(100) unique key,
    city varchar(100),
    salary int
); 
-- show table
select * from employee;
-- insert record
insert into employee(name,email,city,salary)
values("joy","joy@p4n.in","mumbai",34000);
insert into employee(name,email,city,salary)
values("Toy","Toy@p4n.in","Pune",34000);
insert into employee(name,email,city,salary)
values("Roy","Roy@p4n.in","Surat",34000);
insert into employee(name,email,city,salary)
values("Koy","Koy@p4n.in","Bhuj",34000);
-- where 
-- select 
-- select only name and email 
select name,email from employee;
use sakila;
select * from payment;

select * from payment
where staff_id = 1;

select payment_id,customer_id,rental_id from payment
where amount = 0.0;

-- TOP
select * from payment
limit 10;

select * from payment
where payment_id <= 5;

-- SQL - Distinct Clause
use sakila;
select distinct amount from payment;
select * from payment;
select distinct staff_id from payment;
-- SQL - Order By Clause
select * from payment order by amount asc;
select * from payment order by amount desc;
-- SQL - Group By Clause
select amount from payment group by amount;
select amount, count(amount) as total_coustomers from payment group by amount;
-- SQL - Having Clause
select amount, count(amount) as total_coustomers from payment 
group by amount having count(amount) < 50;
-- SQL - AND & OR
select * from payment
where amount >= 0.0 and amount <= 2.99;

select * from payment
where amount = 0.0 or rental_id <= 100;
-- SQL - BOOLEAN (BIT) Operator

select * from payment
where amount between 0.00 and 2.00;





