-- Problem

-- Given the Employee and Department tables,
-- find employees whose salary is among the
-- top 3 unique salaries in their department.

-- If multiple employees have the same salary,
-- they should receive the same rank and all
-- should be included.



-- Concepts Learned

-- 1. Correlated Subquery
-- 2. COUNT(DISTINCT)
-- 3. Dense Ranking
-- 4. INNER JOIN
-- 5. Department-wise Ranking Pattern



-- Solution

SELECT
    d.name AS Department,
    e1.name AS Employee,
    e1.salary AS Salary
FROM Employee e1

JOIN Department d
    ON e1.departmentId = d.id

WHERE (
    SELECT COUNT(DISTINCT e2.salary)
    FROM Employee e2
    WHERE e2.departmentId = e1.departmentId
      AND e2.salary > e1.salary
) < 3;



-- Explanation

-- Step 1:
-- For every employee (e1),
-- compare them with all other employees (e2)
-- in the same department.

-- Step 2:
-- Count the number of DISTINCT salaries
-- that are higher than the current employee's salary.

-- Step 3:
-- If fewer than 3 unique salaries are higher,
-- then the employee belongs to the top
-- 3 unique salaries of that department.

-- Step 4:
-- Join with the Department table
-- to display the department name.



-- Concept 1 : Correlated Subquery

-- A correlated subquery is executed
-- once for every row in the outer query.

-- Here,

-- e1 = Current Employee

-- e2 = Employees being compared

-- The subquery depends on e1,
-- therefore it is called a
-- correlated subquery.



-- Concept 2 : COUNT(DISTINCT)

-- COUNT(DISTINCT salary)

-- counts only unique salaries.

-- Example

-- Salaries

-- 90000
-- 85000
-- 85000
-- 70000

-- COUNT(DISTINCT)

-- = 3

-- This avoids counting duplicate salaries
-- multiple times.



-- Concept 3 : Dense Ranking

-- Rank is calculated indirectly.

-- Formula

-- Rank = COUNT(DISTINCT Higher Salaries) + 1

-- Example

-- Salary      Higher Distinct Salaries     Rank

-- 90000                0                    1

-- 85000                1                    2

-- 85000                1                    2

-- 70000                2                    3

-- 69000                3                    4

-- Since the query keeps

-- COUNT(DISTINCT Higher Salaries) < 3

-- it returns

-- Rank 1
-- Rank 2
-- Rank 3



-- Concept 4 : INNER JOIN

-- Employee and Department
-- are joined using

-- e1.departmentId = d.id

-- This retrieves the department name
-- for each employee.



-- Concept 5 : Department-wise Ranking Pattern

-- Employees should not compete
-- with employees from other departments.

-- Therefore,

-- e2.departmentId = e1.departmentId

-- ensures ranking happens only
-- within the same department.

-- Example

-- IT Department

-- Max      90000
-- Joe      85000
-- Randy    85000
-- Will     70000
-- Janet    69000

----------------------------

-- Sales Department

-- Henry    80000
-- Sam      60000

-- IT salaries never affect
-- Sales rankings and vice versa.



-- Pattern Recognition

-- When you see problems like

-- Top N salaries per department
-- Top N marks per class
-- Top N products per category
-- Top N orders per customer

-- Think

-- Correlated Subquery
--         ↓
-- COUNT(DISTINCT)
--         ↓
-- Dense Rank
--         ↓
-- Filter Rank <= N



-- Time Complexity

-- O(n²)

-- The correlated subquery executes
-- once for each employee.

-- (Modern database optimizers and indexes
-- may improve practical performance.)



-- Space Complexity

-- O(1)

-- Ignoring the output table.