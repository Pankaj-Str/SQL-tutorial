# SQL - Rename Table

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

To rename a table in SQL, you can use the `ALTER TABLE` statement followed by the `RENAME TO` clause. The exact syntax may vary slightly depending on the database management system (DBMS) you are using. Here's a general example:

```sql
ALTER TABLE old_table_name RENAME TO new_table_name;
```

Replace `old_table_name` with the current name of the table you want to rename, and `new_table_name` with the desired new name for the table.

Here are examples for some popular DBMSs:

**MySQL / MariaDB**:
```sql
ALTER TABLE old_table_name RENAME TO new_table_name;
```

**PostgreSQL**:
```sql
ALTER TABLE old_table_name RENAME TO new_table_name;
```

**Microsoft SQL Server**:
```sql
EXEC sp_rename 'old_table_name', 'new_table_name';
```

**Oracle Database**:
```sql
ALTER TABLE old_table_name RENAME TO new_table_name;
```

Please note the following considerations:

1. You usually need appropriate permissions to rename a table, especially in a production environment.

2. Renaming a table can affect other database objects like views, triggers, and stored procedures that reference the table. You may need to update these objects to reflect the new table name.

3. The new table name must adhere to the rules and naming conventions of the DBMS you are using.

4. Renaming a table does not change the table's structure or data; it only changes the table's name.

5. Be cautious when renaming tables in a production environment and consider making a backup of the database or testing the operation in a development or staging environment first.
