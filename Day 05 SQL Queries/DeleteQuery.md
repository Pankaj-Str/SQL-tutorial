# SQL - DELETE Query

| Sn.No. | Topic Name             |
|--------|------------------------|
| 1      | [Insert Query](InsertQuery.md)          |
| 2      | [Select Query](SelectQuery.md)          |
| 3      | [Select Into](SelectInto.md)            |
| 4      | [Insert Into Select](InsertIntoSelect.md)|
| 5      | [Update Query](UpdateQuery.md)          |
| 6      | [Delete Query](DeleteQuery.md)          |
| 7      | [Sorting Results](SortingResults.md)    |
---------

Create a table named "p4n_emp" with the specified columns, you can use SQL. Here's an example SQL statement to create the table:

```sql
CREATE TABLE p4n_emp (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Email VARCHAR(255),
    Phone VARCHAR(15),
    Address VARCHAR(255),
    DepartmentID INT,
    Position VARCHAR(255),
    Salary DECIMAL(10, 2)
);
```

To insert five records into the "p4n_emp" table, you can use the INSERT INTO statement multiple times with different values for each record. Here's an example of inserting five records:

```sql
-- Inserting the first record
INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position, Salary)
VALUES
(1, 'John', 'Doe', '1990-05-15', 'Male', 'johndoe@example.com', '555-555-5555', '123 Main St, City, State', 101, 'Manager', 75000.00);

-- Inserting the second record
INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position, Salary)
VALUES
(2, 'Jane', 'Smith', '1985-08-20', 'Female', 'janesmith@example.com', '555-555-5556', '456 Oak St, City, State', 102, 'Sales Representative', 60000.00);

-- Inserting the third record
INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position, Salary)
VALUES
(3, 'Michael', 'Johnson', '1992-03-10', 'Male', 'michael@example.com', '555-555-5557', '789 Elm St, City, State', 103, 'Software Engineer', 80000.00);

-- Inserting the fourth record
INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position, Salary)
VALUES
(4, 'Emily', 'Wilson', '1988-11-25', 'Female', 'emily@example.com', '555-555-5558', '101 Pine St, City, State', 102, 'Sales Manager', 90000.00);

-- Inserting the fifth record
INSERT INTO p4n_emp (EmployeeID, FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, DepartmentID, Position, Salary)
VALUES
(5, 'David', 'Brown', '1995-07-05', 'Male', 'david@example.com', '555-555-5559', '222 Cedar St, City, State', 104, 'HR Specialist', 65000.00);
```


The `DELETE` statement is used to remove one or more records from a table. It allows you to specify the conditions that determine which rows should be deleted. Here's the basic syntax of a `DELETE` statement:

```sql
DELETE FROM table_name
WHERE condition;
```

Here's a breakdown of the components of a `DELETE` statement:

- `DELETE FROM`: Specifies the name of the table from which you want to delete records.

- `WHERE` (optional): Specifies the conditions that determine which rows will be deleted. If omitted, all rows in the table will be deleted.

Here's an example of how to use the `DELETE` statement:

Suppose you have a table named "p4n_emp" (as mentioned in previous conversations), and you want to delete an employee with a specific `EmployeeID` (e.g., EmployeeID 3).

```sql
-- Delete the employee with EmployeeID 3
DELETE FROM p4n_emp
WHERE EmployeeID = 3;
```

In this example:

- We specify the table name, "p4n_emp."

- We use the `WHERE` clause to specify the condition that identifies the row to be deleted, in this case, the employee with `EmployeeID = 3`.

This SQL statement will delete the employee with `EmployeeID` 3 from the "p4n_emp" table.

You can customize the `DELETE` statement to delete records based on specific conditions, such as deleting all employees in a certain department or with a certain salary range. Always use caution when using `DELETE` statements, as they permanently remove data from the table. Make sure to back up your data and double-check your conditions before executing a `DELETE` statement.
