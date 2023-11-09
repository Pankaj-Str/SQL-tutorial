# SQL - Aliases
| Sn. No. | Topic Name                                                                                                       |
|---------|------------------------------------------------------------------------------------------------------------------|
| 1       | [SQL - Where Clause](WhereClause.md)                                                                           |
| 2       | [SQL - Top Clause](TopClause.md)                                                                               |
| 3       | [SQL - Distinct Clause](DistinctClause.md)                                                                     |
| 4       | [SQL - Group By Clause](GroupByClause.md)                                                                     |
| 5       | [SQL - Having Clause](HavingClause.md)                                                                         |
| 6       | [SQL - AND & OR](AND_OR.md)                                                                                   |
| 7       | [SQL - BOOLEAN (BIT) Operator](BOOLEAN_BIT_Operator.md)                                                         |
| 8       | [SQL - LIKE Operator](LIKEOperator.md)                                                                         |
| 9      | [SQL - IN Operator](INOperator.md)                                                                             |
| 10      | [SQL - ANY, ALL Operators](ANYALLOperators.md)                                                                 |
| 11      | [SQL - EXISTS Operator](EXISTSOperator.md)                                                                     |
| 12      | [SQL - CASE](CASE.md)                                                                                         |
| 13      | [SQL - NOT Operator](NOTOperator.md)                                                                           |
| 14      | [SQL - NOT EQUAL](NOTEQUAL.md)                                                                                |
| 15      | [SQL - IS NOT NULL and NULL](null_not_null.md)                                                                |
| 16      | [SQL - UNION And UNION ALL](UNION_UNIONALL.md)                                                                |
| 17      | [SQL - INTERSECT Operator](INTERSECT_EXCEPT_Operator.md)                                                         |
| 18      | [SQL - Aliases](Aliases.md)                                                                                  |

--------

In SQL, aliases are used to give a temporary name to a table or column for the duration of a SQL query. Aliases make SQL queries more readable and provide a way to rename tables or columns with more meaningful or concise names. Let's explore SQL aliases with examples:

Suppose we have a hypothetical database with a table named "Customers" that contains information about customers, including their names and updated email addresses with "@codeswithpankaj.com" or "@p4n.in." Here's the table structure:

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);
```

Now, let's populate the table with some sample data:

```sql
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES
    (1, 'Pankaj', 'Sharma', 'pankaj@codeswithpankaj.com'),
    (2, 'Nishant', 'Patel', 'nishant@codeswithpankaj.com'),
    (3, 'Kiran', 'Desai', 'kiran@codeswithpankaj.com'),
    (4, 'Tanvi', 'Mehta', 'tanvi@codeswithpankaj.com'),
    (5, 'Kritek', 'Singh', 'kritek@codeswithpankaj.com');
```

Now, let's explore how SQL aliases can be used to rename tables and columns:

1. Using table aliases to simplify table names:
   Retrieve the first names of customers using a table alias:

   ```sql
   SELECT c.FirstName
   FROM Customers AS c;
   ```

   Result:
   ```
   | FirstName |
   |-----------|
   | Pankaj    |
   | Nishant   |
   | Kiran     |
   | Tanvi     |
   | Kritek    |
   ```

   In this query, we use the "AS" keyword to assign the alias "c" to the "Customers" table, making the query more concise.

2. Using column aliases to rename columns:
   Retrieve the email addresses of customers with column aliases:

   ```sql
   SELECT Email AS CustomerEmail
   FROM Customers;
   ```

   Result:
   ```
   | CustomerEmail            |
   |--------------------------|
   | pankaj@codeswithpankaj.com|
   | nishant@codeswithpankaj.com|
   | kiran@codeswithpankaj.com  |
   | tanvi@codeswithpankaj.com  |
   | kritek@codeswithpankaj.com |
   ```

   In this query, we use the "AS" keyword to assign the alias "CustomerEmail" to the "Email" column, providing a more descriptive name in the result set.

SQL aliases are beneficial for simplifying and improving the readability of SQL queries, especially in complex queries involving multiple tables or columns. They also enable you to create more meaningful names for columns in query results.
