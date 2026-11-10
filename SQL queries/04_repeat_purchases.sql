WITH customer_purchases AS (
    SELECT
        c.customer_id,
        COUNT(o.order_id) AS delivered_orders
    FROM customers c
    LEFT JOIN orders o
        ON o.customer_id = c.customer_id
       AND o.order_status = 'Delivered'
    GROUP BY c.customer_id
)
SELECT
    COUNT(*) FILTER (WHERE delivered_orders = 1) AS customers_with_one_purchase,
    COUNT(*) FILTER (WHERE delivered_orders > 1) AS repeat_customers,
    COUNT(*) FILTER (WHERE delivered_orders = 0) AS customers_without_purchases
FROM customer_purchases;