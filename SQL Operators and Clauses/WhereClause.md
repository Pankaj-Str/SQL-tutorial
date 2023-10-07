# SQL - Where Clause

The SQL WHERE clause is a crucial component of SQL (Structured Query Language) that allows you to filter and retrieve specific rows from a database table based on specified conditions. It is used in conjunction with the SELECT statement to narrow down the results returned by a query. The WHERE clause essentially acts as a filter, helping you extract only the data that meets certain criteria.

Let's go through the concept of the SQL WHERE clause with elaborate data and coding examples:

Suppose we have a hypothetical database with a table named "Employees" that contains information about employees in a company. The table has the following structure:

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);
```

Now, let's populate the table with some sample data:

```sql
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
    (1, 'Pankaj', 'Sharma', 'HR', 50000.00, '2020-01-15'),
    (2, 'Nishant', 'Patel', 'Sales', 55000.00, '2019-05-20'),
    (3, 'Kiran', 'Desai', 'IT', 60000.00, '2021-03-10'),
    (4, 'Tanvi', 'Mehta', 'Finance', 65000.00, '2018-11-05'),
    (5, 'Kritek', 'Singh', 'HR', 48000.00, '2022-02-25');
```

Now, let's explore the SQL WHERE clause with various examples:

1. Basic WHERE clause:
   Retrieve all employees in the "HR" department:

   ```sql
   SELECT * FROM Employees
   WHERE Department = 'HR';
   ```

   Result:
   ```
   | EmployeeID | FirstName | LastName | Department | Salary   | HireDate   |
   |------------|-----------|----------|------------|----------|------------|
   | 1          | Pankaj    | Sharma   | HR         | 50000.00 | 2020-01-15 |
   | 5          | Kritek    | Singh    | HR         | 48000.00 | 2022-02-25 |
   ```

2. Using comparison operators:
   Retrieve employees with a salary greater than 55000:

   ```sql
   SELECT * FROM Employees
   WHERE Salary > 55000;
   ```

   Result:
   ```
   | EmployeeID | FirstName | LastName | Department | Salary   | HireDate   |
   |------------|-----------|----------|------------|----------|------------|
   | 3          | Kiran     | Desai    | IT         | 60000.00 | 2021-03-10 |
   | 4          | Tanvi     | Mehta    | Finance    | 65000.00 | 2018-11-05 |
   ```

3. Using logical operators (AND, OR):
   Retrieve employees in the "IT" department with a salary greater than 55000:

   ```sql
   SELECT * FROM Employees
   WHERE Department = 'IT' AND Salary > 55000;
   ```

   Result:
   ```
   | EmployeeID | FirstName | LastName | Department | Salary   | HireDate   |
   |------------|-----------|----------|------------|----------|------------|
   | 3          | Kiran     | Desai    | IT         | 60000.00 | 2021-03-10 |
   ```

4. Using wildcards:
   Retrieve employees whose last name starts with 'S':

   ```sql
   SELECT * FROM Employees
   WHERE LastName LIKE 'S%';
   ```

   Result:
   ```
   | EmployeeID | FirstName | LastName | Department | Salary   | HireDate   |
   |------------|-----------|----------|------------|----------|------------|
   | 2          | Nishant   | Patel    | Sales      | 55000.00 | 2019-05-20 |
   ```

5. Combining multiple conditions:
   Retrieve employees in the "HR" department or employees with a salary greater than 60000:

   ```sql
   SELECT * FROM Employees
   WHERE Department = 'HR' OR Salary > 60000;
   ```

   Result:
   ```
   | EmployeeID | FirstName | LastName | Department | Salary   | HireDate   |
   |------------|-----------|----------|------------|----------|------------|
   | 1          | Pankaj    | Sharma   | HR         | 50000.00 | 2020-01-15 |
   | 3          | Kiran     | Desai    | IT         | 60000.00 | 2021-03-10 |
   | 4          | Tanvi     | Mehta    | Finance    | 65000.00 | 2018-11-05 |
   ```

6. Date-based filtering:
   Retrieve employees hired after January 1, 2021:

   ```sql
   SELECT * FROM Employees
   WHERE HireDate > '2021-01-01';
   ```

   Result:
   ```
   | EmployeeID | FirstName | LastName | Department | Salary   | HireDate   |
   |------------|-----------|----------|------------|----------|------------|
   | 3          | Kiran     | Desai    | IT         | 60000.00 | 2021-03-10 |
   | 5          | Kritek    | Singh    | HR         | 48000.00 | 2022-02-25 |
   ```
