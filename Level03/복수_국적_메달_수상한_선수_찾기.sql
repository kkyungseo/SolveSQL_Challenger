SELECT DISTINCT
  athletes.name
FROM
  athletes
  JOIN records ON athletes.id = records.athlete_id
  JOIN games ON records.game_id = games.id
  JOIN teams ON records.team_id = teams.id
WHERE
  games.year >= 2000
  AND records.medal IS NOT NULL
GROUP BY
  athletes.id
HAVING
  COUNT(DISTINCT teams.team) >= 2
ORDER BY
  athletes.name;