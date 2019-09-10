-- Queries --------------------------------                
-- What items were purchased more than once

SELECT item_name, COUNT(*) FROM Item NATURAL JOIN Orders GROUP BY user_id HAVING COUNT(*) > 1;


-- What is the most popular shoe size?
-- Left off at trying to figure out how to account for ties when finding maximum count.
SELECT Shoe_Size
FROM Shoes 
NATURAL JOIN Portfolio
GROUP BY Shoe_Size
ORDER BY COUNT(*) DESC
LIMIT 1;

-- the most common item group


SELECT 
    'Shoes' tablename, 
     COUNT(*)
FROM
    Shoes 
UNION 
SELECT 
    'Handbags' tablename, 
     COUNT(*) 
FROM
    Handbags
UNION 
SELECT 
    'Watches' tablename, 
     COUNT(*) 
FROM
    Watches
UNION 
SELECT 
    'Streetwear' tablename, 
     COUNT(*) 
FROM
    Streetwear
LIMIT 1;
