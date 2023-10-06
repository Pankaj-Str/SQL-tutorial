# SQL - Show Tables (Listing Tables)

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

In SQL, you can use the `SHOW TABLES` or `SHOW TABLE STATUS` statement, depending on the database management system (DBMS) you are using, to list or display the names of all the tables in a specific database or schema. The exact command may vary slightly between different database systems. Here are examples for some popular DBMSs:

1. **MySQL / MariaDB**:

   To list all tables in a MySQL or MariaDB database, you can use the `SHOW TABLES` statement:

   ```sql
   SHOW TABLES;
   ```

   This will return a list of table names in the current database.

2. **PostgreSQL**:

   In PostgreSQL, you can query the `pg_catalog` schema to list all tables in the current schema:

   ```sql
   SELECT tablename FROM pg_catalog.pg_tables WHERE schemaname = 'public';
   ```

   This query lists the table names in the "public" schema, which is the default schema in PostgreSQL. You can modify the `schemaname` condition to specify a different schema if needed.

3. **Microsoft SQL Server**:

   To list tables in Microsoft SQL Server, you can query the `information_schema` views:

   ```sql
   SELECT table_name FROM information_schema.tables WHERE table_type = 'BASE TABLE';
   ```

   This query retrieves the names of base tables in the current database.

4. **Oracle Database**:

   In Oracle, you can query the `DBA_TABLES` view to list tables in the current schema:

   ```sql
   SELECT table_name FROM dba_tables WHERE owner = 'YOUR_SCHEMA_NAME';
   ```

   Replace `'YOUR_SCHEMA_NAME'` with the name of the schema you want to list tables from.

--------
In MySQL, you can use the `SHOW TABLES` statement to list or display the names of all tables in the currently selected database. Here's how to use it:

```sql
SHOW TABLES;
```

When you run this command, MySQL will return a list of table names from the currently selected database.

To switch to a specific database and then list its tables, you can use the `USE` statement to select the database first and then run `SHOW TABLES`. For example:

```sql
USE your_database_name;
SHOW TABLES;
```

Replace `your_database_name` with the name of the database you want to work with.

Here's a complete example:

```sql
-- Switch to the "your_database_name" database
USE your_database_name;

-- List all tables in the selected database
SHOW TABLES;
```

This will display a list of table names in the specified database.


