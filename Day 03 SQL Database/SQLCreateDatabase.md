
| Sn.No. | Topic Name       |
|--------|------------------|
| 1      | [Create Database](SQLCreateDatabase.md)     |
| 2      | [Show Databases](SQLShowDatabases.md)       |
| 3      | [Drop Database](SQLDropDatabase.md)           |
| 4      | [Rename Database](SQLRenameDatabase.md)     |
| 5      | [Select Database](SQLSelectDatabase.md)     |
| 6      | [Backup Database](SQLBackupDatabase.md)     |
---------

# SQL - Create Database

To create a new database in SQL, you typically use a Data Definition Language (DDL) statement. The exact syntax for creating a database can vary slightly depending on the specific database management system (DBMS) you are using, as different DBMSs may have their own variations of SQL. However, I'll provide a general example using SQL syntax that is common to many relational database systems.

```sql
CREATE DATABASE your_database_name;
```

Here's an explanation of the SQL statement:

- `CREATE DATABASE`: This part of the statement specifies that you want to create a new database.

- `your_database_name`: Replace this with the name you want to give to your new database. Choose a meaningful and descriptive name for your database.

Please note that some DBMSs may have additional options and configurations that you can specify when creating a database. For example, you might want to specify the character set and collation for your database, set storage options, or define other properties. The specific options available to you will depend on the DBMS you are using.

Here are examples for creating a database in a few popular database systems:

**MySQL:**
```sql
CREATE DATABASE your_database_name;
```

**PostgreSQL:**
```sql
CREATE DATABASE your_database_name;
```

**Microsoft SQL Server:**
```sql
CREATE DATABASE your_database_name;
```

**SQLite:**
SQLite is a file-based database, so you don't need to explicitly create a database in the same way as server-based databases. Instead, you can create tables within a SQLite database file using the `CREATE TABLE` statement.

After you run the `CREATE DATABASE` statement, the new database should be created, and you can start working with it by creating tables, inserting data, and running queries.

Make sure you have the necessary permissions to create databases on your SQL server or system. In some environments, you may need administrative or superuser privileges to create databases.
