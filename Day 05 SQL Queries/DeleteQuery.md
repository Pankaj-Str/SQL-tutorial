# SQL - DELETE Query

| Sn.No. | Topic Name             |
|--------|------------------------|
| 1      | [Insert Query](InsertQuery.md)          |
| 2      | [Select Query](SelectQuery.md)          |
| 3      | [Select Into](SelectInto.md)            |
| 4      | [Insert Into Select](InsertIntoSelect.md)|
| 5      | [Update Query](UpdateQuery.md)          |
| 6      | [Delete Query](DeleteQuery.md)          |
| 7      | [Sorting Results](SortingResults.md)    |
---------

The `DELETE` statement is used to remove one or more records from a table. It allows you to specify the conditions that determine which rows should be deleted. Here's the basic syntax of a `DELETE` statement:

```sql
DELETE FROM table_name
WHERE condition;
```

Here's a breakdown of the components of a `DELETE` statement:

- `DELETE FROM`: Specifies the name of the table from which you want to delete records.

- `WHERE` (optional): Specifies the conditions that determine which rows will be deleted. If omitted, all rows in the table will be deleted.

Here's an example of how to use the `DELETE` statement:

Suppose you have a table named "p4n_emp" (as mentioned in previous conversations), and you want to delete an employee with a specific `EmployeeID` (e.g., EmployeeID 3).

```sql
-- Delete the employee with EmployeeID 3
DELETE FROM p4n_emp
WHERE EmployeeID = 3;
```

In this example:

- We specify the table name, "p4n_emp."

- We use the `WHERE` clause to specify the condition that identifies the row to be deleted, in this case, the employee with `EmployeeID = 3`.

This SQL statement will delete the employee with `EmployeeID` 3 from the "p4n_emp" table.

You can customize the `DELETE` statement to delete records based on specific conditions, such as deleting all employees in a certain department or with a certain salary range. Always use caution when using `DELETE` statements, as they permanently remove data from the table. Make sure to back up your data and double-check your conditions before executing a `DELETE` statement.
