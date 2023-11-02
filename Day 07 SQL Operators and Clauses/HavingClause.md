# Having Clause

The HAVING clause in SQL is used to filter the results of a GROUP BY query based on a specified condition. It allows you to filter aggregated data to include only groups that meet the specified criteria. Let's explore the HAVING clause with examples:

Suppose we have a hypothetical database with a table named "Sales" that contains information about sales transactions, including the salesperson names and total sales amounts. Here's the table structure:

```sql
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SalespersonName VARCHAR(50),
    SaleAmount DECIMAL(10, 2)
);
```

Now, let's populate the table with some sample data:

```sql
INSERT INTO Sales (SaleID, SalespersonName, SaleAmount)
VALUES
    (1, 'Pankaj', 100.00),
    (2, 'Nishant', 150.00),
    (3, 'Kiran', 200.00),
    (4, 'Tanvi', 100.00),
    (5, 'Kritek', 250.00);
```

Now, let's explore how the HAVING clause can be used to filter aggregated data:

1. Basic HAVING clause:
   Group sales by salesperson name and filter out salespersons with a total sale amount greater than 200:

   ```sql
   SELECT SalespersonName, SUM(SaleAmount) AS TotalSales
   FROM Sales
   GROUP BY SalespersonName
   HAVING SUM(SaleAmount) > 200;
   ```

   Result:
   ```
   | SalespersonName | TotalSales |
   |-----------------|------------|
   | Kiran           | 200.00     |
   | Kritek          | 250.00     |
   ```

   This query groups sales by salesperson name, calculates the total sale amount for each salesperson, and then filters out salespersons with a total sale amount greater than 200.

2. HAVING with COUNT:
   Group sales by salesperson name and filter out salespersons with more than 1 sale:

   ```sql
   SELECT SalespersonName, COUNT(*) AS NumberOfSales
   FROM Sales
   GROUP BY SalespersonName
   HAVING COUNT(*) > 1;
   ```

   Result:
   ```
   | SalespersonName | NumberOfSales |
   |-----------------|---------------|
   | Pankaj          | 1             |
   | Nishant         | 1             |
   | Tanvi           | 1             |
   | Kritek          | 1             |
   ```

   This query groups sales by salesperson name, counts the number of sales for each salesperson, and then filters out salespersons with more than 1 sale.

The HAVING clause is a valuable tool in SQL for filtering aggregated data, allowing you to focus on specific groups that meet your criteria. It is commonly used in combination with the GROUP BY clause to perform more advanced data analysis tasks.
