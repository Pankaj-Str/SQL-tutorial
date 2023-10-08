# SQL Keys

### SQL - Unique Key:

A Unique Key ensures the uniqueness of values in a specified column or combination of columns. It allows for the presence of NULL values unless explicitly defined as NOT NULL.

Example - Creating a "Students" table with a Unique Key on the "Email" column:

```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

-- Inserting records into the "Students" table
INSERT INTO Students (FirstName, LastName, Email)
VALUES
    ('Pankaj', 'Sharma', 'pankaj@codeswithpankaj.com'),
    ('Nishant', 'Patel', 'nishant@codeswithpankaj.com'),
    ('Kiran', 'Desai', 'kiran@codeswithpankaj.com');
```

In this example, the "Email" column has a Unique Key constraint, ensuring that each student's email address is unique. You can insert records into the "Students" table, and MySQL will enforce the uniqueness of email addresses.

### SQL - Primary Key:

A Primary Key uniquely identifies each record in a table. It enforces both uniqueness and non-null constraints on the specified column(s).

Example - Creating an "Employees" table with a Primary Key on the "EmployeeID" column:

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Inserting records into the "Employees" table
INSERT INTO Employees (EmployeeID, FirstName, LastName)
VALUES
    (1, 'Pankaj', 'Sharma'),
    (2, 'Nishant', 'Patel'),
    (3, 'Kiran', 'Desai');
```

In this example, the "EmployeeID" column serves as the primary key, uniquely identifying each employee. The INSERT statements demonstrate how to insert records into the "Employees" table.

### SQL - Foreign Key:

A Foreign Key establishes relationships between tables by linking a column in one table to the primary key of another table. It enforces referential integrity.

Example - Creating "Orders" and "Customers" tables with a Foreign Key relationship:

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Inserting records into the "Customers" and "Orders" tables
INSERT INTO Customers (CustomerID, FirstName, LastName)
VALUES
    (1, 'Pankaj', 'Sharma'),
    (2, 'Nishant', 'Patel');

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
    (101, 1, '2023-01-15'),
    (102, 2, '2023-02-20');
```

In this example, the "CustomerID" column in the "Orders" table is a Foreign Key that references the "CustomerID" column in the "Customers" table. This establishes a relationship between orders and customers.

### SQL - Composite Key:

A Composite Key consists of two or more columns that, together, uniquely identify a record.

Example - Creating a "Sales" table with a Composite Key:

```sql
CREATE TABLE Sales (
    ProductID INT,
    StoreID INT,
    SaleDate DATE,
    PRIMARY KEY (ProductID, StoreID)
);

-- Inserting records into the "Sales" table
INSERT INTO Sales (ProductID, StoreID, SaleDate)
VALUES
    (101, 1, '2023-01-15'),
    (102, 2, '2023-02-20');
```

In this example, the combination of "ProductID" and "StoreID" forms a Composite Key, ensuring that each sale is uniquely identified by both the product and the store.

### SQL - Alternate Key:

An Alternate Key represents a set of columns that could have been chosen as the primary key but were not. It provides an alternative means of uniquely identifying records.

Example - Creating a "Customers" table with an Alternate Key on the "SSN" column:

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    SSN VARCHAR(20) UNIQUE,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Inserting records into the "Customers" table
INSERT INTO Customers (CustomerID, SSN, FirstName, LastName)
VALUES
    (1, '123-45-6789', 'Pankaj', 'Sharma'),
    (2, '987-65-4321', 'Nishant', 'Patel');
```

In this example, the "SSN" column serves as an Alternate Key, ensuring that each customer has a unique Social Security Number. The UNIQUE constraint enforces this uniqueness.

These examples illustrate the creation of tables with different key types in MySQL, along with the insertion of sample records. Keys play a crucial role in maintaining data integrity and relationships within a database.
