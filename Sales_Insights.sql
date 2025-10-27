USE sales;


SELECT * FROM sales.customers;

SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date where sales.date.year=2020;
SELECT * FROM sales.transactions;

SELECT distinct product_code FROM sales.transactions where market_code="Mark001";
SELECT * FROM sales.products;
 
SELECT * FROM sales.markets;
 
SELECT * FROM sales.date;
 
-- find the total revenue from all zones
SELECT SUM(sales_amount) AS total_revenue, markets.zone
FROM transactions
JOIN markets
ON transactions.market_code = markets.markets_code
GROUP BY zone;

-- what is the total revenue for each year
SELECT SUM(sales_amount) AS total_revenue, date.year
FROM transactions
JOIN date
ON transactions.order_date = date.date
GROUP BY year;

-- print transactions performed in 2017
SELECT *
FROM transactions
JOIN DATE 
ON transactions.order_date = date.date
WHERE year = "2017";

-- print transactions performed in 2018
SELECT *
FROM transactions
JOIN DATE 
ON transactions.order_date = date.date
WHERE year = "2018";

-- print transactions performed in 2019
SELECT *
FROM transactions
JOIN DATE 
ON transactions.order_date = date.date
WHERE year = "2019";

-- print transactions performed in 2020
SELECT *
FROM transactions
JOIN DATE 
ON transactions.order_date = date.date
WHERE year = "2020";

-- print out transactions with sales quantity from highest to lowest
-- find the transactions with the highest number of sales quantity
SELECT *
FROM transactions
ORDER BY sales_qty DESC;

-- find how many customers the company had per year
SELECT COUNT(customer_code) AS number_of_customers, date.year
FROM transactions
JOIN DATE 
ON transactions.order_date = date.date
GROUP BY year;

-- how many transactions did the company perform per year from highest to lowest
SELECT COUNT(*) AS number_of_transactions, date.year
FROM transactions
JOIN DATE 
ON transactions.order_date = date.date
GROUP BY year
ORDER BY COUNT(*) DESC;

-- name of customers that ordered above 100 
SELECT custmer_name, customer_type
FROM customers
WHERE customer_code IN (
      SELECT transactions.customer_code
      FROM transactions
      WHERE transactions.sales_qty > 100);

-- list of sales quanitity for customer type
SELECT transactions.sales_qty, customers.customer_type
FROM transactions
JOIN customers
ON transactions.customer_code = customers.customer_code
ORDER BY sales_qty DESC;

-- number of product type ordered per currency
SELECT COUNT(product_type), currency
FROM products
JOIN transactions
ON products.product_code = transactions.product_code
GROUP BY currency;

-- number of sales made to each customer
-- quantity of products sold to each customer
SELECT COUNT(sales_qty) AS prouduct_quantity_bought, custmer_name
FROM transactions
JOIN customers
ON transactions.customer_code = customers.customer_code
GROUP BY custmer_name
ORDER BY 1 DESC;

-- revenue per market name
SELECT markets_name, zone, order_date, sales_qty, sales_amount
FROM transactions
JOIN markets
ON markets.markets_code = transactions.market_code
ORDER BY sales_amount DESC;

-- sales quantity by market name
SELECT * 
FROM sales.transactions
JOIN markets
ON markets.markets_code = transactions.market_code;

-- top 5 customers revenue per customer
SELECT *
FROM transactions
JOIN customers
ON customers.customer_code = transactions.customer_code;

-- revenue per year using cydate
SELECT *
FROM transactions
JOIN date
ON transactions.order_date = date.date;
