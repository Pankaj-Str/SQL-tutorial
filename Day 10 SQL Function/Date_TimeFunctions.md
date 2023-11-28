# Date and Time Functions

# Functions Documentation

## Table of Contents
| Sn. No | Topic Name                 |
|--------|----------------------------|
| 1      | [Aggregate Functions](AggregateFunctions.md)     |
| 2      | [Date and Time Functions](Date_TimeFunctions.md)  |
| 3      | [Scalar Functions](ScalarFunctions.md)            |
| 4      | [String Functions](StringFunctions.md)            |
| 5      | [User-Defined Functions](User-DefinedFunctions.md)|

***
Date functions using a table that includes date-related information. If you don't have a table with date values, we can create a new one for this example:

```sql
CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(50),
    event_date DATE
);

INSERT INTO events(event_id, event_name, event_date)
VALUES
    (1, 'Meeting', '2023-01-15'),
    (2, 'Conference', '2023-02-20'),
    (3, 'Training', '2023-03-25'),
    (4, 'Workshop', '2023-04-10'),
    (5, 'Seminar', '2023-05-05');
```

Now, let's use some date functions:

1. **CURDATE():**
   - Returns the current date.

   ```sql
   SELECT CURDATE();
   ```

2. **DATEDIFF(date1, date2):**
   - Calculates the difference in days between two dates.

   ```sql
   SELECT event_name, DATEDIFF(event_date, CURDATE()) AS days_until_event FROM events;
   ```

3. **DATE_ADD(date, INTERVAL value unit):**
   - Adds a specific interval to a date.

   ```sql
   SELECT event_name, event_date, DATE_ADD(event_date, INTERVAL 7 DAY) AS new_date FROM events;
   ```

4. **DATE_SUB(date, INTERVAL value unit):**
   - Subtracts a specific interval from a date.

   ```sql
   SELECT event_name, event_date, DATE_SUB(event_date, INTERVAL 3 MONTH) AS new_date FROM events;
   ```

5. **DATE_FORMAT(date, format):**
   - Formats a date as a string according to a specified format.

   ```sql
   SELECT event_name, DATE_FORMAT(event_date, '%Y-%m-%d') AS formatted_date FROM events;
   ```

6. **NOW() and CURTIME():**
   - Returns the current date and time.

   ```sql
   SELECT NOW() AS current_datetime;
   CURTIME() AS current_time;
   ```

These examples illustrate how to use various date functions in MySQL. You can adapt these functions based on your specific date-related requirements.
