# IN Operator

In SQL, the IN operator is used to specify multiple values in a WHERE clause for filtering results. It allows you to filter rows based on a set of values for a specific column. Let's explore the IN operator with examples:

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

Now, let's explore how the IN operator can be used to filter customers:

1. Using the IN operator with a list of values:
   Retrieve customers whose first names are either 'Kiran' or 'Neha':

   ```sql
   SELECT * FROM Customers
   WHERE FirstName IN ('Kiran', 'Neha');
   ```

   Result:
   ```
   | CustomerID | FirstName | LastName | Email                     |
   |------------|-----------|----------|---------------------------|
   | 3          | Kiran     | Desai    | kiran@codeswithpankaj.com  |
   | 7          | Neha      | Verma    | neha@p4n.in                |
   ```

   This query uses the IN operator to specify multiple values for FirstName and selects customers whose first names are either 'Kiran' or 'Neha.'

2. Using the IN operator with a subquery:
   Retrieve customers whose last names match those of employees in a different table named "Employees":

   ```sql
   SELECT * FROM Customers
   WHERE LastName IN (SELECT LastName FROM Employees);
   ```

   Result:
   ```
   | CustomerID | FirstName | LastName | Email                     |
   |------------|-----------|----------|---------------------------|
   | 1          | Pankaj    | Sharma   | pankaj@codeswithpankaj.com|
   | 2          | Nishant   | Patel    | nishant@codeswithpankaj.com|
   ```

   In this query, the IN operator is used with a subquery to select customers whose last names match those of employees from the "Employees" table.

The IN operator is a versatile tool in SQL that allows you to filter rows based on multiple values or a subquery, making it useful for various data filtering and selection scenarios.
