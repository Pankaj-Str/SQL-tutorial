# SQL Joins

SQL JOIN is a database operation used to combine rows from two or more tables based on a related column between them. It allows you to retrieve data from multiple tables in a single query by establishing relationships between the tables. There are several types of JOIN operations in SQL, and here are the most common ones along with their syntax:

1. INNER JOIN:
   - Syntax:
     ```sql
     SELECT columns
     FROM table1
     INNER JOIN table2
     ON table1.column_name = table2.column_name;
     ```
   - Explanation: An INNER JOIN returns only the rows that have matching values in both `table1` and `table2` based on the specified `column_name`. It filters out rows where there is no match, and the result contains only the common data between the two tables.

2. LEFT JOIN (or LEFT OUTER JOIN):
   - Syntax:
     ```sql
     SELECT columns
     FROM table1
     LEFT JOIN table2
     ON table1.column_name = table2.column_name;
     ```
   - Explanation: A LEFT JOIN returns all rows from `table1` and the matching rows from `table2`. If there are no matches in `table2`, NULL values are returned for columns from `table2`.

3. RIGHT JOIN (or RIGHT OUTER JOIN):
   - Syntax:
     ```sql
     SELECT columns
     FROM table1
     RIGHT JOIN table2
     ON table1.column_name = table2.column_name;
     ```
   - Explanation: A RIGHT JOIN is the opposite of a LEFT JOIN. It returns all rows from `table2` and the matching rows from `table1`. If there are no matches in `table1`, NULL values are returned for columns from `table1`.

4. FULL OUTER JOIN:
   - Syntax:
     ```sql
     SELECT columns
     FROM table1
     FULL OUTER JOIN table2
     ON table1.column_name = table2.column_name;
     ```
   - Explanation: A FULL OUTER JOIN returns all rows from both `table1` and `table2`, including matching and non-matching rows. If there are no matches for a row in one table, NULL values are returned for columns from that table.

5. SELF JOIN:
   - Syntax:
     ```sql
     SELECT columns
     FROM table1 AS t1
     JOIN table1 AS t2
     ON t1.column_name = t2.column_name;
     ```
   - Explanation: A SELF JOIN is used to join a table with itself. It's often used to find relationships within a single table, such as hierarchical data or comparing rows within the same table.

These SQL JOIN types provide different ways to combine data from multiple tables based on the relationships between them, allowing you to query and retrieve the information you need.
