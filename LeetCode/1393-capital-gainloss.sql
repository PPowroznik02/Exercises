WITH cte AS
(
    SELECT stock_name, operation, operation_day, 
    (CASE WHEN operation = 'Buy' THEN 0 - price WHEN operation = 'Sell' THEN price END) AS new_price
    FROM Stocks
)

SELECT stock_name, SUM(new_price) AS capital_gain_loss FROM cte
GROUP BY stock_name