WITH customer_purchases AS (
    SELECT
        c.customer_id,
        c.acquisition_channel,
        COUNT(o.order_id) AS delivered_orders
    FROM customers c
    LEFT JOIN orders o
        ON o.customer_id = c.customer_id
       AND o.order_status = 'Delivered'
    GROUP BY c.customer_id, c.acquisition_channel
)
SELECT
    acquisition_channel,
    COUNT(*)                                          AS total_customers,
    COUNT(*) FILTER (WHERE delivered_orders >= 1)     AS customers_with_purchases,
    COUNT(*) FILTER (WHERE delivered_orders >= 2)     AS repeat_customers,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE delivered_orders >= 2)
        / NULLIF(COUNT(*) FILTER (WHERE delivered_orders >= 1), 0),
        1
    )                                                 AS repeat_purchase_rate
FROM customer_purchases
GROUP BY acquisition_channel
ORDER BY repeat_purchase_rate DESC NULLS LAST,
         repeat_customers DESC;