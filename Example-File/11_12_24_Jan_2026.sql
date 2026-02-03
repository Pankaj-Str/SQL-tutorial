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

-- Date : 22 jan 2026
-- show database list
show databases;
-- create database 
create database cwpc100;
-- select database
use cwpc100;

-- create table
create table Employee(
	id int,
	emp_name varchar(100),
    city varchar(100),
    job_id varchar(100)
    
); 

-- show table list
show tables;

-- insert record 

insert into employee value(101,"Joy","Mumbai","A1");

-- show table data
select * from employee;

-- date 24 jan 2026

-- create table 
-- insert query

create table cwpc_emp(
	id int primary key,
    name varchar(50),
    dob date,
    dept enum('hr','sales','it','other'),
    salary bigint,
    city varchar(50),
    email varchar(100),
    mobile varchar(100)
)

-- check tables data 
select * from cwpc_emp;
-- insert data 
insert into cwpc_emp values(
	101,"joy","1990-01-23","sales",23000,"mumbai","joy@codeswithpankaj.com","5415674"
);

insert into cwpc_emp (id,name,dob,dept,salary,city,mobile)
values(102,"joy","1990-01-23","sales",23000,"mumbai","5415674");


-- new table 
create table cwpc_emp1(
	id int primary key auto_increment,
    name varchar(50),
    dob date,
    dept enum('hr','sales','it','other'),
    salary bigint,
    city varchar(50),
    email varchar(100) unique key,
    mobile varchar(100) unique key
)

-- check tables data 
select * from cwpc_emp1;
-- insert data 
insert into cwpc_emp1 values(
	105,"joy","1990-01-23","sales",23000,"mumbai","joy@codeswithpankaj.com","5415674"
);

insert into cwpc_emp1 (name,dob,dept,salary,city,email,mobile)
values(
	"joy","1990-01-23","sales",23000,"mumbai","joy1@codeswithpankaj.com","54157674"
);

-- Date :- 27 Jan 2026
-- where 

show databases;
use classicmodels;
show tables;

select * from customers;

select * from customers where country = "USA";

-- count()
select count(customerName) from customers where country = "USA";


-- and operator

select * from customers where country = "USA" and state = "NY";

-- or operator

select * from customers where country = "USA" or state = "NY";

-- update query

update customers 
set creditlimit = 450000
where customerNumber = 124;

-- show record 
select * from customers where customernumber = 124;

-- Date : 29 jan 2026
-- delete 
use classicmodels;
select * from customers;

-- delete from customers where customernumber = 124;

-- like 
select * from customers where customername like "a%";
select * from customers where customername like "at%";

select * from customers where customername like "%at%";
select * from customers where customername like "%e";

-- top (limit)
select * from customers limit 5;

-- order by
select  customername,creditlimit from customers order by creditlimit asc;
select  customername,creditlimit from customers order by creditlimit desc;

-- group by

select country , count(country) as total_country from customers group by country;


-- Date : 31 Jan 2026
-- group by

use classicmodels;

select * from customers;

select state from customers group by state;
-- count()
select state , count(state) from customers group by state;


-- distinct keyword

select distinct country from customers;
select distinct count(country) from customers;
select distinct creditlimit from customers;

-- Constraints (key)

create database cwp45;
use cwp45;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    email varchar(100) unique key,
    mobile varchar(50) unique key
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


insert into customers 
value(112,"Joy","Kumar",'joy@cwpc.in','8786617468');
select * from customers;
insert into orders value(101,112,'2025-05-01');
select * from orders;

-- date 3 Feb 2026

-- Join  
create database cwpc912;
use cwpc912;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES
    (1, 'Pankaj', 'Sharma', 'pankaj@codeswithpankaj.com'),
    (2, 'Nishant', 'Patel', 'nishant@codeswithpankaj.com'),
    (3, 'Kiran', 'Desai', 'kiran@codeswithpankaj.com'),
    (4, 'Tanvi', 'Mehta', 'tanvi@codeswithpankaj.com'),
    (5, 'Kritek', 'Singh', 'kritek@codeswithpankaj.com'),
    (10, 'Pankaj', 'Kumar', 'pankaj@codeswithpankaj.com');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2023-01-15', 250.00),
    (102, 2, '2023-02-20', 120.50),
    (103, 3, '2023-03-10', 320.75),
    (105, 4, '2023-05-12', 210.00),
    (107, 7, '2077-05-12', 210.00);
    
    
select * from customers;    
select * from orders;    

-- 1	Full Join
select 
customers.Firstname , customers.email , 
orders.orderid, orders.totalamount , orders.orderdate
from customers left join orders
on orders.customerid = customers.customerid 
union
select 
customers.Firstname , customers.email , 
orders.orderid, orders.totalamount , orders.orderdate
from customers right join orders
on orders.customerid = customers.customerid ;


-- 2	Inner Join

select 
customers.Firstname , customers.email , 
orders.orderid, orders.totalamount , orders.orderdate
from customers inner join orders
on orders.customerid = customers.customerid ;

-- 3	Left Join

select 
customers.Firstname , customers.email , 
orders.orderid, orders.totalamount , orders.orderdate
from customers left join orders
on orders.customerid = customers.customerid ;




-- 4	Right Join

select 
customers.Firstname , customers.email , 
orders.orderid, orders.totalamount , orders.orderdate
from customers right join orders
on orders.customerid = customers.customerid; 		
		
