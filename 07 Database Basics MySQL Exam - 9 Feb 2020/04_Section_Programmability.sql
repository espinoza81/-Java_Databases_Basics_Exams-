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
CREATE PROCEDURE udp_find_playmaker (min_dribble_points INT, team_name VARCHAR (45))
BEGIN
	SELECT concat_ws(' ', first_name, last_name) AS full_name, age, salary, sd.dribbling, sd.speed,	t.`name`
   	FROM players AS p
    		JOIN skills_data AS sd
    		ON p.skills_data_id = sd.id
    		JOIN teams AS t
    		ON p.team_id = t.id
    	WHERE sd.dribbling > min_dribble_points 
		AND t.`name` = team_name 
		AND sd.speed > (SELECT avg(speed) FROM skills_data)
    	ORDER BY sd.speed DESC
    	LIMIT 1;
END
