SELECT CASE WHEN t1.transaction_date IS NOT null THEN t1.transaction_date ELSE t2.transaction_date END AS transaction_date, 
CASE WHEN odd_sum IS NOT null THEN odd_sum ELSE 0 END AS odd_sum,
CASE WHEN even_sum IS NOT null THEN even_sum ELSE 0 END AS even_sum
FROM (
    SELECT transaction_date, SUM(amount) AS even_sum FROM transactions
    WHERE amount % 2 = 0
    GROUP BY transaction_date
) AS t1
FULL OUTER JOIN (
    SELECT transaction_date, SUM(amount) AS odd_sum FROM transactions
    WHERE amount % 2 != 0
    GROUP BY transaction_date
) AS t2 ON t2.transaction_date = t1.transaction_date
ORDER BY transaction_date
