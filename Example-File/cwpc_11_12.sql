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
