-- 02. Insert
INSERT INTO games (`name`, rating , budget, team_id)
SELECT lower(reverse(substr(`name`, 2))), id, leader_id * 1000, id
FROM teams
WHERE id BETWEEN 1 AND 9;

-- 03. Update 
UPDATE employees AS e
LEFT JOIN teams AS t
ON e.id = t.leader_id
SET e.salary = e.salary + 1000
WHERE t.leader_id IS NOT NULL 
	AND e.salary < 5000
    	AND e.age <= 40;
    
-- 04. Delete
