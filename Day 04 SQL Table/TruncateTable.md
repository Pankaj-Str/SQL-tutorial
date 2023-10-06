# SQL - TRUNCATE TABLE

The `TRUNCATE TABLE` statement in SQL is used to quickly delete all rows from a table, effectively removing all the data in the table while retaining the table structure. Unlike the `DELETE` statement, which can be used to delete specific rows based on conditions, `TRUNCATE TABLE` removes all rows without the need for specifying conditions. Here's the basic syntax:

```sql
TRUNCATE TABLE table_name;
```

Where `table_name` is the name of the table from which you want to remove all data.

Here's an example:

```sql
TRUNCATE TABLE Employees;
```

In this example, all rows in the "Employees" table will be deleted, but the table structure and column definitions remain intact.

Please note the following considerations when using `TRUNCATE TABLE`:

1. **Speed**: `TRUNCATE TABLE` is generally faster than using `DELETE FROM table_name`, especially for large tables, because it minimizes transaction log activity.

2. **No WHERE Clause**: You cannot specify a `WHERE` clause with `TRUNCATE TABLE` to conditionally delete rows; it removes all rows in the table.

3. **Reset Auto-Increment**: If the table has auto-incrementing columns (e.g., an `INT` column with the `AUTO_INCREMENT` attribute in MySQL), `TRUNCATE TABLE` will reset the auto-increment counter to its initial value.

4. **Referential Integrity**: Be aware that if the table is referenced by foreign keys from other tables, you may need to temporarily remove or disable those foreign key constraints before using `TRUNCATE TABLE`.

5. **Permissions**: You need appropriate permissions (typically `TRUNCATE` and `ALTER`) on the table to execute `TRUNCATE TABLE`.

6. **Data Recovery**: Unlike `DELETE`, `TRUNCATE TABLE` cannot be used to selectively delete specific rows or to recover the deleted data. Once data is truncated, it's typically gone unless you have a backup.

Use `TRUNCATE TABLE` when you need to quickly and efficiently remove all data from a table without affecting the table structure.


# Example of using the `TRUNCATE TABLE` statement in SQL:

Suppose we have a table named "Customers" with the following data:

```plaintext
+----+-----------+----------+-----------------+
| ID | FirstName | LastName | Email           |
+----+-----------+----------+-----------------+
|  1 | John      | Smith    | john@email.com  |
|  2 | Alice     | Johnson  | alice@email.com |
|  3 | Bob       | Brown    | bob@email.com   |
+----+-----------+----------+-----------------+
```

To remove all rows from the "Customers" table using the `TRUNCATE TABLE` statement, you can execute the following SQL query:

```sql
TRUNCATE TABLE Customers;
```

After executing this statement, the "Customers" table will be empty. It will retain its structure (columns, data types, constraints, etc.), but all rows will be deleted:

```plaintext
+----+-----------+----------+-------------+
| ID | FirstName | LastName | Email       |
+----+-----------+----------+-------------+
|    |           |          |             |
+----+-----------+----------+-------------+
```

As shown, all data in the table has been removed, leaving an empty table with the same structure. This operation is efficient and fast, especially for large tables, as it minimizes transaction log activity and is generally faster than using the `DELETE FROM` statement to remove all rows.
