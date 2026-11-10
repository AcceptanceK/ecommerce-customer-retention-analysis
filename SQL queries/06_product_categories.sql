SELECT
    p.category,
    COUNT(DISTINCT o.order_id)                                              AS total_orders,
    COUNT(DISTINCT o.order_id) FILTER (WHERE o.order_status = 'Delivered')  AS delivered_orders,
    COUNT(DISTINCT o.order_id) FILTER (WHERE o.order_status = 'Returned')   AS returned_orders,
    COALESCE(SUM(oi.quantity * oi.unit_price), 0)                           AS gross_order_value,
    ROUND(
        100.0 * COUNT(DISTINCT o.order_id) FILTER (WHERE o.order_status = 'Returned')
        / NULLIF(COUNT(DISTINCT o.order_id), 0),
        1
    )                                                                       AS return_rate
FROM order_items oi
JOIN orders o
    ON o.order_id = oi.order_id
JOIN products p
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY gross_order_value DESC;