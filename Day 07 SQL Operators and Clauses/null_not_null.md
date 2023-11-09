# SQL - IS NULL and IS NOT NULL
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

In SQL, the IS NULL and IS NOT NULL operators are used to check for the presence or absence of values in a column. These operators are commonly used in SQL queries to filter rows based on whether a specific column contains null or non-null values. Let's explore the SQL IS NULL and IS NOT NULL operators with examples:

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
    (5, 'Kritek', 'Singh', 'kritek@codeswithpankaj.com'),
    (6, 'Amit', 'Kumar', NULL),
    (7, 'Neha', 'Verma', NULL);
```

Now, let's explore how the SQL IS NULL and IS NOT NULL operators can be used to check for null and non-null values:

1. Using the IS NULL operator to filter customers with no email address:
   Retrieve customers whose email addresses are NULL:

   ```sql
   SELECT FirstName, LastName, Email
   FROM Customers
   WHERE Email IS NULL;
   ```

   Result:
   ```
   | FirstName | LastName | Email  |
   |-----------|----------|--------|
   | Amit      | Kumar    | NULL   |
   | Neha      | Verma    | NULL   |
   ```

   In this query, we use the IS NULL operator to filter customers whose email addresses are NULL.

2. Using the IS NOT NULL operator to filter customers with valid email addresses:
   Retrieve customers whose email addresses are not NULL:

   ```sql
   SELECT FirstName, LastName, Email
   FROM Customers
   WHERE Email IS NOT NULL;
   ```

   Result:
   ```
   | FirstName | LastName | Email                     |
   |-----------|----------|---------------------------|
   | Pankaj    | Sharma   | pankaj@codeswithpankaj.com|
   | Nishant   | Patel    | nishant@codeswithpankaj.com|
   | Kiran     | Desai    | kiran@codeswithpankaj.com  |
   | Tanvi     | Mehta    | tanvi@codeswithpankaj.com  |
   | Kritek    | Singh    | kritek@codeswithpankaj.com |
   ```

   In this query, we use the IS NOT NULL operator to filter customers whose email addresses are not NULL.

The SQL IS NULL and IS NOT NULL operators are valuable for checking the presence or absence of values in columns, particularly when dealing with missing or incomplete data in SQL databases.
