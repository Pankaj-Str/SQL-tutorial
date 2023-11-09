# INNER JOIN
## Table of Contents
| Sn. No | Join Type                |
|--------|--------------------------|
| 1      | [Full Join](FullJoin.md) |
| 2      | [Inner Join](InnerJoin.md)|
| 3      | [Left Join](LeftJoin.md)  |
| 4      | [Right Join](RightJoin.md)|
| 5      | [Self Join](SelfJoin.md)  |
***
In SQL, the INNER JOIN is used to combine rows from two or more tables based on a related column between them. The INNER JOIN returns only the rows that have matching values in both tables, making it a powerful tool for retrieving data from multiple related tables. Let's explore SQL INNER JOIN with examples:

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
    (104, 1, '2023-04-05', 175.25),
    (105, 4, '2023-05-12', 210.00);
```

Now, let's explore how the SQL INNER JOIN can be used to retrieve data from both "Customers" and "Orders" tables:

1. Using INNER JOIN to retrieve customer information with their order details:
   Retrieve a list of customer names and their order dates:

   ```sql
   SELECT c.FirstName, c.LastName, o.OrderDate
   FROM Customers AS c
   INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID;
   ```

   Result:
   ```
   | FirstName | LastName | OrderDate |
   |-----------|----------|-----------|
   | Pankaj    | Sharma   | 2023-01-15|
   | Nishant   | Patel    | 2023-02-20|
   | Kiran     | Desai    | 2023-03-10|
   | Pankaj    | Sharma   | 2023-04-05|
   | Tanvi     | Mehta    | 2023-05-12|
   ```

   In this query, we use INNER JOIN to combine customer information from the "Customers" table and order information from the "Orders" table based on the common "CustomerID" column.

2. Using INNER JOIN with aggregated functions:
   Retrieve the total amount spent by each customer:

   ```sql
   SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
   FROM Customers AS c
   INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
   GROUP BY c.FirstName, c.LastName;
   ```

   Result:
   ```
   | FirstName | LastName | TotalSpent |
   |-----------|----------|------------|
   | Pankaj    | Sharma   | 425.25     |
   | Nishant   | Patel    | 120.50     |
   | Kiran     | Desai    | 320.75     |
   | Tanvi     | Mehta    | 210.00     |
   ```

   In this query, we use INNER JOIN to combine customer and order data, and then we use the GROUP BY clause with the SUM function to calculate the total amount spent by each customer.

SQL INNER JOIN is a fundamental operation for retrieving related data from multiple tables, and it's widely used in database queries to create meaningful reports and insights.
