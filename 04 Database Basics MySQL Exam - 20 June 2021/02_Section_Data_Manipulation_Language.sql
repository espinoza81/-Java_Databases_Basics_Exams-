-- 02. Insert
INSERT INTO clients (full_name, phone_number)
SELECT concat_ws(' ', first_name, last_name), concat('(088) 9999', id*2)
FROM drivers
WHERE id BETWEEN 10 AND 20;

-- 03. Update 
UPDATE cars
SET `condition` = 'C'
WHERE (mileage >= 800000 OR mileage IS NULL) AND `year` <= 2010 AND make NOT LIKE 'Mercedes-Benz';
    
-- 04. Delete
