SELECT min(p.product_name) AS product_name, sum(unit) AS unit
FROM Orders o
JOIN Products p ON p.product_id = o.product_id
WHERE EXTRACT(YEAR FROM order_date) = 2020
AND EXTRACT(MONTH FROM order_date) = 2
GROUP BY o.product_id
HAVING sum(unit) >= 100
