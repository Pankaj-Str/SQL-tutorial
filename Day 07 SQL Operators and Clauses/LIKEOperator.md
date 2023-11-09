# LIKE Operator
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

In SQL, the LIKE operator is used to search for a specified pattern within a text column. It is often used with wildcard characters to perform partial text matching. Let's explore the LIKE operator with examples:

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
    (6, 'Amit', 'Kumar', 'amit@p4n.in'),
    (7, 'Neha', 'Verma', 'neha@p4n.in');
```

Now, let's explore how the LIKE operator can be used to search for customers:

1. Using the % wildcard:
   Retrieve customers whose email addresses contain either "@codeswithpankaj.com" or "@p4n.in" anywhere in the address:

   ```sql
   SELECT * FROM Customers
   WHERE Email LIKE '%@codeswithpankaj.com%' OR Email LIKE '%@p4n.in%';
   ```

   Result:
   ```
   | CustomerID | FirstName | LastName | Email                     |
   |------------|-----------|----------|---------------------------|
   | 1          | Pankaj    | Sharma   | pankaj@codeswithpankaj.com|
   | 2          | Nishant   | Patel    | nishant@codeswithpankaj.com|
   | 3          | Kiran     | Desai    | kiran@codeswithpankaj.com  |
   | 4          | Tanvi     | Mehta    | tanvi@codeswithpankaj.com  |
   | 5          | Kritek    | Singh    | kritek@codeswithpankaj.com |
   | 6          | Amit      | Kumar    | amit@p4n.in                |
   | 7          | Neha      | Verma    | neha@p4n.in                |
   ```

   The `%` wildcard matches any sequence of characters, so this query selects customers whose email addresses contain either "@codeswithpankaj.com" or "@p4n.in" anywhere in the address.

2. Using the _ wildcard:
   Retrieve customers whose last names start with "S" and are four letters long:

   ```sql
   SELECT * FROM Customers
   WHERE LastName LIKE 'S___';
   ```

   Result:
   ```
   | CustomerID | FirstName | LastName | Email                     |
   |------------|-----------|----------|---------------------------|
   | 1          | Pankaj    | Sharma   | pankaj@codeswithpankaj.com|
   | 5          | Kritek    | Singh    | kritek@codeswithpankaj.com |
   ```

   The `_` wildcard matches a single character, so this query selects customers whose last names start with "S" and are four letters long.

3. Using a combination of wildcards:
   Retrieve customers whose first names start with "K" and end with "n":

   ```sql
   SELECT * FROM Customers
   WHERE FirstName LIKE 'K%n';
   ```

   Result:
   ```
   | CustomerID | FirstName | LastName | Email                     |
   |------------|-----------|----------|---------------------------|
   | 3          | Kiran     | Desai    | kiran@codeswithpankaj.com  |
   | 5          | Kritek    | Singh    | kritek@codeswithpankaj.com |
   ```

   This query uses both `%` and `_` wildcards to specify that the first name should start with "K" and end with "n."

The LIKE operator is a powerful tool in SQL for performing pattern matching operations on text data, making it useful for searching and filtering records based on text patterns.
