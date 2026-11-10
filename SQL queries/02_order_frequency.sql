WITH customer_orders AS (
    SELECT
        c.customer_id,
        COUNT(o.order_id) AS order_count
    FROM customers c
    LEFT JOIN orders o
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_id
)
SELECT
    SUM(CASE WHEN order_count = 1 THEN 1 ELSE 0 END) AS customers_with_one_order,
    SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) AS customers_with_multiple_orders,
    SUM(CASE WHEN order_count = 0 THEN 1 ELSE 0 END) AS customers_with_no_orders
FROM customer_orders;