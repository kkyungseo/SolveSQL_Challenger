SELECT 
    DATE(order_delivered_carrier_date) AS delivered_carrier_date,
    COUNT(order_id) AS orders
FROM 
    olist_orders_dataset
WHERE 
    DATE(order_delivered_carrier_date) BETWEEN '2017-01-01' AND '2017-01-31'
    AND order_delivered_customer_date IS NULL
GROUP BY 
    delivered_carrier_date
ORDER BY 
    delivered_carrier_date ASC;