# SQL - Where Clause
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
-----
In MySQL, the `SELECT` statement is used to retrieve data from one or more tables. The `WHERE` clause is commonly used in conjunction with `SELECT` to specify a condition for filtering the rows that should be returned. Here's a basic syntax for a simple `SELECT` statement with a `WHERE` clause:

```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

Here, `column1, column2, ...` are the columns you want to retrieve, `table_name` is the name of the table from which you want to retrieve data, and `condition` is the filtering condition.

Here are some examples of using the `WHERE` clause with different conditions:

1. **Equal to a specific value:**
   ```sql
   SELECT * 
   FROM employees 
   WHERE department_id = 1;
   ```

2. **Not equal to a specific value:**
   ```sql
   SELECT * 
   FROM products 
   WHERE category_id <> 5;
   ```

3. **Greater than or equal to a value:**
   ```sql
   SELECT * 
   FROM orders 
   WHERE total_amount >= 1000;
   ```

4. **Less than a value:**
   ```sql
   SELECT * 
   FROM students 
   WHERE age < 18;
   ```

5. **Combining conditions with AND:**
   ```sql
   SELECT * 
   FROM customers 
   WHERE city = 'New York' AND state = 'NY';
   ```

6. **Combining conditions with OR:**
   ```sql
   SELECT * 
   FROM products 
   WHERE category_id = 1 OR category_id = 2;
   ```

7. **Checking if a value is within a range:**
   ```sql
   SELECT * 
   FROM employees 
   WHERE salary BETWEEN 50000 AND 80000;
   ```

8. **Checking if a value is NULL:**
   ```sql
   SELECT * 
   FROM orders 
   WHERE customer_id IS NULL;
   ```

These are just basic examples, and you can create more complex conditions using logical operators (`AND`, `OR`, `NOT`) and parentheses to group conditions as needed. Remember to adapt the examples to your specific database schema and requirements.
