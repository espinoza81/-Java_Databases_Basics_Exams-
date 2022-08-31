-- 10. Find all courses by client’s phone number 
CREATE FUNCTION udf_courses_by_client (phone_num VARCHAR (20)) 
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE count INT;
	SET count := (SELECT count(c.id)
        	FROM courses AS c 
        	JOIN clients AS cl 
        	ON c.client_id = cl.id 
        	WHERE cl.phone_number = phone_num);
  	RETURN count;
END;

-- 11. Full info for address 
CREATE PROCEDURE udp_courses_by_address (address_name VARCHAR(100))
BEGIN
	SELECT a.`name`, c.full_name, 
		CASE
			WHEN co.bill <= 20 THEN 'Low'
			WHEN co.bill <= 30 THEN 'Medium'
            	ELSE 'High'
        END AS level_of_bill, ca.make, ca.condition, cat.`name`
	FROM courses AS co
	JOIN addresses AS a
	ON a.id = co.from_address_id
	LEFT JOIN clients AS c
	ON co.client_id = c.id
	LEFT JOIN cars AS ca
	ON co.car_id = ca.id
	LEFT JOIN categories AS cat
	ON ca.category_id = cat.id
	WHERE a.`name` = address_name
	ORDER BY ca.make, c.full_name;
END
