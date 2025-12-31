### 1. Beginner Level: Library Management System

#### Case Study Overview
You're managing a small community library. The system tracks members, books, and issuances (when a book is borrowed). We'll create a database with three tables: `members` (member details), `books` (book info), and `issues` (borrowing records). The dataset includes 5 members, 10 books, and 8 issuances.

This project covers basic CRUD (Create, Read, Update, Delete) operations and simple joins.

#### Step 1: Set Up the Database
```sql
CREATE DATABASE library_db;
USE library_db;
```

#### Step 2: Create the Tables
```sql
-- Members table
CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL
);

-- Books table
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    published_year INT
);

-- Issues table (links members and books)
CREATE TABLE issues (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    issue_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
```

#### Step 3: Insert the Dataset
```sql
-- Insert members
INSERT INTO members (name, join_date) VALUES
('Alice Johnson', '2023-01-10'),
('Bob Smith', '2022-06-15'),
('Charlie Davis', '2024-02-20'),
('Diana Evans', '2021-11-05'),
('Eve Franklin', '2023-09-30');

-- Insert books
INSERT INTO books (title, author, genre, published_year) VALUES
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960),
('1984', 'George Orwell', 'Dystopian', 1949),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925),
('Pride and Prejudice', 'Jane Austen', 'Romance', 1813),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951),
('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'Fantasy', 1997),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937),
('Sapiens', 'Yuval Noah Harari', 'Non-Fiction', 2011),
('Educated', 'Tara Westover', 'Memoir', 2018),
('Atomic Habits', 'James Clear', 'Self-Help', 2018);

-- Insert issues
INSERT INTO issues (member_id, book_id, issue_date, return_date) VALUES
(1, 1, '2024-03-01', '2024-03-15'),
(2, 2, '2024-04-05', NULL),  -- Not returned
(3, 3, '2024-02-10', '2024-02-25'),
(4, 4, '2024-01-20', NULL),
(1, 5, '2024-05-01', '2024-05-10'),
(5, 6, '2024-03-15', NULL),
(2, 7, '2024-04-20', '2024-05-05'),
(3, 8, '2024-02-28', NULL);
```

#### Step 4: Verify the Data
```sql
SELECT * FROM members;
SELECT * FROM books;
SELECT * FROM issues;
```

#### Step 5: Perform Basic Queries
1. List all books issued but not returned:
   ```sql
   SELECT b.title, m.name, i.issue_date
   FROM issues i
   JOIN books b ON i.book_id = b.book_id
   JOIN members m ON i.member_id = m.member_id
   WHERE i.return_date IS NULL;
   ```

2. Find members who joined in the last 2 years:
   ```sql
   SELECT name, join_date
   FROM members
   WHERE join_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);
   ```

3. Count books per genre:
   ```sql
   SELECT genre, COUNT(*) AS book_count
   FROM books
   GROUP BY genre;
   ```

#### Step 6: Advanced Touches (Optional)
- Update a return date:
  ```sql
  UPDATE issues SET return_date = '2024-05-15' WHERE issue_id = 2;
  ```
- Delete an issue:
  ```sql
  DELETE FROM issues WHERE issue_id = 8;
  ```

### 2. Beginner-Intermediate: Online Shopping Cart (E-commerce Basics)

#### Case Study Overview
Simulate an online bookstore. Track customers, products, orders, and order items. Dataset: 15 customers, 20 products, 50 orders, and corresponding items.

Skills: Aggregations, joins, date functions.

#### Step 1: Set Up the Database
```sql
CREATE DATABASE ecommerce_db;
USE ecommerce_db;
```

#### Step 2: Create the Tables
```sql
-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50)
);

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price_at_purchase DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```

#### Step 3: Insert the Dataset
For brevity, I'll insert a subset (5 customers, 5 products, 5 orders, 8 items). Expand as needed.

```sql
-- Insert customers
INSERT INTO customers (name, email, city) VALUES
('John Doe', 'john@example.com', 'New York'),
('Jane Smith', 'jane@example.com', 'Los Angeles'),
('Alice Johnson', 'alice@example.com', 'Chicago'),
('Bob Brown', 'bob@example.com', 'Houston'),
('Charlie Davis', 'charlie@example.com', 'Phoenix');

-- Insert products
INSERT INTO products (name, price, stock) VALUES
('Book A', 19.99, 100),
('Book B', 29.99, 50),
('Book C', 14.99, 200),
('Book D', 24.99, 75),
('Book E', 9.99, 150);

-- Insert orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-01-10', 49.98),
(2, '2024-02-15', 29.99),
(3, '2024-03-20', 44.97),
(4, '2024-04-05', 24.99),
(5, '2024-05-01', 39.98);

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 2, 19.99),
(1, 2, 1, 29.99),  -- Note: Total calculated separately in app logic
(2, 2, 1, 29.99),
(3, 3, 3, 14.99),
(4, 4, 1, 24.99),
(5, 5, 4, 9.99),
(3, 1, 1, 19.99),
(5, 1, 1, 19.99);
```

#### Step 4: Verify the Data
```sql
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
```

#### Step 5: Perform Queries
1. Find top 5 customers by total spending:
   ```sql
   SELECT c.name, SUM(o.total_amount) AS total_spent
   FROM customers c
   JOIN orders o ON c.customer_id = o.customer_id
   GROUP BY c.name
   ORDER BY total_spent DESC
   LIMIT 5;
   ```

2. List products with low stock (<10):
   ```sql
   SELECT name, stock
   FROM products
   WHERE stock < 10;
   ```

3. Monthly sales report:
   ```sql
   SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, SUM(total_amount) AS revenue
   FROM orders
   GROUP BY year, month
   ORDER BY year, month;
   ```

#### Step 6: Advanced Touches
- Update stock after order (manually for demo):
  ```sql
  UPDATE products SET stock = stock - 2 WHERE product_id = 1;
  ```

### 3. Intermediate: School Management System

#### Case Study Overview
Manage a school with students, teachers, subjects, classes, enrollments, and grades. Dataset: 10 students, 5 teachers, 5 subjects, 3 classes, enrollments, and grades.

Skills: Subqueries, HAVING, multiple joins.

#### Step 1: Set Up the Database
```sql
CREATE DATABASE school_db;
USE school_db;
```

#### Step 2: Create the Tables
```sql
-- Students table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    enrollment_year INT
);

-- Teachers table
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    subject_specialty VARCHAR(50)
);

-- Subjects table
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Classes table
CREATE TABLE classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50) NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

-- Enrollments table
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    class_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

-- Grades table
CREATE TABLE grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    grade DECIMAL(5, 2) NOT NULL,
    exam_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);
```

#### Step 3: Insert the Dataset
Subset for brevity (5 students, 3 teachers, 3 subjects, 2 classes).

```sql
-- Insert students
INSERT INTO students (name, enrollment_year) VALUES
('Student A', 2022),
('Student B', 2023),
('Student C', 2022),
('Student D', 2024),
('Student E', 2023);

-- Insert teachers
INSERT INTO teachers (name, subject_specialty) VALUES
('Teacher X', 'Math'),
('Teacher Y', 'Science'),
('Teacher Z', 'English');

-- Insert subjects
INSERT INTO subjects (name) VALUES
('Math'),
('Science'),
('English');

-- Insert classes
INSERT INTO classes (class_name, teacher_id) VALUES
('Class 101', 1),
('Class 102', 2);

-- Insert enrollments
INSERT INTO enrollments (student_id, class_id) VALUES
(1, 1), (2, 1), (3, 2), (4, 2), (5, 1);

-- Insert grades
INSERT INTO grades (student_id, subject_id, grade, exam_date) VALUES
(1, 1, 85.00, '2024-06-01'),
(1, 2, 90.00, '2024-06-02'),
(2, 1, 70.00, '2024-06-01'),
(2, 3, 45.00, '2024-06-03'),  -- Failed
(3, 2, 95.00, '2024-06-02'),
(4, 1, 60.00, '2024-06-01'),
(5, 3, 88.00, '2024-06-03');
```

#### Step 4: Verify the Data
```sql
SELECT * FROM students;
-- Similarly for other tables
```

#### Step 5: Perform Queries
1. Students with average grade > 85:
   ```sql
   SELECT s.name, AVG(g.grade) AS avg_grade
   FROM students s
   JOIN grades g ON s.student_id = g.student_id
   GROUP BY s.name
   HAVING avg_grade > 85;
   ```

2. Teachers and number of students:
   ```sql
   SELECT t.name, COUNT(e.student_id) AS student_count
   FROM teachers t
   JOIN classes c ON t.teacher_id = c.teacher_id
   JOIN enrollments e ON c.class_id = e.class_id
   GROUP BY t.name;
   ```

3. Top 3 students per class by average grade:
   ```sql
   SELECT c.class_name, s.name, AVG(g.grade) AS avg_grade
   FROM classes c
   JOIN enrollments e ON c.class_id = e.class_id
   JOIN students s ON e.student_id = s.student_id
   JOIN grades g ON s.student_id = g.student_id
   GROUP BY c.class_name, s.name
   ORDER BY c.class_name, avg_grade DESC
   LIMIT 3;  -- Note: Use window functions in MySQL 8+ for per-group limit
   ```

4. Students who failed in any subject:
   ```sql
   SELECT s.name, sub.name AS subject, g.grade
   FROM students s
   JOIN grades g ON s.student_id = g.student_id
   JOIN subjects sub ON g.subject_id = sub.subject_id
   WHERE g.grade < 50;
   ```

#### Step 6: Bonus
- Create view:
  ```sql
  CREATE VIEW student_report AS
  SELECT s.name, AVG(g.grade) AS avg_grade
  FROM students s JOIN grades g ON s.student_id = g.student_id
  GROUP BY s.name;
  ```

### 4. Intermediate-Advanced: Hospital Management System

#### Case Study Overview
Track patients, doctors, departments, appointments, and treatments. Dataset: 10 patients, 5 doctors, 3 departments, 15 appointments, treatments.

Skills: CASE, WINDOW functions (MySQL 8+), complex aggregations.

#### Step 1: Set Up the Database
```sql
CREATE DATABASE hospital_db;
USE hospital_db;
```

#### Step 2: Create the Tables
```sql
-- Patients table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dob DATE
);

-- Doctors table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(50)
);

-- Departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- Appointments table
CREATE TABLE appointments (
    appt_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    dept_id INT,
    appt_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Treatments table
CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appt_id INT,
    diagnosis VARCHAR(200),
    prescription TEXT,
    FOREIGN KEY (appt_id) REFERENCES appointments(appt_id)
);
```

#### Step 3: Insert the Dataset
Subset: 5 patients, 3 doctors, 2 depts, 6 appts.

```sql
-- Insert patients
INSERT INTO patients (name, dob) VALUES
('Patient A', '1990-01-01'),
('Patient B', '1985-05-15'),
('Patient C', '2000-03-20'),
('Patient D', '1975-11-10'),
('Patient E', '1995-07-25');

-- Insert doctors
INSERT INTO doctors (name, specialty) VALUES
('Dr. X', 'Cardiology'),
('Dr. Y', 'Neurology'),
('Dr. Z', 'General');

-- Insert departments
INSERT INTO departments (name) VALUES
('Cardiology'),
('Neurology');

-- Insert appointments
INSERT INTO appointments (patient_id, doctor_id, dept_id, appt_date, status) VALUES
(1, 1, 1, '2025-12-01 10:00:00', 'Completed'),
(2, 2, 2, '2025-12-05 14:00:00', 'Scheduled'),
(1, 1, 1, '2025-11-15 09:00:00', 'Completed'),
(3, 3, 1, '2025-12-10 11:00:00', 'Cancelled'),
(4, 1, 1, '2025-12-20 15:00:00', 'Scheduled'),
(2, 2, 2, '2025-11-25 13:00:00', 'Completed');

-- Insert treatments
INSERT INTO treatments (appt_id, diagnosis, prescription) VALUES
(1, 'Heart issue', 'Medication A'),
(3, 'Follow-up', 'Rest'),
(6, 'Headache', 'Painkiller');
```

#### Step 4: Verify the Data
```sql
SELECT * FROM patients;
-- Similarly for others
```

#### Step 5: Perform Queries
1. Doctors with most appointments in December 2025:
   ```sql
   SELECT d.name, COUNT(a.appt_id) AS appt_count
   FROM doctors d
   JOIN appointments a ON d.doctor_id = a.doctor_id
   WHERE YEAR(a.appt_date) = 2025 AND MONTH(a.appt_date) = 12
   GROUP BY d.name
   ORDER BY appt_count DESC;
   ```

2. Patients who visited more than 3 times:
   ```sql
   SELECT p.name, COUNT(a.appt_id) AS visits
   FROM patients p
   JOIN appointments a ON p.patient_id = a.patient_id
   GROUP BY p.name
   HAVING visits > 3;
   ```

3. Monthly appointment count per department:
   ```sql
   SELECT dep.name, YEAR(a.appt_date) AS year, MONTH(a.appt_date) AS month, COUNT(a.appt_id) AS count
   FROM departments dep
   JOIN appointments a ON dep.dept_id = a.dept_id
   GROUP BY dep.name, year, month;
   ```

4. Classify patients as New or Returning (using CASE):
   ```sql
   SELECT p.name,
   CASE
       WHEN COUNT(a.appt_id) = 1 THEN 'New'
       ELSE 'Returning'
   END AS patient_type
   FROM patients p
   JOIN appointments a ON p.patient_id = a.patient_id
   GROUP BY p.name;
   ```

#### Step 6: Advanced Add-on
- Rank doctors by patient load (MySQL 8+):
  ```sql
  SELECT d.name, COUNT(a.appt_id) AS load,
  RANK() OVER (ORDER BY COUNT(a.appt_id) DESC) AS rank
  FROM doctors d JOIN appointments a ON d.doctor_id = a.doctor_id
  GROUP BY d.name;
  ```

### 5. Advanced: Sales & Inventory Management with Analytics

#### Case Study Overview
For a supermarket chain: Track stores, products, categories, inventory, sales, suppliers, purchases. Dataset: 3 stores, 10 products, 2 categories, inventory, 20 sales, suppliers/purchases.

Skills: Procedures, triggers, CTEs, transactions.

#### Step 1: Set Up the Database
```sql
CREATE DATABASE sales_db;
USE sales_db;
```

#### Step 2: Create the Tables
```sql
-- Stores table
CREATE TABLE stores (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Categories table
CREATE TABLE categories (
    cat_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    cat_id INT,
    cost_price DECIMAL(10, 2),
    FOREIGN KEY (cat_id) REFERENCES categories(cat_id)
);

-- Inventory table
CREATE TABLE inventory (
    inv_id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT,
    product_id INT,
    stock_quantity INT NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT,
    product_id INT,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    revenue DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Suppliers table
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Purchases table (for restocking)
CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT,
    product_id INT,
    quantity INT NOT NULL,
    purchase_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```

#### Step 3: Insert the Dataset
Subset: 2 stores, 2 cats, 5 prods, etc.

```sql
-- Insert stores
INSERT INTO stores (name, location) VALUES
('Store 1', 'New York'),
('Store 2', 'Los Angeles');

-- Insert categories
INSERT INTO categories (name) VALUES
('Electronics'),
('Groceries');

-- Insert products
INSERT INTO products (name, cat_id, cost_price) VALUES
('Laptop', 1, 800.00),
('Phone', 1, 500.00),
('Apples', 2, 1.00),
('Bread', 2, 2.50),
('Milk', 2, 3.00);

-- Insert inventory
INSERT INTO inventory (store_id, product_id, stock_quantity) VALUES
(1, 1, 10), (1, 2, 20), (1, 3, 100),
(2, 1, 5), (2, 4, 50);

-- Insert sales
INSERT INTO sales (store_id, product_id, sale_date, quantity, revenue) VALUES
(1, 1, '2025-12-01', 2, 2000.00),
(1, 3, '2025-12-02', 50, 75.00),
(2, 1, '2025-12-03', 1, 1000.00),
(1, 2, '2025-11-15', 3, 1800.00),
(2, 4, '2025-12-10', 10, 30.00);

-- Insert suppliers
INSERT INTO suppliers (name) VALUES
('Supplier A'),
('Supplier B');

-- Insert purchases
INSERT INTO purchases (supplier_id, product_id, quantity, purchase_date) VALUES
(1, 1, 20, '2025-11-01'),
(2, 3, 200, '2025-11-05');
```

#### Step 4: Verify the Data
```sql
SELECT * FROM products;
-- Similarly for others
```

#### Step 5: Perform Advanced Tasks
1. Stored Procedure: Process new sale and update inventory
   ```sql
   DELIMITER //
   CREATE PROCEDURE process_sale(
       IN p_store_id INT,
       IN p_product_id INT,
       IN p_quantity INT,
       IN p_revenue DECIMAL(10,2),
       IN p_sale_date DATE
   )
   BEGIN
       -- Check stock
       DECLARE current_stock INT;
       SELECT stock_quantity INTO current_stock
       FROM inventory
       WHERE store_id = p_store_id AND product_id = p_product_id;
       
       IF current_stock < p_quantity THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock';
       ELSE
           -- Insert sale
           INSERT INTO sales (store_id, product_id, sale_date, quantity, revenue)
           VALUES (p_store_id, p_product_id, p_sale_date, p_quantity, p_revenue);
           
           -- Update inventory
           UPDATE inventory
           SET stock_quantity = stock_quantity - p_quantity
           WHERE store_id = p_store_id AND product_id = p_product_id;
       END IF;
   END //
   DELIMITER ;
   ```
   Call: `CALL process_sale(1, 1, 1, 1000.00, '2025-12-31');`

2. Trigger: Prevent over-selling
   ```sql
   DELIMITER //
   CREATE TRIGGER before_sale_insert
   BEFORE INSERT ON sales
   FOR EACH ROW
   BEGIN
       DECLARE stock INT;
       SELECT stock_quantity INTO stock
       FROM inventory
       WHERE store_id = NEW.store_id AND product_id = NEW.product_id;
       IF stock < NEW.quantity THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock';
       END IF;
   END //
   DELIMITER ;
   ```

3. Monthly report with CTE:
   ```sql
   WITH monthly_sales AS (
       SELECT YEAR(sale_date) AS year, MONTH(sale_date) AS month, SUM(revenue) AS total_revenue
       FROM sales
       GROUP BY year, month
   )
   SELECT year, month, total_revenue,
   LAG(total_revenue) OVER (ORDER BY year, month) AS prev_month,
   (total_revenue - LAG(total_revenue) OVER (ORDER BY year, month)) / LAG(total_revenue) OVER (ORDER BY year, month) * 100 AS growth_pct
   FROM monthly_sales;
   ```

4. Products out of stock in >50% stores (CTE):
   ```sql
   WITH stock_status AS (
       SELECT product_id, COUNT(store_id) AS total_stores,
       SUM(CASE WHEN stock_quantity = 0 THEN 1 ELSE 0 END) AS out_of_stock_count
       FROM inventory
       GROUP BY product_id
   )
   SELECT p.name, ss.out_of_stock_count, ss.total_stores
   FROM stock_status ss
   JOIN products p ON ss.product_id = p.product_id
   WHERE ss.out_of_stock_count > ss.total_stores * 0.5;
   ```

5. View: Profit Analysis
   ```sql
   CREATE VIEW profit_analysis AS
   SELECT p.name, SUM(s.revenue) - SUM(s.quantity * p.cost_price) AS profit
   FROM products p
   JOIN sales s ON p.product_id = s.product_id
   GROUP BY p.name;
   ```

#### Step 6: Bonus
- Transaction for safe sale:
  ```sql
  START TRANSACTION;
  CALL process_sale(1, 2, 1, 600.00, '2025-12-31');
  COMMIT;
  -- Or ROLLBACK on error
  ```

These projects build skills progressively. Start with the beginner one and test in your MySQL environment. If errors occur, check foreign keys or data types. Expand datasets as needed!
