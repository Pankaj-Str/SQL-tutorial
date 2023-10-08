# FULL OUTER JOIN

MySQL does not have a FULL OUTER JOIN operator like some other database systems. However, you can achieve the same result as a FULL OUTER JOIN by using a combination of a LEFT JOIN and a UNION ALL of a RIGHT JOIN. Here's how you can do it:

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

Now, let's create a MySQL query that simulates a FULL OUTER JOIN:

```sql
-- LEFT JOIN to get all customers and their orders
SELECT c.FirstName, c.LastName, o.OrderDate
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID

UNION ALL

-- RIGHT JOIN to get all orders and their associated customers
SELECT c.FirstName, c.LastName, o.OrderDate
FROM Customers AS c
RIGHT JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE c.CustomerID IS NULL;
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

In this query, we first use a LEFT JOIN to get all customers and their orders. Then, we use a RIGHT JOIN to get all orders and their associated customers, but we filter out rows where the customer is not found (c.CustomerID IS NULL) to avoid duplicate rows. Finally, we use UNION ALL to combine the results of the two queries, effectively simulating a FULL OUTER JOIN.

This approach allows you to achieve the equivalent of a FULL OUTER JOIN in MySQL using LEFT JOIN, RIGHT JOIN, and UNION ALL.
