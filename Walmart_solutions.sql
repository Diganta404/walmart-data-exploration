-- Business Questions

-- Sales Overview

-- Q1) Which branch and city have the highest sales?

-- Branch with highest sales
SELECT branch, SUM(total) AS total_sales
FROM walmart
GROUP BY branch
ORDER BY total_sales DESC
LIMIT 1;

-- City with highest sales
SELECT city, SUM(total) AS total_sales
FROM walmart
GROUP BY city
ORDER BY total_sales DESC
LIMIT 1;

-- Which category has the highest profit margin?
SELECT category, AVG(profit_margin) AS avg_profit_margin
FROM walmart
GROUP BY category
ORDER BY avg_profit_margin DESC
LIMIT 1;

-- Customer Insights

-- Are there patterns in customer ratings across branches or categories?

-- Ratings by branch
SELECT branch, AVG(rating) AS avg_rating
FROM walmart
GROUP BY branch
ORDER BY avg_rating DESC;

-- Ratings by category
SELECT category, AVG(rating) AS avg_rating
FROM walmart
GROUP BY category
ORDER BY avg_rating DESC;

-- Time-Based Analysis

-- Which day of the week generates the highest sales?
SELECT TRIM(TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'Day')) AS day_of_week, 
       SUM(total) AS total_sales
FROM walmart
GROUP BY day_of_week
ORDER BY total_sales DESC
LIMIT 1;

-- Profitability Analysis

-- Most profitable branch/city (profit margin + total sales)

--Identify the busiest day for each branch based on the number of transactions
WITH branch_sales AS (
    SELECT 
        branch, 
        TRIM(TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'Day')) AS day_of_week, 
        COUNT(invoice_id) AS total_transactions
    FROM walmart
    GROUP BY branch, day_of_week
)
SELECT DISTINCT ON (branch) branch, day_of_week, total_transactions
FROM branch_sales
ORDER BY branch, total_transactions DESC;

-- By branch
SELECT branch, SUM(total * (profit_margin / 100)) AS total_profit, SUM(total) AS total_sales
FROM walmart
GROUP BY branch
ORDER BY total_profit DESC
LIMIT 1;

-- By city
SELECT city, SUM(total * (profit_margin / 100)) AS total_profit, SUM(total) AS total_sales
FROM walmart
GROUP BY city
ORDER BY total_profit DESC
LIMIT 1;

-- Quantity sold vs. profit margin across categories
SELECT category, SUM(quantity) AS total_quantity, AVG(profit_margin) AS avg_profit_margin
FROM walmart
GROUP BY category
ORDER BY avg_profit_margin DESC;

-- Payment Method Trends

-- Most popular payment method overall and in each city

-- Overall
SELECT payment_method, COUNT(*) AS total_transactions
FROM walmart
GROUP BY payment_method
ORDER BY total_transactions DESC
LIMIT 1;

-- By city
SELECT city, payment_method, COUNT(*) AS total_transactions
FROM walmart
GROUP BY city, payment_method
ORDER BY city, total_transactions DESC;

-- Correlation between payment method and customer rating
SELECT payment_method, AVG(rating) AS avg_rating
FROM walmart
GROUP BY payment_method
ORDER BY avg_rating DESC; 

-- Predictive Modeling

-- Predict total sales based on unit price, quantity, category, and time of purchase
-- Using linear regression approach to prepare data for ML
SELECT unit_price, quantity, category, 
       EXTRACT(HOUR FROM TO_TIMESTAMP(time, 'HH24:MI:SS')) AS purchase_hour, 
       total
FROM walmart;


-- Forecast future sales for the next quarter using time series analysis

-- Prepare data grouped by month
SELECT DATE_TRUNC('month', TO_DATE(date, 'DD/MM/YY')) AS month, SUM(total) AS total_sales
FROM walmart
GROUP BY month
ORDER BY month;

-- Customer Segmentation (Clustering)

-- Segment customers based on purchase behavior
SELECT payment_method, AVG(quantity) AS avg_quantity, SUM(total) AS total_spent, AVG(rating) AS avg_rating
FROM walmart
GROUP BY payment_method;

-- Identify high-value customers and suggest retention strategies
SELECT TO_DATE(date, 'DD/MM/YY') AS formatted_date, SUM(total) AS daily_sales
FROM walmart
GROUP BY formatted_date
HAVING SUM(total) > (SELECT AVG(total) + 2 * STDDEV_POP(total) FROM walmart) 
    OR SUM(total) < (SELECT AVG(total) - 2 * STDDEV_POP(total) FROM walmart)
ORDER BY formatted_date;


-- Market Basket Analysis

-- Identify products frequently bought together
-- Prepare data for association rule mining
SELECT invoice_id, STRING_AGG(category, ', ') AS products
FROM walmart
GROUP BY invoice_id;

-- Profit Optimization

-- Analyze pricing strategies
SELECT unit_price, SUM(quantity) AS total_quantity, SUM(total * (profit_margin / 100)) AS total_profit
FROM walmart
GROUP BY unit_price
ORDER BY total_profit DESC;

-- Recommend discount strategies
SELECT unit_price, SUM(quantity) AS total_quantity, AVG(profit_margin) AS avg_profit_margin
FROM walmart
GROUP BY unit_price
HAVING AVG(profit_margin) < 10  -- Adjust threshold as needed
ORDER BY avg_profit_margin ASC;

-- Anomaly Detection

-- Identify unusual sales patterns
SELECT TO_DATE(date, 'DD/MM/YY') AS formatted_date, SUM(total) AS daily_sales
FROM walmart
GROUP BY formatted_date
HAVING SUM(total) > (SELECT AVG(total) + 2 * STDDEV_POP(total) FROM walmart) 
    OR SUM(total) < (SELECT AVG(total) - 2 * STDDEV_POP(total) FROM walmart)
ORDER BY formatted_date;

-- Detect fraudulent transactions
SELECT *
FROM walmart
WHERE quantity > 100 OR total > 1000 -- Adjust thresholds based on business logic
ORDER BY total DESC;

-- Operational Efficiency

-- Identify branches with lower sales but high footfall
SELECT branch, COUNT(invoice_id) AS total_transactions, SUM(total) AS total_sales
FROM walmart
GROUP BY branch
HAVING COUNT(invoice_id) > 100 AND SUM(total) < (SELECT AVG(total) FROM walmart)
ORDER BY total_transactions DESC;

-- Suggest staffing adjustments based on peak hours
SELECT branch, EXTRACT(HOUR FROM time::TIME) AS hour, COUNT(*) AS total_transactions
FROM walmart
GROUP BY branch, hour
ORDER BY total_transactions DESC;

