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



create database CompanyDB;
use companydb;

create table Departments(
	DepartmentID  INT Primary Key,
    DepartmentName  VARCHAR(100)
);

create table employee(	
    EmployeeID  INT Primary Key,
    FirstName  VARCHAR(50),
    LastName  VARCHAR(50),
    Age  INT,
    Salary  DECIMAL(10, 2),
    DepartmentID  INT,
    Foreign Key (DepartmentID) REFERENCES  Departments(DepartmentID),
    JoiningDate  DATE
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Marketing'),
(4, 'Sales'),
(5, 'IT Support'),
(6, 'Research and Development'),
(7, 'Customer Service'),
(8, 'Legal'),
(9, 'Production'),
(10, 'Logistics');


INSERT INTO employee (EmployeeID, FirstName, LastName, Age, Salary, DepartmentID, JoiningDate) VALUES
(1, 'John', 'Doe', 30, 60000.00, 1, '2022-01-15'),
(2, 'Jane', 'Smith', 28, 55000.00, 2, '2021-11-23'),
(3, 'Michael', 'Johnson', 35, 70000.00, 3, '2023-03-10'),
(4, 'Emily', 'Davis', 25, 48000.00, 4, '2022-07-19'),
(5, 'Chris', 'Brown', 32, 52000.00, 5, '2021-09-05'),
(6, 'Jessica', 'Wilson', 29, 65000.00, 6, '2023-01-12'),
(7, 'David', 'Martinez', 45, 75000.00, 7, '2020-12-01'),
(8, 'Sarah', 'Garcia', 40, 58000.00, 8, '2019-10-15'),
(9, 'Daniel', 'Rodriguez', 27, 53000.00, 9, '2022-06-30'),
(10, 'Laura', 'Martinez', 38, 60000.00, 10, '2021-04-25'),
(11, 'James', 'Hernandez', 34, 62000.00, 1, '2020-08-14'),
(12, 'Emily', 'Lopez', 26, 49000.00, 2, '2023-02-28'),
(13, 'Matthew', 'Gonzalez', 29, 53000.00, 3, '2021-07-11'),
(14, 'Sophia', 'Perez', 31, 56000.00, 4, '2022-03-22'),
(15, 'Olivia', 'Sanchez', 36, 64000.00, 5, '2021-05-10'),
(16, 'William', 'Lee', 42, 71000.00, 6, '2020-09-09'),
(17, 'Ava', 'Wilson', 30, 59000.00, 7, '2022-04-01'),
(18, 'Isabella', 'Taylor', 24, 47000.00, 8, '2023-06-12'),
(19, 'Lucas', 'Anderson', 39, 62000.00, 9, '2021-10-30'),
(20, 'Mia', 'Thomas', 33, 67000.00, 10, '2022-08-14');







-- left join

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
    (10, 'Riddhi', 'Jain', 'Riddhi@codeswithpankaj.com');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2023-01-15', 250.00),
    (102, 2, '2023-02-20', 120.50),
    (103, 3, '2023-03-10', 320.75),
    (105, 4, '2023-05-12', 210.00),
    (107, 7, '2024-05-02', 210.00);


select * from customers;
select * from orders;

select customers.firstname , customers.email, orders.orderdate,orders.totalamount
from customers left join orders on customers.customerid = orders.customerid;

-- right join

select customers.firstname , customers.email, orders.orderdate,orders.totalamount
from customers right join orders on customers.customerid = orders.customerid; 

-- inner join
select customers.firstname , customers.email, orders.orderdate,orders.totalamount
from customers inner join orders on customers.customerid = orders.customerid; 

-- full join
select customers.firstname , customers.email, orders.orderdate,orders.totalamount
from customers left join orders on customers.customerid = orders.customerid
union 
select customers.firstname , customers.email, orders.orderdate,orders.totalamount
from customers right join orders on customers.customerid = orders.customerid; 


-- Date : 05 - 10 - 2024


-- Write a query to display all employees along with their department names.
select * from departments;
select * from employee;

select departments.departmentname, 
concat(employee.firstname ,'  ', employee.lastname) as name
from departments left join  employee
on departments.departmentid = employee.departmentid;

-- Write a query to calculate the average salary of employees in each department.
-- add salary column
select departments.departmentname,
concat(employee.firstname ,'  ', employee.lastname) as name , employee.salary
from departments left join  employee
on departments.departmentid = employee.departmentid;

-- find total Department
select departments.departmentname, count(departments.departmentname) as total_Employee
from departments left join employee 
on departments.departmentid = employee.departmentid group by departments.departmentname;

-- Write a query to calculate the average salary of employees in each department.
select departments.departmentname, count(departments.departmentname) as total_Employee , 
avg(employee.salary) as total_avg
from departments left join employee 
on departments.departmentid = employee.departmentid group by departments.departmentname;





