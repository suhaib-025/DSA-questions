-- ============================================================================
-- LeetCode 175: Combine Two Tables
-- Difficulty : Easy
-- Concepts   :
--   1. LEFT JOIN
--   2. Table Aliases
--   3. ON vs WHERE
-- ============================================================================

/*
Problem:
Return the first name, last name, city, and state of every person.
If a person doesn't have an address, city and state should be NULL.
*/

SELECT
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person AS p
LEFT JOIN Address AS a
ON p.personId = a.personId;

-- =============================================================================
-- Explanation:

/* Left Join: We used this because we wanted all the records from the LEFT table (person)
and only the matching records from the RIGHT table (address). It doesn't matter if there
are records for personID in the address table ot not. The LEFT JOIN will impose all the 
left table records on the address table and return NULL if not match is found. */

-- ============================================================================
-- Time Complexity

/*
Time Complexity:
O(n + m)
where

n = rows in Person
m = rows in Address

(assuming personId is indexed)

Space Complexity:
O(1)
*/