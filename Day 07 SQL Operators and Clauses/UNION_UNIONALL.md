# UNION and UNION ALL

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
