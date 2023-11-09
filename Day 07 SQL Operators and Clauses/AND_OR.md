# AND & OR
| Sn. No. | Topic Name                                                                                                       |
|---------|------------------------------------------------------------------------------------------------------------------|
| 1       | [SQL - Where Clause](WhereClause.md)                                                                           |
| 2       | [SQL - Top Clause](TopClause.md)                                                                               |
| 3       | [SQL - Distinct Clause](DistinctClause.md)                                                                     |
| 4       | [SQL - Group By Clause](GroupByClause.md)                                                                     |
| 5       | [SQL - Having Clause](HavingClause.md)                                                                         |
| 6       | [SQL - AND & OR](AND_OR.md)                                                                                   |
| 7       | [SQL - BOOLEAN (BIT) Operator](BOOLEAN_BIT_Operator.md)                                                         |
| 8       | [SQL - LIKE Operator](LIKEOperator.md)                                                                         |
| 9      | [SQL - IN Operator](INOperator.md)                                                                             |
| 10      | [SQL - ANY, ALL Operators](ANYALLOperators.md)                                                                 |
| 11      | [SQL - EXISTS Operator](EXISTSOperator.md)                                                                     |
| 12      | [SQL - CASE](CASE.md)                                                                                         |
| 13      | [SQL - NOT Operator](NOTOperator.md)                                                                           |
| 14      | [SQL - NOT EQUAL](NOTEQUAL.md)                                                                                |
| 15      | [SQL - IS NOT NULL and NULL](null_not_null.md)                                                                |
| 16      | [SQL - UNION And UNION ALL](UNION_UNIONALL.md)                                                                |
| 17      | [SQL - INTERSECT Operator](INTERSECT_EXCEPT_Operator.md)                                                         |
| 18      | [SQL - Aliases](Aliases.md)                                                                                  |

--------

In SQL, the logical operators AND and OR are used to combine multiple conditions in a WHERE clause to filter and retrieve data from a database table. These operators allow you to create complex conditions for data selection. Let's explore the AND and OR operators with examples:

Suppose we have a hypothetical database with a table named "Employees" that contains information about employees, including their names, departments, and salaries. Here's the table structure:

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

Now, let's explore how the AND and OR operators can be used to create complex conditions:

1. Using the AND operator:
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

   This query uses the AND operator to combine two conditions: employees must be in the "IT" department (Department = 'IT') and have a salary greater than 55000 (Salary > 55000).

2. Using the OR operator:
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

   This query uses the OR operator to combine two conditions: employees can be in the "HR" department (Department = 'HR') or have a salary greater than 60000 (Salary > 60000).

The AND and OR operators are powerful tools in SQL that allow you to create flexible and customized queries by combining multiple conditions to filter data from database tables.
