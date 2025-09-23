SELECT Prices.product_id, COALESCE(ROUND(ROUND(SUM(price * units), 2) / SUM(units), 2), 0) As average_price 
FROM Prices 
LEFT Join UnitsSold ON Prices.product_id = UnitsSold.product_id
AND purchase_date BETWEEN Prices.start_date AND Prices.end_date
GROUP BY Prices.product_id