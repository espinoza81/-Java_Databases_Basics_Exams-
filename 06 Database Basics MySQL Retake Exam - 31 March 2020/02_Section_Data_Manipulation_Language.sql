-- 02. Insert
INSERT INTO addresses (address, town, country, user_id)
SELECT username, `password`, ip, age
FROM users 
WHERE gender = 'M';

-- 03. Update
