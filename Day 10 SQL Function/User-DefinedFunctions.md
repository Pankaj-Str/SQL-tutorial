# User-Defined Functions (UDFs)

# Functions Documentation

## Table of Contents
| Sn. No | Topic Name                 |
|--------|----------------------------|
| 1      | [Aggregate Functions](AggregateFunctions.md)     |
| 2      | [Date and Time Functions](Date_TimeFunctions.md)  |
| 3      | [Scalar Functions](ScalarFunctions.md)            |
| 4      | [String Functions](StringFunctions.md)            |
| 5      | [User-Defined Functions](User-DefinedFunctions.md)|

First, let's create a table called `employees` with the specified records:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO employees (employee_id, first_name, last_name, email)
VALUES
    (1, 'Rohit', 'Gupta', 'rohit@codeswithpankaj.com'),
    (2, 'Pankaj', 'Sharma', 'pankaj@codeswithpankaj.com'),
    (3, 'Nishant', 'Verma', 'nishant@codeswithpankaj.com'),
    (4, 'Neelam', 'Singh', 'neelam@codeswithpankaj.com'),
    (5, 'Tanvi', 'Patel', 'tanvi@codeswithpankaj.com'),
    (6, 'Kiran', 'Yadav', 'kiran@codeswithpankaj.com'),
    (7, 'Ruby', 'Jain', 'ruby@codeswithpankaj.com'),
    (8, 'Priti', 'Mehta', 'priti@codeswithpankaj.com'),
    (9, 'Aditi', 'Raj', 'aditi@codeswithpankaj.com'),
    (10, 'Kritek', 'Agarwal', 'kritek@codeswithpankaj.com');
```

Now, let's create a simple UDF named `ConcatNames` that concatenates the first name and last name of employees with a space in between. Here's the UDF definition:

```sql
-- Creating a UDF
CREATE FUNCTION ConcatNames(first_name VARCHAR(50), last_name VARCHAR(50))
RETURNS VARCHAR(100)
BEGIN
    RETURN CONCAT(first_name, ' ', last_name);
END;
```

Now, let's use this UDF in a query to concatenate the names of employees and display the result:

```sql
-- Using the UDF in a query
SELECT employee_id, ConcatNames(first_name, last_name) AS full_name
FROM employees;
```

Output:

```
| employee_id | full_name      |
|-------------|----------------|
| 1           | Rohit Gupta    |
| 2           | Pankaj Sharma  |
| 3           | Nishant Verma  |
| 4           | Neelam Singh   |
| 5           | Tanvi Patel    |
| 6           | Kiran Yadav    |
| 7           | Ruby Jain      |
| 8           | Priti Mehta    |
| 9           | Aditi Raj      |
| 10          | Kritek Agarwal |
```

In this example, we created a UDF `ConcatNames` that takes two string parameters, concatenates them with a space in between, and returns the result. We then used this UDF in a SELECT query to concatenate the first and last names of employees and display them as `full_name`.

UDFs are powerful tools in SQL, allowing you to encapsulate complex logic and reuse it across multiple queries, making your code more maintainable and readable.
