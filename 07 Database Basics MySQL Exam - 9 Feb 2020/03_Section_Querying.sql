-- 05. Players 
SELECT first_name, age, salary
FROM players
ORDER BY salary DESC;

-- 06. Young offense players without contract 
SELECT p.id, concat_ws(' ', first_name, last_name) AS full_name, age, position, hire_date
FROM players AS p
JOIN skills_data AS s
ON p.skills_data_id = s.id
WHERE age < 23 AND position = 'A' AND hire_date IS NULL AND s.strength > 50
ORDER BY salary, age;

-- 07. Detail info for all teams 
SELECT `name`, established, fan_base, 
	(SELECT count(id)
    	FROM players
    	WHERE team_id = t.id) AS players_count
FROM teams AS t
ORDER BY players_count DESC, fan_base DESC;

-- 08. The fastest player by towns
