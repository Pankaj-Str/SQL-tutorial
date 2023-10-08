# Date and Time Functions


First, let's create a sample table called `employees`:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE
);

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date)
VALUES
    (1, 'Rohit', 'Gupta', 'rohit@codeswithpankaj.com', '2022-01-15'),
    (2, 'Pankaj', 'Sharma', 'pankaj@codeswithpankaj.com', '2021-03-20'),
    (3, 'Nishant', 'Verma', 'nishant@codeswithpankaj.com', '2023-02-10'),
    (4, 'Neelam', 'Singh', 'neelam@codeswithpankaj.com', '2022-11-05'),
    (5, 'Tanvi', 'Patel', 'tanvi@codeswithpankaj.com', '2021-09-30'),
    (6, 'Kiran', 'Yadav', 'kiran@codeswithpankaj.com', '2022-08-14'),
    (7, 'Ruby', 'Jain', 'ruby@codeswithpankaj.com', '2023-04-25'),
    (8, 'Priti', 'Mehta', 'priti@codeswithpankaj.com', '2022-06-08'),
    (9, 'Aditi', 'Raj', 'aditi@codeswithpankaj.com', '2021-12-01'),
    (10, 'Kritek', 'Agarwal', 'kritek@codeswithpankaj.com', '2023-03-15');
```

Now, let's demonstrate the common date and time functions:

1. **GETDATE()**:
   - Returns the current date and time.

   Example:
   ```sql
   SELECT GETDATE() AS current_datetime;
   ```

   Output:
   ```
   | current_datetime           |
   |----------------------------|
   | 2023-10-08 12:34:56.789   |
   ```

2. **DATEADD()**:
   - Adds a specified time interval to a date.

   Example:
   ```sql
   SELECT DATEADD(MONTH, 3, hire_date) AS three_months_later
   FROM employees;
   ```

   Output:
   ```
   | three_months_later |
   |---------------------|
   | 2022-04-15          |
   | 2021-06-20          |
   | 2023-05-10          |
   | 2023-02-05          |
   | 2021-12-30          |
   | 2022-11-14          |
   | 2023-07-25          |
   | 2022-09-08          |
   | 2022-03-01          |
   | 2023-06-15          |
   ```

3. **DATEDIFF()**:
   - Calculates the difference between two dates.

   Example:
   ```sql
   SELECT DATEDIFF(DAY, hire_date, GETDATE()) AS days_since_hire
   FROM employees;
   ```

   Output:
   ```
   | days_since_hire |
   |-----------------|
   | 267             |
   | 566             |
   | -241            |
   | 338             |
   | 744             |
   | 420             |
   | -178            |
   | 488             |
   | 676             |
   | -176            |
   ```

4. **YEAR(), MONTH(), DAY()**:
   - Extracts components from a date.

   Example:
   ```sql
   SELECT
       first_name,
       YEAR(hire_date) AS hire_year,
       MONTH(hire_date) AS hire_month,
       DAY(hire_date) AS hire_day
   FROM employees;
   ```

   Output:
   ```
   | first_name | hire_year | hire_month | hire_day |
   |------------|-----------|------------|----------|
   | Rohit      | 2022      | 1          | 15       |
   | Pankaj     | 2021      | 3          | 20       |
   | Nishant    | 2023      | 2          | 10       |
   | Neelam     | 2022      | 11         | 5        |
   | Tanvi      | 2021      | 9          | 30       |
   | Kiran      | 2022      | 8          | 14       |
   | Ruby       | 2023      | 4          | 25       |
   | Priti      | 2022      | 6          | 8        |
   | Aditi      | 2021      | 12         | 1        |
   | Kritek     | 2023      | 3          | 15       |
   ```

These date and time functions allow you to work with date and time values in SQL, perform calculations, and extract specific components for analysis and reporting.
