SELECT
  G.game_id,
  G.name,
  (
    CASE
      WHEN G.critic_score IS NULL THEN (
        SELECT
          ROUND(AVG(A.critic_score), 3)
        FROM
          games A
        WHERE
          G.genre_id = A.genre_id
      )
      ELSE G.critic_score
    END
  ) AS `critic_score`,
  (
    CASE
      WHEN G.critic_count IS NULL THEN (
        SELECT
          CAST(AVG(B.critic_count) + 0.999999 AS INTEGER)
        FROM
          games B
        WHERE
          G.genre_id = B.genre_id
      )
      ELSE G.critic_count
    END
  ) AS `critic_count`,
  (
    CASE
      WHEN G.user_score IS NULL THEN (
        SELECT
          ROUND(AVG(C.user_score), 3)
        FROM
          games C
        WHERE
          G.genre_id = C.genre_id
      )
      ELSE G.user_score
    END
  ) AS `user_score`,
  (
    CASE
      WHEN G.user_count IS NULL THEN (
        SELECT
          CAST(AVG(D.user_count) + 0.999999 AS INTEGER)
        FROM
          games D
        WHERE
          G.genre_id = D.genre_id
      )
      ELSE G.user_count
    END
  ) AS `user_count`
FROM
  games AS G
WHERE
  G.year >= 2015
  AND (
    G.critic_score IS NULL
    OR G.user_score IS NULL
  )