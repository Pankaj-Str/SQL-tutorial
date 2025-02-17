-- Start by creating a new database
CREATE DATABASE IF NOT EXISTS banking_system;

-- Use the newly created database
USE banking_system;

-- Create the customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the accounts table
CREATE TABLE IF NOT EXISTS accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type ENUM('Checking', 'Savings', 'Credit') NOT NULL,
    balance DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    interest_rate DECIMAL(5, 2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create the transactions table to track all money movements
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    from_account_id INT,
    to_account_id INT,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_type ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    notes TEXT,
    FOREIGN KEY (from_account_id) REFERENCES accounts(account_id),
    FOREIGN KEY (to_account_id) REFERENCES accounts(account_id)
);

-- Insert some sample customers
INSERT INTO customers (first_name, last_name, email, phone)
VALUES 
('John', 'Doe', 'john.doe@example.com', '555-123-4567'),
('Jane', 'Smith', 'jane.smith@example.com', '555-987-6543'),
('Michael', 'Johnson', 'michael.j@example.com', '555-456-7890');

-- Create accounts for the customers
INSERT INTO accounts (customer_id, account_type, balance, interest_rate)
VALUES
(1, 'Checking', 5000.00, 0.00),
(1, 'Savings', 10000.00, 2.50),
(2, 'Checking', 3500.00, 0.00),
(2, 'Savings', 15000.00, 2.75),
(3, 'Checking', 7800.00, 0.00),
(3, 'Credit', -2500.00, 19.99);

-- Example of a transaction: Transfer money between accounts
-- Function to transfer money with transaction handling
DELIMITER //
CREATE PROCEDURE transfer_funds(
    IN p_from_account INT,
    IN p_to_account INT,
    IN p_amount DECIMAL(15, 2),
    OUT p_status VARCHAR(50)
)
BEGIN
    DECLARE current_balance DECIMAL(15, 2);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_status = 'Error: Transaction failed';
    END;

    -- Start transaction
    START TRANSACTION;
    
    -- Check if source account has sufficient funds
    SELECT balance INTO current_balance FROM accounts WHERE account_id = p_from_account FOR UPDATE;
    
    IF current_balance >= p_amount THEN
        -- Deduct from source account
        UPDATE accounts SET balance = balance - p_amount WHERE account_id = p_from_account;
        
        -- Add to destination account
        UPDATE accounts SET balance = balance + p_amount WHERE account_id = p_to_account;
        
        -- Record the transaction
        INSERT INTO transactions (from_account_id, to_account_id, amount, transaction_type, status, notes)
        VALUES (p_from_account, p_to_account, p_amount, 'Transfer', 'Completed', 
                CONCAT('Transfer of $', p_amount, ' from account #', p_from_account, ' to account #', p_to_account));
        
        COMMIT;
        SET p_status = 'Success: Transfer completed';
    ELSE
        -- Insufficient funds, rollback and log failed attempt
        INSERT INTO transactions (from_account_id, to_account_id, amount, transaction_type, status, notes)
        VALUES (p_from_account, p_to_account, p_amount, 'Transfer', 'Failed', 
                CONCAT('Failed transfer of $', p_amount, ' from account #', p_from_account, ' due to insufficient funds'));
        
        ROLLBACK;
        SET p_status = 'Error: Insufficient funds';
    END IF;
END //
DELIMITER ;

-- Example usage of the transfer procedure
CALL transfer_funds(1, 3, 1000.00, @transfer_status);
SELECT @transfer_status AS 'Transfer Status';

-- Check account balances after transfer
SELECT account_id, customer_id, account_type, balance 
FROM accounts 
WHERE account_id IN (1, 3);

-- View transaction history
SELECT * FROM transactions ORDER BY transaction_date DESC LIMIT 5;