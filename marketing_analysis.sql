-- Exploratory data analysis
SELECT COUNT(*)
FROM marketing;

DESCRIBE marketing;

SELECT COUNT(*) as total_sessions FROM marketing;


-- Funnel analysis
SELECT
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN visited_website THEN 1 ELSE 0 END) AS visited,
    SUM(CASE WHEN viewed_product THEN 1 ELSE 0 END) AS viewed,
    SUM(CASE WHEN added_to_cart THEN 1 ELSE 0 END) AS cart,
    SUM(CASE WHEN checkout_started THEN 1 ELSE 0 END) AS checkout,
    SUM(CASE WHEN purchase_completed THEN 1 ELSE 0 END) AS purchased
FROM marketing;

-- Channel Analysis

SELECT
    channel,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM marketing
GROUP BY channel
ORDER BY total_revenue;

SELECT
    channel,
    COUNT(*) AS sessions,
    SUM(CASE WHEN purchase_completed THEN 1 ELSE 0 END) AS purchases,
    ROUND(
        SUM(CASE WHEN purchase_completed THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS conversion_rate
FROM marketing
GROUP BY channel
ORDER BY conversion_rate DESC;


SELECT
    channel,
    SUM(CASE WHEN purchase_completed THEN 1 ELSE 0 END) AS purchases,
    ROUND(
        SUM(CASE WHEN purchase_completed THEN 1 ELSE 0 END) * 100.0
        / SUM(SUM(CASE WHEN purchase_completed THEN 1 ELSE 0 END)) OVER (),
        2
    ) AS purchase_percentage
FROM marketing
GROUP BY channel
ORDER BY purchase_percentage DESC;


SELECT
    channel,
    ROUND(SUM(revenue),2) AS total_revenue,
    ROUND(AVG(order_value),2) AS avg_order_value
FROM marketing
GROUP BY channel
ORDER BY total_revenue DESC;

SELECT
ROUND(
100.0 *
(
SUM(CASE WHEN added_to_cart THEN 1 ELSE 0 END)
-
SUM(CASE WHEN purchase_completed THEN 1 ELSE 0 END)
)
/
SUM(CASE WHEN added_to_cart THEN 1 ELSE 0 END),
2
) AS cart_abandonment_rate
FROM marketing;

SELECT ROUND(
100.0 * SUM(CASE WHEN purchase_completed THEN 1 ELSE 0 END)
/ COUNT(*),2) AS conversion_rate
FROM marketing;

SELECT
ROUND(
100.0 *
SUM(CASE WHEN purchase_completed THEN 1 ELSE 0 END)
/
SUM(CASE WHEN checkout_started THEN 1 ELSE 0 END),
2
) AS checkout_completion_rate
FROM marketing;

-- Revenue by region
SELECT
region,
ROUND(SUM(revenue),2) revenue
FROM marketing
GROUP BY region
ORDER BY revenue DESC;

-- Revenue by Device
SELECT
device,
ROUND(SUM(revenue),2) revenue
FROM marketing
GROUP BY device
ORDER BY revenue DESC;

-- Revenue by user_type
SELECT
user_type,
ROUND(SUM(revenue),2) revenue
FROM marketing
GROUP BY user_type;

--Campaign Ranking
SELECT
campaign_type,
ROUND(SUM(revenue),2) revenue,
RANK() OVER(ORDER BY SUM(revenue) DESC) campaign_rank
FROM marketing
GROUP BY campaign_type;


--Revenue Contribution by channel
SELECT
channel,
ROUND(SUM(revenue),2) revenue,
ROUND(
100*SUM(revenue)
/SUM(SUM(revenue)) OVER(),
2
) contribution_percent
FROM marketing
GROUP BY channel;




--Running total
SELECT
    month,
    SUM(revenue) AS monthly_revenue,
    SUM(SUM(revenue)) OVER (ORDER BY month) AS running_total
FROM marketing
GROUP BY month
ORDER BY month;


