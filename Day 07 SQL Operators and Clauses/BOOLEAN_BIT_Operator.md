# BOOLEAN (BIT) Operator
| Sn. No. | Topic Name                                                                                                       |
|---------|------------------------------------------------------------------------------------------------------------------|
| 1       | [SQL - Where Clause](WhereClause.md)                                                                           |
| 2       | [SQL - Top Clause](TopClause.md)                                                                               |
| 3       | [SQL - Distinct Clause](DistinctClause.md)                                                                     |
| 4       | [SQL - Group By Clause](GroupByClause.md)                                                                     |
| 5       | [SQL - Having Clause](HavingClause.md)                                                                         |
| 6       | [SQL - AND & OR](AND_OR.md)                                                                                   |
| 7       | [SQL - BOOLEAN (BIT) Operator](BOOLEAN_BIT_Operator.md)                                                         |
| 8       | [SQL - LIKE Operator](LIKEOperator.md)                                                                         |
| 9      | [SQL - IN Operator](INOperator.md)                                                                             |
| 10      | [SQL - ANY, ALL Operators](ANYALLOperators.md)                                                                 |
| 11      | [SQL - EXISTS Operator](EXISTSOperator.md)                                                                     |
| 12      | [SQL - CASE](CASE.md)                                                                                         |
| 13      | [SQL - NOT Operator](NOTOperator.md)                                                                           |
| 14      | [SQL - NOT EQUAL](NOTEQUAL.md)                                                                                |
| 15      | [SQL - IS NOT NULL and NULL](null_not_null.md)                                                                |
| 16      | [SQL - UNION And UNION ALL](UNION_UNIONALL.md)                                                                |
| 17      | [SQL - INTERSECT Operator](INTERSECT_EXCEPT_Operator.md)                                                         |
| 18      | [SQL - Aliases](Aliases.md)                                                                                  |

--------

In SQL, BOOLEAN (BIT) operators are used to perform logical operations on boolean values, which are typically represented as 1 (true) or 0 (false) in SQL databases. These operators allow you to combine, negate, or compare boolean expressions. Let's explore BOOLEAN (BIT) operators with examples:

Suppose we have a hypothetical database with a table named "Tasks" that contains information about tasks assigned to employees. Each task has a status represented as a BOOLEAN (BIT) value (1 for completed, 0 for not completed). Here's the table structure:

```sql
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY,
    TaskName VARCHAR(100),
    AssignedTo VARCHAR(50),
    Status BIT
);
```

Now, let's populate the table with some sample data:

```sql
INSERT INTO Tasks (TaskID, TaskName, AssignedTo, Status)
VALUES
    (1, 'Task 1', 'Pankaj', 1),
    (2, 'Task 2', 'Nishant', 0),
    (3, 'Task 3', 'Kiran', 1),
    (4, 'Task 4', 'Tanvi', 0),
    (5, 'Task 5', 'Kritek', 1);
```

Now, let's explore how BOOLEAN (BIT) operators can be used to perform logical operations:

1. Using the NOT operator:
   Retrieve tasks that are not completed (Status = 0):

   ```sql
   SELECT * FROM Tasks
   WHERE NOT Status = 1;
   ```

   Result:
   ```
   | TaskID | TaskName | AssignedTo | Status |
   |--------|----------|------------|--------|
   | 2      | Task 2   | Nishant    | 0      |
   | 4      | Task 4   | Tanvi      | 0      |
   ```

   The NOT operator is used to negate the condition, so it selects tasks where the Status is not equal to 1 (not completed).

2. Using the AND operator:
   Retrieve tasks that are assigned to 'Pankaj' and are completed:

   ```sql
   SELECT * FROM Tasks
   WHERE AssignedTo = 'Pankaj' AND Status = 1;
   ```

   Result:
   ```
   | TaskID | TaskName | AssignedTo | Status |
   |--------|----------|------------|--------|
   | 1      | Task 1   | Pankaj     | 1      |
   ```

   The AND operator is used to combine two conditions: tasks must be assigned to 'Pankaj' (AssignedTo = 'Pankaj') and have a Status of 1 (completed).

3. Using the OR operator:
   Retrieve tasks that are either assigned to 'Kiran' or are not completed:

   ```sql
   SELECT * FROM Tasks
   WHERE AssignedTo = 'Kiran' OR NOT Status = 1;
   ```

   Result:
   ```
   | TaskID | TaskName | AssignedTo | Status |
   |--------|----------|------------|--------|
   | 2      | Task 2   | Nishant    | 0      |
   | 3      | Task 3   | Kiran      | 1      |
   | 4      | Task 4   | Tanvi      | 0      |
   | 5      | Task 5   | Kritek     | 1      |
   ```

   The OR operator is used to combine two conditions: tasks must be either assigned to 'Kiran' (AssignedTo = 'Kiran') or not completed (Status = 0).

BOOLEAN (BIT) operators allow you to perform logical operations on boolean values in SQL, enabling you to filter and select data based on complex boolean expressions.
