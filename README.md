<img width="1821" height="853" alt="image" src="https://github.com/user-attachments/assets/95f596db-6864-4b57-9198-bba716dfd79c" /># US E-commerce Customer Retention & Repeat Purchase Analysis
Dataset: This project uses fictional US e-commerce data created for portfolio and educational purposes.
## Project Overview

A fictional US online retailer wants to understand why some customers purchase repeatedly while others never complete an order or stop returning. This project uses SQL to examine customer acquisition, order outcomes, repeat purchases, marketing channels, product categories, discounts and inactivity.

**Business objective:** Identify practical opportunities to improve successful purchases, customer retention and sales performance.

## Tools and Data

- **Tools:** PostgreSQL and DBeaver
- **Data:** Fictional US e-commerce records, with prices in USD
- **Tables:** `customers` (300), `orders` (618), `products` (20), `order_items` (948)
- **Analysis:** Eight SQL business questions

## Key Findings

- Of **300 registered customers**, **241** had at least one delivered order; **138 (57% of those 241)** had multiple delivered orders.
- **59 customers** had no delivered orders, including **20 who placed orders but had none delivered**.
- **Email** had the highest repeat purchase rate (**65.4%**); **Paid Search** generated the most repeat buyers (**42**).
- First delivered orders with a discount showed a **60.0%** repeat purchase rate versus **54.8%** without a discount. This does not establish that discounts caused repeat purchases.
- **Fashion** generated the highest gross order value (**$9,298**) and the lowest category-level return rate (**3.8%**). **Electronics** (**11.7%**) and **Beauty** (**10.6%**) had the highest category-level return rates.
- **94 of 618 orders (15%)** were cancelled or returned, associated with about **$4,194** in gross order value.
- Using **9 November 2026** as the inactivity reference, **215 of 241 buyers (89%)** had not made a delivered purchase for over 60 days. Using the dataset's most recent delivered-order date (**30 September 2026**) instead gives **150 (62%)**.

## Strategic Recommendations

- Re-engage previously frequent buyers with relevant product suggestions and timed follow-ups.
- Investigate customers whose orders never reached delivery, and address cancellation and return causes.
- Review Electronics and Beauty return patterns at product level before making operational changes.
- Compare customer acquisition costs and profitability before increasing spending on marketing channels or discounts.
- Test retention campaigns against a control group to measure whether they increase repeat buying.
## SQL Skills Demonstrated

This project demonstrates my ability to use PostgreSQL to investigate customer behaviour, marketing performance and retention opportunities.

- **Joins:** `INNER JOIN` and `LEFT JOIN` to connect customers, orders, products and order items.
- **Aggregations:** `COUNT()`, `SUM()`, `MAX()`, `GROUP BY` and `HAVING` to calculate business metrics.
- **Conditional analysis:** `CASE WHEN` and `FILTER` to segment customers and analyse order statuses.
- **CTEs:** `WITH` to break complex business questions into manageable steps.
- **Window functions:** `ROW_NUMBER()` and `COUNT() OVER (PARTITION BY ...)` to identify first purchases and repeat buying.
- **Data handling:** `COALESCE()`, `NULLIF()` and `DISTINCT` to handle missing values, prevent division errors and avoid duplicate counts.
- **Date analysis:** Date subtraction to measure customer inactivity.
- **Business metrics:** Repeat purchase rates, customer conversion, gross order value, product return rates and customer inactivity.
## SQL Analyses

| # | Analysis | SQL | Results |
|---|---|---|---|
| 01 | Customer acquisition | [Query](SQL%20queries/01_customer_acquisition.sql) | [CSV](Results/01_customer_acquisition.csv) |
| 02 | Order frequency | [Query](SQL%20queries/02_order_frequency.sql) | [CSV](Results/02_order_frequency.csv) |
| 03 | Order status and value | [Query](SQL%20queries/03_order_status_analysis.sql) | [CSV](Results/03_order_status_analysis.csv) |
| 04 | Successful repeat purchases | [Query](SQL%20queries/04_repeat_purchases.sql) | [CSV](Results/04_repeat_purchases.csv) |
| 05 | Marketing channels | [Query](SQL%20queries/05_marketing_channels.sql) | [CSV](Results/05_marketing_channels.csv) |
| 06 | Product category performance | [Query](SQL%20queries/06_product_categories.sql) | [CSV](Results/06_product_categories.csv) |
| 07 | Discounts and repeat purchasing | [Query](SQL%20queries/07_discounts_repeat_purchases.sql) | [CSV](Results/07_discounts_repeat_purchases.csv) |
| 08 | Customer inactivity | [Query](SQL%20queries/08_customer_inactivity.sql) | [CSV](Results/08_customer_inactivity.csv) |

**[Read the full executive summary, eight findings and recommendations](Business%20Insights/key_findings.md).**

## Data Limitations

- `Delivered` is used as a proxy for a successful purchase; it does not prove payment settlement or rule out later refunds.
- Gross order values are calculated from item quantity and unit price, before discounts, returns and other costs. They should not be described as confirmed revenue.
- An order containing several product categories can appear in several category totals. Category return rates are order-based, not item-level return rates.
- Inactivity depends on the reference date and the available data window. It is not proof that a customer has permanently left.
- The data does not establish why orders were cancelled or returned, or whether marketing and discounts caused customers to purchase again.

## Conclusion

The analysis identifies opportunities to improve repeat purchasing, investigate unsuccessful orders, reduce returns and focus retention efforts on customers with a history of delivered purchases. Further operational and financial data would be needed before deciding which campaigns will be most profitable.
