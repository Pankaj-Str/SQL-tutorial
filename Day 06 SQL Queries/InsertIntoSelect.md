# SQL - Insert Into... Select Statement

| Sn.No. | Topic Name             |
|--------|------------------------|
| 1      | [Insert Query](InsertQuery.md)          |
| 2      | [Select Query](SelectQuery.md)          |
| 3      | [Select Into](SelectInto.md)            |
| 4      | [Insert Into Select](InsertIntoSelect.md)|
| 5      | [Update Query](UpdateQuery.md)          |
| 6      | [Delete Query](DeleteQuery.md)          |
| 7      | [Sorting Results](SortingResults.md)    |

--------


Suppose you have two tables, `source_table` and `cwp_emp`, and you want to insert data from `source_table` into `cwp_emp`. The tables have the following structures:

```sql
-- Source table
CREATE TABLE source_table (
    employee_id INT,
    employee_name VARCHAR(255),
    department VARCHAR(255),
    salary DECIMAL(10, 2)
);

-- Target table
CREATE TABLE cwp_emp (
    employee_id INT,
    employee_name VARCHAR(255),
    department VARCHAR(255),
    salary DECIMAL(10, 2)
);
```

You can use the `INSERT INTO...SELECT` statement like this:

```sql
INSERT INTO cwp_emp (employee_id, employee_name, department, salary)
SELECT employee_id, employee_name, department, salary
FROM source_table;
```

In this example:

1. We specify the columns in the target table (`cwp_emp`) where we want to insert data using `INSERT INTO cwp_emp (column1, column2, ...)`.
2. We then use the `SELECT` statement to specify the source of the data we want to insert. In this case, we select the corresponding columns from the `source_table` using `SELECT employee_id, employee_name, department, salary`.
3. The data from the `SELECT` statement is inserted into the specified columns of the `cwp_emp` table.

Make sure the columns in the source table match the columns and data types in the target table, and the number of columns in the `INSERT INTO` and `SELECT` statements match as well. This will ensure that the data is inserted correctly.
