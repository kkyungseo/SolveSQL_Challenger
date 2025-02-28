WITH A AS (
  SELECT station, pm10
  , (
    CASE
      WHEN (DATE(measured_at) >= '2022-03-01') AND (DATE(measured_at) <= '2022-05-31')
      THEN 'spring'
      WHEN (DATE(measured_at) >= '2022-06-01') AND (DATE(measured_at) <= '2022-08-31')
      THEN 'summer'
      WHEN (DATE(measured_at) >= '2022-09-01') AND (DATE(measured_at) <= '2022-11-30')
      THEN 'autumn'
      ELSE 'winter'
      END
  ) AS `season`
  FROM measurements
)
SELECT A.`season`
, MEDIAN(A.pm10) AS `pm10_median`
, ROUND(AVG(A.pm10), 2) AS `pm10_average`
FROM A
GROUP BY A.`season`
ORDER BY A.pm10