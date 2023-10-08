# LEFT JOIN (or LEFT OUTER JOIN):

In SQL, the LEFT JOIN (or LEFT OUTER JOIN) is used to retrieve rows from the left table along with matching rows from the right table. If there are no matches in the right table, the result will still contain rows from the left table with NULL values in the columns from the right table. LEFT JOIN is valuable for fetching data from the primary table while including related data from the secondary table, even if some rows have no matches in the secondary table. Let's explore SQL LEFT JOIN with examples:

Suppose we have a hypothetical database with two tables, "Orders" and "Customers," containing information about customer orders and customer details. Here's the table structure:

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);
```

Now, let's populate the "Customers" and "Orders" tables with some sample data:

```sql
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES
    (1, 'Pankaj', 'Sharma', 'pankaj@codeswithpankaj.com'),
    (2, 'Nishant', 'Patel', 'nishant@codeswithpankaj.com'),
    (3, 'Kiran', 'Desai', 'kiran@codeswithpankaj.com'),
    (4, 'Tanvi', 'Mehta', 'tanvi@codeswithpankaj.com'),
    (5, 'Kritek', 'Singh', 'kritek@codeswithpankaj.com');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2023-01-15', 250.00),
    (102, 2, '2023-02-20', 120.50),
    (103, 3, '2023-03-10', 320.75),
    (105, 4, '2023-05-12', 210.00);
```

Now, let's explore how the SQL LEFT JOIN can be used to retrieve data from both "Customers" and "Orders" tables, including customers who haven't placed any orders:

1. Using LEFT JOIN to retrieve customer information with their order details:
   Retrieve a list of customer names and their order dates, including customers who haven't placed any orders:

   ```sql
   SELECT c.FirstName, c.LastName, o.OrderDate
   FROM Customers AS c
   LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID;
   ```

   Result:
   ```
   | FirstName | LastName | OrderDate |
   |-----------|----------|-----------|
   | Pankaj    | Sharma   | 2023-01-15|
   | Nishant   | Patel    | 2023-02-20|
   | Kiran     | Desai    | 2023-03-10|
   | Tanvi     | Mehta    | 2023-05-12|
   | Kritek    | Singh    | NULL      |
   ```

   In this query, we use LEFT JOIN to combine customer information from the "Customers" table with order information from the "Orders" table. Customers who haven't placed any orders have NULL values in the "OrderDate" column.

2. Using LEFT JOIN with aggregated functions:
   Retrieve the total amount spent by each customer, including customers who haven't placed any orders:

   ```sql
   SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
   FROM Customers AS c
   LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID
   GROUP BY c.FirstName, c.LastName;
   ```

   Result:
   ```
   | FirstName | LastName | TotalSpent |
   |-----------|----------|------------|
   | Pankaj    | Sharma   | 250.00     |
   | Nishant   | Patel    | 120.50     |
   | Kiran     | Desai    | 320.75     |
   | Tanvi     | Mehta    | 210.00     |
   | Kritek    | Singh    | NULL       |
   ```

   In this query, we use LEFT JOIN to combine customer and order data, and then we use the GROUP BY clause with the SUM function to calculate the total amount spent by each customer, including those who haven't placed any orders.

SQL LEFT JOIN is a powerful tool for retrieving data from the primary table while including related data from the secondary table, ensuring that all rows from the primary table are included in the result, even if some have no matches in the secondary table.
