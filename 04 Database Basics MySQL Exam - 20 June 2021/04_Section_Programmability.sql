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
