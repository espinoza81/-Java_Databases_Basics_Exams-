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
