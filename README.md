### Sales Performance Analysis - Revenue Analysis and Business Insights

#### Project Overview
This project analyzes sales data using SQL to understand business performance. 

#### Key Metrics
Overall revenue trends, sales quantity, market performance, top-performing products and regions as well as key customers.

#### Tools & Skills
- SQL for data extraction and analysis (SELECT, JOIN, GROUP BY, ORDER BY, aggregate functions, subqueries)
- Data visualization (Tableau)  
- Business performance and trend analysis (Revenue tracking, performance evaluation, growth insights)

#### Objectives
- Identify total revenue and average sales
- Find top customers and best-selling products
- Track yearly and regional revenue trends

#### Dashboard Highlights
- Total revenue and sales quantity
- Revenue by year and market
- Sales quantity by market
- Top 5 products by revenue
- Top 5 customers by revenue

#### Sample SQL Queries

```sql
-- Total revenue by region
SELECT SUM(sales_amount) AS total_revenue, markets.zone
FROM transactions
JOIN markets
ON transactions.market_code = markets.markets_code
GROUP BY zone;

-- Yearly revenue trends
```sql
SELECT SUM(sales_amount) AS total_revenue, date.year
FROM transactions
JOIN date
ON transactions.order_date = date.date
GROUP BY year;

-- Number of customers per year
```sql
SELECT COUNT(customer_code) AS number_of_customers, date.year
FROM transactions
JOIN DATE 
ON transactions.order_date = date.date
GROUP BY year;

-- Top performing market
```sql
SELECT markets_name, zone, order_date, sales_qty, sales_amount
FROM transactions
JOIN markets
ON markets.markets_code = transactions.market_code
ORDER BY sales_amount DESC;

-- Top customers by total purchases
```sql
SELECT custmer_name, customer_type
FROM customers
WHERE customer_code IN (
      SELECT transactions.customer_code
      FROM transactions
      WHERE transactions.sales_qty > 100);
---

#### Key Insights
- Revenue varies significantly across regions and years
- Identified regions with the highest and lowest revenue contributions
- Recognized top customers and their purchasing patterns
- Top customers and products drive most of the revenue
  
