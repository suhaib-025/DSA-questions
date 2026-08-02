-- Problem

-- Given Customers and Orders tables,
-- find all customers who never placed an order.

-- Return only the customer names.



-- Concepts Learned

-- 1. LEFT JOIN
-- 2. NULL Handling
-- 3. Foreign Key Relationship
-- 4. LEFT JOIN vs INNER JOIN



-- Solution

SELECT
    c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
    ON c.id = o.customerId
WHERE o.id IS NULL;



-- Explanation

-- Customers is the primary table because
-- we want every customer to appear.

-- LEFT JOIN keeps all customers.

-- If a customer has not placed an order,
-- SQL fills every column from the Orders table
-- with NULL.

-- Therefore,
-- checking o.id IS NULL identifies customers
-- who have never ordered.



-- Concept 1 : LEFT JOIN

-- LEFT JOIN returns

-- All rows from the LEFT table
-- +
-- Matching rows from the RIGHT table.

-- If no match exists,
-- columns from the right table become NULL.

-- Example

-- Customers

-- Joe
-- Henry
-- Sam
-- Max

-- Orders

-- Joe
-- Sam

-- Result

-- Joe     Order Exists
-- Henry   NULL
-- Sam     Order Exists
-- Max     NULL



-- Concept 2 : NULL Handling

-- After a LEFT JOIN,
-- unmatched rows have NULL values
-- in every column of the right table.

-- Example

-- Customer     Order ID

-- Joe          2
-- Henry        NULL
-- Sam          1
-- Max          NULL

-- Therefore

-- WHERE o.id IS NULL

-- returns

-- Henry
-- Max

-- Note:
-- Checking o.customerId IS NULL also works
-- because it belongs to the Orders table.
-- However, checking the primary key (o.id)
-- is the standard and preferred approach.



-- Concept 3 : Foreign Key Relationship

-- Customers

-- id (Primary Key)

----------------------------

-- Orders

-- customerId (Foreign Key)

-- Join Condition

-- c.id = o.customerId

-- The foreign key connects each order
-- to its corresponding customer.



-- Concept 4 : LEFT JOIN vs INNER JOIN

-- INNER JOIN

-- Returns only matching rows.

-- Customers

-- Joe
-- Sam

------------------------------------------------

-- LEFT JOIN

-- Returns every customer.

-- Customers

-- Joe
-- Henry
-- Sam
-- Max

------------------------------------------------

-- Rule of Thumb

-- Need every row from the left table?
-- -> LEFT JOIN

-- Need only matching rows?
-- -> INNER JOIN



-- Time Complexity

-- O(n)

-- Assuming Customers.id and Orders.customerId
-- are indexed, the join performs efficient lookups.



-- Space Complexity

-- O(1)

-- Ignoring the output table.