# SQL - UPDATE Query

| Sn.No. | Topic Name             |
|--------|------------------------|
| 1      | [Insert Query](InsertQuery.md)          |
| 2      | [Select Query](SelectQuery.md)          |
| 3      | [Select Into](SelectInto.md)            |
| 4      | [Insert Into Select](InsertIntoSelect.md)|
| 5      | [Update Query](UpdateQuery.md)          |
| 6      | [Delete Query](DeleteQuery.md)          |
| 7      | [Sorting Results](SortingResults.md)    |

----------
To create a table named "p4n_emp" with the specified columns, you can use SQL. Here's an example SQL statement to create the table:

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


Suppose you want to update the position and salary for an employee with a specific `EmployeeID` (e.g., EmployeeID 2).

```sql
-- Update the position and salary for EmployeeID 2
UPDATE p4n_emp
SET Position = 'Senior Software Engineer', Salary = 90000.00
WHERE EmployeeID = 2;
```

In this example:

- We specify the table name, "p4n_emp."

- We use the `SET` clause to specify the columns "Position" and "Salary" and their new values.

- We use the `WHERE` clause to specify the condition that identifies the row to be updated, in this case, the employee with `EmployeeID = 2`.

This SQL statement will update the position to "Senior Software Engineer" and the salary to $90,000 for the employee with `EmployeeID` 2 in the "p4n_emp" table.

You can modify the `UPDATE` statement to update different columns and conditions as needed to make changes to your database's data.


You can adjust the data types and field lengths as needed for your specific database requirements.
