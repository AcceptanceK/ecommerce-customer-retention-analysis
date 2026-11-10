SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name)                    AS full_name,
    c.acquisition_channel,
    COUNT(o.order_id)                                         AS total_purchases,
    MAX(o.order_date)::date                                   AS last_purchase_date,
    DATE '2026-11-09' - MAX(o.order_date)::date               AS days_since_last_purchase,
    CASE
        WHEN DATE '2026-11-09' - MAX(o.order_date)::date <= 30 THEN 'Active'
        WHEN DATE '2026-11-09' - MAX(o.order_date)::date <= 60 THEN 'At Risk'
        ELSE 'Inactive'
    END                                                       AS activity_status
FROM customers c
JOIN orders o
    ON o.customer_id = c.customer_id
   AND o.order_status = 'Delivered'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.acquisition_channel
ORDER BY
    days_since_last_purchase DESC,
    c.customer_id;