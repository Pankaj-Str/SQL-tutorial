# SQL Window Functions
---

## 1. What is a Window Function?

A **Window Function** in SQL performs a calculation across a set of related rows while **keeping every original row in the result**.

The easiest way to remember it:

> **GROUP BY combines rows. Window Functions keep rows and add calculations.**

For example, suppose we have 10 employees.

With `GROUP BY`, we might get:

```text
IT       → 60000
HR       → 70000
Sales    → 65000
```

Only one row per department.

With a Window Function:

```text
Rahul    IT       50000    60000
Amit     IT       70000    60000
Raj      IT       60000    60000
Priya    HR       60000    70000
Neha     HR       80000    70000
```

Every employee remains visible.

---

# 2. Dataset for This Tutorial

We will use one employee dataset throughout the tutorial.

## `employees` table

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    job_title VARCHAR(50),
    salary INT,
    hire_date DATE
);
```

Now insert the data:

```sql
INSERT INTO employees
(emp_id, emp_name, department, job_title, salary, hire_date)
VALUES
(1, 'Rahul', 'IT', 'Developer', 55000, '2022-01-10'),
(2, 'Amit', 'IT', 'Senior Developer', 75000, '2020-06-15'),
(3, 'Priya', 'HR', 'HR Executive', 60000, '2021-03-20'),
(4, 'Neha', 'HR', 'HR Manager', 85000, '2019-08-10'),
(5, 'Raj', 'IT', 'Developer', 65000, '2023-02-05'),
(6, 'Sneha', 'Sales', 'Sales Executive', 50000, '2022-11-12'),
(7, 'Vikas', 'Sales', 'Sales Manager', 90000, '2018-05-25'),
(8, 'Anjali', 'IT', 'Developer', 65000, '2021-09-18'),
(9, 'Karan', 'HR', 'Recruiter', 55000, '2023-04-10'),
(10, 'Pooja', 'Sales', 'Sales Executive', 60000, '2023-01-15');
```

Check the data:

```sql
SELECT *
FROM employees;
```

You should have:

| emp_id | emp_name | department | job_title        | salary |
| -----: | -------- | ---------- | ---------------- | -----: |
|      1 | Rahul    | IT         | Developer        |  55000 |
|      2 | Amit     | IT         | Senior Developer |  75000 |
|      3 | Priya    | HR         | HR Executive     |  60000 |
|      4 | Neha     | HR         | HR Manager       |  85000 |
|      5 | Raj      | IT         | Developer        |  65000 |
|      6 | Sneha    | Sales      | Sales Executive  |  50000 |
|      7 | Vikas    | Sales      | Sales Manager    |  90000 |
|      8 | Anjali   | IT         | Developer        |  65000 |
|      9 | Karan    | HR         | Recruiter        |  55000 |
|     10 | Pooja    | Sales      | Sales Executive  |  60000 |

---

# 3. Before Window Functions: Understand GROUP BY

Let's first calculate the average salary of each department.

```sql
SELECT
    department,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
```

Result:

| department | avg_salary |
| ---------- | ---------: |
| HR         |   66666.67 |
| IT         |      65000 |
| Sales      |   66666.67 |

This is useful, but notice something:

**We lost individual employee information.**

We cannot see Rahul's salary, Amit's salary, etc.

---

# 4. Same Problem Using a Window Function

Now let's use:

```sql
AVG(salary) OVER (
    PARTITION BY department
)
```

Complete query:

```sql
SELECT
    emp_name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS avg_department_salary
FROM employees;
```

Result:

| emp_name | department | salary | avg_department_salary |
| -------- | ---------- | -----: | --------------------: |
| Rahul    | IT         |  55000 |                 65000 |
| Amit     | IT         |  75000 |                 65000 |
| Raj      | IT         |  65000 |                 65000 |
| Anjali   | IT         |  65000 |                 65000 |
| Priya    | HR         |  60000 |              66666.67 |
| Neha     | HR         |  85000 |              66666.67 |
| Karan    | HR         |  55000 |              66666.67 |
| Sneha    | Sales      |  50000 |              66666.67 |
| Vikas    | Sales      |  90000 |              66666.67 |
| Pooja    | Sales      |  60000 |              66666.67 |

This is the power of Window Functions.

---

# 5. Understanding `OVER()`

The basic syntax is:

```sql
function_name() OVER (
    PARTITION BY column
    ORDER BY column
)
```

For example:

```sql
AVG(salary) OVER (
    PARTITION BY department
)
```

There are two important parts:

### `PARTITION BY`

Defines the groups/windows.

### `ORDER BY`

Defines the order of rows inside the window.

---

# 6. What Does PARTITION BY Mean?

Suppose we write:

```sql
AVG(salary) OVER (
    PARTITION BY department
)
```

SQL creates separate windows:

```text
IT
-------------------------
Rahul
Amit
Raj
Anjali


HR
-------------------------
Priya
Neha
Karan


Sales
-------------------------
Sneha
Vikas
Pooja
```

The average is calculated separately inside each window.

Important:

> `PARTITION BY` does NOT remove rows.

---

# 7. Window Function Without PARTITION BY

You can also use:

```sql
AVG(salary) OVER ()
```

Example:

```sql
SELECT
    emp_name,
    department,
    salary,
    AVG(salary) OVER () AS company_avg_salary
FROM employees;
```

Now SQL calculates one average for the **entire table**.

Every employee gets the same company average.

---

# 8. Ranking Functions

Ranking is one of the most common uses of Window Functions.

Important ranking functions are:

```text
ROW_NUMBER()
RANK()
DENSE_RANK()
NTILE()
```

---

# 9. ROW_NUMBER()

`ROW_NUMBER()` gives every row a unique sequential number.

```sql
SELECT
    emp_name,
    department,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_num
FROM employees;
```

Result will look like:

| emp_name | salary | row_num |
| -------- | -----: | ------: |
| Vikas    |  90000 |       1 |
| Neha     |  85000 |       2 |
| Amit     |  75000 |       3 |
| Raj      |  65000 |       4 |
| Anjali   |  65000 |       5 |
| Priya    |  60000 |       6 |
| Pooja    |  60000 |       7 |
| Rahul    |  55000 |       8 |
| Karan    |  55000 |       9 |
| Sneha    |  50000 |      10 |

Even when salaries are equal, `ROW_NUMBER()` assigns different numbers.

---

# 10. RANK()

Now use:

```sql
RANK()
```

```sql
SELECT
    emp_name,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;
```

For equal salaries:

```text
75000 → 3
65000 → 4
65000 → 4
60000 → 6
60000 → 6
```

Notice that rank **5 is skipped**.

---

# 11. DENSE_RANK()

Now:

```sql
SELECT
    emp_name,
    salary,
    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;
```

Result pattern:

```text
75000 → 3
65000 → 4
65000 → 4
60000 → 5
60000 → 5
```

No rank is skipped.

---

# 12. ROW_NUMBER vs RANK vs DENSE_RANK

This is extremely important.

Suppose salaries are:

```text
90000
80000
70000
70000
60000
```

### ROW_NUMBER

```text
90000 → 1
80000 → 2
70000 → 3
70000 → 4
60000 → 5
```

### RANK

```text
90000 → 1
80000 → 2
70000 → 3
70000 → 3
60000 → 5
```

### DENSE_RANK

```text
90000 → 1
80000 → 2
70000 → 3
70000 → 3
60000 → 4
```

Remember:

> **ROW_NUMBER = always unique**

> **RANK = same rank + gaps**

> **DENSE_RANK = same rank + no gaps**

---

# 13. Ranking Within Each Department

This is where `PARTITION BY` becomes very powerful.

```sql
SELECT
    emp_name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;
```

Now ranking starts from 1 inside every department.

For example:

```text
IT
----------------
Amit      75000 → 1
Raj       65000 → 2
Anjali    65000 → 2
Rahul     55000 → 4

HR
----------------
Neha      85000 → 1
Priya     60000 → 2
Karan     55000 → 3

Sales
----------------
Vikas     90000 → 1
Pooja     60000 → 2
Sneha     50000 → 3
```

---

# 14. Finding the Highest-Paid Employee in Each Department

This is a very common real-world problem.

First create the ranking:

```sql
SELECT
    emp_name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees;
```

Now we need:

```text
dept_rank = 1
```

A common approach is to use a CTE:

```sql
WITH ranked_employees AS (
    SELECT
        emp_name,
        department,
        salary,
        RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS dept_rank
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE dept_rank = 1;
```

This gives the highest-paid employee(s) from each department.

---

# 15. Aggregate Window Functions

Window Functions aren't only for ranking.

You can use:

```sql
SUM()
AVG()
COUNT()
MIN()
MAX()
```

with `OVER()`.

---

## SUM()

```sql
SELECT
    emp_name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
    ) AS department_total_salary
FROM employees;
```

Every employee sees the total salary of their department.

---

# 16. Department Salary Percentage

We can calculate what percentage of the department's total salary belongs to each employee.

```sql
SELECT
    emp_name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
    ) AS department_total,
    
    ROUND(
        salary * 100.0 /
        SUM(salary) OVER (
            PARTITION BY department
        ),
        2
    ) AS salary_percentage
FROM employees;
```

This is a great example of using a Window Function for analytics.

---

# 17. Running Total

A **running total** means cumulative sum.

Suppose we have sales data:

```sql
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    salesperson VARCHAR(50),
    amount INT
);
```

Insert sample data:

```sql
INSERT INTO sales
(sale_id, sale_date, salesperson, amount)
VALUES
(1, '2026-01-01', 'Rahul', 1000),
(2, '2026-01-03', 'Amit', 1500),
(3, '2026-01-05', 'Priya', 2000),
(4, '2026-01-07', 'Rahul', 1200),
(5, '2026-01-10', 'Amit', 1800);
```

Now:

```sql
SELECT
    sale_date,
    amount,
    SUM(amount) OVER (
        ORDER BY sale_date
    ) AS running_total
FROM sales;
```

Result:

| sale_date | amount | running_total |
| --------- | -----: | ------------: |
| Jan 1     |   1000 |          1000 |
| Jan 3     |   1500 |          2500 |
| Jan 5     |   2000 |          4500 |
| Jan 7     |   1200 |          5700 |
| Jan 10    |   1800 |          7500 |

---

# 18. Running Total for Each Salesperson

We can combine `PARTITION BY` and `ORDER BY`.

```sql
SELECT
    sale_date,
    salesperson,
    amount,
    SUM(amount) OVER (
        PARTITION BY salesperson
        ORDER BY sale_date
    ) AS running_sales
FROM sales;
```

Now every salesperson gets their own running total.

---

# 19. LAG()

`LAG()` allows us to look at the **previous row**.

Example:

```sql
SELECT
    sale_date,
    amount,
    LAG(amount) OVER (
        ORDER BY sale_date
    ) AS previous_sale
FROM sales;
```

Result:

| sale_date | amount | previous_sale |
| --------- | -----: | ------------: |
| Jan 1     |   1000 |          NULL |
| Jan 3     |   1500 |          1000 |
| Jan 5     |   2000 |          1500 |
| Jan 7     |   1200 |          2000 |
| Jan 10    |   1800 |          1200 |

The first row has no previous row, so it returns `NULL`.

---

# 20. Calculate Difference from Previous Row

Now we can calculate:

```sql
SELECT
    sale_date,
    amount,
    LAG(amount) OVER (
        ORDER BY sale_date
    ) AS previous_amount,

    amount - LAG(amount) OVER (
        ORDER BY sale_date
    ) AS difference

FROM sales;
```

This is extremely useful for:

* Sales growth
* Stock prices
* Monthly revenue
* Website traffic
* Customer activity
* Performance analysis

---

# 21. LEAD()

`LEAD()` does the opposite of `LAG()`.

`LAG()`:

```text
Current ← Previous
```

`LEAD()`:

```text
Current → Next
```

Example:

```sql
SELECT
    sale_date,
    amount,
    LEAD(amount) OVER (
        ORDER BY sale_date
    ) AS next_sale
FROM sales;
```

Result:

| sale_date | amount | next_sale |
| --------- | -----: | --------: |
| Jan 1     |   1000 |      1500 |
| Jan 3     |   1500 |      2000 |
| Jan 5     |   2000 |      1200 |
| Jan 7     |   1200 |      1800 |
| Jan 10    |   1800 |      NULL |

---

# 22. FIRST_VALUE()

`FIRST_VALUE()` returns the first value within the window.

Example:

```sql
SELECT
    emp_name,
    department,
    salary,
    FIRST_VALUE(salary) OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS highest_salary
FROM employees;
```

Every employee in a department will see that department's highest salary.

---

# 23. LAST_VALUE()

`LAST_VALUE()` can be slightly confusing because the window frame matters.

A common explicit form is:

```sql
SELECT
    emp_name,
    department,
    salary,
    LAST_VALUE(salary) OVER (
        PARTITION BY department
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS lowest_salary
FROM employees;
```

The important concept here is the **window frame**.

---

# 24. What is a Window Frame?

A Window Function can have:

```sql
ROWS BETWEEN ...
```

For example:

```sql
ROWS BETWEEN UNBOUNDED PRECEDING
AND CURRENT ROW
```

means:

> Start from the first row and continue up to the current row.

This is commonly used for running totals.

```sql
SUM(amount) OVER (
    ORDER BY sale_date
    ROWS BETWEEN UNBOUNDED PRECEDING
    AND CURRENT ROW
)
```

---

# 25. NTILE()

`NTILE()` divides rows into a specified number of groups.

For example:

```sql
SELECT
    emp_name,
    salary,
    NTILE(4) OVER (
        ORDER BY salary DESC
    ) AS salary_quartile
FROM employees;
```

This divides employees into 4 groups.

Useful for:

* Top 25%
* Bottom 25%
* Customer segmentation
* Performance groups
* Salary bands

---

# 26. COUNT() as a Window Function

We can count employees in each department:

```sql
SELECT
    emp_name,
    department,
    COUNT(*) OVER (
        PARTITION BY department
    ) AS department_employee_count
FROM employees;
```

Result conceptually:

```text
IT     → 4 employees
HR     → 3 employees
Sales  → 3 employees
```

But every employee still appears.

---

# 27. MIN() and MAX()

Find the minimum and maximum salary within each department:

```sql
SELECT
    emp_name,
    department,
    salary,

    MIN(salary) OVER (
        PARTITION BY department
    ) AS min_department_salary,

    MAX(salary) OVER (
        PARTITION BY department
    ) AS max_department_salary

FROM employees;
```

Now each employee can be compared against their department's salary range.

---

# 28. Comparing Employee Salary with Department Average

This is a practical analytics example.

```sql
SELECT
    emp_name,
    department,
    salary,

    AVG(salary) OVER (
        PARTITION BY department
    ) AS avg_salary,

    salary -
    AVG(salary) OVER (
        PARTITION BY department
    ) AS difference_from_average

FROM employees;
```

If Rahul earns `55000` and the IT average is `65000`:

```text
55000 - 65000 = -10000
```

So Rahul earns ₹10,000 less than the department average.

---

# 29. Top 2 Employees from Every Department

This is one of the most important practical Window Function problems.

First rank employees:

```sql
WITH ranked_employees AS (
    SELECT
        emp_name,
        department,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE rn <= 2;
```

This returns the top 2 employees from every department.

---

# 30. Window Functions vs GROUP BY

This comparison is essential.

### GROUP BY

```sql
SELECT
    department,
    AVG(salary)
FROM employees
GROUP BY department;
```

Output:

```text
IT       65000
HR       66666
Sales    66666
```

Rows are grouped.

### Window Function

```sql
SELECT
    emp_name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS avg_salary
FROM employees;
```

Output:

```text
Rahul    IT       55000    65000
Amit     IT       75000    65000
Raj      IT       65000    65000
...
```

Rows remain.

---

# 31. The Basic Window Function Formula

Remember this structure:

```sql
FUNCTION() OVER (
    PARTITION BY column
    ORDER BY column
)
```

For example:

```sql
RANK() OVER (
    PARTITION BY department
    ORDER BY salary DESC
)
```

Read it like English:

> "Rank employees separately for each department, based on salary from highest to lowest."

---

# 32. Most Important Window Functions Cheat Sheet

| Function        | Purpose                 |
| --------------- | ----------------------- |
| `ROW_NUMBER()`  | Unique row number       |
| `RANK()`        | Ranking with gaps       |
| `DENSE_RANK()`  | Ranking without gaps    |
| `NTILE()`       | Divide rows into groups |
| `SUM()`         | Total / running total   |
| `AVG()`         | Average                 |
| `COUNT()`       | Count rows              |
| `MIN()`         | Minimum                 |
| `MAX()`         | Maximum                 |
| `LAG()`         | Previous row            |
| `LEAD()`        | Next row                |
| `FIRST_VALUE()` | First value             |
| `LAST_VALUE()`  | Last value              |

---

# 33. Real-World Uses

Window Functions are heavily used in Data Analytics, Business Intelligence, and Data Science.

### Employee Analytics

```text
Highest salary employee
Salary ranking
Department average
Salary comparison
```

### Sales Analytics

```text
Running sales
Previous month's sales
Sales growth
Top salesperson
Sales ranking
```

### E-commerce

```text
Top customers
Customer purchase ranking
Previous purchase
Customer spending percentage
```

### Finance

```text
Stock price changes
Portfolio ranking
Running balance
Previous transaction
```

### Data Science

```text
Feature calculations
Time-series analysis
Customer segmentation
Trend analysis
```

---

# 34. A Practical Interview Question

### Question:

Find the second-highest-paid employee from each department.

Solution:

```sql
WITH ranked_employees AS (
    SELECT
        emp_name,
        department,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT
    emp_name,
    department,
    salary
FROM ranked_employees
WHERE salary_rank = 2;
```

Why `DENSE_RANK()`?

Because if two employees have the same highest salary, we usually want the **second distinct salary level**.

---

# 35. Another Interview Question

### Find employees earning more than their department's average salary.

```sql
WITH employee_data AS (
    SELECT
        emp_name,
        department,
        salary,
        AVG(salary) OVER (
            PARTITION BY department
        ) AS avg_salary
    FROM employees
)
SELECT
    emp_name,
    department,
    salary,
    avg_salary
FROM employee_data
WHERE salary > avg_salary;
```

This is a very common analytics pattern.

---

# 36. The Mental Model

Whenever you see a Window Function, ask these three questions:

### Question 1: What calculation?

```sql
SUM()
AVG()
RANK()
LAG()
LEAD()
```

### Question 2: Which group/window?

```sql
PARTITION BY department
```

### Question 3: What order?

```sql
ORDER BY salary DESC
```

For example:

```sql
RANK() OVER (
    PARTITION BY department
    ORDER BY salary DESC
)
```

Think:

```text
WHAT?       RANK
     ↓
WHERE?      Each Department
     ↓
ORDER?      Salary DESC
```

---

# 37. Final Summary

A SQL Window Function allows you to perform calculations across related rows **without collapsing those rows into a single result**.

The three most important concepts are:

```sql
FUNCTION()
OVER()
PARTITION BY
ORDER BY
```

For example:

```sql
RANK() OVER (
    PARTITION BY department
    ORDER BY salary DESC
)
```

means:

> Rank employees separately within each department, from highest salary to lowest salary.

If you're learning SQL for **Data Science/Data Analytics**, I recommend mastering Window Functions in this exact order:

```text
1. OVER()
      ↓
2. PARTITION BY
      ↓
3. ORDER BY
      ↓
4. ROW_NUMBER()
      ↓
5. RANK()
      ↓
6. DENSE_RANK()
      ↓
7. SUM() + Running Total
      ↓
8. AVG()
      ↓
9. LAG()
      ↓
10. LEAD()
      ↓
11. FIRST_VALUE()
      ↓
12. LAST_VALUE()
      ↓
13. NTILE()
      ↓
14. Window Frames
      ↓
15. Top-N per Group
      ↓
16. Real-world Analytics Problems
```

**The one sentence to remember:**

> **GROUP BY reduces rows; Window Functions calculate across rows while keeping the original rows.**
