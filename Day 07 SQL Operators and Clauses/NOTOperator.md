# SQL - NOT Operator
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

In SQL, the NOT operator is used to negate the result of a condition or expression. It reverses the logical value of a Boolean expression, making it useful for filtering rows that do not meet a specific condition. Let's explore the SQL NOT operator with examples:

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

Now, let's explore how the SQL NOT operator can be used for negating conditions:

1. Using the NOT operator to filter customers with email domains other than "@codeswithpankaj.com":
   Retrieve customers whose email domains are not "@codeswithpankaj.com":

   ```sql
   SELECT FirstName, LastName, Email
   FROM Customers
   WHERE NOT Email LIKE '%@codeswithpankaj.com%';
   ```

   Result:
   ```
   | FirstName | LastName | Email                |
   |-----------|----------|----------------------|
   | Amit      | Kumar    | amit@p4n.in          |
   | Neha      | Verma    | neha@p4n.in          |
   ```

   In this query, we use the NOT operator to negate the condition and select customers whose email domains are not "@codeswithpankaj.com."

2. Using the NOT operator with other conditions:
   Retrieve customers whose last names are not 'Mehta' and whose first names are not 'Amit':

   ```sql
   SELECT FirstName, LastName
   FROM Customers
   WHERE NOT (LastName = 'Mehta' AND FirstName = 'Amit');
   ```

   Result:
   ```
   | FirstName | LastName |
   |-----------|----------|
   | Pankaj    | Sharma   |
   | Nishant   | Patel    |
   | Kiran     | Desai    |
   | Kritek    | Singh    |
   | Neha      | Verma    |
   ```

   In this query, we use the NOT operator to negate a combination of conditions and select customers whose last names are not 'Mehta' and whose first names are not 'Amit.'

The SQL NOT operator is a valuable tool for inverting conditions and filtering rows that do not meet specific criteria, allowing for more precise data retrieval in SQL queries.
