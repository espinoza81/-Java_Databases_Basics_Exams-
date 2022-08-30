-- 05. Employees
SELECT first_name, last_name, age, salary, happiness_level
FROM employees
ORDER BY salary, id;

-- 06. Addresses of the teams
SELECT t.`name`, a.`name`, length(a.`name`)
FROM teams AS t
JOIN offices AS o
ON t.office_id = o.id
JOIN addresses AS a
ON o.address_id = a.id
WHERE o.website IS NOT NULL
ORDER BY t.`name`, a.`name`;

-- 07. Categories Info
SELECT c.`name`, 
	count(gc.game_id) AS games_count,
    	round(avg(g.budget), 2) AS avg_budget,
    	max(g.rating) AS max_rating
FROM games AS g
JOIN games_categories AS gc
ON gc.game_id = g.id
JOIN categories AS c
ON gc.category_id = c.id
GROUP BY c.id
HAVING max_rating >= 9.5
ORDER BY games_count DESC, c.`name`;

-- 08. Games of 2022
SELECT g.`name`, 
	g.release_date, 
    	concat(left(g.`description`, 10), '...') AS summary,
    	CASE
		WHEN month(g.release_date) BETWEEN 1 AND 3 THEN 'Q1'
		WHEN month(g.release_date) BETWEEN 4 AND 6 THEN 'Q2'
		WHEN month(g.release_date) BETWEEN 7 AND 9 THEN 'Q3'
        	ELSE 'Q4'
    	END AS `quarter`,
    	t.`name`
FROM games AS g
JOIN teams AS t
ON g.team_id = t.id
WHERE right(g.`name`, 1) = '2'
	AND year(g.release_date) = 2022
    	AND month(g.release_date) % 2 = 0
ORDER BY `quarter`;

-- 09. Full info for games
