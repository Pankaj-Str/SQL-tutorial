# SQL - Select Database
In SQL, you don't typically use a specific SQL statement to select a database like you do in some other database management systems. Instead, you usually specify the database you want to work with when you connect to the database server or when you execute subsequent SQL statements. The way you specify the database can vary depending on the database management system (DBMS) you are using. Here are common methods for selecting a database in different DBMSs:

1. **MySQL and MariaDB:**

   To select a database in MySQL or MariaDB, you specify the database you want to use immediately after connecting to the server or at the beginning of your SQL script using the `USE` statement.

   ```sql
   USE your_database_name;
   ```

   Replace `your_database_name` with the name of the database you want to select. All subsequent SQL statements will operate on this selected database until you change it with another `USE` statement.

2. **PostgreSQL:**

   In PostgreSQL, you can specify the database you want to connect to when connecting to the server. You can also use the `CONNECT` or `SET` command to change the current database once you are connected.

   To specify the database during connection:

   ```sql
   psql -d your_database_name -U your_username -h your_host
   ```

   To change the current database after connecting:

   ```sql
   \c your_database_name
   ```

3. **Microsoft SQL Server:**

   In Microsoft SQL Server, you can specify the initial database when connecting to the server. You can also change the database context using the `USE` statement.

   To specify the database during connection, you can provide it in the connection string.

   To change the current database after connecting:

   ```sql
   USE your_database_name;
   ```

4. **SQLite:**

   In SQLite, the database is specified when you open a database file. You connect directly to the database file, so there's no need to explicitly select a database. For example, if you have a SQLite database file named `my_database.db`, you connect to it like this:

   ```sql
   sqlite3 my_database.db
   ```

   All subsequent SQL statements will operate on this connected database.

Remember that the method for selecting a database can vary depending on the SQL client or programming language you are using to interact with the database. The examples provided here are for interactive SQL sessions, and the exact syntax may differ in application code or scripts.
