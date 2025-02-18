SELECT *
FROM tips
WHERE (total_bill + tip) IN (
  SELECT MAX(total_bill + tip)
  FROM tips
  GROUP BY day
);