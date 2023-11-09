# Aggregate Functions
# Functions Documentation

## Table of Contents
| Sn. No | Topic Name                 |
|--------|----------------------------|
| 1      | [Aggregate Functions](AggregateFunctions.md)     |
| 2      | [Date and Time Functions](Date_TimeFunctions.md)  |
| 3      | [Scalar Functions](ScalarFunctions.md)            |
| 4      | [String Functions](StringFunctions.md)            |
| 5      | [User-Defined Functions](User-DefinedFunctions.md)|
First, let's create a sample table called `employees`:

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

Now, let's demonstrate the common aggregate functions:

1. **COUNT()**:
   - Counts the number of rows or non-null values in a column.

   Example:
   ```sql
   SELECT COUNT(*) AS total_records
   FROM employees;
   ```

   Output:
   ```
   | total_records |
   |---------------|
   | 10            |
   ```

2. **SUM()**:
   - Calculates the sum of numeric values in a column. Note that the `SUM()` function is typically used with numeric columns, such as salary.

   Example (assuming there is a `salary` column):
   ```sql
   SELECT SUM(salary) AS total_salary
   FROM employees;
   ```

   Output (assuming salary values are provided):
   ```
   | total_salary |
   |--------------|
   | 0.00         |  -- The actual sum depends on the data
   ```

3. **AVG()**:
   - Calculates the average of numeric values in a column. As with `SUM()`, it's typically used with numeric columns.

   Example (assuming there is a `salary` column):
   ```sql
   SELECT AVG(salary) AS average_salary
   FROM employees;
   ```

   Output (assuming salary values are provided):
   ```
   | average_salary |
   |----------------|
   | 0.00           |  -- The actual average depends on the data
   ```

4. **MIN()**:
   - Finds the minimum value in a column. For text columns, it returns the lowest alphabetical value.

   Example:
   ```sql
   SELECT MIN(first_name) AS min_first_name
   FROM employees;
   ```

   Output:
   ```
   | min_first_name |
   |----------------|
   | Aditi          |
   ```

5. **MAX()**:
   - Finds the maximum value in a column. For text columns, it returns the highest alphabetical value.

   Example:
   ```sql
   SELECT MAX(last_name) AS max_last_name
   FROM employees;
   ```

   Output:
   ```
   | max_last_name |
   |---------------|
   | Yadav         |
   ```

These aggregate functions are useful for summarizing and analyzing data in SQL, and you can apply them to various columns based on your requirements.
