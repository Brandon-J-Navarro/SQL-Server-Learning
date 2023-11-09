-- 3.12 LAB - Select employees and managers with inner join

-- The Employee table has the following columns:
-- ID - integer, primary key
-- FirstName - variable-length string
-- LastName - variable-length string
-- ManagerID - integer

-- Write a SELECT statement to show a list of all employees' first names and their managers' first names. List only employees that have a manager. Order the results by Employee first name. Use aliases to give the result columns distinctly different names, like "Employee" and "Manager".

-- Hint: Join the Employee table to itself using INNER JOIN.

-- Your SELECT statement goes here
SELECT E.FirstName AS Employee, 
      M.FirstName AS Manager
FROM Employee E
INNER JOIN Employee M
ON M.ID = E.ManagerID
ORDER BY E.FirstName;

-- ID	FirstName	LastName	ManagerID
-- 1	David	    Wallace	    null
-- 2	Ryan	    Howard	    1
-- 3	Michael	    Scott	    2
-- 4	Dwight	    Schrute	    3
-- 5	Jim	        Halpert	    3
-- 6	Pam	        Beesly	    3
-- 7	Andy	    Bernard	    5
-- 8	Phyllis	    Lapin	    7
-- 9	Stanley	    Hudson	    7
-- 10	Angela	    Martin	    3
-- 11	Kelly	    Kapoor	    3
-- 12	Meredith	Palmer	    3
