# MySQL Transaction

# Complete MySQL transaction example with explanation.

```sql
-- Start a transaction
START TRANSACTION;

-- Try to update two tables as part of a money transfer
UPDATE accounts 
SET balance = balance - 1000 
WHERE account_id = 123;

UPDATE accounts 
SET balance = balance + 1000 
WHERE account_id = 456;

-- Check if the first account has sufficient funds
SELECT @current_balance := balance FROM accounts WHERE account_id = 123;

-- Decide whether to commit or rollback
IF @current_balance >= 0 THEN
    COMMIT;
    SELECT 'Transaction successful' AS message;
ELSE
    ROLLBACK;
    SELECT 'Transaction failed: Insufficient funds' AS message;
END IF;
```

## Key MySQL Transaction Components

MySQL provides several important transaction commands:

1. **START TRANSACTION** or **BEGIN** - Starts a new transaction
2. **COMMIT** - Makes all changes permanent
3. **ROLLBACK** - Undoes all changes since the transaction started
4. **SAVEPOINT** - Creates points within a transaction you can roll back to
5. **SET autocommit** - Controls automatic commit behavior

## Transaction Isolation Levels

MySQL supports four transaction isolation levels:

```sql
-- Set the transaction isolation level
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
```

Available levels:
- **READ UNCOMMITTED** (least strict)
- **READ COMMITTED**
- **REPEATABLE READ** (MySQL default)
- **SERIALIZABLE** (most strict)

## Example with SAVEPOINT

```sql
START TRANSACTION;

INSERT INTO orders (customer_id, order_date, total)
VALUES (101, CURDATE(), 500.00);

-- Store the new order_id
SET @new_order_id = LAST_INSERT_ID();

SAVEPOINT order_created;

-- Add order items
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (@new_order_id, 1001, 2, 250.00);

-- If there's a problem with inventory
-- ROLLBACK TO SAVEPOINT order_created;

COMMIT;
```

## Best Practices

1. Keep transactions as short as possible
2. Don't mix DDL (CREATE/ALTER/DROP) with DML (INSERT/UPDATE/DELETE) in transactions
3. Choose the appropriate isolation level for your needs
4. Handle errors properly to ensure proper rollback
5. Be mindful of locks when running concurrent transactions.