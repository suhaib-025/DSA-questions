-- ============================================================================
-- Problem
-- ============================================================================
-- LeetCode 176 - Second Highest Salary
-- Difficulty: Easy
--
-- Find the second highest DISTINCT salary from the Employee table.
-- If there is no second highest salary, return NULL.

-- ============================================================================
-- Concepts Learned
-- ============================================================================
-- 1. DISTINCT
-- 2. ORDER BY
-- 3. LIMIT & OFFSET
-- 4. Scalar Subquery
-- 5. IFNULL / COALESCE

-- ============================================================================
-- Solution
-- ============================================================================

SELECT
    (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1
    ) AS SecondHighestSalary;

/* 
Second Type of Solutoion
SELECT MAX(salary)
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);
--- For 3rd Largest Salary
    SELECT MAX(salary)
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
    WHERE salary < (
        SELECT MAX(salary)
        FROM Employee
    )
);
->  SELECT MAX(salary)
FROM Employee;    return 500

-> SELECT MAX(salary)
FROM Employee
WHERE salary < 500;

400
300
200
100

MAX() returns:

400

-> SELECT MAX(salary)
FROM Employee
WHERE salary < 400;

Remaining salaries:

300
200
100

MAX() returns:

300

 */



/* 
3. LIMIT 1 OFFSET 1
   OFFSET 1 skips the highest salary.
   LIMIT 1 returns the next salary.

   Result:
   200

4. If no second salary exists,
   the scalar subquery returns NULL,
   which matches the expected output.
   */