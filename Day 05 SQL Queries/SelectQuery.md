# SQL - SELECT 

| Sn.No. | Topic Name             |
|--------|------------------------|
| 1      | [Insert Query](InsertQuery.md)          |
| 2      | [Select Query](SelectQuery.md)          |
| 3      | [Select Into](SelectInto.md)            |
| 4      | [Insert Into Select](InsertIntoSelect.md)|
| 5      | [Update Query](UpdateQuery.md)          |
| 6      | [Delete Query](DeleteQuery.md)          |
| 7      | [Sorting Results](SortingResults.md)    |

----

Certainly! Here are some SQL `SELECT` query examples using the "p4n_emp" table:

1. **Select All Employees:**

   Retrieve all employees and all their information from the "p4n_emp" table:

   ```sql
   SELECT *
   FROM p4n_emp;
   ```

2. **Select Specific Columns for Employees:**

   Retrieve only the first name, last name, and email address of all employees:

   ```sql
   SELECT FirstName, LastName, Email
   FROM p4n_emp;
   ```

3. **Filter Employees by Department:**

   Retrieve employees who belong to the "IT" department (assuming "IT" corresponds to a specific `DepartmentID`):

   ```sql
   SELECT FirstName, LastName, Department
   FROM p4n_emp
   WHERE Department = 'IT';
   ```

4. **Order Employees by Salary:**

   Retrieve employees sorted by their salary in descending order:

   ```sql
   SELECT FirstName, LastName, Salary
   FROM p4n_emp
   ORDER BY Salary DESC;
   ```

5. **Filter Employees by Gender and Salary Range:**

   Retrieve female employees with a salary between $50,000 and $70,000:

   ```sql
   SELECT FirstName, LastName, Gender, Salary
   FROM p4n_emp
   WHERE Gender = 'Female' AND Salary BETWEEN 50000.00 AND 70000.00;
   ```

6. **Calculate the Average Salary:**

   Calculate the average salary of all employees:

   ```sql
   SELECT AVG(Salary) AS AvgSalary
   FROM p4n_emp;
   ```

7. **Select Distinct Values:**

   Retrieve distinct department names from the "p4n_emp" table:

   ```sql
   SELECT DISTINCT Department
   FROM p4n_emp;
   ```

8. **Limit the Number of Rows Returned:**

   Retrieve the top 10 highest-paid employees:

   ```sql
   SELECT FirstName, LastName, Salary
   FROM p4n_emp
   ORDER BY Salary DESC
   LIMIT 10;
   ```

These are some examples of SQL `SELECT` queries using the "p4n_emp" table. You can customize and combine these queries to meet your specific data retrieval needs.
