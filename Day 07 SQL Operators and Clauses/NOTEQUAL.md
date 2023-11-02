# SQL - NOT EQUAL

In SQL, the NOT EQUAL operator, represented as "<>", "!=" or "!=", is used to compare two values or expressions to determine if they are not equal. It's used in SQL queries to filter rows where a specific condition is not met. Let's explore the SQL NOT EQUAL operator with examples:

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

Now, let's explore how the SQL NOT EQUAL operator can be used to compare values and filter rows:

1. Using the "<>" operator to filter customers with email domains other than "@codeswithpankaj.com":
   Retrieve customers whose email domains are not equal to "@codeswithpankaj.com":

   ```sql
   SELECT FirstName, LastName, Email
   FROM Customers
   WHERE Email <> 'pankaj@codeswithpankaj.com';
   ```

   Result:
   ```
   | FirstName | LastName | Email                |
   |-----------|----------|----------------------|
   | Nishant   | Patel    | nishant@codeswithpankaj.com|
   | Kiran     | Desai    | kiran@codeswithpankaj.com  |
   | Tanvi     | Mehta    | tanvi@codeswithpankaj.com  |
   | Kritek    | Singh    | kritek@codeswithpankaj.com |
   | Amit      | Kumar    | amit@p4n.in          |
   | Neha      | Verma    | neha@p4n.in          |
   ```

   In this query, we use the "<>" operator to filter customers whose email addresses are not equal to "pankaj@codeswithpankaj.com."

2. Using the "!=" operator to filter customers with last names not equal to 'Mehta':
   Retrieve customers whose last names are not equal to 'Mehta':

   ```sql
   SELECT FirstName, LastName
   FROM Customers
   WHERE LastName != 'Mehta';
   ```

   Result:
   ```
   | FirstName | LastName |
   |-----------|----------|
   | Pankaj    | Sharma   |
   | Nishant   | Patel    |
   | Kiran     | Desai    |
   | Kritek    | Singh    |
   | Amit      | Kumar    |
   | Neha      | Verma    |
   ```

   In this query, we use the "!=" operator to filter customers whose last names are not equal to 'Mehta.'

The SQL NOT EQUAL operator is essential for comparing values and filtering rows that do not meet specific conditions in SQL queries, providing flexibility in data retrieval.
