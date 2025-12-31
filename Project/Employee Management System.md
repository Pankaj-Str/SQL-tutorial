### Beginner SQL Project: Simple Employee Management System

This project is designed for beginners learning MySQL. We'll create a small case study around an "Employee Management System" for a fictional company. The goal is to set up a database, insert sample data, and perform basic queries to analyze employee information.

#### Case Study Overview
Imagine you're working for a small tech company called "TechCorp." The HR department needs a simple database to track employees, their departments, and salaries. We'll build a database with two tables: `employees` (basic employee details) and `departments` (department info). The dataset will include 10 sample employees across 3 departments.

This project covers:
- Creating a database and tables.
- Inserting data.
- Basic queries (SELECT, JOIN, GROUP BY, etc.).
- Simple analysis, like average salary per department.

You'll need MySQL installed (e.g., via XAMPP, MySQL Workbench, or a cloud service like AWS RDS). We'll assume you're using the MySQL command-line or a GUI tool like phpMyAdmin.

#### Step 1: Set Up the Database
1. Open your MySQL client (command-line: `mysql -u root -p` or use a GUI).
2. Create a new database:
   ```sql
   CREATE DATABASE techcorp_db;
   ```
3. Switch to the new database:
   ```sql
   USE techcorp_db;
   ```

#### Step 2: Create the Tables
We'll create two tables:
- `departments`: Stores department names and IDs.
- `employees`: Stores employee details, with a foreign key linking to departments.

Run these commands one by one:

```sql
-- Create departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL
);

-- Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
```

- `AUTO_INCREMENT` automatically assigns unique IDs.
- `FOREIGN KEY` ensures data integrity between tables.

#### Step 3: Insert the Dataset
Here's a small sample dataset. We'll insert 3 departments and 10 employees.

First, insert departments:
```sql
INSERT INTO departments (dept_name) VALUES
('Engineering'),
('Marketing'),
('Sales');
```

Then, insert employees (using realistic sample data):
```sql
INSERT INTO employees (first_name, last_name, hire_date, salary, dept_id) VALUES
('John', 'Doe', '2022-01-15', 75000.00, 1),  -- Engineering
('Jane', 'Smith', '2021-05-20', 68000.00, 1),
('Alice', 'Johnson', '2023-03-10', 82000.00, 1),
('Bob', 'Brown', '2020-11-01', 55000.00, 2),  -- Marketing
('Charlie', 'Davis', '2022-07-05', 62000.00, 2),
('Diana', 'Evans', '2021-09-12', 59000.00, 2),
('Eve', 'Franklin', '2023-02-28', 71000.00, 3),  -- Sales
('Frank', 'Green', '2020-04-18', 65000.00, 3),
('Grace', 'Harris', '2022-10-30', 78000.00, 3),
('Henry', 'Isaac', '2021-12-05', 69000.00, 3);
```

This dataset is fictional but realistic. You can copy-paste these into your MySQL client.

#### Step 4: Verify the Data
Run these to check if everything inserted correctly:
```sql
-- View all departments
SELECT * FROM departments;

-- View all employees
SELECT * FROM employees;
```

You should see 3 rows in `departments` and 10 in `employees`.

#### Step 5: Perform Basic Queries (Analysis)
Now, let's analyze the data with simple queries. These demonstrate common SQL operations.

1. **List all employees with their department names** (using JOIN):
   ```sql
   SELECT e.emp_id, e.first_name, e.last_name, d.dept_name
   FROM employees e
   JOIN departments d ON e.dept_id = d.dept_id;
   ```
   - This combines data from both tables.

2. **Find employees hired after 2022** (using WHERE):
   ```sql
   SELECT first_name, last_name, hire_date
   FROM employees
   WHERE hire_date > '2022-01-01';
   ```

3. **Calculate average salary per department** (using GROUP BY and AVG):
   ```sql
   SELECT d.dept_name, AVG(e.salary) AS average_salary
   FROM employees e
   JOIN departments d ON e.dept_id = d.dept_id
   GROUP BY d.dept_name;
   ```
   - Output might show: Engineering ~75000, Marketing ~58666, Sales ~70750 (approximate).

4. **Find the highest-paid employee** (using MAX and subquery):
   ```sql
   SELECT first_name, last_name, salary
   FROM employees
   WHERE salary = (SELECT MAX(salary) FROM employees);
   ```

5. **Count employees per department** (using COUNT and GROUP BY):
   ```sql
   SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
   FROM employees e
   JOIN departments d ON e.dept_id = d.dept_id
   GROUP BY d.dept_name;
   ```

#### Step 6: Advanced Touches (Optional for Beginners)
- **Update data**: Change an employee's salary.
  ```sql
  UPDATE employees SET salary = 80000.00 WHERE emp_id = 1;
  ```
- **Delete data**: Remove an employee (be careful!).
  ```sql
  DELETE FROM employees WHERE emp_id = 10;
  ```
- **Add a new column**: e.g., for job title.
  ```sql
  ALTER TABLE employees ADD COLUMN job_title VARCHAR(50);
  ```

#### Step 7: Project Extensions
- Export the database: Use `mysqldump -u root -p techcorp_db > backup.sql` for backup.
- Import data from CSV: If you have a larger dataset in CSV, use `LOAD DATA INFILE`.
- Build on this: Add a `projects` table and link employees to projects for more complexity.

