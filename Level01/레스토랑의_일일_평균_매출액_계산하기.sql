SELECT
  ROUND(AVG(daily_sales), 2) AS avg_sales
FROM (
  SELECT
    day,
    SUM(total_bill) AS daily_sales
  FROM
    tips
  GROUP BY
    day
);