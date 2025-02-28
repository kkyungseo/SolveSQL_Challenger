SELECT
  G.name
FROM
  games G
  JOIN platforms P ON G.platform_id = P.platform_id
WHERE
  G.year >= 2012
  AND P.name IN (
    'PS3',
    'PS4',
    'PSP',
    'PSV',
    'Wii',
    'WiiU',
    'DS',
    '3DS',
    'X360',
    'XONE'
  )
GROUP BY
  G.name
HAVING
  COUNT(
    DISTINCT CASE
      WHEN P.name IN ('PS3', 'PS4', 'PSP', 'PSV') THEN 'Sony'
      WHEN P.name IN ('Wii', 'WiiU', 'DS', '3DS') THEN 'Nintendo'
      WHEN P.name IN ('X360', 'XONE') THEN 'Microsoft'
    END
  ) >= 2
ORDER BY
  G.name;