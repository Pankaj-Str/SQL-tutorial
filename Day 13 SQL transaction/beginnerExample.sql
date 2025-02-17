-- Create a simple database for a bookstore
CREATE DATABASE IF NOT EXISTS simple_bookstore;

-- Use the bookstore database
USE simple_bookstore;

-- Create a table for books
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0
);

-- Create a table for customers
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Create a table for orders
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create a table for order details
CREATE TABLE IF NOT EXISTS order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price_each DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Insert sample data for books
INSERT INTO books (title, author, price, stock)
VALUES 
('Introduction to SQL', 'Jane Smith', 29.99, 20),
('Database Design', 'John Doe', 39.99, 15),
('MySQL for Beginners', 'Mary Johnson', 24.99, 30);

-- Insert a sample customer
INSERT INTO customers (name, email)
VALUES ('Bob Brown', 'bob@example.com');

-- TRANSACTION EXAMPLE: Process a book order
-- This shows how to use transactions for a typical e-commerce scenario

-- Start a transaction
START TRANSACTION;

-- 1. Create a new order
INSERT INTO orders (customer_id, total_amount)
VALUES (1, 0.00);  -- We'll update the total later

-- Get the new order ID
SET @new_order_id = LAST_INSERT_ID();

-- 2. Add two books to the order
-- First book: "Introduction to SQL"
INSERT INTO order_details (order_id, book_id, quantity, price_each)
VALUES (@new_order_id, 1, 2, 29.99);

-- Update stock for first book
UPDATE books SET stock = stock - 2 WHERE book_id = 1;

-- Second book: "MySQL for Beginners"
INSERT INTO order_details (order_id, book_id, quantity, price_each)
VALUES (@new_order_id, 3, 1, 24.99);

-- Update stock for second book
UPDATE books SET stock = stock - 1 WHERE book_id = 3;

-- 3. Calculate and update the order total
UPDATE orders 
SET total_amount = (SELECT SUM(quantity * price_each) 
                    FROM order_details 
                    WHERE order_id = @new_order_id)
WHERE order_id = @new_order_id;

-- 4. Check if everything is OK and commit
-- If any errors occurred, the transaction would automatically rollback
COMMIT;

-- View the results
SELECT 'Order created successfully' AS message;
SELECT * FROM orders WHERE order_id = @new_order_id;
SELECT * FROM order_details WHERE order_id = @new_order_id;
SELECT * FROM books WHERE book_id IN (1, 3);