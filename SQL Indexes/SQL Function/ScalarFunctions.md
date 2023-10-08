# Scalar Functions

Let's create a table and use it to demonstrate these common scalar functions with examples and provide the expected output. We'll set the email domain to "@codeswithpankaj.com" and use the specified names for records.

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

Now, we'll use this `employees` table to demonstrate the common scalar functions and change the email domain:

1. **CONCAT() or ||**:
   - Concatenates strings.

   Example:
   ```sql
   SELECT CONCAT(first_name, ' ', last_name) AS full_name
   FROM employees;
   ```

   Output:
   ```
   | full_name      |
   |----------------|
   | Rohit Gupta    |
   | Pankaj Sharma  |
   | Nishant Verma  |
   | Neelam Singh   |
   | Tanvi Patel    |
   | Kiran Yadav    |
   | Ruby Jain      |
   | Priti Mehta    |
   | Aditi Raj      |
   | Kritek Agarwal |
   ```

2. **UPPER()**:
   - Converts a string to uppercase.

   Example:
   ```sql
   SELECT UPPER(email) AS uppercase_email
   FROM employees;
   ```

   Output:
   ```
   | uppercase_email             |
   |-----------------------------|
   | ROHIT@CODESWITHPANKAJ.COM   |
   | PANKAJ@CODESWITHPANKAJ.COM |
   | NISHANT@CODESWITHPANKAJ.COM |
   | NEELAM@CODESWITHPANKAJ.COM  |
   | TANVI@CODESWITHPANKAJ.COM   |
   | KIRAN@CODESWITHPANKAJ.COM   |
   | RUBY@CODESWITHPANKAJ.COM    |
   | PRITI@CODESWITHPANKAJ.COM   |
   | ADITI@CODESWITHPANKAJ.COM   |
   | KRITEK@CODESWITHPANKAJ.COM  |
   ```

3. **LOWER()**:
   - Converts a string to lowercase.

   Example:
   ```sql
   SELECT LOWER(email) AS lowercase_email
   FROM employees;
   ```

   Output:
   ```
   | lowercase_email             |
   |-----------------------------|
   | rohit@codeswithpankaj.com   |
   | pankaj@codeswithpankaj.com |
   | nishant@codeswithpankaj.com |
   | neelam@codeswithpankaj.com  |
   | tanvi@codeswithpankaj.com   |
   | kiran@codeswithpankaj.com   |
   | ruby@codeswithpankaj.com    |
   | priti@codeswithpankaj.com   |
   | aditi@codeswithpankaj.com   |
   | kritek@codeswithpankaj.com  |
   ```

4. **LENGTH() or LEN()**:
   - Returns the length (number of characters) of a string.

   Example (for databases using LENGTH()):
   ```sql
   SELECT LENGTH(email) AS email_length
   FROM employees;
   ```

   Output:
   ```
   | email_length |
   |--------------|
   | 26           |
   | 26           |
   | 26           |
   | 26           |
   | 26           |
   | 26           |
   | 26           |
   | 26           |
   | 26           |
   | 26           |
   ```

5. **SUBSTRING()**:
   - Extracts a substring from a string.

   Example:
   ```sql
   SELECT SUBSTRING(email, 1, 5) AS extracted_text
   FROM employees;
   ```

   Output:
   ```
   | extracted_text |
   |----------------|
   | rohit          |
   | panka          |
   | nisha          |
   | neela          |
   | tanvi          |
   | kiran          |
   | ruby@          |
   | priti          |
   | aditi          |
   | krite          |
   ```

These scalar functions are useful for text manipulation and formatting within your SQL queries, and they allow you to change the email domain for the specified records as required.
