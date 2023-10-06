
| Sn.No. | Topic Name       |
|--------|------------------|
| 1      | [Create Database](SQLCreateDatabase.md)     |
| 2      | [Show Databases](SQLShowDatabases.md)       |
| 3      | [Drop Database](SQLDropDatabase.md)           |
| 4      | [Rename Database](SQLRenameDatabase.md)     |
| 5      | [Select Database](SQLSelectDatabase.md)     |
| 6      | [Backup Database](SQLBackupDatabase.md)     |
---------

# SQL - Rename Database

Renaming a database in SQL can be a bit tricky because SQL standard doesn't provide a direct "RENAME DATABASE" command. The exact procedure for renaming a database depends on the database management system (DBMS) you are using. Here, I'll provide general guidelines for renaming a database in a few common DBMSs:

**MySQL and MariaDB:**

MySQL and MariaDB do not have a built-in command to rename a database directly. Instead, you typically need to create a new database with the desired name and then transfer the data from the old database to the new one, and finally, you can drop the old database if needed. Here's a basic procedure:

1. Create a new database with the desired name:

   ```sql
   CREATE DATABASE new_database_name;
   ```

2. Copy the tables and data from the old database to the new one. You can use a tool like `mysqldump` to help with this:

   ```bash
   mysqldump -u your_username -p old_database_name | mysql -u your_username -p new_database_name
   ```

3. Verify that the data in the new database is correct.

4. If everything is satisfactory, you can drop the old database:

   ```sql
   DROP DATABASE old_database_name;
   ```

**PostgreSQL:**

PostgreSQL provides a command called `ALTER DATABASE` that allows you to rename a database:

```sql
ALTER DATABASE old_database_name RENAME TO new_database_name;
```

This command renames the database directly without the need for creating a new one.

**Microsoft SQL Server:**

In SQL Server, you can't directly rename a database using SQL. Instead, you typically have to use SQL Server Management Studio (SSMS) or a similar tool to rename the database. Here's how you can do it using SSMS:

1. Open SQL Server Management Studio.

2. Connect to your SQL Server instance.

3. In the Object Explorer, right-click on the database you want to rename and select "Rename."

4. Enter the new name for the database.

**SQLite:**

SQLite does not support renaming a database directly. To rename an SQLite database, you typically need to follow a similar approach as MySQL/MariaDB by creating a new database with the desired name and copying the data from the old database to the new one using backup and restore methods.

Remember to take proper precautions when renaming databases, especially in production environments, to avoid data loss or corruption. Always backup your data before performing such operations.
