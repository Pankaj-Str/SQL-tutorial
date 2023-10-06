# SQL - Temporary Tables

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

Temporary tables in SQL are special tables that are used to store temporary data for the duration of a database session. They are often used for intermediate storage of data within a query or a series of queries and are particularly useful in complex data manipulation scenarios. Temporary tables are scoped to the session or connection in which they are created and are automatically dropped when the session ends.

There are generally two types of temporary tables:

1. **Local Temporary Tables** (prefix: `#`): These tables are only visible within the current session or connection. They are automatically dropped when the session that created them ends.

2. **Global Temporary Tables** (prefix: `##`): These tables are visible to all sessions but are dropped when the last session that references them ends.

Here's how to create and use temporary tables:

**Creating Local Temporary Table:**

```sql
CREATE TEMPORARY TABLE #TempTable (
    ID INT,
    Name VARCHAR(50)
);
```

**Creating Global Temporary Table:**

```sql
CREATE TEMPORARY TABLE ##TempTable (
    ID INT,
    Name VARCHAR(50)
);
```

**Inserting Data into a Temporary Table:**

```sql
INSERT INTO #TempTable (ID, Name) VALUES (1, 'John'), (2, 'Alice');
```

**Querying Data from a Temporary Table:**

```sql
SELECT * FROM #TempTable;
```

**Dropping a Temporary Table (Optional):**

Temporary tables are automatically dropped when the session ends. However, you can explicitly drop them if needed:

```sql
DROP TEMPORARY TABLE #TempTable;
```

Please note the following about temporary tables:

- Temporary tables are typically used for intermediate storage during complex queries or stored procedures.
- They are useful when you need to break down a complex operation into smaller steps or when you want to store intermediate results.
- Temporary tables can have indexes, constraints, and triggers just like regular tables.
- Temporary tables can be used in the same way as permanent tables within your SQL statements.
- The lifetime of temporary tables is tied to the session/connection that created them. They are automatically cleaned up when the session ends.
- Be cautious when using global temporary tables, as they can be accessed by multiple sessions and may have synchronization considerations.

The exact syntax and behavior of temporary tables may vary slightly depending on the database system you are using, so it's essential to consult the documentation for your specific database management system for details and best practices.
