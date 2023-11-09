-- 3.15 LAB - Select tall horses with subquery

-- The Horse table has the following columns:

-- ID - integer, primary key
-- RegisteredName - variable-length string
-- Breed - variable-length string
-- Height - decimal number
-- BirthDate - date

-- Write a SELECT statement to select the registered name and height for only horses that have an above average height. Order the results by height (ascending).

-- Hint: Use a subquery to find the average height.

-- Your SQL statements go here 
SELECT RegisteredName, Height
FROM Horse
WHERE Height > 
   (SELECT AVG(Height)
   FROM Horse)
ORDER BY Height
