SELECT
  strftime('%Y-%m', o.order_date) AS order_month,
  SUM(quantity * price) AS total_amount,
  SUM(CASE WHEN o.order_id NOT LIKE 'C%' THEN quantity * price ELSE 0 END) AS ordered_amount,
  SUM(CASE WHEN o.order_id LIKE 'C%' THEN quantity * price ELSE 0 END) AS canceled_amount
FROM orders AS o
INNER JOIN order_items AS oi ON o.order_id = oi.order_id
GROUP BY order_month
ORDER BY order_month;