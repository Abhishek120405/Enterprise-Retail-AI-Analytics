-- Enterprise Retail AI Analytics — executable SQLite business analysis
-- Dataset: 07_DATA/retail_orders_sample.csv loaded into table retail_orders.

-- 1. Revenue by region (delivered orders)
SELECT region, ROUND(SUM(revenue),2) AS delivered_revenue
FROM retail_orders WHERE order_status = 'Delivered'
GROUP BY region ORDER BY delivered_revenue DESC;

-- 2. Gross profit by category (delivered orders)
SELECT category, ROUND(SUM(profit),2) AS profit,
       ROUND(100.0*SUM(profit)/NULLIF(SUM(revenue),0),2) AS profit_margin_pct
FROM retail_orders WHERE order_status = 'Delivered'
GROUP BY category ORDER BY profit DESC;

-- 3. Order-status distribution
SELECT order_status, COUNT(*) AS orders,
       ROUND(100.0*COUNT(*)/(SELECT COUNT(*) FROM retail_orders),1) AS status_pct
FROM retail_orders GROUP BY order_status ORDER BY orders DESC;

-- 4. Monthly delivered revenue trend
SELECT substr(order_date,1,7) AS month, ROUND(SUM(revenue),2) AS revenue
FROM retail_orders WHERE order_status = 'Delivered'
GROUP BY substr(order_date,1,7) ORDER BY month;

-- 5. Top 5 products by delivered revenue
SELECT product_name, ROUND(SUM(revenue),2) AS revenue
FROM retail_orders WHERE order_status = 'Delivered'
GROUP BY product_name ORDER BY revenue DESC LIMIT 5;

-- 6. Return rate by category
SELECT category,
       ROUND(100.0*SUM(CASE WHEN order_status='Returned' THEN 1 ELSE 0 END)/COUNT(*),1) AS return_rate_pct
FROM retail_orders GROUP BY category ORDER BY return_rate_pct DESC;

-- 7. High-value customers (delivered revenue)
SELECT customer_id, ROUND(SUM(revenue),2) AS delivered_revenue, COUNT(*) AS delivered_orders
FROM retail_orders WHERE order_status='Delivered'
GROUP BY customer_id ORDER BY delivered_revenue DESC LIMIT 10;
