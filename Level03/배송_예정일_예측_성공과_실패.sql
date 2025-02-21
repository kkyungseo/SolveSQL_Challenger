SELECT
  DATE(order_purchase_timestamp) AS purchase_date,
  COUNT(
    DISTINCT CASE
      WHEN order_estimated_delivery_date >= order_delivered_customer_date THEN order_id
    END
  ) AS success,
  COUNT(
    DISTINCT CASE
      WHEN order_estimated_delivery_date < order_delivered_customer_date THEN order_id
    END
  ) AS fail
FROM
  olist_orders_dataset
WHERE
  purchase_date LIKE '2017-01%'
GROUP BY
  purchase_date
ORDER BY
  purchase_date;