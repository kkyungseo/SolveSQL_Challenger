SELECT
  CASE
    WHEN (
      CAST(STRFTIME ('%w', DATE(measured_at)) AS INTEGER) + 6
    ) % 7 = 0 THEN '월요일'
    WHEN (
      CAST(STRFTIME ('%w', DATE(measured_at)) AS INTEGER) + 6
    ) % 7 = 1 THEN '화요일'
    WHEN (
      CAST(STRFTIME ('%w', DATE(measured_at)) AS INTEGER) + 6
    ) % 7 = 2 THEN '수요일'
    WHEN (
      CAST(STRFTIME ('%w', DATE(measured_at)) AS INTEGER) + 6
    ) % 7 = 3 THEN '목요일'
    WHEN (
      CAST(STRFTIME ('%w', DATE(measured_at)) AS INTEGER) + 6
    ) % 7 = 4 THEN '금요일'
    WHEN (
      CAST(STRFTIME ('%w', DATE(measured_at)) AS INTEGER) + 6
    ) % 7 = 5 THEN '토요일'
    WHEN (
      CAST(STRFTIME ('%w', DATE(measured_at)) AS INTEGER) + 6
    ) % 7 = 6 THEN '일요일'
  END AS `weekday`,
  ROUND(AVG(no2), 4) AS `no2`,
  ROUND(AVG(o3), 4) AS `o3`,
  ROUND(AVG(co), 4) AS `co`,
  ROUND(AVG(so2), 4) AS `so2`,
  ROUND(AVG(pm10), 4) AS `pm10`,
  ROUND(AVG(pm2_5), 4) AS `pm2_5`
FROM
  measurements
GROUP BY
  (
    CAST(STRFTIME ('%w', DATE(measured_at)) AS INTEGER) + 6
  ) % 7
ORDER BY
  (
    CAST(STRFTIME ('%w', DATE(measured_at)) AS INTEGER) + 6
  ) % 7 ASC