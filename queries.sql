-- number of publishers of each game
SELECT game.game_id, game.name AS game_name, COUNT(publish.company_id) AS num_publishers
FROM game
JOIN publish ON game.game_id = publish.game_id
GROUP BY game.game_id;

-- how many genres each game has
SELECT game.game_id, game.name AS game_name, COUNT(game_genre.genre_id) AS num_genres
FROM game
LEFT JOIN game_genre ON game.game_id = game_genre.game_id
GROUP BY game.game_id;

-- how many times company was mentioned as publisher or developer
SELECT
  c.name AS company_name,
  COUNT(DISTINCT p.game_id) + COUNT(DISTINCT d.game_id) AS total_count
FROM
  company c
LEFT JOIN
  publish p ON c.company_id = p.company_id
LEFT JOIN
  develop d ON c.company_id = d.company_id
GROUP BY
  c.company_id, c.name;
