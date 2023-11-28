# String Functions

# Functions Documentation

## Table of Contents
| Sn. No | Topic Name                 |
|--------|----------------------------|
| 1      | [Aggregate Functions](AggregateFunctions.md)     |
| 2      | [Date and Time Functions](Date_TimeFunctions.md)  |
| 3      | [Scalar Functions](ScalarFunctions.md)            |
| 4      | [String Functions](StringFunctions.md)            |
| 5      | [User-Defined Functions](User-DefinedFunctions.md)|

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
```
Let's use the `employees` table you've created to demonstrate some string functions in MySQL:

1. **CONCAT(str1, str2, ...):**
   - Concatenates first and last names.

   ```sql
   SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
   ```

2. **UPPER(str) and LOWER(str):**
   - Converts email addresses to uppercase and lowercase.

   ```sql
   SELECT UPPER(email) AS uppercase_email, LOWER(email) AS lowercase_email FROM employees;
   ```

3. **SUBSTRING(str, start, length):**
   - Extracts the first three characters of the email.

   ```sql
   SELECT SUBSTRING(email, 1, 3) AS email_prefix FROM employees;
   ```

4. **LENGTH(str) or CHAR_LENGTH(str):**
   - Returns the length of the first names.

   ```sql
   SELECT first_name, LENGTH(first_name) AS name_length FROM employees;
   ```

5. **TRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str):**
   - Removes leading and trailing spaces from email addresses.

   ```sql
   SELECT TRIM(BOTH ' ' FROM email) AS trimmed_email FROM employees;
   ```

6. **REPLACE(str, old_substring, new_substring):**
   - Replaces 'codeswithpankaj.com' with 'example.com' in email addresses.

   ```sql
   SELECT REPLACE(email, 'codeswithpankaj.com', 'example.com') AS modified_email FROM employees;
   ```

These examples demonstrate how to use various string functions with the `employees` table. You can modify and combine these functions based on your specific requirements.
