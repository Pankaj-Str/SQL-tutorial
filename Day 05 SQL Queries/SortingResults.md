# SQL - SORTING Results

| Sn.No. | Topic Name             |
|--------|------------------------|
| 1      | [Insert Query](InsertQuery.md)          |
| 2      | [Select Query](SelectQuery.md)          |
| 3      | [Select Into](SelectInto.md)            |
| 4      | [Insert Into Select](InsertIntoSelect.md)|
| 5      | [Update Query](UpdateQuery.md)          |
| 6      | [Delete Query](DeleteQuery.md)          |
| 7      | [Sorting Results](SortingResults.md)    |






You can use the `ORDER BY` clause in SQL to sort the results of your `SELECT` queries in ascending or descending order based on one or more columns. Here are some examples of how to sort results using the "p4n_emp" table:

1. **Sort by Salary in Ascending Order:**

   To retrieve all employees and sort them by salary in ascending order:

   ```sql
   SELECT FirstName, LastName, Salary
   FROM p4n_emp
   ORDER BY Salary ASC;
   ```

2. **Sort by Salary in Descending Order:**

   To retrieve all employees and sort them by salary in descending order:

   ```sql
   SELECT FirstName, LastName, Salary
   FROM p4n_emp
   ORDER BY Salary DESC;
   ```

3. **Sort by Last Name and First Name in Ascending Order:**

   To retrieve all employees and sort them by last name and first name in ascending order:

   ```sql
   SELECT FirstName, LastName
   FROM p4n_emp
   ORDER BY LastName ASC, FirstName ASC;
   ```

4. **Sort by Department and Salary in Descending Order:**

   To retrieve all employees and sort them by department (ascending) and salary (descending):

   ```sql
   SELECT FirstName, LastName, Department, Salary
   FROM p4n_emp
   ORDER BY Department ASC, Salary DESC;
   ```

5. **Sort by Birthdate in Ascending Order:**

   To retrieve all employees and sort them by date of birth in ascending order:

   ```sql
   SELECT FirstName, LastName, DateOfBirth
   FROM p4n_emp
   ORDER BY DateOfBirth ASC;
   ```

6. **Sort by Multiple Columns with Different Sort Orders:**

   To retrieve all employees and sort them by department in ascending order and salary in descending order:

   ```sql
   SELECT FirstName, LastName, Department, Salary
   FROM p4n_emp
   ORDER BY Department ASC, Salary DESC;
   ```

These examples demonstrate how to use the `ORDER BY` clause to sort the results of your SQL queries using the "p4n_emp" table. You can customize the sorting criteria and order (ascending or descending) to meet your specific requirements.
