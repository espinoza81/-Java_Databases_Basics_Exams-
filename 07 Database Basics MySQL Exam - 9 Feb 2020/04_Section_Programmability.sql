-- 10. Find all players that play on stadium
CREATE FUNCTION udf_stadium_players_count (stadium_name VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE count INT;
	
	SET count := (
		SELECT count(p.id)
		FROM stadiums AS s
		JOIN teams AS t
		ON t.stadium_id = s.id
        JOIN players AS p
        ON p.team_id = t.id
        WHERE s.`name` = stadium_name);
        
  	RETURN count;
END

-- 11. Find good playmaker by teams 
