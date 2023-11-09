# SQL - INTERSECT Operator and INTERSECT Operator
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

In SQL, the INTERSECT and EXCEPT operators are used to perform set operations on the result sets of two or more SELECT queries. These operators allow you to find common elements between sets (INTERSECT) or find elements in one set but not in another (EXCEPT). Let's explore the SQL INTERSECT and EXCEPT operators with examples:

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

Now, let's populate the "Customers" and "Suppliers" tables with some sample data:

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

Now, let's explore how the SQL INTERSECT and EXCEPT operators can be used to perform set operations:

1. Using the INTERSECT operator to find common email addresses between customers and suppliers:
   Retrieve email addresses that are common between the "Customers" and "Suppliers" tables:

   ```sql
   SELECT Email FROM Customers
   INTERSECT
   SELECT Email FROM Suppliers;
   ```

   Result:
   ```
   | Email                     |
   |---------------------------|
   | abc@codeswithpankaj.com   |
   | kritek@codeswithpankaj.com|
   | nishant@codeswithpankaj.com|
   | pankaj@codeswithpankaj.com|
   ```

   In this query, we use the INTERSECT operator to find the common email addresses between customers and suppliers.

2. Using the EXCEPT operator to find email addresses of customers not found among suppliers:
   Retrieve email addresses of customers that are not found among suppliers:

   ```sql
   SELECT Email FROM Customers
   EXCEPT
   SELECT Email FROM Suppliers;
   ```

   Result:
   ```
   | Email                     |
   |---------------------------|
   | kiran@codeswithpankaj.com  |
   | tanvi@codeswithpankaj.com  |
   ```

   In this query, we use the EXCEPT operator to find email addresses of customers that are not present among suppliers.

The SQL INTERSECT and EXCEPT operators are valuable for performing set operations and finding common elements or differences between result sets, making them useful tools for data analysis and comparison in SQL queries.
