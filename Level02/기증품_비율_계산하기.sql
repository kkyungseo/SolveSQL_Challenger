SELECT
  round(
    100.0 * (
      SELECT
        count(DISTINCT artwork_id)
      FROM
        artworks
      WHERE
        credit LIKE '%gift%'
    ) / count(DISTINCT artwork_id),
    3
  ) ratio
FROM
  artworks