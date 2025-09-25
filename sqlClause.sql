USE MyDatabase;
-- Retrieve all customer Data
/*
SELECT *
FROM dbo.customers
*/

-- Retrieve all the order data
/*
SELECT *
FROM orders
*/

-- Retrieve all customer's names, country, score
/*
SELECT first_name,country,score
FROM dbo.customers
*/

-- Retrieve customers with a score not equal to zero
/*
SELECT *
FROM customers
WHERE score != 0
*/

-- Retrieve customers from Germany
/*
SELECT *
FROM customers
WHERE country = 'Germany'
*/

-- Retrieve all customers and sort the results by the highest score first
/*
SELECT *
FROM customers
ORDER BY score DESC
*/

-- Retrieve all customers and sort the results by the lowest score first
/*
SELECT *
FROM customers
ORDER BY score ASC
*/

-- Retrieve all customers and sort the results by the country and then by the highest score
/*
SELECT *
FROM customers
ORDER BY country ASC, score DESC
*/

-- Find the total score for each country
/*
SELECT country, SUM(score) AS total_score
FROM customers
GROUP BY country
*/
--Find the total score and total number of customers for each country
/*
SELECT country, SUM(score) AS total_score, COUNT(id) AS total_customers
FROM customers
GROUP BY country
*/

-- Find the average score for each country considering only customers with a score not equal to 0
-- And return only those countries with an average score greater than 430
/*
SELECT country, AVG(score) AS average_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430
*/
-- Return unique list of all countries
/*
SELECT DISTINCT country
FROM customers
*/

-- Retrieve only 3 customers
/*
SELECT TOP 3 *
FROM customers
*/

-- Retrieve the top 3 customers with the highest score
/*
SELECT TOP 3 *
FROM customers
ORDER BY score DESC
*/

-- Retrieve the lowest 2 customers based on the score
/*
SELECT TOP 2 *
FROM customers
ORDER BY score ASC
*/

-- Retrieve the 2 most recent orders
/*
SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC
*/

-- Create a new table called persons with columns: id, person_name, birth_date, and phone
/*
CREATE TABLE persons (
    id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY (id)

)
*/

-- Add a new column called email to the persons table
/*
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL
*/

-- Remove the phone column from the persons table
/*
ALTER TABLE persons
DROP COLUMN phone
*/

-- Remove the table persons from the database
/*
DROP TABLE persons
*/

-- INSERT
/*
INSERT INTO customers (id, first_name, country, score)
VALUES (6, 'ANNA', 'USA', NULL),
        (7, 'Sam', NULL, 100)

INSERT INTO customers
VALUES (9, 'Andreas', 'Germany', NULL)

INSERT INTO customers (id, first_name)
VALUES (8, 'Sarah')
*/

-- Change the score of customer with id 6 to 0
/*
UPDATE customers
    SET score = 0
WHERE id = 6
*/

-- Change the score of customer with id 10 to 0 and update the country to UK
/*
UPDATE customers
    SET score = 0,
        country = 'UK'
WHERE id = 10
*/

-- Update all customers with a NULL score by setting their score to 0
/*
UPDATE customers
    SET score = 0
WHERE score IS NULL
*/

-- Delete all customers with an ID greater than 5
/*
DELETE FROM customers
WHERE id > 5
*/

-- Retrieve all customers from germany
/*
SELECT *
FROM customers
WHERE country = 'Germany'
*/

-- Retrieve all customers who are not from germany
/*
SELECT *
FROM customers
WHERE country != 'Germany'
*/

-- Retrieve all customers and orders as separate results
/*
SELECT *
FROM customers;
SELECT *
FROM orders;
*/

-- Get all customers along with their orders, but only for customers who have placed an order
/*
SELECT *
FROM customers
INNER JOIN orders
ON id = customer_id
*/

-- Get all customers along with their orders, including those whithout orders
/*
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
*/

-- Get all customers along with their orders, including those whithout matching customers
/*
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
*/

-- Get all customers and all orders, even if there's no match
/*
SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
*/

-- Get all customers who haven't placed any orders
/*
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL
*/

-- Get all orders without matching customers
/*
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL
*/

-- Find customers without orders and orders without customers
/*
SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL
*/

-- Get all customers along with their orders but only for customers who have placed an order (Without using INNER JOIN)
SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NOT NULL AND o.customer_id IS NOT NULL
















