-- Create a simple bank database
CREATE DATABASE IF NOT EXISTS simple_bank;
USE simple_bank;

-- Create a simple accounts table
CREATE TABLE IF NOT EXISTS accounts (
    account_id INT PRIMARY KEY,
    account_name VARCHAR(100),
    balance DECIMAL(10,2)
);

-- Insert two test accounts
INSERT INTO accounts (account_id, account_name, balance)
VALUES 
(1, 'Alice', 1000.00),
(2, 'Bob', 500.00);

-- Show initial balances
SELECT * FROM accounts;

-- START A SIMPLE TRANSACTION
-- This transaction transfers $200 from Alice to Bob

START TRANSACTION;

-- Step 1: Take $200 from Alice's account
UPDATE accounts 
SET balance = balance - 200 
WHERE account_id = 1;

-- Step 2: Add $200 to Bob's account
UPDATE accounts 
SET balance = balance + 200 
WHERE account_id = 2;

-- Commit the transaction - makes changes permanent
COMMIT;

-- Show final balances after the transaction
SELECT * FROM accounts;

-- EXAMPLE OF A TRANSACTION WITH ROLLBACK
-- This transaction will be cancelled

START TRANSACTION;

-- Try to withdraw too much money from Bob
UPDATE accounts 
SET balance = balance - 1000 
WHERE account_id = 2;

-- We realize Bob doesn't have enough money
-- So we cancel the transaction
ROLLBACK;

-- Show balances - should be the same as after first transaction
SELECT * FROM accounts;