# SQL - Constraints

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

In SQL, constraints are rules or conditions that you can apply to a table or one or more columns within a table to enforce data integrity and maintain data accuracy. Constraints help ensure that data entered into the database meets certain criteria and adheres to business rules. Here are some common types of constraints in SQL:

1. **Primary Key Constraint**:
   - Ensures that each row in a table has a unique identifier.
   - Guarantees that the column(s) specified as the primary key will have unique values and cannot contain NULL values.
   - Typically used to identify records uniquely.
   - Example:
     ```sql
     CREATE TABLE Employees (
         EmployeeID INT PRIMARY KEY,
         FirstName VARCHAR(50),
         LastName VARCHAR(50)
     );
     ```

2. **Foreign Key Constraint**:
   - Enforces referential integrity by ensuring that values in one table's column correspond to values in another table's column (usually the primary key of the referenced table).
   - Helps maintain relationships between tables.
   - Example:
     ```sql
     CREATE TABLE Orders (
         OrderID INT PRIMARY KEY,
         CustomerID INT,
         OrderDate DATE,
         FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
     );
     ```

3. **Unique Constraint**:
   - Ensures that values in a column or a combination of columns are unique across all rows in the table (except for NULL values).
   - Does not prevent NULL values.
   - Example:
     ```sql
     CREATE TABLE Students (
         StudentID INT PRIMARY KEY,
         StudentEmail VARCHAR(255) UNIQUE
     );
     ```

4. **Check Constraint**:
   - Specifies a condition that data must meet before it can be inserted or updated in a column.
   - Used to enforce business rules or constraints.
   - Example:
     ```sql
     CREATE TABLE Products (
         ProductID INT PRIMARY KEY,
         Price DECIMAL(10, 2) CHECK (Price >= 0)
     );
     ```

5. **Default Constraint**:
   - Specifies a default value for a column when no value is provided during an INSERT operation.
   - Example:
     ```sql
     CREATE TABLE Orders (
         OrderID INT PRIMARY KEY,
         OrderDate DATE DEFAULT CURRENT_DATE
     );
     ```

6. **Not Null Constraint**:
   - Ensures that a column does not contain NULL values.
   - Example:
     ```sql
     CREATE TABLE Customers (
         CustomerID INT PRIMARY KEY,
         FirstName VARCHAR(50) NOT NULL,
         LastName VARCHAR(50) NOT NULL
     );
     ```

Constraints help maintain data quality and consistency in your database. By defining appropriate constraints, you can prevent invalid or inconsistent data from being inserted or updated, which is essential for data accuracy and reliability.
