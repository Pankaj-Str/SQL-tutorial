-- =========================================
-- CREATE DATABASE & USE IT
-- =========================================
CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

-- =========================================
-- DROP TABLES IF THEY EXIST (RESET)
-- =========================================
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Authors;

-- =========================================
-- CREATE TABLES
-- =========================================

-- AUTHORS TABLE
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    birth_year INT,
    nationality VARCHAR(50)
);

-- BOOKS TABLE
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    publication_year INT,
    genre VARCHAR(50),
    price DECIMAL(10,2) CHECK (price > 0),
    stock INT DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- CUSTOMERS TABLE
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    email VARCHAR(100),
    join_date DATE
);

-- ORDERS TABLE
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- =========================================
-- INSERT BASE MANUAL DATA
-- =========================================

-- 20 BASE AUTHORS (MANUAL)
INSERT INTO Authors (first_name, last_name, birth_year, nationality) VALUES
('John','Doe',1975,'American'),
('Alice','Walker',1985,'British'),
('Ravi','Kumar',1990,'Indian'),
('Maria','Gomez',1978,'Spanish'),
('David','Smith',1982,'American'),
('Linda','Brown',1988,'Canadian'),
('Ken','Tanaka',1972,'Japanese'),
('Sara','Miller',1991,'British'),
('Omar','Hassan',1980,'Egyptian'),
('Julia','Roberts',1975,'American'),
('Leon','Adams',1973,'German'),
('Vikram','Singh',1988,'Indian'),
('Chen','Wei',1983,'Chinese'),
('Hiro','Sato',1979,'Japanese'),
('Paula','Fernandez',1985,'Mexican'),
('Mohammed','Ali',1981,'UAE'),
('Eva','Larsen',1989,'Norwegian'),
('Pierre','Dupont',1977,'French'),
('Isabella','Rossi',1984,'Italian'),
('Oliver','King',1976,'British');

-- 30 MORE AUTHORS (MANUAL) = 50 MANUAL AUTHORS
INSERT INTO Authors (first_name, last_name, birth_year, nationality) VALUES
('Sonia','Sharma',1991,'Indian'),
('Arjun','Patel',1987,'Indian'),
('Henry','Clark',1980,'American'),
('Jacob','White',1979,'American'),
('Nina','Lopez',1986,'Spanish'),
('Carlos','Martinez',1990,'Mexican'),
('Yuki','Nakamura',1983,'Japanese'),
('Jin','Park',1985,'Korean'),
('Aisha','Rahman',1988,'Bangladeshi'),
('Tom','Baker',1978,'British'),
('George','Hall',1974,'American'),
('Irina','Petrov',1982,'Russian'),
('Natalia','Smirnova',1987,'Russian'),
('Liam','Scott',1985,'Australian'),
('Noah','Turner',1990,'Australian'),
('Emma','Wright',1993,'Canadian'),
('Maya','Kapoor',1992,'Indian'),
('Zara','Qureshi',1989,'Pakistani'),
('Farhan','Iqbal',1984,'Pakistani'),
('Tariq','Hussein',1976,'Jordanian'),
('Anita','Desai',1958,'Indian'),
('Mark','Wilson',1986,'American'),
('Grace','Young',1991,'British'),
('Hannah','Moore',1983,'Canadian'),
('Samuel','Reed',1980,'American'),
('Austin','Cole',1994,'Australian'),
('Andre','Silva',1987,'Brazilian'),
('Miguel','Castro',1982,'Portuguese'),
('Elena','Costa',1985,'Italian'),
('Jonas','Muller',1981,'German');

-- 25 BASE BOOKS (MANUAL)
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) VALUES
('Python Basics',1,2020,'Programming',20.00,10),
('Advanced Python Concepts',1,2022,'Programming',25.00,4),
('Java Essentials',2,2021,'Programming',18.50,5),
('Machine Learning 101',3,2023,'AI',30.00,8),
('Deep Learning Guide',3,2022,'AI',40.00,2),
('The Great Adventure',4,2018,'Fiction',12.99,13),
('Love and War',5,2019,'Fiction',15.50,6),
('Secrets of the Universe',6,2020,'Science',22.00,9),
('History of Civilizations',7,2015,'History',18.00,20),
('Fantasy World',8,2017,'Fantasy',16.50,7),
('Cloud Computing',9,2021,'Technology',28.00,3),
('Cyber Security Fundamentals',10,2020,'Technology',32.00,5),
('AI for Beginners',11,2021,'AI',24.99,14),
('Cooking Made Easy',12,2019,'Cooking',12.00,16),
('Master Chef Secrets',13,2022,'Cooking',18.00,5),
('Gardening at Home',14,2021,'Lifestyle',14.00,8),
('Healthy Living',15,2020,'Lifestyle',19.00,11),
('Travel the World',16,2018,'Travel',20.50,4),
('Mountains & Rivers',17,2017,'Travel',21.00,3),
('Digital Photography',18,2021,'Art',26.00,7),
('Painting for All',19,2019,'Art',22.00,9),
('Blockchain Explained',20,2022,'Technology',29.99,6),
('Cryptocurrency Mastery',21,2023,'Technology',34.99,2),
('Big Data Analytics',22,2020,'Technology',27.00,8),
('Physics for Everyone',23,2018,'Science',23.50,15);

-- 25 MORE BASE BOOKS (MANUAL) = 50 MANUAL BOOKS
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) VALUES
('Chemistry Basics',24,2021,'Science',17.50,6),
('Biology Illustrated',25,2022,'Science',19.99,4),
('Space Exploration',26,2023,'Science',28.00,7),
('Programming in C++',27,2021,'Programming',22.50,10),
('Web Development with HTML',28,2020,'Programming',15.99,12),
('Mastering CSS',29,2022,'Programming',17.99,8),
('JavaScript in Depth',30,2023,'Programming',24.99,3),
('PHP & MySQL Guide',31,2021,'Programming',19.50,5),
('Data Structures & Algorithms',32,2020,'Programming',26.50,7),
('Linux for Everyone',33,2022,'Technology',29.50,4),
('Networking Essentials',34,2021,'Technology',21.99,6),
('Mobile App Development',35,2023,'Programming',31.00,3),
('Android Development',36,2021,'Programming',18.50,9),
('iOS Development',37,2022,'Programming',27.50,2),
('Machine Learning Advanced',38,2023,'AI',39.99,4),
('Quantum Computing',39,2022,'Technology',45.00,1),
('Artificial Intelligence Future',40,2023,'AI',35.00,5),
('Romantic Stories',41,2018,'Fiction',11.50,14),
('Horror Night',42,2019,'Fiction',13.00,8),
('Detective Mystery',43,2020,'Fiction',15.00,5),
('Spiritual Awakening',44,2021,'Religion',16.99,6),
('Philosophy of Life',45,2019,'Philosophy',18.99,9),
('Economics Explained',46,2020,'Economics',24.00,7),
('Business Management',47,2022,'Business',29.00,4),
('Startup Guide',48,2021,'Business',19.50,11);

-- 20 BASE CUSTOMERS (MANUAL)
INSERT INTO Customers (first_name, last_name, email, join_date) VALUES
('Amit','Sharma','amit1@mail.com','2022-01-10'),
('Riya','Mehta','riya2@mail.com','2023-02-14'),
('John','King','john3@mail.com','2021-05-20'),
('Karan','Patel','karan4@mail.com','2020-08-11'),
('Sneha','Kapoor','sneha5@mail.com','2023-03-19'),
('Pooja','Iyer','pooja6@mail.com','2022-09-21'),
('Rahul','Singh','rahul7@mail.com','2021-11-23'),
('Mohan','Das','mohan8@mail.com','2020-10-12'),
('Preeti','Nair','preeti9@mail.com','2023-01-05'),
('Daniel','Jones','dan10@mail.com','2022-04-17'),
('Sophia','Brown','soph11@mail.com','2023-01-30'),
('Emma','Wilson','emm12@mail.com','2022-06-21'),
('Oliver','Scott','oli13@mail.com','2021-03-27'),
('Lucas','Walker','luc14@mail.com','2021-07-14'),
('Noah','Adams','noah15@mail.com','2023-02-11'),
('Arjun','Khurana','arj16@mail.com','2020-01-11'),
('Kabir','Rathod','kab17@mail.com','2021-02-05'),
('Sanjay','Shah','san18@mail.com','2022-10-10'),
('Deepa','Joshi','deep19@mail.com','2023-04-09'),
('Zoya','Ali','zoy20@mail.com','2020-12-12');

-- 20 BASE ORDERS (MANUAL)
INSERT INTO Orders (customer_id, book_id, order_date, quantity, total_amount) VALUES
(1,1,'2023-01-10',2,40.00),
(2,3,'2023-03-15',1,18.50),
(3,5,'2022-07-20',1,40.00),
(4,2,'2021-09-11',3,75.00),
(5,10,'2023-04-19',2,52.00),
(6,7,'2022-10-21',1,15.50),
(7,12,'2021-12-23',1,32.00),
(8,4,'2020-11-12',2,60.00),
(9,6,'2023-02-05',1,12.99),
(10,8,'2022-05-17',2,44.00),
(11,15,'2023-02-28',1,18.00),
(12,20,'2022-08-22',1,26.00),
(13,25,'2021-04-01',2,47.00),
(14,30,'2021-08-18',1,24.99),
(15,40,'2023-02-11',3,105.00),
(16,45,'2020-01-11',1,18.99),
(17,48,'2021-02-05',2,39.00),
(18,50,'2022-10-10',1,31.50),
(19,11,'2023-04-09',1,24.99),
(20,19,'2020-12-12',1,21.00);

-- =========================================
-- AUTO-GENERATED EXTRA DATA
-- To reach 2000+ total rows (especially in Orders)
-- =========================================

-- -----------------------------------------
-- MORE AUTHORS (AUTO) → about +150 extra
-- -----------------------------------------
SET @a := 0;
INSERT INTO Authors (first_name, last_name, birth_year, nationality)
SELECT CONCAT('AutoFirst', @a := @a + 1),
       CONCAT('AutoLast', @a),
       FLOOR(RAND()*40) + 1960,
       ELT(FLOOR(RAND()*6)+1,
           'American','British','Indian','Canadian','German','Australian')
FROM information_schema.columns
LIMIT 150;

-- -----------------------------------------
-- MORE BOOKS (AUTO) → about +450 extra
-- -----------------------------------------
SET @b := 0;
INSERT INTO Books (title, author_id, publication_year, genre, price, stock)
SELECT CONCAT('Book Title ', @b := @b + 1),
       FLOOR(RAND() * (SELECT MAX(author_id) FROM Authors)) + 1,
       FLOOR(RAND()*24) + 2000,  -- years 2000–2023
       ELT(FLOOR(RAND()*6)+1,
           'Programming','Fiction','Science','History','Fantasy','Business'),
       ROUND(RAND()*40 + 10, 2), -- price between 10 and 50
       FLOOR(RAND()*30)          -- stock 0–29
FROM information_schema.columns
LIMIT 450;

-- -----------------------------------------
-- MORE CUSTOMERS (AUTO) → about +180 extra
-- -----------------------------------------
SET @c := 20;
INSERT INTO Customers (first_name, last_name, email, join_date)
SELECT CONCAT('CustFirst', @c := @c + 1),
       CONCAT('CustLast', @c),
       CONCAT('customer', @c, '@mail.com'),
       DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND()*1460) DAY)  -- between 2020-2023
FROM information_schema.columns
LIMIT 180;

-- -----------------------------------------
-- MORE ORDERS (AUTO) → about +2000 extra
-- -----------------------------------------
SET @o := 20;
INSERT INTO Orders (customer_id, book_id, order_date, quantity, total_amount)
SELECT 
    FLOOR(RAND() * (SELECT MAX(customer_id) FROM Customers)) + 1 AS customer_id,
    FLOOR(RAND() * (SELECT MAX(book_id) FROM Books)) + 1 AS book_id,
    DATE_ADD('2021-01-01', INTERVAL FLOOR(RAND()*1460) DAY) AS order_date, -- 2021–2024 approx
    (@qty := FLOOR(RAND()*5) + 1) AS quantity,
    ROUND(@qty * (RAND()*40 + 10), 2) AS total_amount
FROM information_schema.columns
LIMIT 2000;

-- At this point:
--   Authors   ≈ 200+
--   Books     ≈ 500+
--   Customers ≈ 200+
--   Orders    ≈ 2020+
-- Total rows >> 2000
