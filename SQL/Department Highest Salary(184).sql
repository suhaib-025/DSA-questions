-- Problem

-- Given the Employee and Department tables,
-- find the employee(s) who have the highest salary
-- in each department.

-- If multiple employees share the highest salary
-- in a department, return all of them.



-- Concepts Learned

-- 1. GROUP BY
-- 2. Aggregate Function (MAX)
-- 3. Derived Table (Subquery in FROM)
-- 4. INNER JOIN
-- 5. Aggregate + Join Back Pattern



-- Solution

SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e

JOIN (
    SELECT
        departmentId,
        MAX(salary) AS maxSalary
    FROM Employee
    GROUP BY departmentId
) AS m
ON e.departmentId = m.departmentId
AND e.salary = m.maxSalary

JOIN Department d
ON e.departmentId = d.id;



-- Explanation

-- Step 1:
-- Find the maximum salary for every department.

-- Step 2:
-- Join the result back with the Employee table.

-- Match both:
-- 1. Department
-- 2. Maximum Salary

-- This returns every employee who earns
-- the highest salary in that department.

-- Step 3:
-- Join with the Department table
-- to retrieve the department name.



-- Concept 1 : GROUP BY

-- GROUP BY divides employees
-- according to department.

-- Example

-- IT

-- Joe     70000
-- Jim     90000
-- Max     90000

-------------------------

-- Sales

-- Henry   80000
-- Sam     60000



-- Concept 2 : Aggregate Function (MAX)

-- MAX(salary) returns the highest salary
-- inside each department.

-- Result

-- departmentId     maxSalary

--      1             90000
--      2             80000

-- Notice that this tells us only the salary,
-- not the employee's name.



-- Concept 3 : Derived Table

-- The GROUP BY query becomes
-- a temporary table.

-- Example

-- SELECT
--     departmentId,
--     MAX(salary) AS maxSalary
-- FROM Employee
-- GROUP BY departmentId

-- Temporary Table (m)

-- departmentId     maxSalary

--      1             90000
--      2             80000



-- Concept 4 : INNER JOIN

-- Join Employee with the temporary table.

-- Join Conditions

-- e.departmentId = m.departmentId
-- AND
-- e.salary = m.maxSalary

-- This removes employees who do not
-- earn the highest salary.

-- Result

-- Jim      90000
-- Max      90000
-- Henry    80000



-- Concept 5 : Aggregate + Join Back Pattern

-- Sometimes an aggregate function
-- loses row-level information.

-- Example

-- MAX(salary)

-- tells us

-- 90000

-- but not

-- Jim
-- Max

-- Therefore,

-- Step 1

-- GROUP BY
-- MAX()

-- Step 2

-- Join back to the original table
-- using the grouped column and
-- the aggregate value.

-- This restores the employee details.



-- Pattern Recognition

-- When you see problems like:

-- Highest salary per department
-- Lowest price per category
-- Latest order per customer
-- Most expensive product per brand

-- Think

-- GROUP BY
--        ↓
-- Aggregate Function
--        ↓
-- Derived Table
--        ↓
-- INNER JOIN back to original table



-- Time Complexity

-- O(n)

-- One scan to compute the maximum salary
-- per department and another join with
-- the Employee table.

-- (Assuming proper indexing.)



-- Space Complexity

-- O(d)

-- Where d is the number of departments.

-- Extra space is used for the derived table
-- storing one row per department.