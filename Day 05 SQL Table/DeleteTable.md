# SQL - Delete Table

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
In SQL, the `DELETE` statement is used to remove rows from a table based on specified conditions, but it does not delete the table itself. If you want to remove all the rows from a table without deleting the table structure, you can use the `DELETE` statement without a `WHERE` clause, like this:

```sql
DELETE FROM table_name;
```

Here, `table_name` should be replaced with the name of the table from which you want to remove all rows. For example:

```sql
DELETE FROM Customers;
```

This statement will delete all rows from the "Customers" table, leaving the table structure intact.

Please note the following considerations when using the `DELETE` statement:

1. **No WHERE Clause**: If you omit the `WHERE` clause, as shown in the example, all rows in the specified table will be deleted. Use this with caution, as it can result in the loss of all data in the table.

2. **Transactions**: The `DELETE` statement is usually executed within a transaction. You may need to commit the transaction explicitly to make the changes permanent.

3. **Foreign Keys**: If the table is referenced by foreign keys from other tables, be careful when deleting data from it to avoid violating referential integrity constraints.

4. **Data Recovery**: Unlike the `DROP TABLE` statement, the `DELETE` statement can be rolled back within a transaction, allowing you to recover the deleted data until the transaction is committed. However, once the transaction is committed, the data is permanently deleted.

5. **Performance**: For large tables, deleting all rows with `DELETE FROM table_name;` can be slow and resource-intensive. Consider using `TRUNCATE TABLE` for a more efficient way to remove all data from a table while preserving the table structure.

Remember that the `DELETE` statement is primarily used for removing specific rows based on conditions, while the `DROP TABLE` statement is used to delete the entire table. Use these statements according to your specific requirements.
