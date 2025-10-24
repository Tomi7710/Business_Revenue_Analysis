### Sales Performance Analysis - Revenue Analysis and Business Insights

#### Project Overview
This project analyzes sales data using SQL to understand business performance. 

#### Key Metrics
Overall revenue trend, sales quantity, market performance, top-performing products and regions as well as key customers.

#### Tools & Skills
- SQL for data extraction and analysis (SELECT, JOIN, GROUP BY, ORDER BY, aggregate functions, subqueries)
- Data visualization (Tableau)  
- Business performance and trend analysis (Revenue tracking, performance evaluation, growth insights)

#### Objectives
- Calculate total revenue and average sales
- Find top customers and best-selling products
- Track yearly and regional revenue trends

#### Dashboard Highlights
- Total revenue and sales quantity
- Revenue by year and market
- Sales quantity by market
- Top 5 products by revenue
- Top 5 customers by revenue

#### Sample SQL Queries
-- Total revenue by region
SELECT region, SUM(sales_amount) AS total_revenue
FROM sales_data
GROUP BY region
ORDER BY total_revenue DESC;

-- Top 10 customers by total purchases
SELECT customer_id, SUM(sales_amount) AS total_spent
FROM sales_data
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Monthly revenue trend
SELECT EXTRACT(YEAR FROM sales_date) AS year,
       EXTRACT(MONTH FROM sales_date) AS month,
       SUM(sales_amount) AS monthly_revenue
FROM sales_data
GROUP BY year, month
ORDER BY year, month;

#### Key Insights
- Top customers and products drive most of the revenue
- Certain regions show strong seasonal patterns
- Monthly analysis helps forecast future sales
- Identified regions with the highest and lowest revenue contributions
- Recognized top customer segments and their purchasing patterns
- Determined seasonal and monthly trends that influence overall revenue
- Highlighted actionable insights for improving sales and targeting marketing efforts
