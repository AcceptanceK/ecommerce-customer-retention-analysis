SELECT
    o.order_status,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COALESCE(
        SUM(oi.quantity * oi.unit_price), 0
    ) AS total_order_value
FROM orders AS o
LEFT JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY o.order_status
ORDER BY total_orders DESC;