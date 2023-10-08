# CASE

In SQL, the CASE statement is a powerful conditional expression that allows you to perform conditional logic within a SQL query. It's often used to return different values or perform different actions based on specified conditions. Let's explore the SQL CASE statement with examples:

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

Now, let's explore how the SQL CASE statement can be used for conditional logic:

1. Using the CASE statement to categorize customers based on their email domain:
   Categorize customers as either 'Internal' if their email domain is "@codeswithpankaj.com" or 'External' if their email domain is "@p4n.in":

   ```sql
   SELECT FirstName, LastName, Email,
       CASE
           WHEN Email LIKE '%@codeswithpankaj.com' THEN 'Internal'
           WHEN Email LIKE '%@p4n.in' THEN 'External'
           ELSE 'Unknown'
       END AS EmailCategory
   FROM Customers;
   ```

   Result:
   ```
   | FirstName | LastName | Email                     | EmailCategory |
   |-----------|----------|---------------------------|---------------|
   | Pankaj    | Sharma   | pankaj@codeswithpankaj.com| Internal      |
   | Nishant   | Patel    | nishant@codeswithpankaj.com| Internal      |
   | Kiran     | Desai    | kiran@codeswithpankaj.com  | Internal      |
   | Tanvi     | Mehta    | tanvi@codeswithpankaj.com  | Internal      |
   | Kritek    | Singh    | kritek@codeswithpankaj.com | Internal      |
   | Amit      | Kumar    | amit@p4n.in                | External      |
   | Neha      | Verma    | neha@p4n.in                | External      |
   ```

   In this query, we use the CASE statement to categorize customers based on their email domain, and the result includes a new column called "EmailCategory."

2. Using the CASE statement with multiple conditions:
   Categorize customers into different age groups based on their CustomerID:

   ```sql
   SELECT FirstName, LastName, CustomerID,
       CASE
           WHEN CustomerID <= 2 THEN 'Young'
           WHEN CustomerID <= 5 THEN 'Middle-aged'
           ELSE 'Senior'
       END AS AgeGroup
   FROM Customers;
   ```

   Result:
   ```
   | FirstName | LastName | CustomerID | AgeGroup    |
   |-----------|----------|------------|-------------|
   | Pankaj    | Sharma   | 1          | Young       |
   | Nishant   | Patel    | 2          | Young       |
   | Kiran     | Desai    | 3          | Middle-aged |
   | Tanvi     | Mehta    | 4          | Middle-aged |
   | Kritek    | Singh    | 5          | Middle-aged |
   | Amit      | Kumar    | 6          | Senior      |
   | Neha      | Verma    | 7          | Senior      |
   ```

   In this query, we use the CASE statement with multiple conditions to categorize customers into different age groups based on their CustomerID.

The SQL CASE statement is a versatile tool for performing conditional logic within SQL queries, allowing you to customize query results based on specified conditions.
