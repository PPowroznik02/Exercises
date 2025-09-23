SELECT customer_id, count(customer_id) as count_no_trans
FROM Visits 
FULL OUTER JOIN Transactions on Visits.visit_id = Transactions.visit_id 
WHERE amount IS NULL and transaction_id IS NUll
GROUP BY customer_id