-- 1️⃣ Monthly Sales Growth
SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    SUM(total_amount) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;

-- 2️⃣ Top 5 Products by Profitability
SELECT 
    p.product_name,
    SUM((p.unit_price - p.cost_price) * s.quantity) AS total_profit
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_profit DESC
LIMIT 5;

-- 3️⃣ Customer Purchase Patterns
SELECT 
    c.city,
    COUNT(DISTINCT s.customer_id) AS unique_customers,
    SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;
