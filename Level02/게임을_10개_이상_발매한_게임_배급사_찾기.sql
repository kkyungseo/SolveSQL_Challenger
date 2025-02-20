SELECT
  c.name
FROM
  games g
  LEFT JOIN companies c ON g.publisher_id = c.company_id
GROUP BY
  publisher_id
HAVING
  count(DISTINCT game_id) >= 10;