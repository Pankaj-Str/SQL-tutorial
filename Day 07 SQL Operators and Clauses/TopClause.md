# SQL - Top Clause
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

Suppose we have a hypothetical database with a table named "Products" that contains information about various products, including their names and prices. Here's the table structure:

```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);
```

Now, let's populate the table with some sample data:

```sql
INSERT INTO Products (ProductID, ProductName, Price)
VALUES
    (1, 'Laptop', 800.00),
    (2, 'Smartphone', 500.00),
    (3, 'Tablet', 300.00),
    (4, 'Headphones', 100.00),
    (5, 'Monitor', 250.00);
```

Now, let's explore how the "TOP" clause can be used to retrieve a specific number of rows:

1. Basic "TOP" clause:
   Retrieve the top 3 products based on price:

   ```sql
   SELECT TOP 3 * FROM Products
   ORDER BY Price DESC;
   ```

   Result:
   ```
   | ProductID | ProductName | Price   |
   |-----------|-------------|---------|
   | 1         | Laptop      | 800.00  |
   | 2         | Smartphone  | 500.00  |
   | 5         | Monitor     | 250.00  |
   ```

   This query returns the top 3 products with the highest prices, ordered in descending order.

2. Using the "TOP" clause with a percentage:
   Retrieve the top 50% of products based on price:

   ```sql
   SELECT TOP 50 PERCENT * FROM Products
   ORDER BY Price DESC;
   ```

   Result:
   ```
   | ProductID | ProductName | Price   |
   |-----------|-------------|---------|
   | 1         | Laptop      | 800.00  |
   | 2         | Smartphone  | 500.00  |
   ```

   This query returns the top 50% of products with the highest prices.

3. Using the "TOP" clause with ties:
   Retrieve the top 2 products with the same highest price:

   ```sql
   SELECT TOP 2 WITH TIES * FROM Products
   ORDER BY Price DESC;
   ```

   Result:
   ```
   | ProductID | ProductName | Price   |
   |-----------|-------------|---------|
   | 1         | Laptop      | 800.00  |
   | 2         | Smartphone  | 500.00  |
   | 5         | Monitor     | 250.00  |
   ```

   The "WITH TIES" option includes additional rows with the same value as the last row in the sorted order.

The "TOP" clause is a valuable tool in SQL for limiting the number of rows returned by a query and is commonly used in scenarios where you want to fetch a specific subset of data from a table.
