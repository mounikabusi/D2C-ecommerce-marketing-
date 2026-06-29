## 🛒 E-Commerce Marketing Funnel Analysis


End-to-end SQL + Power BI project analyzing a D2C brand's marketing funnel — from website visits to completed purchases — across channels, devices, regions, and campaigns.




## 📊 Dashboard Preview

Show Image


## 🎯 Business Problem

A D2C e-commerce brand wanted to understand where customers drop off in the buying journey, which marketing channels drive the most revenue, and how campaign types and user segments perform — to improve conversion rates and reduce cart abandonment.


## 🔍 Key Insights
| Insight | Finding |
|---------|---------|
| 🏆 Top Revenue Channel | **Paid Ads** generated **₹1.70M** in revenue. |
| 📉 Cart Abandonment Rate | **68.82%** of users abandoned their cart before completing a purchase. |
| 📱 Device Performance | **Mobile users contributed 69%** of total revenue. |
| 🎯 Best Campaign Type | **Discount campaigns** generated **₹2.02M** in revenue. |
| 📅 Revenue Peak | **September** recorded the highest monthly revenue. |
| 🔁 Customer Behavior | **Returning users contributed 65.43%** of total revenue. |


## 🧪 Funnel Breakdown

| Stage | Count | Drop-off |
|-------|------:|---------:|
| Visited Website | 28K | — |
| Viewed Product | 18K | 35.3% |
| Added to Cart | 6K | 66.7% |
| Checkout Started | 4K | 33.3% |
| Purchase Completed | 2K | 50.0% |

Overall Conversion Rate: 7.03%


## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| DuckDB | Data storage and SQL querying |
| SQL | Data exploration, KPI calculation, and business analysis |
| Power BI | Interactive dashboard and data visualization |
| CSV Dataset | D2C Marketing Funnel dataset |



## 📁 Project Structure

```
📁 E-Commerce-Marketing-Funnel-Analysis
│
├── marketing_queries.sql
├── dashboard.pbix
├── dashboard.png
├── dataset.csv
└── README.md
```


## 📝 SQL Concepts Used


CASE WHEN for conditional aggregations (funnel stage counts)
Window Functions: SUM() OVER(), RANK() OVER() for revenue contribution and campaign ranking
Running Totals: Cumulative monthly revenue using SUM() OVER (ORDER BY month)
CTEs and multi-level aggregations
Group-by aggregations across channels, devices, regions, and user types
Conversion rate, cart abandonment rate, and checkout completion rate calculations



## 📈 SQL Analysis Sections


Exploratory Data Analysis — row counts, schema inspection
Funnel Analysis — stage-wise drop-off across the customer journey
Channel Analysis — revenue, conversion rate, and purchase share by channel
Revenue Segmentation — by region, device, user type, and campaign type
Campaign Ranking — RANK() window function on campaign revenue
Running Total — cumulative monthly revenue trend



## 💡 Business Recommendations


Reduce cart abandonment (68.82%) by triggering email/SMS reminders after cart add — especially for mobile users
Scale Paid Ads investment — highest revenue channel at ₹1.7M; optimize ROAS during peak months (August–September)
Prioritize mobile UX — 69% of revenue comes from mobile; a faster checkout flow could significantly lift conversions
Leverage returning users — they contribute 65% of revenue; a loyalty/rewards program could increase purchase frequency
Run Discount campaigns year-round — generated 2x the revenue of Influencer campaigns



## 🚀 How to Run


Clone this repository
Load d2c_marketing_funnel_data.csv into DuckDB or any SQL environment
Run marketing_analysis.sql section by section
Open ecommerce_dashboard.pbix in Power BI Desktop



## 👩‍💻 Author

Mounika

B.Tech CSE | Data Analyst Fresher | Hyderabad
