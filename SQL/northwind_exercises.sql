/*
DATABASE SOURCE: https://github.com/pthom/northwind_psql
*/

-- 1.
WITH TempEmployeeInfo AS 
(
	SELECT * FROM customers 
)

SELECT * FROM TempEmployeeInfo;

-- 2
WITH Tmp AS (
	SELECT SUM(o.quantity * (o.unit_price - o.discount)) AS sales_rank, COUNT(p.product_name) FROM suppliers s
	JOIN products p ON p.supplier_id = s.supplier_id
	JOIN order_details o ON o.product_id = p.product_id
	GROUP BY s.company_name
)

SELECT * FROM Tmp;

------------------------------------------------------------
-- Exercise Simple SQL Queries

-- Use the Northwind Demo Database. Write the queries for the following:
-- 1. Get all columns from the tables Customers, Orders and Suppliers
SELECT * FROM customers, orders, suppliers;

-- 2. Get all Customers alphabetically, by Country and name
SELECT * FROM customers
ORDER BY country ASC, company_name ASC;

-- 3. Get all Orders by date
SELECT * FROM orders
ORDER BY order_date;

-- 4. Get the count of all Orders made during 1997
SELECT COUNT(order_id) FROM orders
WHERE DATE_PART('year', order_date) = '1997'

-- 5. Get all orders placed on the 19th of May, 1997
SELECT * FROM orders WHERE order_date = '1997-05-19';


------------------------------------------------------------
-- Exercise SQL Queries for JOINS
-- Using the Northwind Database, write the queries for the following:
-- 1. Create a report for all the orders of 1996 and their Customers (152 rows)
SELECT * FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
WHERE DATE_PART('year', o.order_date) = 1996;

-- 2. Create a report that shows the number of employees and customers from each city that has employees in it (5 rows)
SELECT COUNT(DISTINCT  e.employee_id) as employees, COUNT(DISTINCT c.customer_id) as customers, e.city 
FROM employees e
LEFT JOIN customers c ON c.city = e.city
GROUP BY e.city;

-- 3. Create a report that shows the number of employees and customers from each city that has customers in it (69 rows)
SELECT COUNT(DISTINCT e.employee_id) as employees, COUNT(DISTINCT c.customer_id) as customers, c.city
FROM employees e
RIGHT JOIN customers c ON c.city = e.city
GROUP BY c.city;

-- 4. Create a report that shows the number of employees and customers from each city ( rows)
SELECT COUNT(DISTINCT e.employee_id) as employees, COUNT(DISTINCT c.customer_id) as customers, c.city
FROM employees e
FULL OUTER JOIN customers c ON c.city = e.city
GROUP BY c.city;



------------------------------------------------------------
-- Exercise SQL Queries for HAVING, WHERE

-- 1. Create a report that shows the order ids and the associated employee names for orders that shipped after the required date (37 rows)
SELECT o.order_id,  CONCAT(CONCAT(e.first_name, ' '), e.last_name) as full_name FROM orders o
JOIN employees e ON e.employee_id = o.employee_id
WHERE o.required_date < o.shipped_date

-- 2. Create a report that shows the total quantity of products (from the Order_Details table) ordered. Only show records for products for which the quantity ordered is fewer than 200 ( rows)
SELECT SUM(quantity), order_details.product_id, product_name FROM order_details
JOIN products ON products.product_id = order_details.product_id
GROUP BY order_details.product_id, product_name
HAVING SUM(quantity) < 200;

-- 3. Create a report that shows the total number of orders by Customer since December 31,1996. The report should only return rows for which the total number of orders is greater than 15 (5 rows)
SELECT COUNT(o.order_id), o.customer_id FROM orders o
WHERE o.order_date > '1996-12-31'
GROUP BY o.customer_id
HAVING COUNT(o.order_id) > 15

------------------------------------------------------------
-- Exercise SQL Inserting Record
-- (Hint: use transactions)

-- 1. Insert yourself into the Employees table Include the following fields: LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo
BEGIN;
INSERT INTO employees (employee_id, last_name, first_name, title, title_of_courtesy, birth_date, hire_date, city, region, postal_code, country, home_phone, reports_to)
VALUES ((SELECT MAX(employee_id) FROM employees) + 1, 'Komandor', 'Kretes', 'Manager', 'Mr.', '1973-01-05', '1998-05-20', 'Magix', 'MX', '98120', 'USA', '(48) 637-9495', 2);

ROLLBACK;
COMMIT;
-- 2. Insert an order for yourself in the Orders table Include the following fields: CustomerID, EmployeeID, OrderDate, RequiredDate
BEGIN;
INSERT INTO orders (order_id, customer_id, employee_id, order_date, required_date)
VALUES ((SELECT MAX(order_id) FROM orders) + 1, 'ALFKI', 10, '2024-10-21', '2024-10-25');

ROLLBACK;
COMMIT;

-- 3. Insert order details in the Order_Details table Include the following fields: OrderID, ProductID, UnitPrice, Quantity, Discount
BEGIN;
INSERT INTO order_details (order_id, product_id, unit_price, quantity, discount)
VALUES (11078, 1, 14.4, 60, 0.2)

ROLLBACK;
COMMIT;


-- Helpers
SELECT MAX(employee_id) FROM employees
SELECT * FROM order_details WHERE product_id = 1


------------------------------------------------------------
-- Exercise SQL Updating Records
-- (Hint: use transactions)
-- 1. Update the phone of yourself (from the previous entry in Employees table) (1 row)
BEGIN;
UPDATE employees
SET home_phone = '(48) 541-9282'
WHERE first_name = 'Kretes' AND last_name = 'Komandor';

ROLLBACK;
COMMIT;

-- 2. Double the quantity of the order details record you inserted before (1 row)
BEGIN;
UPDATE order_details
SET quantity = quantity * 2
WHERE order_id = 11078;

ROLLBACK;
COMMIT;

SELECT * FROM order_details WHERE order_id = 11078;

-- 3. Repeat previous update but this time update all orders associated with you (1 row)
-- Add new val
INSERT INTO orders (order_id, customer_id, employee_id, order_date, required_date)
VALUES (11079, 'ALFKI', 10, '2024-10-21', '2024-10-25');
INSERT INTO order_details (order_id, product_id, unit_price, quantity, discount)
VALUES (11079, 1, 14.4, 60, 0.2);

BEGIN;
UPDATE order_details od
SET quantity = quantity * 3
FROM orders o
JOIN employees e ON e.employee_id = o.employee_id
WHERE o.order_id = od.order_id
  AND e.last_name = 'Komandor'
  AND e.first_name = 'Kretes';
  
COMMIT;

SELECT * FROM order_details WHERE order_id >= 11078;


------------------------------------------------------------
-- Exercise Advances SQL queries

-- 1. What were our total revenues in 1997 (Result must be 617.085,27)
SELECT SUM((unit_price - unit_price*discount) * quantity) FROM order_details od
JOIN orders o ON o.order_id = od.order_id
WHERE date_part('year', o.order_date) = '1997'

-- 2. What is the total amount each customer has payed us so far (Hint: QUICK-Stop has payed us 110.277,32)
SELECT SUM((unit_price - unit_price*discount) * quantity), c.company_name FROM order_details od
JOIN orders o ON o.order_id = od.order_id
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.company_name

-- 3. Find the 10 top selling products (Hint: Top selling product is "Côte de Blaye")
SELECT SUM((od.unit_price - od.unit_price*discount) * quantity), p.product_name FROM order_details od
JOIN products p ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY SUM((od.unit_price - od.unit_price*discount) * quantity) DESC
LIMIT 10

-- 4. Create a view with total revenues per customer
SELECT SUM((od.unit_price - od.unit_price*discount) * quantity), c.company_name FROM order_details od
JOIN orders o ON o.order_id = od.order_id
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.company_name

-- 5. Which UK Customers have payed us more than 1000 dollars (6 rows)
SELECT SUM((od.unit_price - od.unit_price*discount) * quantity), c.company_name FROM order_details od
JOIN orders o ON o.order_id = od.order_id
JOIN customers c ON c.customer_id = o.customer_id
WHERE c.country = 'UK'
GROUP BY c.company_name
HAVING SUM((od.unit_price - od.unit_price*discount) * quantity) > 1000

