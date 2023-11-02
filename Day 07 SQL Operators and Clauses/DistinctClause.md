# SQL - Distinct Clause

The DISTINCT clause in SQL is used to retrieve unique values from a specified column in a database table. It ensures that the result set contains only distinct (unique) values, eliminating duplicate entries. Let's explore the DISTINCT clause with examples:

Suppose we have a hypothetical database with a table named "Students" that contains information about students and their majors. Here's the table structure:

```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Major VARCHAR(50)
);
```

Now, let's populate the table with some sample data:

```sql
INSERT INTO Students (StudentID, FirstName, LastName, Major)
VALUES
    (1, 'Pankaj', 'Sharma', 'Computer Science'),
    (2, 'Nishant', 'Patel', 'Mathematics'),
    (3, 'Kiran', 'Desai', 'Computer Science'),
    (4, 'Tanvi', 'Mehta', 'Physics'),
    (5, 'Kritek', 'Singh', 'Mathematics');
```

Now, let's explore how the DISTINCT clause can be used to retrieve unique values from a column:

1. Basic DISTINCT clause:
   Retrieve unique majors from the "Major" column:

   ```sql
   SELECT DISTINCT Major FROM Students;
   ```

   Result:
   ```
   | Major           |
   |-----------------|
   | Computer Science|
   | Mathematics     |
   | Physics         |
   ```

   This query returns a list of distinct majors present in the "Major" column.

2. Using DISTINCT with multiple columns:
   Retrieve unique combinations of first names and last names:

   ```sql
   SELECT DISTINCT FirstName, LastName FROM Students;
   ```

   Result:
   ```
   | FirstName | LastName |
   |-----------|----------|
   | Pankaj    | Sharma   |
   | Nishant   | Patel    |
   | Kiran     | Desai    |
   | Tanvi     | Mehta    |
   | Kritek    | Singh    |
   ```

   This query returns unique combinations of first names and last names from the "FirstName" and "LastName" columns.

3. DISTINCT with ORDER BY:
   Retrieve unique majors in alphabetical order:

   ```sql
   SELECT DISTINCT Major FROM Students
   ORDER BY Major ASC;
   ```

   Result:
   ```
   | Major           |
   |-----------------|
   | Computer Science|
   | Mathematics     |
   | Physics         |
   ```

   This query first retrieves unique majors and then sorts them in ascending order.

4. DISTINCT with COUNT:
   Count the number of students in each major:

   ```sql
   SELECT Major, COUNT(*) AS NumberOfStudents FROM Students
   GROUP BY Major;
   ```

   Result:
   ```
   | Major           | NumberOfStudents |
   |-----------------|------------------|
   | Computer Science| 2                |
   | Mathematics     | 2                |
   | Physics         | 1                |
   ```

   This query combines DISTINCT with COUNT to count the number of students in each major.

The DISTINCT clause is useful for obtaining a list of unique values from one or more columns in a database table, helping to remove duplicates and simplify the results of a query.
