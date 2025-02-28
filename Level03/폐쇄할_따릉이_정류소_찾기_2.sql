WITH
  A AS (
    SELECT
      rent_station_id,
      SUM(
        CASE
          WHEN STRFTIME ('%Y-%m', DATE(rent_at)) = '2018-10' THEN 1
          ELSE 0
        END
      ) AS `rent_2018`,
      SUM(
        CASE
          WHEN STRFTIME ('%Y-%m', DATE(rent_at)) = '2019-10' THEN 1
          ELSE 0
        END
      ) AS `rent_2019`
    FROM
      rental_history
    GROUP BY
      rent_station_id
  ),
  B AS (
    SELECT
      return_station_id,
      SUM(
        CASE
          WHEN STRFTIME ('%Y-%m', DATE(return_at)) = '2018-10' THEN 1
          ELSE 0
        END
      ) AS `return_2018`,
      SUM(
        CASE
          WHEN STRFTIME ('%Y-%m', DATE(return_at)) = '2019-10' THEN 1
          ELSE 0
        END
      ) AS `return_2019`
    FROM
      rental_history
    GROUP BY
      return_station_id
  ),
  C AS (
    SELECT
      A.rent_station_id,
      ROUND(
        100.0 * (A.`rent_2019` + B.`return_2019`) / (A.`rent_2018` + B.`return_2018`),
        2
      ) AS `usage_pct`
    FROM
      A
      JOIN B ON A.rent_station_id = B.return_station_id
    WHERE
      (A.`rent_2018` + B.`return_2018`) > 0
      AND (A.`rent_2019` + B.`return_2019`) > 0
  )
SELECT
  D.station_id,
  D.name,
  D.local,
  C.`usage_pct`
FROM
  station D
  JOIN C ON D.station_id = C.rent_station_id
WHERE
  C.`usage_pct` <= 50