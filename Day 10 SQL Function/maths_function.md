```sql

Create database codeswithpankaj;
use codeswithpankaj;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO employees(employee_id, first_name, last_name, email)
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
    
select * from employees;

```

Explore some mathematical functions in MySQL using the `employees` table as an example:

1. **ROUND(number, decimals):**
   - Rounds the `employee_id` to the nearest integer.

   ```sql
   SELECT ROUND(employee_id) AS rounded_id FROM employees;
   ```

2. **CEIL(number) and FLOOR(number):**
   - Rounds the `employee_id` up and down, respectively.

   ```sql
   SELECT CEIL(employee_id) AS ceil_id, FLOOR(employee_id) AS floor_id FROM employees;
   ```

3. **ABS(number):**
   - Returns the absolute value of the `employee_id`.

   ```sql
   SELECT ABS(employee_id) AS absolute_id FROM employees;
   ```

4. **RAND():**
   - Generates a random number for each employee.

   ```sql
   SELECT employee_id, RAND() AS random_number FROM employees;
   ```

5. **SQRT(number):**
   - Calculates the square root of the `employee_id`.

   ```sql
   SELECT employee_id, SQRT(employee_id) AS sqrt_id FROM employees;
   ```

6. **POWER(number, exponent):**
   - Raises the `employee_id` to the power of 2.

   ```sql
   SELECT employee_id, POWER(employee_id, 2) AS squared_id FROM employees;
   ```

7. **MOD(number, divisor):**
   - Returns the remainder when dividing `employee_id` by 3.

   ```sql
   SELECT employee_id, MOD(employee_id, 3) AS remainder FROM employees;
   ```


