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





-- Date : 21 Sep 2024


create database p4n93;

show databases;

use p4n93;

create table CreditCard(
	card_id int auto_increment primary key,
    card_no bigint,
    bank_name varchar(20),
    customer_name varchar(20),
    credit_limit bigint,
    bill int
);

select * from CreditCard;

-- insert

insert into CreditCard (card_no,bank_name,customer_name,credit_limit,bill) values
(1019008765,'SBI','Nishant',5000000,23400),
(1019008745,'SBIA','Joy',3000000,2300),
(1019008755,'CBI','Toy',5400000,24500),
(1019008733,'FBI','Roy',5600000,26600),
(1019008775,'IBI','Noy',5700000,27800),
(1019008785,'RBI','Aoy',1800000,21200),
(1019008795,'TBI','Soy',3400000,29000),
(1019008795,'YBI','RRoy',6700000,23300),
(1019008705,'UBI','ttoy',890000,27880),
(1019008715,'SEBI','Chius',5400000,9000),
(1019008715,'RRBI','Ntyip',3400000,10200);






-- update 
-- delete 

show databases;

show tables;


select * from customers;

-- where 

select * from customers where country = "USA";


select customername,phone,city,state,country,creditlimit from customers where country = "USA";

-- count()

select count(country) as total_count from customers where country = "USA";

-- and 

select customername,phone,city,state,country,creditlimit from customers 
where country = "USA" and creditlimit = 0.0;

select customername,phone,city,state,country,creditlimit from customers 
where country = "USA" and State = "CA";

-- or 

select customername,phone,city,state,country,creditlimit from customers 
where country = "USA" or creditlimit = 0.0;

-- not

select customername,phone,city,state,country,creditlimit from customers 
where not country = "USA" and creditlimit = 0.0;

select customername,phone,city,state,country,creditlimit from customers 
where  creditlimit > 50000;

-- sum()

select sum(creditlimit) as total from customers where  creditlimit < 50000;

use sakila;

select * from payment;

show tables;

select count(rental_id) from payment;




