-- 02. Insert 
INSERT INTO actors (first_name, last_name, birthdate, height, awards, country_id)
SELECT reverse(first_name), reverse(last_name), date_sub(birthdate, INTERVAL 2 DAY), height + 10, country_id, (SELECT id FROM countries WHERE `name` LIKE 'Armenia')
    FROM actors
    WHERE id <= 10;

-- 03. Update 
UPDATE movies_additional_info
SET runtime = 
	CASE 
    WHEN runtime - 10 < 0 
    THEN  0 
    ELSE runtime - 10 
    END 
WHERE id BETWEEN 15 AND 25;

-- 04. Delete
DELETE c
FROM countries AS c
LEFT JOIN movies AS m
ON c.id = m.country_id 
WHERE m.country_id IS NULL;

-- 05. Countries
SELECT * 
FROM countries
ORDER BY currency DESC, id;

-- 06. Old movies
SELECT m.id, m.title, i.runtime, i.budget, i.release_date
FROM movies_additional_info AS i
JOIN movies AS m USING (id)
WHERE year(release_date) BETWEEN 1996 AND 1999
ORDER BY runtime, id
LIMIT 20;

-- 07. Movie casting
SELECT 
	concat_ws(' ', first_name, last_name) AS full_name, 
	concat(reverse(last_name), length(last_name), '@cast.com') AS email,
    	2022 - year(birthdate) AS age,
    	height
FROM actors
LEFT JOIN movies_actors AS m 
ON id = m.actor_id
WHERE actor_id IS NULL
ORDER BY height;

-- 08. International festival
SELECT c.`name`, count(m.id) AS movies_count
FROM movies AS m
LEFT JOIN countries AS c 
ON m.country_id = c.id
GROUP BY m.country_id
HAVING movies_count >= 7
ORDER BY c.`name` DESC;

-- 09. Rating system
