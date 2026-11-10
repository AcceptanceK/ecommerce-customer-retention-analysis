SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN EXISTS (
            SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
        ) THEN 1 ELSE 0 END) AS customers_with_orders,
    SUM(CASE WHEN NOT EXISTS (
            SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
        ) THEN 1 ELSE 0 END) AS customers_without_orders
FROM customers c;