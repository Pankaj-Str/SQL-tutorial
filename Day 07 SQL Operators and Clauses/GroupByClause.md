# Group By Clause
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

The GROUP BY clause in SQL is used to group rows from a database table based on the values in one or more columns. It is often used in conjunction with aggregate functions like COUNT, SUM, AVG, MAX, or MIN to perform calculations on grouped data. Let's explore the GROUP BY clause with examples:

Suppose we have a hypothetical database with a table named "Orders" that contains information about customer orders, including the customer names and order amounts. Here's the table structure:

```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    OrderAmount DECIMAL(10, 2)
);
```

Now, let's populate the table with some sample data:

```sql
INSERT INTO Orders (OrderID, CustomerName, OrderAmount)
VALUES
    (1, 'Pankaj', 100.00),
    (2, 'Nishant', 150.00),
    (3, 'Kiran', 200.00),
    (4, 'Tanvi', 100.00),
    (5, 'Kritek', 250.00);
```

Now, let's explore how the GROUP BY clause can be used to group and aggregate data:

1. Basic GROUP BY clause:
   Group orders by customer name and calculate the total order amount for each customer:

   ```sql
   SELECT CustomerName, SUM(OrderAmount) AS TotalAmount
   FROM Orders
   GROUP BY CustomerName;
   ```

   Result:
   ```
   | CustomerName | TotalAmount |
   |--------------|-------------|
   | Pankaj       | 100.00      |
   | Nishant      | 150.00      |
   | Kiran        | 200.00      |
   | Tanvi        | 100.00      |
   | Kritek       | 250.00      |
   ```

   This query groups orders by customer name and calculates the total order amount for each customer.

2. GROUP BY with HAVING:
   Group orders by customer name and filter out customers with a total order amount greater than 200:

   ```sql
   SELECT CustomerName, SUM(OrderAmount) AS TotalAmount
   FROM Orders
   GROUP BY CustomerName
   HAVING SUM(OrderAmount) > 200;
   ```

   Result:
   ```
   | CustomerName | TotalAmount |
   |--------------|-------------|
   | Kiran        | 200.00      |
   | Kritek       | 250.00      |
   ```

   This query groups orders by customer name, calculates the total order amount for each customer, and then filters out customers with a total order amount greater than 200.

3. GROUP BY with COUNT:
   Count the number of orders placed by each customer:

   ```sql
   SELECT CustomerName, COUNT(*) AS NumberOfOrders
   FROM Orders
   GROUP BY CustomerName;
   ```

   Result:
   ```
   | CustomerName | NumberOfOrders |
   |--------------|----------------|
   | Pankaj       | 1              |
   | Nishant      | 1              |
   | Kiran        | 1              |
   | Tanvi        | 1              |
   | Kritek       | 1              |
   ```

   This query groups orders by customer name and counts the number of orders placed by each customer.

The GROUP BY clause is a powerful tool in SQL for summarizing and aggregating data based on specific criteria. It is commonly used in reporting and analysis to obtain insights from large datasets.
