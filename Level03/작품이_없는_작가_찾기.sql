SELECT
  A.artist_id,
  A.name
FROM
  artists A
  LEFT JOIN artworks_artists B on A.artist_id = B.artist_id
WHERE
  A.death_year <> ''
  AND B.artist_id IS NULL 