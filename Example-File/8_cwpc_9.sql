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


-- create a new database
create database cwpc901;
-- list of database 
show databases;
-- delete database 
drop database cwpc901;
-- select database
use cwpc901;
-- create a table 
create table employee(	
    id int,
    name varchar(100),
    job_id varchar(100),
    salary int,
    city varchar(100)
);
-- show tables 
select * from employee;
-- insert data into table 
insert into employee (id,name,job_id,salary,city) 
values (101,"joy","A1001",56000,"mumbai"); 


-- Date : 27 Nov 2025

create database cwpc93;
-- select database
use cwpc93;


create table employee(
	id int,
    name varchar(50),
    salary int,
    dob date,
    dept enum("sales","hr","it","other"),
    city varchar(50)
);
select * from employee;

insert into employee (id,name,salary,dob,dept,city) 
value(101,"joy",45000,"2000-02-23","hr","mumbai"),
(102,"neev",45000,"2000-02-23","sales","mumbai"),
(103,"riya",45000,"2000-02-23","it","mumbai"),
(104,"toy",45000,"2000-02-23","sales","mumbai");

-- other way 
create table employee1(
	id int primary key,
    name varchar(50),
    salary int,
    dob date,
    dept enum("sales","hr","it","other"),
    city varchar(50)
);
select * from employee1;

insert into employee1 (id,name,salary,dob,dept,city) 
value(101,"joy",45000,"2000-02-23","hr","mumbai"),
(102,"neev",45000,"2000-02-23","sales","mumbai"),
(103,"riya",45000,"2000-02-23","it","mumbai"),
(104,"toy",45000,"2000-02-23","sales","mumbai");

-- other way 

-- other way 
create table employee2(
	id int primary key auto_increment,
    name varchar(50),
    salary int,
    dob date,
    dept enum("sales","hr","it","other"),
    city varchar(50),
    email varchar(100) unique key
);
select * from employee2;

insert into employee2 (name,salary,dob,dept,city,email) 
value("joy",45000,"2000-02-23","hr","mumbai","joy@cwpc.in"),
("neev",45000,"2000-02-23","sales","mumbai","neev@cwpc.in"),
("riya",45000,"2000-02-23","it","mumbai","riya@cwpc.in"),
("toy",45000,"2000-02-23","sales","mumbai","toy@cwpc.in");

insert into employee2 (id,name,salary,dob,dept,city,email) 
value(101,"Rohan",45000,"2000-02-23","hr","mumbai","rohan@cwpc.in");

insert into employee2 (name,salary,dob,dept,city,email) 
value("heena",45000,"2000-02-23","hr","mumbai","heena@cwpc.in"),
("jeet",45000,"2000-02-23","sales","mumbai","jeet@cwpc.in"),
("karan",45000,"2000-02-23","it","mumbai","karan@cwpc.in"),
("nishant",45000,"2000-02-23","sales","mumbai","nishant@cwpc.in");

insert into employee2 (name,dob,dept,city,email) 
value("sumit","2000-02-23","hr","mumbai","sumit@cwpc.in");

-- empty table 
truncate employee2;

-- delete table 
drop table employee2;

-- Date : 2 Dec 2025
-- where 
-- and operator
-- or operator
-- update query 
-- delete 

use classicmodels;
-- show list of tables 
show tables;

select * from customers;
-- find customers - Country USA 
select * from customers where country = "USA";
-- select column 
select customerName,city,creditlimit,Country from customers 
where country = "USA";
-- find the customer credit 1,00,000/-
select customerName,city,creditlimit,Country from customers 
where creditlimit > 100000;

select customerName,city,creditlimit,Country from customers 
where creditlimit < 50000;

select customerName,city,creditlimit,Country from customers 
where creditlimit = 0;

-- and operator
-- or operator

select customerName,city,creditlimit,Country from customers 
where creditlimit = 0 and country = "Germany";

select customerName,city,creditlimit,Country from customers 
where creditlimit = 0 or country = "Germany";


-- operation 
select customerName,city,Country, creditlimit , 
creditlimit+1000 as update_new_creditLimit 
from customers 
where creditlimit = 0;

-- count()
select count(creditlimit) from customers 
where creditlimit = 0;

select count(customername) from customers 
where country = "USA";

-- sum()
select sum(creditlimit) from customers 
where country = "USA";

-- date : 4 - 12 - 2025
-- update query 
-- delete 
-- like 
-- top (limit)
-- order by
-- group by

use classicmodels;

select * from customers;

update customers
set creditlimit = 51000 where customerNumber = 103;

select * from customers where customerNumber = 103;

-- delete from customers
-- where customernumber = 103;

select * from customers where customername like "a%";
select * from customers where customername like "%gifts%";
select * from customers where customername like "%g%";

select * from customers where customername like "%e";

-- limit

select * from customers limit 10;

-- order by

select * from customers order by creditlimit asc limit 10;
select * from customers order by creditlimit desc limit 10;


select * from customers order by customername asc ;
select * from customers order by customername desc ;


-- group by 

select country from customers group by country;

select country,count(country) as total_customer from customers group by country;


-- Date : 6 - 12 - 2025
-- distinct keyword

use classicmodels;

select distinct country from customers;

-- Constraints (key)
create database ecom;
use ecom;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    email varchar(100) unique key
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


select * from customers;
select * from orders;
insert into orders value(101,1,'2025-01-12');
insert into customers value(1,"Joy",'Mumbai','joy@gmail.com');

-- truncate table 
truncate table customers;

-- having 
SELECT SalespersonName, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY SalespersonName
HAVING SUM(SaleAmount) > 200;

use classicmodels;
select * from customers;

select country , sum(creditlimit) as total_credit 
from customers group by country having sum(creditlimit) > 500000;


-- Join 
-- Date : 9 dec 2025 
create database cwpc9090;
use cwpc9090;
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
    (7, 'Pooja', 'jain', 'pooja@codeswithpankaj.com');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2023-01-15', 250.00),
    (102, 2, '2023-02-20', 120.50),
    (103, 3, '2023-03-10', 320.75),
    (104, 1, '2023-04-05', 175.25),
    (105, 4, '2023-05-12', 210.00),
    (106, 6, '2023-10-12', 850.00);

select * from customers;
select * from orders;

-- inner join
select customers.firstname , customers.email , 
orders.orderid , orders.totalamount,orders.orderdate
from customers inner join orders 
on customers.customerid = orders.customerid;

-- left join
select customers.firstname , customers.email , 
orders.orderid , orders.totalamount,orders.orderdate
from customers left join orders 
on customers.customerid = orders.customerid;

-- right join
select customers.firstname , customers.email , 
orders.orderid , orders.totalamount,orders.orderdate
from customers right join orders 
on customers.customerid = orders.customerid;

-- full join
select customers.firstname , customers.email , 
orders.orderid , orders.totalamount,orders.orderdate
from customers left join orders 
on customers.customerid = orders.customerid
union
select customers.firstname , customers.email , 
orders.orderid , orders.totalamount,orders.orderdate
from customers right join orders 
on customers.customerid = orders.customerid;


-- view 

create view  joinhub as
-- full join
select customers.firstname , customers.email , 
orders.orderid , orders.totalamount,orders.orderdate
from customers left join orders 
on customers.customerid = orders.customerid
union
select customers.firstname , customers.email , 
orders.orderid , orders.totalamount,orders.orderdate
from customers right join orders 
on customers.customerid = orders.customerid;

-- call view

select * from joinhub;

use classicmodels;

select count(*) from customers;
-- avg()
select avg(creditlimit) from customers;
-- MIN()
select min(creditlimit) from customers;
-- MAX()
select max(creditlimit) from customers;

-- CONCAT()

select * from customers;

select concat(contactfirstname,' ',contactlastname) as full_name
from customers;

use classicmodels;

-- concat()
select concat(contactfirstname, ' ' ,contactlastname) as full_name from customers;

-- upper()
select upper(contactfirstname) from customers;

-- lower()
select lower(contactfirstname) from customers;

-- left()
select left(contactfirstname, 3) from customers;

-- right()
select right(contactfirstname, 5) from customers;

-- length()
select contactfirstname, length(contactfirstname) from customers;

-- trim()
select trim(contactfirstname), length(trim(contactfirstname)) from customers;

-- replace()
select replace(city, 'ars' , 'qq') as city_replaced from customers;

-- ltrim()
select ltrim(city) AS city_ltrimmed FROM customers;

-- ltrim()
select ltrim(city) AS city_ltrimmed FROM customers;

-- rtrim()
select ltrim(city) AS city_rtrimmed FROM customers;

-- charindex() -- does not work in mysql
select charindex('a', city) as position_of_a from customers;

-- replicate() -- does not work in mysql
select replicate('abc', 3) AS repeated_string FROM customers LIMIT 1;

-- substring()
-- substring(string_expression, start_position, length)
select contactfirstname, substring(contactfirstname, 3, 4) AS First_Name
from customers;

-- reverse
select reverse(city) from customers;

-- format
select creditlimit, format(creditlimit, 2) from customers;
select creditlimit, concat('$',format(creditlimit, 2)) from customers;

-- stuff() -- does not work in mysql
select contactfirstname, stuff(contactfirstname, 3, 4, '34333') AS First_Name
from customers;

-- ascii
select ascii('A') as ascii_value from customers limit 1;

-- unicode -- does not work in mysql -- check one more time
select unicode('A') as unicode_value from customers limit 1;










