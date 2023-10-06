# Create a Database in MySQL

```
1. How Create a Database in MySQL
2. What is MySQL?
3. How to Create Database in MySQL?
4. How to Show Listing All the Databases in MySQL ?
5. How to Create Table in MySQL?
6. How to Delete Database from MySQL?
7. How to Alter Database in MySQL?

```

MySQL is a popular open-source relational database management system (RDBMS) that allows you to store, manage, and retrieve data efficiently. Below are step-by-step instructions for creating a database in MySQL, showing a list of all databases, creating a table, deleting a database, and altering a database using the example database name "codeswithpankaj."

**1. What is MySQL?**
MySQL is an open-source relational database management system. It is widely used for building and managing databases for various applications.

**2. How to Create a Database in MySQL:**
To create a new database in MySQL, you can use the `CREATE DATABASE` statement. Here's an example using the database name "codeswithpankaj":

```sql
CREATE DATABASE codeswithpankaj;
```

**3. How to Show Listing All the Databases in MySQL:**
To list all the databases in MySQL, you can use the `SHOW DATABASES` statement:

```sql
SHOW DATABASES;
```

**4. How to Create a Table in MySQL:**
After creating a database, you can create tables within it using the `CREATE TABLE` statement. Here's an example:

```sql
USE codeswithpankaj; -- Use the database you created
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);
```

This example creates a table named "users" with three columns: `id`, `username`, and `email`.

**5. How to Delete a Database from MySQL:**
To delete a database, you can use the `DROP DATABASE` statement:

```sql
DROP DATABASE codeswithpankaj;
```

Please be cautious when using this command, as it will permanently delete the database and all its associated data.

**6. How to Alter a Database in MySQL:**
MySQL does not have a direct command to alter a database like you can with tables. Altering a database typically involves modifying the tables and data within it. You can use `ALTER TABLE` statements to modify table structures and data.

Here's an example of adding a new column to the "users" table:

```sql
USE codeswithpankaj; -- Use the database where the table is located
ALTER TABLE users
ADD COLUMN age INT;
```

This adds a new column named "age" to the "users" table.

Remember that database alterations often depend on the specific changes you need to make, and they are typically done at the table level.

Now you have a basic understanding of how to create a database, list databases, create tables, delete databases, and make table alterations in MySQL. Make sure to adapt these commands to your specific needs and use them responsibly, especially when deleting data or databases.
