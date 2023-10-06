# Create Table

| Sn.No. | Topic Name              |
|--------|-------------------------|
| 1      | [Data Types](DataTypes.md)          |
| 2      | [Create Table](CreateTable.md)        |
| 3      | [Constraints](Constraints.md)        |
| 4      | [Show Tables](ShowTables.md)          |
| 5      | [Rename Table](RenameTable.md)        |
| 6      | [Truncate Table](TruncateTable.md)    |
| 7      | [Clone Tables](CloneTables.md)        |
| 8      | [Temporary Tables](TemporaryTables.md)|
| 9      | [Alter Tables](AlterTables.md)        |
| 10     | [Drop Table](DropTable.md)            |
| 11     | [Delete Table](DeleteTable.md)        |
-------

Creating a table in MySQL involves using the `CREATE TABLE` statement, where you define the table's structure, including column names, data types, constraints, and other properties. Here's the basic syntax for creating a table in MySQL:

```sql
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    ...
);
```

Let's create a simple example table named "Employees" with a few columns to illustrate the process:

```sql
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE,
    department VARCHAR(30)
);
```

In this example:
- We created a table named "Employees."
- It has five columns: `employee_id`, `first_name`, `last_name`, `birthdate`, and `department`.
- `employee_id` is defined as an integer and designated as the primary key, which means it will contain unique values and be used as the table's identifier.
- `first_name` and `last_name` are defined as variable-length character strings (`VARCHAR`) to store names.
- `birthdate` is defined as a `DATE` data type to store birthdates.
- `department` is also defined as a `VARCHAR` to store the department name.

You can also add additional constraints, such as `NOT NULL`, `UNIQUE`, or `DEFAULT`, to further define the behavior of your table columns. For example, to specify that the `birthdate` column cannot contain NULL values, you can modify the table creation statement like this:

```sql
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE NOT NULL,
    department VARCHAR(30)
);
```

Remember that this is just a basic example. In practice, you would create more complex tables with additional columns and constraints based on your specific application's requirements. Additionally, you can add indexes, foreign keys, and other advanced features as needed to design a robust and efficient database schema.

# Create a table named "p4n_employee" with the specified columns using the following SQL query:

```sql
CREATE TABLE p4n_employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    Email VARCHAR(255),
    Phone VARCHAR(15),
    Address TEXT,
    DepartmentID INT,
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    TerminationDate DATE,
    ManagerID INT,
    SocialSecurityNumber VARCHAR(20)
);
```

In this SQL statement:

- `EmployeeID` is an integer column and the primary key for uniquely identifying employees.
- `FirstName` and `LastName` are used for storing the first name and last name of employees, respectively.
- `DateOfBirth` stores the birthdate of employees.
- `Gender` is an ENUM column to store gender information.
- `Email` is for storing employee email addresses.
- `Phone` is used for phone numbers.
- `Address` is a TEXT column for storing employee addresses.
- `DepartmentID` is an integer column that can be used to link to a department table if needed.
- `Position` stores the job position/title of employees.
- `Salary` is a decimal column for storing salary information.
- `HireDate` stores the date when an employee was hired.
- `TerminationDate` stores the date when an employee's employment was terminated (if applicable).
- `ManagerID` can be used to specify the manager of an employee, referencing another employee in the same table.
- `SocialSecurityNumber` (or equivalent identifier) is used to store employee identification information.

Please note that you may need to adjust the data types, lengths, and constraints based on your specific requirements and the policies and regulations of your organization. Additionally, you may want to create additional indexes or foreign keys based on your application's needs.

----
## Example : Using all Datatype :

Create a table named "p4n_Employee" with all available data types in MySQL would result in a very lengthy and impractical table definition. However, I can provide you with a sample table that includes one column for each commonly used data type in MySQL:

```sql
CREATE TABLE p4n_Employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    smallint_col SMALLINT,
    tinyint_col TINYINT,
    mediumint_col MEDIUMINT,
    int_col INT,
    bigint_col BIGINT,
    decimal_col DECIMAL(10, 2),
    float_col FLOAT(8, 2),
    double_col DOUBLE(8, 2),
    char_col CHAR(10),
    varchar_col VARCHAR(255),
    text_col TEXT,
    enum_col ENUM('Option1', 'Option2', 'Option3'),
    date_col DATE,
    time_col TIME,
    datetime_col DATETIME,
    timestamp_col TIMESTAMP,
    year_col YEAR,
    binary_col BINARY(10),
    varbinary_col VARBINARY(255),
    blob_col BLOB,
    boolean_col BOOLEAN,
    json_col JSON,
    geometry_col GEOMETRY
);
```
