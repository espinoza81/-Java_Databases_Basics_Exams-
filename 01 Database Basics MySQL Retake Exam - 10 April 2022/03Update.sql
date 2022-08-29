UPDATE movies_additional_info
SET runtime = 
	CASE 
    WHEN runtime - 10 < 0 
    THEN  0 
    ELSE runtime - 10 
    END 
WHERE id BETWEEN 15 AND 25;
