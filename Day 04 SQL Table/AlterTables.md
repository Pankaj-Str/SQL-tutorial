# SQL - ALTER TABLE

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


In SQL, the `ALTER TABLE` statement is used to modify an existing table's structure, such as adding, modifying, or dropping columns, changing data types, adding or removing constraints, and more. It allows you to make changes to an existing table without deleting and recreating it, preserving the data stored in the table.

Here are some common operations you can perform using `ALTER TABLE`:

1. **Add a New Column**:
   You can add a new column to an existing table using the `ADD` clause.

   ```sql
   ALTER TABLE table_name
   ADD new_column_name data_type;
   ```

2. **Modify Column Definition**:
   You can modify the definition of an existing column, such as changing its data type or size.

   ```sql
   ALTER TABLE table_name
   MODIFY column_name new_data_type;
   ```

3. **Rename a Column**:
   You can rename an existing column using the `RENAME COLUMN` clause (not supported in all database systems).

   ```sql
   ALTER TABLE table_name
   RENAME COLUMN old_column_name TO new_column_name;
   ```

4. **Drop a Column**:
   You can remove an existing column from a table.

   ```sql
   ALTER TABLE table_name
   DROP column_name;
   ```

5. **Add Constraints**:
   You can add constraints like primary keys, foreign keys, unique constraints, and check constraints to a table.

   ```sql
   ALTER TABLE table_name
   ADD CONSTRAINT constraint_name constraint_definition;
   ```

6. **Drop Constraints**:
   You can drop existing constraints from a table.

   ```sql
   ALTER TABLE table_name
   DROP CONSTRAINT constraint_name;
   ```

7. **Change Table Name**:
   Some database systems allow you to change the name of a table.

   ```sql
   ALTER TABLE old_table_name
   RENAME TO new_table_name;
   ```

8. **Change Table Engine (MySQL)**:
   In MySQL, you can change the storage engine of a table.

   ```sql
   ALTER TABLE table_name
   ENGINE = new_engine;
   ```

9. **Change Default Value**:
   You can modify the default value of an existing column.

   ```sql
   ALTER TABLE table_name
   ALTER COLUMN column_name SET DEFAULT new_default_value;
   ```

Please note that the exact syntax and supported operations may vary depending on the database management system you are using. It's essential to consult the documentation for your specific database system for detailed syntax and options related to the `ALTER TABLE` statement.
