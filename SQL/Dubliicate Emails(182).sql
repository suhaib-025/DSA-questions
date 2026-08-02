-- Problem

-- Given a Person table, report all duplicate emails.
-- An email is considered duplicate if it appears
-- more than once in the table.

-- Return each duplicate email only once.



-- Concepts Learned

-- 1. GROUP BY
-- 2. COUNT()
-- 3. HAVING
-- 4. WHERE vs HAVING



-- Solution

SELECT
    email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;



-- Explanation

-- GROUP BY creates one group for each unique email.
--
-- COUNT(*) counts the number of rows in each group.
--
-- HAVING filters only those groups whose count
-- is greater than 1.
--
-- The remaining groups represent duplicate emails.



-- Concept 1 : GROUP BY

-- GROUP BY groups rows having the same value.

-- Example

-- Person Table

-- a@b.com
-- c@d.com
-- a@b.com
-- d@e.com
-- a@b.com

-- After GROUP BY

-- a@b.com

--     a@b.com
--     a@b.com
--     a@b.com

-------------------

-- c@d.com

--     c@d.com

-------------------

-- d@e.com

--     d@e.com



-- Concept 2 : COUNT()

-- COUNT(*) counts the number of rows
-- in each group.

-- Example

-- a@b.com -> 3
-- c@d.com -> 1
-- d@e.com -> 1

-- COUNT(*) is preferred over COUNT(email)
-- because it counts rows regardless of columns.

-- In this problem both work because
-- email is guaranteed to be NOT NULL.



-- Concept 3 : HAVING

-- HAVING filters groups after GROUP BY.

-- Example

-- Email      Count

-- a@b.com      3
-- c@d.com      1
-- d@e.com      1

-- HAVING COUNT(*) > 1

-- Result

-- a@b.com



-- Concept 4 : WHERE vs HAVING

-- WHERE

-- Filters rows before GROUP BY.

-- Example

-- SELECT *
-- FROM Employee
-- WHERE salary > 50000;

------------------------------------------------

-- HAVING

-- Filters groups after GROUP BY.

-- Example

-- SELECT department,
--        COUNT(*)
-- FROM Employee
-- GROUP BY department
-- HAVING COUNT(*) > 10;

------------------------------------------------

-- Execution Order

-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY



-- Time Complexity

-- O(n)

-- SQL scans the table once and groups
-- identical email addresses.



-- Space Complexity

-- O(n)

-- Additional space is required to maintain
-- the grouped email counts.