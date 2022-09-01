-- 02. Insert
INSERT INTO addresses (address, town, country, user_id)
SELECT username, `password`, ip, age
FROM users 
WHERE gender = 'M';

-- 03. Update
UPDATE addresses
SET country = 
	CASE
		WHEN left(country, 1) = 'B' THEN 'Blocked'
        	WHEN left(country, 1) = 'T' THEN 'Test'
        	WHEN left(country, 1) = 'P' THEN 'In Progress'
        	ELSE country
	END;
  
-- 04. Delete
