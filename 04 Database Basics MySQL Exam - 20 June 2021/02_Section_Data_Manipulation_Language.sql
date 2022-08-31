-- 02. Insert
INSERT INTO clients (full_name, phone_number)
SELECT concat_ws(' ', first_name, last_name), concat('(088) 9999', id*2)
FROM drivers
WHERE id BETWEEN 10 AND 20;

-- 03. Update 

    
-- 04. Delete
