-- 10. Find all basic information for a game
CREATE FUNCTION udf_game_info_by_name (game_name VARCHAR (20))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE info VARCHAR (255);
	DECLARE team_name VARCHAR (40);
	DECLARE address_text VARCHAR (50);
	
  SET team_name := (SELECT t.`name`
        FROM teams AS t 
        JOIN games AS g 
        ON g.team_id = t.id 
        WHERE g.`name` = game_name);
	
  SET address_text := (SELECT a.`name`
        FROM addresses AS a
        JOIN offices AS o
        ON a.id = o.address_id
        JOIN teams AS t
        ON o.id = t.office_id
        WHERE t.`name` = team_name);
    
  SET info := concat_ws(' ', 'The', game_name, 'is developed by a', team_name, 'in an office with an address', address_text);
  RETURN info;
END

-- 11. Update Budget of the Games
