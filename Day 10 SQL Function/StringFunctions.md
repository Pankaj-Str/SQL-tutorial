# String Functions

# Functions Documentation

## Table of Contents
| Sn. No | Topic Name                 |
|--------|----------------------------|
| 1      | [Aggregate Functions](AggregateFunctions.md)     |
| 2      | [Date and Time Functions](Date_TimeFunctions.md)  |
| 3      | [Scalar Functions](ScalarFunctions.md)            |
| 4      | [String Functions](StringFunctions.md)            |
| 5      | [User-Defined Functions](User-DefinedFunctions.md)|


**Introduction:**
Introduce the importance of string functions in SQL and how they can be used to manipulate, analyze, and extract valuable information from textual data stored in databases.

**What are String Functions?**
Briefly explain what string functions are and how they are used to perform various operations on strings, such as concatenation, substring extraction, case conversion, and pattern matching.

**Commonly Used String Functions:**


```sql
-- Create the database
CREATE DATABASE IF NOT EXISTS p4n;

-- Use the database
USE p4n;

-- Create the table
CREATE TABLE IF NOT EXISTS p4n_employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_join DATE,
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    email VARCHAR(100),
    city VARCHAR(50),
    DOB DATE
);

-- Inserting sample data
INSERT INTO p4n_employee (first_name, last_name, date_of_join, department, salary, email, city, DOB) VALUES
('Khari', 'Sharma', '2023-01-01', 'IT', 50000, 'khari.sharma@codeswithpankaj.com', 'Delhi', '2000-01-01'),
('Naya', 'Joshi', '2023-02-01', 'HR', 45000, 'naya.joshi@codeswithpankaj.com', 'Mumbai', '1999-02-02'),
('Ishaan', 'Patel', '2023-03-01', 'Finance', 55000, 'ishaan.patel@codeswithpankaj.com', 'Ahmedabad', '1998-03-03'),
('Atharv', 'Kumar', '2023-04-01', 'Marketing', 60000, 'atharv.kumar@codeswithpankaj.com', 'Bangalore', '1997-04-04'),
('Kanan', 'Singh', '2023-05-01', 'IT', 52000, 'kanan.singh@codeswithpankaj.com', 'Kolkata', '1996-05-05'),
('Jai', 'Gupta', '2023-06-01', 'HR', 48000, 'jai.gupta@codeswithpankaj.com', 'Chennai', '1995-06-06'),
('Amar', 'Sharma', '2023-07-01', 'Finance', 56000, 'amar.sharma@codeswithpankaj.com', 'Pune', '1994-07-07'),
('Dhruv', 'Yadav', '2023-08-01', 'Marketing', 61000, 'dhruv.yadav@codeswithpankaj.com', 'Hyderabad', '1993-08-08'),
('Aarna', 'Shah', '2023-09-01', 'IT', 53000, 'aarna.shah@codeswithpankaj.com', 'Jaipur', '1992-09-09'),
('Agastya', 'Verma', '2023-10-01', 'HR', 49000, 'agastya.verma@codeswithpankaj.com', 'Lucknow', '1991-10-10'),
('Reyansh', 'Gupta', '2023-11-01', 'Finance', 57000, 'reyansh.gupta@codeswithpankaj.com', 'Chandigarh', '1990-11-11'),
('Tenzin', 'Singh', '2023-12-01', 'Marketing', 62000, 'tenzin.singh@codeswithpankaj.com', 'Nagpur', '1989-12-12'),
('Jiya', 'Sharma', '2024-01-01', 'IT', 54000, 'jiya.sharma@codeswithpankaj.com', 'Indore', '1988-01-13'),
('Nila', 'Yadav', '2024-02-01', 'HR', 50000, 'nila.yadav@codeswithpankaj.com', 'Surat', '1987-02-14'),
('Indi', 'Joshi', '2024-03-01', 'Finance', 58000, 'indi.joshi@codeswithpankaj.com', 'Agra', '1986-03-15'),
('Sahana', 'Kumar', '2024-04-01', 'Marketing', 63000, 'sahana.kumar@codeswithpankaj.com', 'Varanasi', '1985-04-16'),
('Ambar', 'Shah', '2024-05-01', 'IT', 55000, 'ambar.shah@codeswithpankaj.com', 'Coimbatore', '1984-05-17'),
('Ansh', 'Verma', '2024-06-01', 'HR', 51000, 'ansh.verma@codeswithpankaj.com', 'Patna', '1983-06-18'),
('Anjali', 'Gupta', '2024-07-01', 'Finance', 59000, 'anjali.gupta@codeswithpankaj.com', 'Ranchi', '1982-07-19'),
('Ahana', 'Singh', '2024-08-01', 'Marketing', 64000, 'ahana.singh@codeswithpankaj.com', 'Gurgaon', '1981-08-20'),
('Neelam', 'Sharma', '2024-09-01', 'IT', 56000, 'neelam.sharma@codeswithpankaj.com', 'Goa', '1980-09-21'),
('Pankaj', 'Yadav', '2024-10-01', 'HR', 52000, 'pankaj.yadav@codeswithpankaj.com', 'Bhopal', '1979-10-22'),
('Nishant', 'Joshi', '2024-11-01', 'Finance', 60000, 'nishant.joshi@codeswithpankaj.com', 'Dehradun', '1978-11-23');
```


1. **CONCAT**: This function is used to concatenate two or more strings together.
   
   Example:
   ```sql
   SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM p4n_employee;
   ```
   Output:
   ```
   +-------------------+
   | full_name         |
   +-------------------+
   | Khari Sharma      |
   | Naya Joshi        |
   | Ishaan Patel      |
   | Atharv Kumar      |
   | Kanan Singh       |
   | Jai Gupta         |
   | Amar Sharma       |
   | Dhruv Yadav       |
   | Aarna Shah        |
   | Agastya Verma     |
   | Reyansh Gupta     |
   | Tenzin Singh      |
   | Jiya Sharma       |
   | Nila Yadav        |
   | Indi Joshi        |
   | Sahana Kumar      |
   | Ambar Shah        |
   | Ansh Verma        |
   | Anjali Gupta      |
   | Ahana Singh       |
   | Neelam Sharma     |
   | Pankaj Yadav      |
   | Nishant Joshi     |
   +-------------------+
   ```

2. **SUBSTRING**: This function is used to extract a substring from a string.
   
   Example:
   ```sql
   SELECT SUBSTRING(email, 1, CHARINDEX('@', email) - 1) AS username FROM p4n_employee;
   ```
   Output:
   ```
   +---------------+
   | username      |
   +---------------+
   | khari.sharma  |
   | naya.joshi    |
   | ishaan.patel  |
   | atharv.kumar  |
   | kanan.singh   |
   | jai.gupta     |
   | amar.sharma   |
   | dhruv.yadav   |
   | aarna.shah    |
   | agastya.verma |
   | reyansh.gupta |
   | tenzin.singh  |
   | jiya.sharma   |
   | nila.yadav    |
   | indi.joshi    |
   | sahana.kumar  |
   | ambar.shah    |
   | ansh.verma    |
   | anjali.gupta  |
   | ahana.singh   |
   | neelam.sharma |
   | pankaj.yadav  |
   | nishant.joshi |
   +---------------+
   ```

3. **UPPER**: This function is used to convert a string to uppercase.
   
   Example:
   ```sql
   SELECT UPPER(city) AS city_uppercase FROM p4n_employee;
   ```
   Output:
   ```
   +-----------------+
   | city_uppercase  |
   +-----------------+
   | DELHI           |
   | MUMBAI          |
   | AHMEDABAD       |
   | BANGALORE       |
   | KOLKATA         |
   | CHENNAI         |
   | PUNE            |
   | HYDERABAD       |
   | JAIPUR          |
   | LUCKNOW         |
   | CHANDIGARH      |
   | NAGPUR          |
   | INDORE          |
   | SURAT           |
   | AGRA            |
   | VARANASI        |
   | COIMBATORE      |
   | PATNA           |
   | RANCHI          |
   | GURGAON         |
   | GOA             |
   | BHOPAL          |
   | DEHRADUN        |
   +-----------------+
   ```

4. **LOWER**: This function is used to convert a string to lowercase.
   
   Example:
   ```sql
   SELECT LOWER(city) AS city_lowercase FROM p4n_employee;
   ```
   Output:
   ```
   +-----------------+
   | city_lowercase  |
   +-----------------+
   | delhi           |
   | mumbai          |
   | ahmedabad       |
   | bangalore       |
   | kolkata         |
   | chennai         |
   | pune            |
   | hyderabad       |
   | jaipur          |
   | lucknow         |
   | chandigarh      |
   | nagpur          |
   | indore          |
   | surat           |
   | agra            |
   | varanasi        |
   | coimbatore      |
   | patna           |
   | ranchi          |
   | gurgaon         |
   | goa             |
   | bhopal          |
   | dehradun        |
   +-----------------+
   ```

5. **LEFT**: This function is used to extract a specified number of characters from the left side of a string.
   
   Example:
   ```sql
   SELECT LEFT(first_name, 3) AS first_name_short FROM p4n_employee;
   ```
   Output:
   ```
   +----------------+
   | first_name_short|
   +----------------+
   | Kha            |
   | Nay            |
   | Ish            |
   | Ath            |
   | Kan            |
   | Jai            |
   | Ama            |
   | Dhr            |
   | Aar            |
   | Aga            |
   | Rey            |
   | Ten            |
   | Jiy            |
   | Nil            |
   | Ind            |
   | Sah            |
   | Amb            |
   | Ans            |
   | Anj            |
   | Aha            |
   | Nee            |
   | Pan            |
   | Nis            |
   +----------------+
   ```

6. **RIGHT**: This function is used to extract a specified number of characters from the right side of a string.
   
   Example:
   ```sql
   SELECT RIGHT(last_name, 3) AS last_name_short FROM p4n_employee;
   ```
   Output:
   ```
   +----------------+
   | last_name_short|
   +----------------+
   | rma            |
   | shi            |
   | tel            |
   | mar            |
   | ngh            |
   | pta            |
   | rma            |
   | vad            |
   | hah            |
   | rma            |
   | pta            |
   | ngh            |
   | rma            |
   | vad            |
   | shi            |
   | mar            |
   | hah            |
   | rma            |
   | lli            |
   | ngh            |
   | ma             |
   | vad            |
   | shi            |
   +----------------+
   ```

7. **LENGTH**: This function is used to get the length of a string.
   
   Example:
   ```sql
   SELECT first_name, LENGTH(first_name) AS name_length FROM p4n_employee;
   ```
   Output:
   ```
   +------------+-------------+
   | first_name | name_length |
   +------------+-------------+
   | Khari      | 5           |
   | Naya       | 4           |
   | Ishaan     | 6           |
   | Atharv     | 6



8. **REPLACE**: This function is used to replace all occurrences of a substring within a string with another substring.
   
   Example:
   ```sql
   SELECT REPLACE(city, 'a', 'X') AS city_replaced FROM p4n_employee;
   ```
   Output:
   ```
   +----------------+
   | city_replaced  |
   +----------------+
   | DelXi          |
   | Mumbai         |
   | XhmXdXbXd     |
   | BengXlore      |
   | KolkXtX       |
   | ChenXi         |
   | Pune           |
   | HyderXbXd     |
   | JXipur         |
   | Lucknow        |
   | ChXndigXrh     |
   | NXXpur         |
   | Indore         |
   | SurXt          |
   | XgrX           |
   | VXRXnXsi       |
   | CoimXbXre      |
   | PXTnX          |
   | RXXnchi        |
   | GurgXon        |
   | GoX            |
   | BhopXl         |
   | DehrXdun       |
   +----------------+
   ```

9. **TRIM**: This function is used to remove leading and trailing spaces from a string.
   
   Example:
   ```sql
   SELECT TRIM(city) AS city_trimmed FROM p4n_employee;
   ```
   Output:
   ```
   +---------------+
   | city_trimmed  |
   +---------------+
   | Delhi         |
   | Mumbai        |
   | Ahmedabad     |
   | Bangalore     |
   | Kolkata       |
   | Chennai       |
   | Pune          |
   | Hyderabad     |
   | Jaipur        |
   | Lucknow       |
   | Chandigarh    |
   | Nagpur        |
   | Indore        |
   | Surat         |
   | Agra          |
   | Varanasi      |
   | Coimbatore    |
   | Patna         |
   | Ranchi        |
   | Gurgaon       |
   | Goa           |
   | Bhopal        |
   | Dehradun      |
   +---------------+
   ```

10. **LTRIM**: This function is used to remove leading spaces from a string.
   
    Example:
    ```sql
    SELECT LTRIM(city) AS city_ltrimmed FROM p4n_employee;
    ```
    Output:
    ```
    +----------------+
    | city_ltrimmed  |
    +----------------+
    | Delhi          |
    | Mumbai         |
    | Ahmedabad      |
    | Bangalore      |
    | Kolkata        |
    | Chennai        |
    | Pune           |
    | Hyderabad      |
    | Jaipur         |
    | Lucknow        |
    | Chandigarh     |
    | Nagpur         |
    | Indore         |
    | Surat          |
    | Agra           |
    | Varanasi       |
    | Coimbatore     |
    | Patna          |
    | Ranchi         |
    | Gurgaon        |
    | Goa            |
    | Bhopal         |
    | Dehradun       |
    +----------------+
    ```

11. **RTRIM**: This function is used to remove trailing spaces from a string.
   
    Example:
    ```sql
    SELECT RTRIM(city) AS city_rtrimmed FROM p4n_employee;
    ```
    Output:
    ```
    +----------------+
    | city_rtrimmed  |
    +----------------+
    | Delhi          |
    | Mumbai         |
    | Ahmedabad      |
    | Bangalore      |
    | Kolkata        |
    | Chennai        |
    | Pune           |
    | Hyderabad      |
    | Jaipur         |
    | Lucknow        |
    | Chandigarh     |
    | Nagpur         |
    | Indore         |
    | Surat          |
    | Agra           |
    | Varanasi       |
    | Coimbatore     |
    | Patna          |
    | Ranchi         |
    | Gurgaon        |
    | Goa            |
    | Bhopal         |
    | Dehradun       |
    +----------------+
    ```


12. **CHARINDEX**: This function is used to find the starting position of a substring within a string.

   Example:
   ```sql
   SELECT CHARINDEX('a', city) AS position_of_a FROM p4n_employee;
   ```
   Output:
   ```
   +----------------+
   | position_of_a  |
   +----------------+
   | 4              |
   | 2              |
   | 2              |
   | 4              |
   | 2              |
   | 3              |
   | NULL           |
   | 3              |
   | NULL           |
   | 4              |
   | 4              |
   | 2              |
   | 3              |
   | 2              |
   | 3              |
   | NULL           |
   | NULL           |
   | NULL           |
   | 3              |
   | 2              |
   | NULL           |
   | NULL           |
   | 2              |
   +----------------+
   ```

13. **REPLICATE**: This function is used to repeat a string a specified number of times.

   Example:
   ```sql
   SELECT REPLICATE('abc', 3) AS repeated_string FROM p4n_employee LIMIT 1;
   ```
   Output:
   ```
   +-----------------+
   | repeated_string |
   +-----------------+
   | abcabcabc       |
   +-----------------+
   ```

14. **SPACE**: This function is used to generate a string consisting of the specified number of spaces.

   Example:
   ```sql
   SELECT SPACE(5) AS spaces FROM p4n_employee LIMIT 1;
   ```
   Output:
   ```
   +--------+
   | spaces |
   +--------+
   |       |
   +--------+
   ```

15. **ASCII**: This function is used to get the ASCII value of the first character in a string.

   Example:
   ```sql
   SELECT ASCII('A') AS ascii_value FROM p4n_employee LIMIT 1;
   ```
   Output:
   ```
   +-------------+
   | ascii_value |
   +-------------+
   | 65          |
   +-------------+
   ```

16. **UNICODE**: This function is used to get the Unicode value of the first character in a string.

   Example:
   ```sql
   SELECT UNICODE('A') AS unicode_value FROM p4n_employee LIMIT 1;
   ```
   Output:
   ```
   +---------------+
   | unicode_value |
   +---------------+
   | 65            |
   +---------------+
   ```

17. **STUFF**: This function is used to delete a specified length of characters from a string and then insert another string at the specified starting point.

   Example:
   ```sql
   SELECT STUFF('abcdef', 3, 2, '123') AS modified_string FROM p4n_employee LIMIT 1;
   ```
   Output:
   ```
   +-----------------+
   | modified_string |
   +-----------------+
   | ab123ef         |
   +-----------------+
   ```

18. **REVERSE**: This function is used to reverse a string.

   Example:
   ```sql
   SELECT REVERSE(city) AS reversed_city FROM p4n_employee LIMIT 1;
   ```
   Output:
   ```
   +----------------+
   | reversed_city  |
   +----------------+
   | ihleD          |
   +----------------+
   ```

19. **FORMAT**: This function is used to format numbers or dates.

   Example:
   ```sql
   SELECT FORMAT(salary, 0) AS formatted_salary FROM p4n_employee LIMIT 1;
   ```
   Output:
   ```
   +-----------------+
   | formatted_salary|
   +-----------------+
   | 50,000          |
   +-----------------+
   ```



