
| Sn.No. | Topic Name       |
|--------|------------------|
| 1      | [Create Database](SQLCreateDatabase.md)     |
| 2      | [Show Databases](SQLShowDatabases.md)       |
| 3      | [Drop Database](SQLDropDatabase.md)           |
| 4      | [Rename Database](SQLRenameDatabase.md)     |
| 5      | [Select Database](SQLSelectDatabase.md)     |
| 6      | [Backup Database](SQLBackupDatabase.md)     |
---------

# SQL - Show Databases

The SQL command for listing databases may vary depending on the specific database management system (DBMS) you are using. Here are examples for several popular DBMSs:

**MySQL and MariaDB:**

To list the databases in MySQL or MariaDB, you can use the following SQL query:

```sql
SHOW DATABASES;
```

This query will return a list of database names that exist on the server.

**PostgreSQL:**

In PostgreSQL, you can use the following SQL query to list databases:

```sql
SELECT datname FROM pg_database;
```

This query selects the names of all databases from the system catalog table `pg_database`.

**Microsoft SQL Server:**

To list databases in Microsoft SQL Server, you can use the following SQL query:

```sql
SELECT name FROM sys.databases;
```

This query retrieves the names of all databases from the system catalog view `sys.databases`.

**SQLite:**

SQLite is a file-based database, so there's no direct SQL query to list databases like in server-based databases. Instead, you can use command-line tools or file system exploration to identify SQLite database files. For example, on the command line:

```bash
sqlite3 .databases
```

This will list the currently attached databases in SQLite.

Please note that the specific method for listing databases can vary depending on the SQL client or programming language you are using to interact with the database. The examples provided here are for interactive SQL sessions, and the exact syntax may differ in application code or scripts. Additionally, the user executing these queries may need appropriate permissions to view the list of databases, especially in multi-user environments.
