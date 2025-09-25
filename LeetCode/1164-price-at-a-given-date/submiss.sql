WITH cte AS (
    SELECT DISTINCT ON (product_id) product_id, change_date, new_price
    FROM Products
    WHERE change_date <= '2019-08-16' OR change_date > '2019-08-16'
    ORDER BY product_id, 
    CASE WHEN change_date <= '2019-08-16' THEN 1 ELSE 2 END,
    change_date DESC
)

SELECT product_id,
CASE
    WHEN change_date <= '2019-08-16' THEN new_price
    ELSE 10 END AS price
FROM cte
