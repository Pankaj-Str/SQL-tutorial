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
