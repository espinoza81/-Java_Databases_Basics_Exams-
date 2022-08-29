UPDATE movies_additional_info
SET runtime = 
	CASE 
    WHEN runtime - 10 < 0 
    THEN  0 
    ELSE runtime - 10 
    END 
WHERE id >= 15 AND id <= 25;
