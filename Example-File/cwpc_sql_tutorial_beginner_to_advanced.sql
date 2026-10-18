/*
===============================================================================
CODES WITH PANKAJ (CWPC)
SQL TUTORIAL: BEGINNER TO ADVANCED
Database: MySQL 8.0+
File: cwpc_sql_tutorial_beginner_to_advanced.sql

HOW TO USE THIS FILE
1. Open this file in MySQL Workbench.
2. Run sections one at a time, from top to bottom.
3. Read each heading and comment before executing the code.
4. This file creates separate practice databases so examples do not conflict.
5. Sections marked OPTIONAL or DESTRUCTIVE are commented out by default.

NOTE ABOUT DATA
- Most sections create small, self-contained sample tables.
- The Bookstore Case Study section expects the database generated earlier:
  bookstore_case_study (Authors, Books, Customers, Orders).
- Some statements use MySQL 8.0 features such as window functions and CTEs.
===============================================================================
*/


/*
===============================================================================
SECTION 01 - EXPLORING THE DATA UNIVERSE
Goal: Create a database, select it, and inspect tables.
===============================================================================
*/

CREATE DATABASE IF NOT EXISTS CWPC_Company;
USE CWPC_Company;

SHOW DATABASES;
SHOW TABLES;

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    joining_date DATE
);

DESCRIBE employees;
SELECT * FROM employees;


/*
===============================================================================
SECTION 02 - SQL SETUP AND BASICS
Goal: Understand comments, INSERT, and SELECT.
===============================================================================
*/

-- Single-line comment
/*
   Multi-line comment
*/

INSERT INTO employees
    (employee_id, name, department, salary, city, joining_date)
VALUES
    (101, 'Nishant', 'IT', 45000.00, 'Mumbai', '2024-01-15'),
    (102, 'Riya', 'HR', 35000.00, 'Pune', '2023-06-10'),
    (103, 'Neha', 'IT', 55000.00, 'Surat', '2022-03-20'),
    (104, 'Rohan', 'Sales', 40000.00, 'Delhi', '2025-02-01');

SELECT * FROM employees;


/*
===============================================================================
SECTION 03 - JUGGLING DATA TYPES
Goal: Practice INT, VARCHAR, DECIMAL, DATE, ENUM, and NULL.
===============================================================================
*/

CREATE DATABASE IF NOT EXISTS CWPC_DataTypes;
USE CWPC_DataTypes;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    mobile VARCHAR(15),
    age INT,
    credit_limit DECIMAL(12,2),
    dob DATE,
    bank ENUM('HDFC', 'SBI', 'ICICI')
);

INSERT INTO customers
    (customer_id, name, mobile, age, credit_limit, dob, bank)
VALUES
    (1, 'Nishant', '7894562100', 14, 45000.00, '2012-04-23', 'ICICI'),
    (2, 'Riya',    '7894562101', 25, 65000.50, '2001-08-12', 'HDFC'),
    (3, 'Neha',    '7894562102', 30, 80000.00, '1996-05-17', 'SBI');

SELECT * FROM customers;
DESCRIBE customers;


/*
===============================================================================
SECTION 04 - NAVIGATING DATABASE RELATIONSHIPS
Goal: Use primary keys, foreign keys, and INNER JOIN.
===============================================================================
*/

CREATE DATABASE IF NOT EXISTS CWPC_Relationships;
USE CWPC_Relationships;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    total_amount DECIMAL(10,2),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name, email)
VALUES
    (1, 'Joy', 'joy@example.com'),
    (2, 'Riya', 'riya@example.com');

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2026-05-23', 5600.23),
    (102, 1, '2026-06-10', 2500.00),
    (103, 2, '2026-07-15', 1800.00);

SELECT
    c.customer_id,
    c.name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;


/*
===============================================================================
SECTION 05 - DATA QUALITY AND SPEED: KEYS AND INDEXING
Goal: Practice indexes and inspect a query plan.
===============================================================================
*/

USE CWPC_Relationships;

CREATE INDEX idx_orders_order_date
    ON orders(order_date);

CREATE INDEX idx_orders_customer_date
    ON orders(customer_id, order_date);

SELECT *
FROM orders
WHERE customer_id = 1
ORDER BY order_date;

EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 1;


/*
===============================================================================
SECTION 06 - NORMALIZATION AND DENORMALIZATION STRATEGIES
Goal: Store customer details once and connect orders by customer_id.
===============================================================================
*/

CREATE DATABASE IF NOT EXISTS CWPC_Normalization;
USE CWPC_Normalization;

CREATE TABLE IF NOT EXISTS customer_profiles (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS customer_orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10,2),
    CONSTRAINT fk_customer_orders_profile
        FOREIGN KEY (customer_id) REFERENCES customer_profiles(customer_id)
);

INSERT INTO customer_profiles (customer_id, customer_name, city)
VALUES
    (1, 'Joy', 'Mumbai'),
    (2, 'Riya', 'Pune');

INSERT INTO customer_orders (order_id, customer_id, total_amount)
VALUES
    (101, 1, 5600.23),
    (102, 1, 2500.00),
    (103, 2, 1800.00);

SELECT
    c.customer_name,
    c.city,
    o.order_id,
    o.total_amount
FROM customer_profiles AS c
JOIN customer_orders AS o
    ON c.customer_id = o.customer_id;


/*
===============================================================================
SECTION 07 - BLUEPRINTING DATABASE STRUCTURES
Goal: CREATE, ALTER, DEFAULT, CHECK, and inspect a table.
===============================================================================
*/

CREATE DATABASE IF NOT EXISTS CWPC_Structure;
USE CWPC_Structure;

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL DEFAULT 0
);

ALTER TABLE products
    ADD COLUMN category VARCHAR(50);

DESCRIBE products;

-- OPTIONAL DESTRUCTIVE COMMANDS - uncomment only when you intend to use them.
-- TRUNCATE TABLE products; -- Removes all rows but keeps the table.
-- DROP TABLE products;     -- Removes the table and its data.


/*
===============================================================================
SECTION 08 - SQL'S DATA ADDITION TOOL: INSERT
Goal: Insert one row and multiple rows.
===============================================================================
*/

CREATE DATABASE IF NOT EXISTS CWPC_InsertPractice;
USE CWPC_InsertPractice;

CREATE TABLE IF NOT EXISTS authors (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    nationality VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    publication_year SMALLINT,
    genre VARCHAR(80),
    price DECIMAL(10,2),
    stock INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_insert_books_author
        FOREIGN KEY (author_id) REFERENCES authors(author_id),
    CONSTRAINT chk_insert_books_price CHECK (price IS NULL OR price > 0)
);

INSERT INTO authors (author_id, first_name, last_name, nationality)
VALUES
    (1, 'Aarav', 'Mehta', 'Indian'),
    (2, 'Riya', 'Shah', 'Indian');

INSERT INTO books
    (book_id, title, author_id, publication_year, genre, price, stock)
VALUES
    (1, 'SQL for Beginners', 1, 2026, 'Programming', 19.99, DEFAULT),
    (2, 'Python Made Simple', 1, 2025, 'Programming', 24.50, 5),
    (3, 'Learning Databases', 2, 2024, 'Education', 15.00, 10);

SELECT * FROM authors;
SELECT * FROM books;


/*
===============================================================================
SECTION 09 - DATA MAINTENANCE WITH UPDATE
Goal: Preview rows before updating them.
===============================================================================
*/

USE CWPC_InsertPractice;

-- Preview books that are eligible for a 10% price increase.
SELECT book_id, title, price, stock
FROM books
WHERE genre = 'Programming'
  AND stock < 5
  AND price IS NOT NULL;

-- Update only after reviewing the preview.
UPDATE books
SET price = ROUND(price * 1.10, 2)
WHERE genre = 'Programming'
  AND stock < 5
  AND price IS NOT NULL;

SELECT * FROM books;


/*
===============================================================================
SECTION 10 - SQL CLEANUP CREW
Goal: Preview rows before deleting them.
===============================================================================
*/

USE CWPC_InsertPractice;

CREATE TABLE IF NOT EXISTS cleanup_orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO cleanup_orders (order_id, order_date, total_amount)
VALUES
    (1, DATE_SUB(CURRENT_DATE(), INTERVAL 2 YEAR), 5.00),
    (2, DATE_SUB(CURRENT_DATE(), INTERVAL 2 YEAR), 25.00),
    (3, CURRENT_DATE(), 4.00);

-- Preview old, low-value orders.
SELECT *
FROM cleanup_orders
WHERE order_date < DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
  AND total_amount < 10;

-- OPTIONAL DESTRUCTIVE COMMAND: uncomment after checking the preview.
-- DELETE FROM cleanup_orders
-- WHERE order_date < DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
--   AND total_amount < 10;


/*
===============================================================================
SECTION 11 - MASTERING SELECT STATEMENTS
Goal: Select columns, filter rows, count rows, and use DISTINCT.
===============================================================================
*/

CREATE DATABASE IF NOT EXISTS CWPC_SelectPractice;
USE CWPC_SelectPractice;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(60),
    credit_limit DECIMAL(12,2)
);

INSERT INTO customers (customer_id, customer_name, country, credit_limit)
VALUES
    (101, 'Joy', 'USA', 120000),
    (102, 'Riya', 'India', 80000),
    (103, 'Neha', 'USA', 75000),
    (104, 'Rohan', 'UK', 150000),
    (105, 'Mia', 'USA', 250000);

SELECT customer_id, customer_name, country, credit_limit
FROM customers;

SELECT customer_name, country, credit_limit
FROM customers
WHERE country = 'USA'
  AND credit_limit < 100000;

SELECT COUNT(*) AS total_customers
FROM customers
WHERE country = 'USA';

SELECT DISTINCT country
FROM customers
ORDER BY country;


/*
===============================================================================
SECTION 12 - SORTING QUERY RESULTS
Goal: Sort results with ORDER BY ASC and DESC.
===============================================================================
*/

USE CWPC_InsertPractice;

SELECT title, price
FROM books
WHERE price IS NOT NULL
ORDER BY price DESC;

SELECT title, price
FROM books
WHERE price IS NOT NULL
ORDER BY price ASC;

SELECT title, genre, price
FROM books
ORDER BY genre ASC, title ASC;


/*
===============================================================================
SECTION 13 - RESULT CONTROL WITH LIMIT AND OFFSET
Goal: Return a small page of results.
===============================================================================
*/

USE CWPC_InsertPractice;

-- First five books.
SELECT book_id, title, price
FROM books
ORDER BY book_id
LIMIT 5;

-- Skip the first row and return the next two.
SELECT book_id, title, price
FROM books
ORDER BY book_id
LIMIT 2 OFFSET 1;

-- Three most expensive books.
SELECT title, price
FROM books
WHERE price IS NOT NULL
ORDER BY price DESC, book_id ASC
LIMIT 3;


/*
===============================================================================
SECTION 14 - WINDOW FUNCTIONS DECODED
Goal: Use RANK, DENSE_RANK, ROW_NUMBER, and PARTITION BY.
===============================================================================
*/

USE CWPC_InsertPractice;

SELECT
    title,
    genre,
    price,
    RANK() OVER (
        PARTITION BY genre
        ORDER BY price DESC
    ) AS price_rank
FROM books
WHERE price IS NOT NULL;

SELECT
    title,
    price,
    ROW_NUMBER() OVER (ORDER BY price DESC, book_id) AS row_num,
    RANK() OVER (ORDER BY price DESC) AS price_rank,
    DENSE_RANK() OVER (ORDER BY price DESC) AS dense_price_rank
FROM books
WHERE price IS NOT NULL;


/*
===============================================================================
SECTION 15 - NULLS DECODED
Goal: Use IS NULL, IS NOT NULL, COALESCE, and COUNT.
===============================================================================
*/

CREATE DATABASE IF NOT EXISTS CWPC_NullPractice;
USE CWPC_NullPractice;

CREATE TABLE IF NOT EXISTS contacts (
    contact_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(150),
    manager_id INT
);

INSERT INTO contacts (contact_id, name, email, manager_id)
VALUES
    (1, 'Nishant', 'nishant@example.com', NULL),
    (2, 'Riya', NULL, 1),
    (3, 'Neha', 'neha@example.com', 1),
    (4, 'Rohan', NULL, NULL);

SELECT * FROM contacts WHERE email IS NULL;
SELECT * FROM contacts WHERE manager_id IS NOT NULL;

SELECT
    name,
    COALESCE(email, 'No email available') AS email_display,
    COALESCE(manager_id, 0) AS manager_id_display
FROM contacts;

SELECT
    COUNT(*) AS total_contacts,
    COUNT(email) AS contacts_with_email
FROM contacts;


/*
===============================================================================
SECTION 16 - STRING MANIPULATION MAGIC
Goal: Combine, transform, and search text.
===============================================================================
*/

USE CWPC_InsertPractice;

SELECT
    CONCAT(first_name, ' ', last_name) AS author_name,
    UPPER(nationality) AS nationality_upper
FROM authors;

SELECT
    title,
    LENGTH(title) AS title_length,
    SUBSTRING(title, 1, 10) AS short_title
FROM books;

SELECT title
FROM books
WHERE LOWER(title) LIKE '%python%';

SELECT TRIM('   SQL Tutorial   ') AS cleaned_text;

SELECT REPLACE(title, 'Guide', 'Handbook') AS revised_title
FROM books;


/*
===============================================================================
SECTION 17 - UNLOCKING MATH PROWESS
Goal: Use common mathematical functions and calculations.
===============================================================================
*/

USE CWPC_InsertPractice;

SELECT
    price,
    ROUND(price, 0) AS rounded_price,
    CEIL(price) AS ceiling_price,
    FLOOR(price) AS floor_price,
    ABS(price - 20) AS difference_from_20
FROM books
WHERE price IS NOT NULL;

SELECT
    title,
    price,
    ROUND(price * 0.90, 2) AS price_after_10_percent_discount
FROM books
WHERE price IS NOT NULL;

SELECT
    POWER(5, 2) AS square_of_5,
    SQRT(144) AS square_root_of_144,
    MOD(17, 5) AS remainder;


/*
===============================================================================
SECTION 18 - MASTERING DATES AND TIMES
Goal: Extract date parts, add dates, subtract dates, and find date differences.
===============================================================================
*/

USE CWPC_Relationships;

SELECT
    order_date,
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    DAY(order_date) AS order_day
FROM orders;

SELECT
    order_date,
    DATE_ADD(order_date, INTERVAL 10 DAY) AS date_after_10_days,
    DATE_SUB(order_date, INTERVAL 2 MONTH) AS date_2_months_before
FROM orders;

SELECT
    order_id,
    order_date,
    DATEDIFF(CURRENT_DATE(), order_date) AS days_since_order
FROM orders;

SELECT *
FROM orders
WHERE order_date >= '2026-01-01'
  AND order_date < '2027-01-01';


/*
===============================================================================
SECTION 19 - CRUNCHING NUMBERS WITH SQL
Goal: Use COUNT, SUM, AVG, MIN, MAX, GROUP BY, and HAVING.
===============================================================================
*/

USE CWPC_Relationships;

SELECT
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_order_amount,
    MIN(total_amount) AS smallest_order,
    MAX(total_amount) AS largest_order
FROM orders;

SELECT
    customer_id,
    COUNT(*) AS order_count,
    SUM(total_amount) AS customer_spending
FROM orders
GROUP BY customer_id
HAVING COUNT(*) >= 2
ORDER BY customer_spending DESC;


/*
===============================================================================
SECTION 20 - DISCOVERING SQL TRENDS
Goal: Group by month and calculate a moving average.
===============================================================================
*/

USE CWPC_Relationships;

SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS monthly_revenue
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY sales_year, sales_month;

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m-01') AS sales_month,
        SUM(total_amount) AS revenue
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m-01')
)
SELECT
    sales_month,
    revenue,
    ROUND(
        AVG(revenue) OVER (
            ORDER BY sales_month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_average_3_periods
FROM monthly_sales
ORDER BY sales_month;


/*
===============================================================================
SECTION 21 - CONNECTING DATA FOR BETTER INSIGHTS
Goal: Practice INNER JOIN, LEFT JOIN, and RIGHT JOIN.
===============================================================================
*/

USE CWPC_Relationships;

-- INNER JOIN: only matching customers and orders.
SELECT c.customer_id, c.name, o.order_id, o.total_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- LEFT JOIN: all customers, including customers without orders.
SELECT c.customer_id, c.name, o.order_id, o.total_amount
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- RIGHT JOIN: all orders, including orders without a matching customer.
-- The foreign key normally prevents unmatched customer IDs in this example.
SELECT c.customer_id, c.name, o.order_id, o.total_amount
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- MySQL does not support FULL OUTER JOIN directly.
-- A LEFT JOIN plus a RIGHT JOIN with UNION can simulate it.
SELECT c.customer_id, c.name, o.order_id, o.total_amount
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, c.name, o.order_id, o.total_amount
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id;


/*
===============================================================================
SECTION 22 - SUBQUERIES FOR SMARTER DATA ACCESS
Goal: Use scalar subqueries, EXISTS, and NOT EXISTS.
===============================================================================
*/

USE CWPC_Relationships;

-- Orders greater than the average order amount.
SELECT order_id, total_amount
FROM orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM orders
);

-- Customers who have at least one order.
SELECT c.customer_id, c.name
FROM customers AS c
WHERE EXISTS (
    SELECT 1
    FROM orders AS o
    WHERE o.customer_id = c.customer_id
);

-- Customers who have never placed an order.
SELECT c.customer_id, c.name
FROM customers AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders AS o
    WHERE o.customer_id = c.customer_id
);


/*
===============================================================================
SECTION 23 - VIEWS
Goal: Save a SELECT query as a reusable virtual table.
===============================================================================
*/

USE CWPC_Relationships;

CREATE OR REPLACE VIEW customer_order_summary AS
SELECT
    c.customer_id,
    c.name AS customer_name,
    COUNT(o.order_id) AS order_count,
    COALESCE(SUM(o.total_amount), 0) AS total_spending
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

SELECT * FROM customer_order_summary;

-- Optional: remove the view.
-- DROP VIEW customer_order_summary;


/*
===============================================================================
SECTION 24 - BOOKSTORE CASE STUDY
Prerequisite: Run the bookstore_1000_plus_records.sql file first.
Database: bookstore_case_study
Tables: Authors, Books, Customers, Orders
Goal: Practice queries on the larger dataset.
===============================================================================
*/

USE bookstore_case_study;

-- 24.1 Show all authors.
SELECT * FROM Authors;

-- 24.2 Find books priced between $15 and $25.
SELECT book_id, title, price
FROM Books
WHERE price BETWEEN 15 AND 25;

-- 24.3 Find titles containing Python or Java.
SELECT book_id, title
FROM Books
WHERE title LIKE '%Python%'
   OR title LIKE '%Java%';

-- 24.4 Authors born after 1980 who are American or British.
SELECT *
FROM Authors
WHERE birth_year > 1980
  AND nationality IN ('American', 'British');

-- 24.5 Books with fewer than 5 items in stock.
SELECT title, stock
FROM Books
WHERE stock < 5;

-- 24.6 Count books per author, including authors with no books.
SELECT
    a.author_id,
    a.first_name,
    a.last_name,
    COUNT(b.book_id) AS total_books
FROM Authors AS a
LEFT JOIN Books AS b
    ON a.author_id = b.author_id
GROUP BY a.author_id, a.first_name, a.last_name
ORDER BY total_books DESC;

-- 24.7 Top 3 customers by total spending.
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(o.total_amount) AS total_spending
FROM Customers AS c
JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spending DESC
LIMIT 3;

-- 24.8 Genres with more than 3 books.
SELECT genre, COUNT(*) AS total_books
FROM Books
WHERE genre IS NOT NULL
GROUP BY genre
HAVING COUNT(*) > 3;

-- 24.9 Books priced above the average known price.
SELECT title, price
FROM Books
WHERE price > (SELECT AVG(price) FROM Books);

-- 24.10 Customers who joined in 2023 but have no orders.
SELECT c.customer_id, c.first_name, c.last_name, c.join_date
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE c.join_date >= '2023-01-01'
  AND c.join_date < '2024-01-01'
  AND o.order_id IS NULL;

-- 24.11 Books where exactly one of genre or price is NULL.
SELECT book_id, title, genre, price
FROM Books
WHERE (genre IS NULL AND price IS NOT NULL)
   OR (genre IS NOT NULL AND price IS NULL);

-- 24.12 Customers with orders but no email.
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS total_spending
FROM Customers AS c
JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE c.email IS NULL
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 24.13 Authors who have no books.
SELECT a.author_id, a.first_name, a.last_name
FROM Authors AS a
LEFT JOIN Books AS b
    ON a.author_id = b.author_id
WHERE b.book_id IS NULL;

-- 24.14 Books whose titles start with The and end in Guide or Tutorial.
SELECT book_id, title
FROM Books
WHERE title LIKE 'The%Guide'
   OR title LIKE 'The%Tutorial';

-- 24.15 Full author names sorted by last name and first name.
SELECT CONCAT(first_name, ' ', last_name) AS author_name
FROM Authors
ORDER BY last_name, first_name;

-- 24.16 Top 5 calendar months by average order amount.
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    AVG(total_amount) AS average_order_amount
FROM Orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY average_order_amount DESC
LIMIT 5;

-- 24.17 Authors with books in at least 3 distinct genres.
SELECT
    a.author_id,
    a.first_name,
    a.last_name,
    COUNT(DISTINCT b.genre) AS genre_count
FROM Authors AS a
JOIN Books AS b
    ON a.author_id = b.author_id
GROUP BY a.author_id, a.first_name, a.last_name
HAVING COUNT(DISTINCT b.genre) >= 3;

-- 24.18 Monthly 2023 sales: order count, revenue, unique customers.
SELECT
    MONTH(order_date) AS sales_month,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM Orders
WHERE order_date >= '2023-01-01'
  AND order_date < '2024-01-01'
GROUP BY MONTH(order_date)
ORDER BY sales_month;

-- 24.19 Preview price increases before updating.
SELECT book_id, title, price, stock
FROM Books
WHERE genre = 'Programming'
  AND stock < 5
  AND price IS NOT NULL;

-- OPTIONAL UPDATE: uncomment to increase qualifying prices by 10%.
-- UPDATE Books
-- SET price = ROUND(price * 1.10, 2)
-- WHERE genre = 'Programming'
--   AND stock < 5
--   AND price IS NOT NULL;

-- 24.20 Preview old orders below $10 before deletion.
SELECT *
FROM Orders
WHERE order_date < DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
  AND total_amount < 10;

-- OPTIONAL DESTRUCTIVE DELETE: uncomment only after previewing.
-- DELETE FROM Orders
-- WHERE order_date < DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
--   AND total_amount < 10;

-- 24.21 Customer ranking by spending (50%), order count (30%), account age (20%).
WITH customer_metrics AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        COALESCE(SUM(o.total_amount), 0) AS spending,
        COUNT(o.order_id) AS order_count,
        DATEDIFF(CURRENT_DATE(), c.join_date) AS account_age_days
    FROM Customers AS c
    LEFT JOIN Orders AS o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.join_date
),
normalized AS (
    SELECT *,
        COALESCE(spending / NULLIF(MAX(spending) OVER (), 0), 0) AS spending_score,
        COALESCE(order_count / NULLIF(MAX(order_count) OVER (), 0), 0) AS order_score,
        COALESCE(account_age_days / NULLIF(MAX(account_age_days) OVER (), 0), 0) AS age_score
    FROM customer_metrics
)
SELECT
    customer_id,
    customer_name,
    spending,
    order_count,
    ROUND(100 * (
        0.50 * spending_score +
        0.30 * order_score +
        0.20 * age_score
    ), 2) AS customer_score,
    RANK() OVER (
        ORDER BY (
            0.50 * spending_score +
            0.30 * order_score +
            0.20 * age_score
        ) DESC
    ) AS customer_rank
FROM normalized
ORDER BY customer_rank;


/*
===============================================================================
SECTION 25 - EXTENSION FOR MULTI-BOOK ORDERS
Important: The original Orders table stores only one book_id per order.
A proper OrderItems table is needed to represent multiple books in one order.

This is an optional schema design example. It does not migrate existing orders.
===============================================================================
*/

-- Run this only if you want to extend the schema.
-- USE bookstore_case_study;
--
-- CREATE TABLE OrderItems (
--     order_id INT NOT NULL,
--     book_id INT NOT NULL,
--     quantity INT NOT NULL CHECK (quantity > 0),
--     unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price > 0),
--     PRIMARY KEY (order_id, book_id),
--     FOREIGN KEY (order_id) REFERENCES Orders(order_id),
--     FOREIGN KEY (book_id) REFERENCES Books(book_id)
-- );
--
-- Once OrderItems contains multiple books per order, this query finds pairs
-- that have never appeared together in any order.
--
-- SELECT b1.book_id AS book1_id, b1.title AS book1_title,
--        b2.book_id AS book2_id, b2.title AS book2_title
-- FROM Books AS b1
-- JOIN Books AS b2 ON b1.book_id < b2.book_id
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM OrderItems AS oi1
--     JOIN OrderItems AS oi2
--       ON oi1.order_id = oi2.order_id
--     WHERE oi1.book_id = b1.book_id
--       AND oi2.book_id = b2.book_id
-- );


/*
===============================================================================
FINAL PRACTICE CHECKLIST
1. Run one section at a time.
2. Read the comments and predict the output before running each query.
3. Change the sample values and run the query again.
4. For UPDATE and DELETE, run the matching SELECT preview first.
5. Run the bookstore case study section only after importing its dataset.
===============================================================================
END OF CODES WITH PANKAJ SQL TUTORIAL
*/
