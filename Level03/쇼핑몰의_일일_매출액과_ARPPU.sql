SELECT DATE(orders.order_purchase_timestamp) AS dt 
      ,COUNT(distinct orders.customer_id) AS pu 
      ,ROUND(SUM(pays.payment_value),2) AS revenue_daily 
      ,ROUND(SUM(pays.payment_value)/COUNT(distinct orders.customer_id),2) AS arppu
FROM olist_orders_dataset orders
      INNER JOIN olist_order_payments_dataset pays
      ON orders.order_id = pays.order_id
WHERE dt >= '2018-01-01'
GROUP BY dt