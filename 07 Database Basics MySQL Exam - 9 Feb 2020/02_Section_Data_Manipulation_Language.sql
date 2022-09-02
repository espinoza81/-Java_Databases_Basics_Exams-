-- 02. Insert 
INSERT INTO coaches (first_name, last_name, salary, coach_level)
SELECT first_name, last_name, salary * 2, length(first_name)
FROM players
WHERE age >= 45;

-- 03. Update 
UPDATE coaches AS c
LEFT JOIN players_coaches AS pc
ON c.id = pc.coach_id
SET c.coach_level = c.coach_level + 1
WHERE left(first_name, 1) = 'A' AND pc.player_id IS NOT NULL;

-- 04. Delete
