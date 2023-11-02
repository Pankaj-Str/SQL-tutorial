# SQL data types
| Sn.No. | Topic Name              |
|--------|-------------------------|
| 1      | [Data Types](DataTypes.md)          |
| 2      | [Create Table](CreateTable.md)        |
| 3      | [Constraints](Constraints.md)        |
| 4      | [Show Tables](ShowTables.md)          |
| 5      | [Rename Table](RenameTable.md)        |
| 6      | [Truncate Table](TruncateTable.md)    |
| 7      | [Clone Tables](CloneTables.md)        |
| 8      | [Temporary Tables](TemporaryTables.md)|
| 9      | [Alter Tables](AlterTables.md)        |
| 10     | [Drop Table](DropTable.md)            |
| 11     | [Delete Table](DeleteTable.md)        |
-------

1. **INT (Integer)**:
   - Represents whole numbers.
   - Examples:
     ```sql
     CREATE TABLE Students (
         student_id INT PRIMARY KEY,
         age INT
     );
     ```

2. **VARCHAR (Variable-Length Character)**:
   - Stores variable-length character strings.
   - Examples:
     ```sql
     CREATE TABLE Employees (
         employee_id INT PRIMARY KEY,
         first_name VARCHAR(50),
         last_name VARCHAR(50)
     );
     ```

3. **DATE**:
   - Stores date values in the format 'YYYY-MM-DD'.
   - Examples:
     ```sql
     CREATE TABLE Orders (
         order_id INT PRIMARY KEY,
         order_date DATE
     );
     ```

4. **TIME**:
   - Stores time values in the format 'HH:MM:SS'.
   - Examples:
     ```sql
     CREATE TABLE Appointments (
         appointment_id INT PRIMARY KEY,
         appointment_time TIME
     );
     ```

5. **DATETIME**:
   - Stores date and time values in the format 'YYYY-MM-DD HH:MM:SS'.
   - Examples:
     ```sql
     CREATE TABLE Events (
         event_id INT PRIMARY KEY,
         event_datetime DATETIME
     );
     ```

6. **CHAR (Fixed-Length Character)**:
   - Stores fixed-length character strings.
   - Examples:
     ```sql
     CREATE TABLE Products (
         product_id INT PRIMARY KEY,
         product_code CHAR(10)
     );
     ```

7. **FLOAT**:
   - Stores floating-point numbers.
   - Examples:
     ```sql
     CREATE TABLE Stock (
         stock_id INT PRIMARY KEY,
         price FLOAT
     );
     ```

8. **BOOLEAN (or BOOL)**:
   - Stores true/false or 1/0 values.
   - Examples:
     ```sql
     CREATE TABLE Tasks (
         task_id INT PRIMARY KEY,
         is_completed BOOLEAN
     );
     ```

9. **TEXT**:
   - Stores large text data.
   - Examples:
     ```sql
     CREATE TABLE Comments (
         comment_id INT PRIMARY KEY,
         comment_text TEXT
     );
     ```

10. **BLOB (Binary Large Object)**:
    - Stores binary data, such as images or files.
    - Examples:
      ```sql
      CREATE TABLE Images (
          image_id INT PRIMARY KEY,
          image_data BLOB
      );
      ```

11. **ENUM**:
    - Defines a list of enumerated values.
    - Examples:
      ```sql
      CREATE TABLE DaysOfWeek (
          day_id INT PRIMARY KEY,
          day_name ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')
      );
      ```

These are some of the commonly used data types in SQL. The choice of data type depends on the nature of the data you want to store and the requirements of your database schema. Different database systems might have variations in data types and their behavior, so it's essential to consult the documentation of your specific database system for precise details and options.
