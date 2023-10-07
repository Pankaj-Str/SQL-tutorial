# SQL View

**1. Creating View from a Single Table:**

   - **Overview:** In SQL, a view is a virtual table based on the result of a SELECT query. You can create views from a single table, allowing you to simplify data access and apply security restrictions.

   - **Syntax:** To create a view from a single table, use the following syntax:

     ```sql
     CREATE VIEW view_name AS
     SELECT column1, column2, ...
     FROM table_name
     WHERE condition;
     ```

   - **Example:** Suppose you have a table called "Employees," and you want to create a view that only shows employees with a salary greater than 50000:

     ```sql
     CREATE VIEW HighSalaryEmployees AS
     SELECT EmployeeID, FirstName, LastName
     FROM Employees
     WHERE Salary > 50000;
     ```

**2. Creating View from Multiple Tables:**

   - **Introduction:** SQL views can also be created by combining data from multiple tables using JOIN operations. This is useful for simplifying complex queries and providing a unified view of related data.

   - **Example:** Let's say you have two tables, "Orders" and "Customers," and you want to create a view that displays order details along with customer information:

     ```sql
     CREATE VIEW OrderDetails AS
     SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
     FROM Orders
     INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
     ```

**3. Listing All Views in a Database:**

   - **Retrieving Views:** To obtain a list of all views in a database, you can query system catalog tables or views. The specific method may vary depending on the database system you are using.

   - **Example:** In many relational databases, you can use the INFORMATION_SCHEMA view to retrieve a list of views. For example:

     ```sql
     SELECT table_name
     FROM INFORMATION_SCHEMA.VIEWS
     WHERE table_schema = 'your_database_name';
     ```

**4. Deleting Views:**

   - **View Deletion:** To delete a view, use the `DROP VIEW` statement. Be cautious when deleting views, as it can affect queries and applications that rely on them.

   - **Example:** To delete the "HighSalaryEmployees" view created earlier:

     ```sql
     DROP VIEW HighSalaryEmployees;
     ```

**5. Updating Views:**

   - **Overview:** Views are often read-only, meaning you can't use them to modify the underlying data. However, you can update views in certain situations by using the `WITH CHECK OPTION` clause during view creation.

   - **Example:** Suppose you have a view named "ActiveEmployees" that displays employees with a status of "Active." You can update this view with the `WITH CHECK OPTION` to ensure that any changes made through the view meet the specified criteria:

     ```sql
     CREATE VIEW ActiveEmployees AS
     SELECT EmployeeID, FirstName, LastName
     FROM Employees
     WHERE Status = 'Active'
     WITH CHECK OPTION;
     ```

     With this option, attempting to update an employee's status to "Inactive" through the view would result in an error, ensuring the view only displays active employees.

