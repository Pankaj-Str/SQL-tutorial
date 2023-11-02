# SQL - SORTING Results

| Sn.No. | Topic Name             |
|--------|------------------------|
| 1      | [Insert Query](InsertQuery.md)          |
| 2      | [Select Query](SelectQuery.md)          |
| 3      | [Select Into](SelectInto.md)            |
| 4      | [Insert Into Select](InsertIntoSelect.md)|
| 5      | [Update Query](UpdateQuery.md)          |
| 6      | [Delete Query](DeleteQuery.md)          |
| 7      | [Sorting Results](SortingResults.md)    |


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



You can use the `ORDER BY` clause in SQL to sort the results of your `SELECT` queries in ascending or descending order based on one or more columns. Here are some examples of how to sort results using the "p4n_emp" table:

1. **Sort by Salary in Ascending Order:**

   To retrieve all employees and sort them by salary in ascending order:

   ```sql
   SELECT FirstName, LastName, Salary
   FROM p4n_emp
   ORDER BY Salary ASC;
   ```

2. **Sort by Salary in Descending Order:**

   To retrieve all employees and sort them by salary in descending order:

   ```sql
   SELECT FirstName, LastName, Salary
   FROM p4n_emp
   ORDER BY Salary DESC;
   ```

3. **Sort by Last Name and First Name in Ascending Order:**

   To retrieve all employees and sort them by last name and first name in ascending order:

   ```sql
   SELECT FirstName, LastName
   FROM p4n_emp
   ORDER BY LastName ASC, FirstName ASC;
   ```

4. **Sort by Department and Salary in Descending Order:**

   To retrieve all employees and sort them by department (ascending) and salary (descending):

   ```sql
   SELECT FirstName, LastName, Department, Salary
   FROM p4n_emp
   ORDER BY Department ASC, Salary DESC;
   ```

5. **Sort by Birthdate in Ascending Order:**

   To retrieve all employees and sort them by date of birth in ascending order:

   ```sql
   SELECT FirstName, LastName, DateOfBirth
   FROM p4n_emp
   ORDER BY DateOfBirth ASC;
   ```

6. **Sort by Multiple Columns with Different Sort Orders:**

   To retrieve all employees and sort them by department in ascending order and salary in descending order:

   ```sql
   SELECT FirstName, LastName, Department, Salary
   FROM p4n_emp
   ORDER BY Department ASC, Salary DESC;
   ```

These examples demonstrate how to use the `ORDER BY` clause to sort the results of your SQL queries using the "p4n_emp" table. You can customize the sorting criteria and order (ascending or descending) to meet your specific requirements.
