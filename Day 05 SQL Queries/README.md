# SQL Queries

| Sn.No. | Topic Name             |
|--------|------------------------|
| 1      | [Insert Query](InsertQuery.md)          |
| 2      | [Select Query](SelectQuery.md)          |
| 3      | [Select Into](SelectInto.md)            |
| 4      | [Insert Into Select](InsertIntoSelect.md)|
| 5      | [Update Query](UpdateQuery.md)          |
| 6      | [Delete Query](DeleteQuery.md)          |
| 7      | [Sorting Results](SortingResults.md)    |


SQL (Structured Query Language) is a domain-specific language used for managing and querying relational databases. SQL queries are statements written in SQL that are used to interact with a database. SQL queries enable you to retrieve, manipulate, insert, update, and delete data from a database.

SQL queries can be categorized into several types based on their purpose:

1. **Data Retrieval Queries**:
   - `SELECT` statements are used to retrieve data from one or more database tables.
   - You can specify columns to retrieve, conditions to filter data, sorting criteria, and more in a `SELECT` statement.

   Example:
   ```sql
   SELECT FirstName, LastName FROM Customers WHERE Country = 'USA' ORDER BY LastName;
   ```

2. **Data Manipulation Queries**:
   - `INSERT`, `UPDATE`, and `DELETE` statements are used to manipulate data in a database.
   - `INSERT` is used to add new rows to a table, `UPDATE` is used to modify existing rows, and `DELETE` is used to remove rows.

   Example:
   ```sql
   INSERT INTO Orders (CustomerID, OrderDate) VALUES (123, '2023-10-06');
   ```

3. **Data Definition Queries**:
   - `CREATE`, `ALTER`, and `DROP` statements are used to define, modify, or delete database objects such as tables, indexes, and constraints.
   - These queries are part of the Data Definition Language (DDL).

   Example:
   ```sql
   CREATE TABLE Products (
       ProductID INT PRIMARY KEY,
       ProductName VARCHAR(255),
       Price DECIMAL(10, 2)
   );
   ```

4. **Data Control Queries**:
   - `GRANT` and `REVOKE` statements are used to manage user privileges and permissions, controlling who can access and modify data in the database.
   - These queries are part of the Data Control Language (DCL).

   Example:
   ```sql
   GRANT SELECT ON Customers TO SalesTeam;
   ```

SQL queries are essential for interacting with databases and are the foundation of database-driven applications. They allow you to retrieve the information you need, modify data, define the database structure, and control access to the database. SQL is a standard language for relational databases, and while specific features and syntax may vary between database systems (e.g., MySQL, PostgreSQL, SQL Server), the core SQL language remains consistent.
