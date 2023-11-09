# RIGHT JOIN (or RIGHT OUTER JOIN): 
## Table of Contents
| Sn. No | Join Type                |
|--------|--------------------------|
| 1      | [Full Join](FullJoin.md) |
| 2      | [Inner Join](InnerJoin.md)|
| 3      | [Left Join](LeftJoin.md)  |
| 4      | [Right Join](RightJoin.md)|
| 5      | [Self Join](SelfJoin.md)  |
***
In SQL, the RIGHT JOIN (or RIGHT OUTER JOIN) is used to retrieve rows from the right table along with matching rows from the left table. If there are no matches in the left table, the result will still contain rows from the right table with NULL values in the columns from the left table. RIGHT JOIN is valuable for fetching data from the secondary table while including related data from the primary table, even if some rows have no matches in the primary table. Let's explore SQL RIGHT JOIN with examples:

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

Now, let's explore how the SQL RIGHT JOIN can be used to retrieve data from both "Orders" and "Customers" tables, including orders without associated customers:

1. Using RIGHT JOIN to retrieve order information with customer details:
   Retrieve a list of order dates and customer names, including orders without associated customers:

   ```sql
   SELECT o.OrderDate, c.FirstName, c.LastName
   FROM Orders AS o
   RIGHT JOIN Customers AS c ON o.CustomerID = c.CustomerID;
   ```

   Result:
   ```
   | OrderDate | FirstName | LastName |
   |-----------|-----------|----------|
   | 2023-01-15| Pankaj    | Sharma   |
   | 2023-02-20| Nishant   | Patel    |
   | 2023-03-10| Kiran     | Desai    |
   | 2023-05-12| Tanvi     | Mehta    |
   | NULL      | Kritek    | Singh    |
   ```

   In this query, we use RIGHT JOIN to combine order information from the "Orders" table with customer details from the "Customers" table. Orders without associated customers have NULL values in the "FirstName" and "LastName" columns.

2. Using RIGHT JOIN with aggregated functions:
   Retrieve the total amount spent on orders, including orders without associated customers:

   ```sql
   SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
   FROM Orders AS o
   RIGHT JOIN Customers AS c ON o.CustomerID = c.CustomerID
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

   In this query, we use RIGHT JOIN to combine order and customer data, and then we use the GROUP BY clause with the SUM function to calculate the total amount spent on orders, including those without associated customers.

SQL RIGHT JOIN is a valuable tool for retrieving data from the secondary table while including related data from the primary table, ensuring that all rows from the secondary table are included in the result, even if some have no matches in the primary table.
