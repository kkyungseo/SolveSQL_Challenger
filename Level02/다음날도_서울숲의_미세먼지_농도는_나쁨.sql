SELECT
  *
FROM
  (
    SELECT
      measured_at AS today,
      LEAD(measured_at) OVER (
        PARTITION BY
          station
        ORDER BY
          measured_at
      ) AS next_day,
      pm10 AS pm10,
      LEAD(pm10) OVER (
        PARTITION BY
          station
        ORDER BY
          measured_at
      ) AS next_pm10
    FROM
      measurements
  ) sub
WHERE
  next_pm10 > pm10;