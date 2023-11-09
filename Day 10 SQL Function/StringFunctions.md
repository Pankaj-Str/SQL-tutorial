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

Now, let's demonstrate the common string functions:

1. **CHARINDEX()**:
   - Finds the position of a substring within a string.

   Example:
   ```sql
   SELECT CHARINDEX('kaj', email) AS position_kaj
   FROM employees;
   ```

   Output:
   ```
   | position_kaj |
   |--------------|
   | 10           |
   | 5            |
   | 6            |
   | 7            |
   | 5            |
   | 5            |
   | 5            |
   | 5            |
   | 5            |
   | 6            |
   ```

2. **LEFT()**:
   - Returns a specified number of characters from the beginning of a string.

   Example:
   ```sql
   SELECT LEFT(first_name, 3) AS left_three_chars
   FROM employees;
   ```

   Output:
   ```
   | left_three_chars |
   |------------------|
   | Roh              |
   | Pan              |
   | Nis              |
   | Nee              |
   | Tan              |
   | Kir              |
   | Rub              |
   | Pri              |
   | Adi              |
   | Kri              |
   ```

3. **RIGHT()**:
   - Returns a specified number of characters from the end of a string.

   Example:
   ```sql
   SELECT RIGHT(last_name, 4) AS right_four_chars
   FROM employees;
   ```

   Output:
   ```
   | right_four_chars |
   |------------------|
   | upta             |
   | harma            |
   | Verma            |
   | Singh            |
   | Patel            |
   | Yadav            |
   | Jain             |
   | Mehta            |
   | Raj              |
   | Agar             |
   ```

4. **REPLACE()**:
   - Replaces occurrences of a substring with another substring.

   Example (using "@p4n.in" as the replacement domain):
   ```sql
   SELECT REPLACE(email, '@codeswithpankaj.com', '@p4n.in') AS updated_email
   FROM employees;
   ```

   Output:
   ```
   | updated_email              |
   |---------------------------|
   | rohit@p4n.in               |
   | pankaj@p4n.in              |
   | nishant@p4n.in             |
   | neelam@p4n.in              |
   | tanvi@p4n.in               |
   | kiran@p4n.in               |
   | ruby@p4n.in                |
   | priti@p4n.in               |
   | aditi@p4n.in               |
   | kritek@p4n.in              |
   ```

These string functions are valuable for manipulating and working with text data in SQL, allowing you to perform various operations on string values within your queries.
