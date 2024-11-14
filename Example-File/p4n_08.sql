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







