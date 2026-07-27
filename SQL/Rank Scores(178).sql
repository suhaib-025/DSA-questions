-- Problem

-- Concepts Learned

-- Solution

-- Explanation

-- Concept 1

-- Concept 2

-- Concept 3

-- Time Complexity

-- Space Complexity

-- Interview Notes

-- Problem

-- Given a Scores table, assign a rank to each score.
-- Higher scores receive better ranks.
-- Equal scores share the same rank.
-- Rankings should have no gaps (Dense Ranking).

-- Concepts Learned

-- 1. Correlated Subqueries
-- 2. Table Aliases
-- 3. COUNT(DISTINCT)
-- 4. Dense Ranking Logic



-- Solution

SELECT
    s1.score,
    (
        SELECT COUNT(DISTINCT s2.score)
        FROM Scores s2
        WHERE s2.score > s1.score
    ) + 1 AS `rank`
FROM Scores s1
ORDER BY s1.score DESC;



-- Explanation

-- For every score in s1,
-- count the number of DISTINCT scores greater than it.
-- Add 1 to that count to obtain the dense rank.



-- Concept 1 : Correlated Subquery

-- The inner query depends on a value from the outer query.

-- Outer Query
-- SELECT s1.score
-- FROM Scores s1

-- Inner Query
-- SELECT COUNT(DISTINCT s2.score)
-- FROM Scores s2
-- WHERE s2.score > s1.score

-- Here, s1.score belongs to the outer query.
-- SQL executes the inner query once for every row of the outer query.



-- Concept 2 : Table Aliases

-- s1 represents the current row.
-- s2 represents another copy of the Scores table used for comparison.

-- FROM Scores s1
-- FROM Scores s2

-- Using aliases allows us to compare rows within the same table.



-- Concept 3 : COUNT(DISTINCT)

-- COUNT(score)
-- Counts all matching rows.

-- COUNT(DISTINCT score)
-- Counts only unique scores.

-- Example

-- Scores greater than 3.65

-- 4.00
-- 4.00
-- 3.85

-- COUNT(score) = 3
-- COUNT(DISTINCT score) = 2

-- DISTINCT is necessary because duplicate scores should
-- receive the same rank.

-- Time Complexity

-- O(n²)

-- For every row,
-- SQL scans the table again inside the correlated subquery.

-- Space Complexity

-- O(1)

-- Ignoring the output table.


-- Interview Notes

-- Dense Rank = Number of DISTINCT higher values + 1.

-- COUNT(DISTINCT) is mandatory because duplicate scores
-- should not increase the rank.

-- In MySQL 8+, DENSE_RANK() is the preferred solution,
-- but this correlated subquery demonstrates the underlying logic.