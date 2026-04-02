SELECT * FROM spotnana_dataset.clean_customer_data;

-- 1. Which region has the highest average total spend?
SELECT region, AVG(total_spend) AS avg_spend
FROM spotnana_dataset.clean_customer_data
GROUP BY region
ORDER BY avg_spend DESC;

-- 2. What % of customers are at high churn risk?
SELECT churn_risk, COUNT(*) AS count,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM spotnana_dataset.clean_customer_data), 1) AS pct
FROM spotnana_dataset.clean_customer_data
GROUP BY churn_risk;

-- 3. Which product category has the most Platinum customers?
SELECT product_category, COUNT(*) AS platinum_count
FROM spotnana_dataset.clean_customer_data
WHERE loyalty_tier = 'Platinum'
GROUP BY product_category
ORDER BY platinum_count DESC;

-- 4. Are email clickers spending more? (engagement vs revenue)
SELECT
  CASE WHEN email_clicks >= 10 THEN 'High Engagers' ELSE 'Low Engagers' END AS segment,
  AVG(total_spend) AS avg_spend,
  AVG(total_purchases) AS avg_purchases
FROM spotnana_dataset.clean_customer_data
GROUP BY segment;