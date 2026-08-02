-- Problem

-- Given an Employee table, find all employees whose
-- salary is greater than their manager's salary.

-- Return only the employee names.



-- Concepts Learned

-- 1. Self Join
-- 2. INNER JOIN
-- 3. Table Aliases
-- 4. Self Referencing Relationship



-- Solution

SELECT
    e.name AS Employee
FROM Employee e
INNER JOIN Employee m
    ON e.managerId = m.id
WHERE e.salary > m.salary;



-- Explanation

-- Every manager is also an employee.
-- Therefore, we join the Employee table with itself.

-- e represents the employee.
-- m represents the manager.

-- The join matches an employee's managerId
-- with the manager's id.

-- After joining,
-- compare employee salary with manager salary.

-- If employee salary is greater,
-- return the employee name.



-- Concept 1 : Self Join

-- A Self Join joins a table with itself.

-- Employee Table

-- Employee (e)
-- Manager  (m)

-- Both aliases refer to the same table,
-- but represent different roles.



-- Concept 2 : INNER JOIN

-- Join Condition

-- e.managerId = m.id

-- Example

-- Employee

-- id = 1
-- name = Joe
-- salary = 70000
-- managerId = 3

-- Manager

-- id = 3
-- name = Sam
-- salary = 60000

-- INNER JOIN connects

-- Joe -----> Sam

-- allowing us to compare their salaries.



-- Concept 3 : Table Aliases

-- e -> Employee
-- m -> Manager

-- Aliases make it possible to reference
-- the same table multiple times.

-- Example

-- e.salary
-- m.salary

-- These refer to different rows
-- from the same table.



-- Concept 4 : Self Referencing Relationship

-- managerId is a Foreign Key
-- that references id in the same table.

-- Employee

-- id
-- managerId

-- Example

-- Joe

-- id = 1
-- managerId = 3

-- This means

-- Joe's manager is the employee
-- whose id = 3.

-- This type of relationship is called
-- a Self Referencing Relationship.



-- Time Complexity

-- O(n)

-- Since id is the Primary Key,
-- the join uses indexed lookups.



-- Space Complexity

-- O(1)

-- Ignoring the output table.