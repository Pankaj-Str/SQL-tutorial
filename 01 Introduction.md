# SQL Introduction Tutorial by Codes with Pankaj

## Table of Contents
1. [What is SQL?](#what-is-sql)
2. [Why Learn SQL?](#why-learn-sql)
3. [Database Basics](#database-basics)
4. [SQL Fundamentals](#sql-fundamentals)
5. [Basic SQL Commands](#basic-sql-commands)
6. [Practical Examples](#practical-examples)
7. [Conclusion](#conclusion)

## What is SQL?

SQL (Structured Query Language) is a standardized programming language designed for managing and manipulating relational databases. It allows you to:
- Store and retrieve data
- Create database structures
- Modify existing data
- Control access to databases

### Key Characteristics of SQL:
- Declarative language
- Used across multiple database systems
- Supports complex data operations
- Standardized by ANSI and ISO

## Why Learn SQL?

Learning SQL provides numerous advantages:
- Essential skill for data-driven careers
- Used in software development, data analysis, and business intelligence
- High demand in job markets
- Enables efficient data management
- Works with multiple database systems like MySQL, PostgreSQL, SQLite, and Microsoft SQL Server

## Database Basics

### What is a Database?
A database is an organized collection of structured information or data, typically stored electronically in a computer system.

### Types of Databases:
1. **Relational Databases**
   - Organize data into tables with rows and columns
   - Use relationships between tables
   - Examples: MySQL, PostgreSQL, Oracle

2. **Non-Relational Databases**
   - Store data in different formats
   - More flexible structure
   - Examples: MongoDB, Cassandra

### Database Management Systems (DBMS)
Software that allows users to define, create, maintain, and control access to databases.

## SQL Fundamentals

### Basic Database Objects
1. **Tables**: Primary storage for data
2. **Columns**: Define data types
3. **Rows**: Individual data entries
4. **Primary Keys**: Unique identifiers
5. **Foreign Keys**: Create relationships between tables

### Data Types in SQL
- **Numeric Types**: 
  - INT
  - FLOAT
  - DECIMAL

- **String Types**:
  - VARCHAR
  - CHAR
  - TEXT

- **Date Types**:
  - DATE
  - DATETIME
  - TIMESTAMP

## Basic SQL Commands

### 1. CREATE DATABASE
```sql
CREATE DATABASE CodesWithPankaj;
USE CodesWithPankaj;
```

### 2. CREATE TABLE
```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Age INT
);
```

### 3. INSERT DATA
```sql
INSERT INTO Students (StudentID, FirstName, LastName, Email, Age)
VALUES 
(1, 'Pankaj', 'Kumar', 'pankaj@example.com', 28),
(2, 'Rahul', 'Singh', 'rahul@example.com', 25);
```

### 4. SELECT Queries
```sql
-- Select all students
SELECT * FROM Students;

-- Select specific columns
SELECT FirstName, LastName FROM Students;

-- Filter with WHERE clause
SELECT * FROM Students WHERE Age > 25;
```

### 5. UPDATE Command
```sql
UPDATE Students
SET Email = 'newpankaj@example.com'
WHERE StudentID = 1;
```

### 6. DELETE Command
```sql
DELETE FROM Students
WHERE StudentID = 2;
```

## Practical Examples

### Example 1: Creating a Course Enrollment System
```sql
-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Instructor VARCHAR(100)
);

-- Create Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
```

### Example 2: Complex Query
```sql
-- Get students enrolled in courses
SELECT 
    s.FirstName, 
    s.LastName, 
    c.CourseName
FROM 
    Students s
JOIN 
    Enrollments e ON s.StudentID = e.StudentID
JOIN 
    Courses c ON e.CourseID = c.CourseID;
```

## Conclusion

SQL is a powerful tool for managing data. This tutorial covered the basics, but there's much more to explore:
- Advanced querying techniques
- Database optimization
- Performance tuning
- Complex joins and subqueries

### Next Steps
- Practice with sample databases
- Learn about indexing
- Explore advanced SQL features
- Work on real-world projects

**Happy Coding with Codes with Pankaj!**