# SQL Indexes

```yaml
SQL - Indexes
SQL - Create Index
SQL - Drop Index
SQL - Show Indexes
SQL - Unique Index
SQL - Clustered Index
SQL - Non-Clustered Index
```

1. **Create Table and Add Records**:

   ```sql
   -- Create the employees table
   CREATE TABLE employees (
       employee_id INT PRIMARY KEY,
       first_name VARCHAR(50),
       last_name VARCHAR(50),
       email VARCHAR(100)
   );

   
   INSERT INTO employees (employee_id, first_name, last_name, email)
   VALUES
       (1, 'Amit', 'Kumar', 'amit.kumar@codeswithpankaj.com'),
       (2, 'Priya', 'Sharma', 'priya.sharma@codeswithpankaj.com'),
       (3, 'Rajesh', 'Singh', 'rajesh.singh@codeswithpankaj.com'),
       (4, 'Neha', 'Patel', 'neha.patel@codeswithpankaj.com'),
       (5, 'Sanjay', 'Gupta', 'sanjay.gupta@codeswithpankaj.com'),
       (6, 'Pooja', 'Verma', 'pooja.verma@codeswithpankaj.com'),
       (7, 'Sandeep', 'Yadav', 'sandeep.yadav@codeswithpankaj.com'),
       (8, 'Meera', 'Shah', 'meera.shah@codeswithpankaj.com'),
       (9, 'Vikram', 'Mishra', 'vikram.mishra@codeswithpankaj.com'),
       (10, 'Anita', 'Goyal', 'anita.goyal@codeswithpankaj.com');
   ```

   This creates an `employees` table with four columns: `employee_id`, `first_name`, `last_name`, and `email`, and inserts 10 records with Indian names and email domains ending in "@codeswithpankaj.com."

2. **Create Index**:

   Let's create a non-clustered index on the `email` column to improve query performance when searching by email:

   ```sql
   CREATE NONCLUSTERED INDEX idx_email ON employees(email);
   ```

3. **Drop Index**:

   If you want to remove the `idx_email` index:

   ```sql
   DROP INDEX idx_email ON employees;
   ```

4. **Show Indexes**:

   Viewing indexes depends on your database system. In MySQL, you can use the following query:

   ```sql
   SHOW INDEXES FROM employees;
   ```

   In PostgreSQL, you can use:

   ```sql
   \di employees
   ```

   In SQL Server, you can use:

   ```sql
   EXEC sp_helpindex 'employees';
   ```

5. **Unique Index**:

   Let's create a unique index on the `email` column to ensure email addresses are unique:

   ```sql
   CREATE UNIQUE INDEX idx_unique_email ON employees(email);
   ```

6. **Clustered Index** (for SQL Server):

   SQL Server uses clustered indexes to determine the physical order of data rows. However, you can have only one clustered index per table. Let's create one on `employee_id`:

   ```sql
   CREATE CLUSTERED INDEX idx_clustered_employee_id ON employees(employee_id);
   ```

Now, you can execute these SQL statements in your database system and check the actual output and results according to your specific environment. The provided examples should work in most relational database systems with minor adjustments.
