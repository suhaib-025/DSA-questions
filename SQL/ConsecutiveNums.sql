-- Problem

-- Given a Logs table, find all numbers that appear
-- at least three times consecutively.
--
-- Return each qualifying number only once.



-- Concepts Learned

-- 1. Self Join
-- 2. INNER JOIN
-- 3. Table Aliases
-- 4. DISTINCT
-- 5. Comparing Consecutive Rows



-- Solution

SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
INNER JOIN Logs l2
    ON l2.id = l1.id + 1
   AND l2.num = l1.num
INNER JOIN Logs l3
    ON l3.id = l1.id + 2
   AND l3.num = l1.num;



-- Explanation

-- We compare each row with the next two rows.
--
-- If:
-- 1. The ids are consecutive.
-- 2. All three rows contain the same number.
--
-- Then that number appears three consecutive times.
--
-- DISTINCT removes duplicate outputs when a number
-- appears more than three consecutive times.



-- Concept 1 : Self Join

-- A Self Join joins a table with itself.

-- We create three logical copies of the Logs table.

-- l1 -> Current Row
-- l2 -> Next Row
-- l3 -> Next Next Row

-- This allows us to compare rows within the same table.



-- Concept 2 : INNER JOIN

-- INNER JOIN returns only matching rows.

-- Join Conditions

-- l2.id = l1.id + 1
-- l3.id = l1.id + 2

-- l2.num = l1.num
-- l3.num = l1.num

-- If any condition fails,
-- that row is excluded from the result.

-- INNER JOIN is preferred because:
-- 1. It clearly expresses relationships.
-- 2. It is easier to read and maintain.
-- 3. It avoids accidental Cartesian Products.



-- Concept 3 : DISTINCT

-- Consider

-- id  num
-- 1   1
-- 2   1
-- 3   1
-- 4   1

-- The joins produce

-- l1.id = 1
-- l1.id = 2

-- Both satisfy the condition.

-- SELECT l1.num

-- Output

-- 1
-- 1

-- Using DISTINCT

-- SELECT DISTINCT l1.num

-- Output

-- 1

-- DISTINCT removes duplicate numbers from the result.



-- Time Complexity

-- O(n)

-- Assuming id is indexed (Primary Key),
-- each join performs indexed lookups for id + 1 and id + 2.

-- Without indexing, the worst-case complexity can approach O(n²).



-- Space Complexity

-- O(1)

-- Ignoring the output table.