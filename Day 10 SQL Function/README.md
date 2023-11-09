# SQL Function

# Functions Documentation

## Table of Contents
| Sn. No | Topic Name                 |
|--------|----------------------------|
| 1      | [Aggregate Functions](AggregateFunctions.md)     |
| 2      | [Date and Time Functions](Date_TimeFunctions.md)  |
| 3      | [Scalar Functions](ScalarFunctions.md)            |
| 4      | [String Functions](StringFunctions.md)            |
| 5      | [User-Defined Functions](User-DefinedFunctions.md)|



SQL functions are database-specific operations that allow you to perform calculations, manipulate data, and return specific values or results. There are several categories of SQL functions, including:

1. **Scalar Functions**:
   Scalar functions operate on a single value and return a single value. They can be used in various SQL statements, such as SELECT, WHERE, and more. Common scalar functions include:

   - `CONCAT()` or `||`: Concatenates strings.
   - `UPPER()`: Converts a string to uppercase.
   - `LOWER()`: Converts a string to lowercase.
   - `LENGTH()` or `LEN()`: Returns the length of a string.
   - `SUBSTRING()`: Extracts a substring from a string.

   Example:
   ```sql
   SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
   ```

2. **Aggregate Functions**:
   Aggregate functions operate on a set of values and return a single value summarizing the data in a column. Common aggregate functions include:

   - `COUNT()`: Counts the number of rows or non-null values in a column.
   - `SUM()`: Calculates the sum of numeric values in a column.
   - `AVG()`: Calculates the average of numeric values in a column.
   - `MIN()`: Finds the minimum value in a column.
   - `MAX()`: Finds the maximum value in a column.

   Example:
   ```sql
   SELECT AVG(salary) AS avg_salary FROM employees;
   ```

3. **Date and Time Functions**:
   Date and time functions allow you to manipulate and perform calculations with date and time values. Common date and time functions include:

   - `GETDATE()`: Returns the current date and time.
   - `DATEADD()`: Adds a specified time interval to a date.
   - `DATEDIFF()`: Calculates the difference between two dates.
   - `YEAR()`, `MONTH()`, `DAY()`: Extracts components from a date.

   Example:
   ```sql
   SELECT DATEADD(MONTH, 3, hire_date) AS three_months_later FROM employees;
   ```

4. **String Functions**:
   String functions are used to manipulate and work with text data. They can be used to search, replace, and format strings. Common string functions include:

   - `CHARINDEX()`: Finds the position of a substring within a string.
   - `LEFT()`: Returns a specified number of characters from the beginning of a string.
   - `RIGHT()`: Returns a specified number of characters from the end of a string.
   - `REPLACE()`: Replaces occurrences of a substring with another substring.

   Example:
   ```sql
   SELECT REPLACE(description, 'old_text', 'new_text') AS updated_description FROM products;
   ```

5. **User-Defined Functions (UDFs)**:
   In addition to built-in functions, you can create your own custom functions using SQL. These functions allow you to encapsulate custom logic and reuse it within your queries.

   Example (SQL Server UDF):
   ```sql
   CREATE FUNCTION dbo.CalculateTax(@amount DECIMAL(10, 2)) RETURNS DECIMAL(10, 2)
   AS
   BEGIN
       DECLARE @tax DECIMAL(10, 2);
       SET @tax = @amount * 0.1; -- 10% tax rate
       RETURN @tax;
   END;
   ```

   You can then use this UDF in your SQL queries like any other function.

These are just a few examples of SQL functions. The specific functions available and their syntax may vary depending on the database system you are using (e.g., MySQL, PostgreSQL, SQL Server). You can refer to your database system's documentation for a comprehensive list of functions and their usage.
