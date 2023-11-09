# UNION and UNION ALL
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

In SQL, the UNION and UNION ALL operators are used to combine the results of two or more SELECT queries into a single result set. While both operators serve a similar purpose, they have some key differences in terms of duplicate rows. Let's explore the SQL UNION and UNION ALL operators with examples:

Suppose we have a hypothetical database with two tables, "Customers" and "Suppliers," each containing information about individuals and companies, including their names and updated email addresses with "@codeswithpankaj.com" or "@p4n.in." Here's the table structure:

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Email VARCHAR(100)
);
```

Now, let's populate the "Customers" table with some sample data:

```sql
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES
    (1, 'Pankaj', 'Sharma', 'pankaj@codeswithpankaj.com'),
    (2, 'Nishant', 'Patel', 'nishant@codeswithpankaj.com'),
    (3, 'Kiran', 'Desai', 'kiran@codeswithpankaj.com'),
    (4, 'Tanvi', 'Mehta', 'tanvi@codeswithpankaj.com'),
    (5, 'Kritek', 'Singh', 'kritek@codeswithpankaj.com');

INSERT INTO Suppliers (SupplierID, CompanyName, Email)
VALUES
    (101, 'ABC Inc.', 'abc@codeswithpankaj.com'),
    (102, 'XYZ Ltd.', 'xyz@codeswithpankaj.com'),
    (103, 'Company A', 'companya@p4n.in');
```

Now, let's explore how the SQL UNION and UNION ALL operators can be used to combine results:

1. Using the UNION operator to combine customer and supplier emails without duplicate rows:
   Retrieve a list of unique email addresses from both the "Customers" and "Suppliers" tables:

   ```sql
   SELECT Email FROM Customers
   UNION
   SELECT Email FROM Suppliers;
   ```

   Result:
   ```
   | Email                     |
   |---------------------------|
   | abc@codeswithpankaj.com   |
   | companya@p4n.in           |
   | kiran@codeswithpankaj.com |
   | kritek@codeswithpankaj.com|
   | nishant@codeswithpankaj.com|
   | pankaj@codeswithpankaj.com|
   | tanvi@codeswithpankaj.com  |
   | xyz@codeswithpankaj.com   |
   ```

   In this query, we use the UNION operator to combine the email addresses from both tables, eliminating duplicate rows.

2. Using the UNION ALL operator to combine customer and supplier emails with duplicate rows:
   Retrieve a list of all email addresses from both the "Customers" and "Suppliers" tables, including duplicates:

   ```sql
   SELECT Email FROM Customers
   UNION ALL
   SELECT Email FROM Suppliers;
   ```

   Result:
   ```
   | Email                     |
   |---------------------------|
   | pankaj@codeswithpankaj.com|
   | nishant@codeswithpankaj.com|
   | kiran@codeswithpankaj.com  |
   | tanvi@codeswithpankaj.com  |
   | kritek@codeswithpankaj.com |
   | abc@codeswithpankaj.com   |
   | xyz@codeswithpankaj.com   |
   | companya@p4n.in           |
   ```

   In this query, we use the UNION ALL operator to combine the email addresses from both tables, including duplicate rows.

The SQL UNION operator is used to combine and return unique rows from multiple SELECT statements, while the SQL UNION ALL operator combines and returns all rows, including duplicates. These operators are helpful for merging data from different tables or queries into a single result set.
