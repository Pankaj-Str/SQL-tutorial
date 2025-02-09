# **A Quick Tour of SQL with Pankaj Chouhan**  
**Step-by-Step Guide with Detailed Examples**

---

## **1. A Simple Database**  
A database stores structured data in **tables**. Each table has **rows** (records) and **columns** (fields). Let’s create a sample database with two tables: `Customers` and `Orders`.

### **Step 1: Create a Database**  
```sql
CREATE DATABASE QuickTourDB;
USE QuickTourDB; -- Switch to this database
```

### **Step 2: Create Tables**  
```sql
-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```
- **Explanation**:  
  - `PRIMARY KEY`: Uniquely identifies each row.  
  - `AUTO_INCREMENT`: Automatically generates unique IDs.  
  - `FOREIGN KEY`: Links `Orders` to `Customers`.

---

## **2. Retrieving Data**  
Use `SELECT` to query data. Let’s add sample data first.

### **Step 1: Insert Sample Data**  
```sql
-- Insert into Customers
INSERT INTO Customers (FirstName, LastName, Email)
VALUES 
    ('Pankaj', 'Chouhan', 'pankaj.chouhan@example.com'),
    ('John', 'Doe', 'john.doe@example.com');

-- Insert into Orders
INSERT INTO Orders (CustomerID, OrderDate, Amount)
VALUES 
    (1, '2023-10-01', 150.00),
    (1, '2023-10-05', 200.00),
    (2, '2023-10-02', 75.50);
```

### **Step 2: Basic SELECT Queries**  
**Example 1**: Retrieve all customers.  
```sql
SELECT * FROM Customers;
```
**Output**:  
| CustomerID | FirstName | LastName | Email                     |
|------------|-----------|----------|---------------------------|
| 1          | Pankaj    | Chouhan  | pankaj.chouhan@example.com|
| 2          | John      | Doe      | john.doe@example.com      |

**Example 2**: Retrieve specific columns with a filter.  
```sql
SELECT FirstName, LastName 
FROM Customers 
WHERE CustomerID = 1;
```
**Output**:  
| FirstName | LastName |  
|-----------|----------|  
| Pankaj    | Chouhan  |  

---

## **3. Summarizing Data**  
Use aggregate functions like `SUM`, `AVG`, `COUNT`.

### **Example 1**: Total number of customers.  
```sql
SELECT COUNT(*) AS TotalCustomers FROM Customers;
```
**Output**:  
| TotalCustomers |  
|----------------|  
| 2              |  

### **Example 2**: Total sales for Pankaj Chouhan.  
```sql
SELECT SUM(Amount) AS TotalSpent 
FROM Orders 
WHERE CustomerID = 1;
```
**Output**:  
| TotalSpent |  
|------------|  
| 350.00     |  

---

## **4. Adding Data to the Database**  
Use `INSERT INTO` to add new records.

### **Example**: Add a new customer.  
```sql
INSERT INTO Customers (FirstName, LastName, Email)
VALUES ('Alice', 'Smith', 'alice.smith@example.com');
```

---

## **5. Deleting Data**  
Use `DELETE` to remove records. **Always use `WHERE` to avoid deleting all data!**

### **Example**: Delete John Doe’s orders.  
```sql
DELETE FROM Orders WHERE CustomerID = 2;
```

---

## **6. Updating the Database**  
Use `UPDATE` to modify existing records.

### **Example**: Update Pankaj’s email.  
```sql
UPDATE Customers 
SET Email = 'pankaj.new@example.com' 
WHERE CustomerID = 1;
```

---

## **7. Protecting Data**  
### **Constraints**  
- **Primary Key**: Ensures uniqueness.  
- **Foreign Key**: Maintains referential integrity.  
- **UNIQUE**: No duplicate values in a column.  

### **Transactions**  
Group SQL operations to ensure atomicity.  
```sql
START TRANSACTION;

INSERT INTO Orders (CustomerID, OrderDate, Amount)
VALUES (1, '2023-10-10', 100.00);

UPDATE Customers 
SET LastName = 'Chouhan-Updated' 
WHERE CustomerID = 1;

COMMIT; -- Save changes
-- ROLLBACK; -- Undo changes if needed
```

---

## **8. Creating a Database**  
### **Step 1: Create a New Database**  
```sql
CREATE DATABASE SalesDB;
```

### **Step 2: Switch to the Database**  
```sql
USE SalesDB;
```

---

## **9. Summary**  
**Key Takeaways**:  
1. **Structure**: Use `CREATE TABLE` with proper constraints.  
2. **Retrieve**: `SELECT` with filters (`WHERE`) and sorting (`ORDER BY`).  
3. **Summarize**: Aggregate functions (`SUM`, `COUNT`).  
4. **Modify**: `INSERT`, `DELETE`, `UPDATE`.  
5. **Protect**: Constraints and transactions.  

---

**Final Example**: Retrieve Pankaj Chouhan’s total orders.  
```sql
SELECT 
    C.FirstName, 
    C.LastName, 
    SUM(O.Amount) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE C.CustomerID = 1
GROUP BY C.CustomerID;
```
**Output**:  
| FirstName | LastName | TotalSpent |  
|-----------|----------|------------|  
| Pankaj    | Chouhan  | 450.00     |  

---

**Thank you for following *A Quick Tour of SQL with Pankaj Chouhan*!**  
Practice these examples, and you’ll master SQL basics in no time. 🚀