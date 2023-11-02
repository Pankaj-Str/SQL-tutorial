# Accessing MySQL via CLI 

**Introduction**
- Briefly introduce the purpose of the tutorial.
- Mention the significance of using the command-line interface for MySQL.

**Table of Contents**
1. **Prerequisites**
   - Explain what the reader needs to have in place before proceeding.
   - Mention the necessity of MySQL installation.

2. **Connecting to MySQL**
   - Show how to access MySQL via the CLI.
   - Explain the basic command structure: `mysql -u [username] -p`.
   - Describe options and flags like -h for the host.

3. **Logging In**
   - Guide users on how to enter their MySQL password securely.

4. **Basic MySQL Commands**
   - Introduce fundamental MySQL commands such as:
     - `SHOW DATABASES` - to list available databases.
     - `USE [database]` - to select a specific database.
     - `SHOW TABLES` - to list tables in the selected database.
     - `DESCRIBE [table]` or `DESC [table]` - to show the structure of a table.

5. **Creating and Managing Databases**
   - Show how to create a new database using `CREATE DATABASE`.
   - Explain how to delete databases with `DROP DATABASE`.

6. **Creating and Managing Tables**
   - Describe how to create tables using `CREATE TABLE`.
   - Explain altering tables with `ALTER TABLE`.
   - Show how to delete tables with `DROP TABLE`.

7. **Data Manipulation**
   - Cover essential SQL statements like:
     - `INSERT INTO [table]` - for adding data.
     - `SELECT` - for querying data.
     - `UPDATE` - for modifying existing data.
     - `DELETE` - for removing data.

8. **Exporting and Importing Data**
   - Teach how to export data to a file with `SELECT ... INTO OUTFILE`.
   - Explain how to import data from a file with `LOAD DATA INFILE`.

9. **Database Backup and Restoration**
   - Describe how to backup a database using `mysqldump`.
   - Explain how to restore a database from a backup.

10. **User Management**
    - Show how to create and manage MySQL users.
    - Explain granting and revoking privileges with `GRANT` and `REVOKE`.

11. **Security Best Practices**
    - Highlight security considerations when using the CLI, like avoiding plain text passwords.

12. **Troubleshooting Common Issues**
    - Address common errors and how to resolve them.

