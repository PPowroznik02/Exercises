SELECT name 
FROM SalesPerson
WHERE sales_id NOT IN 
(
    SELECT s.sales_id
    FROM SalesPerson s
    LEFT JOIN Orders o ON s.sales_id = o.sales_id
    JOIN Company c ON o.com_id = c.com_id
    WHERE c.name = 'RED'
)