-- games that have more that one publisher
SELECT game.game_id, game.name AS game_name, COUNT(publish.company_id) AS num_publishers
FROM game
JOIN publish ON game.game_id = publish.game_id
GROUP BY game.game_id
HAVING COUNT(publish.company_id) > 1;

-- how many genred each game has
SELECT game.game_id, game.name AS game_name, COUNT(game_genre.genre_id) AS num_genres
FROM game
LEFT JOIN game_genre ON game.game_id = game_genre.game_id
GROUP BY game.game_id;

-- cpmpanies that didnt develop games
SELECT company.company_id, company.name AS company_name
FROM company 
LEFT JOIN develop ON company.company_id = develop.company_id
WHERE develop.company_id IS NULL;
