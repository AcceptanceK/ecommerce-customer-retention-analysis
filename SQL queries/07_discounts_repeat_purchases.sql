WITH delivered AS (
    SELECT
        customer_id,
        order_id,
        discount_pct,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
        )                                        AS order_rank,
        COUNT(*) OVER (PARTITION BY customer_id) AS delivered_orders
    FROM orders
    WHERE order_status = 'Delivered'
)
SELECT
    CASE
        WHEN COALESCE(discount_pct, 0) > 0 THEN 'Discounted'
        ELSE 'No Discount'
    END                                                           AS discount_group,
    COUNT(*)                                                      AS total_customers,
    COUNT(*) FILTER (WHERE delivered_orders >= 2)                 AS repeat_customers,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE delivered_orders >= 2)
        / COUNT(*),
        1
    )                                                             AS repeat_purchase_rate
FROM delivered
WHERE order_rank = 1
GROUP BY 1
ORDER BY repeat_purchase_rate DESC;