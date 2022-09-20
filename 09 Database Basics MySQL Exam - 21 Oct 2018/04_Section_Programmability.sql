-- 15. Get colonists count
CREATE FUNCTION udf_count_colonists_by_destination_planet (planet_name VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE count_colonists INT;
	SET count_colonists := (
		SELECT count(c.id)
		FROM colonists AS c
		JOIN travel_cards AS tc
		ON c.id = tc.colonist_id
		JOIN journeys AS j
		ON j.id = tc.journey_id
        JOIN spaceports AS s
        ON j.destination_spaceport_id = s.id
        JOIN planets AS p
        ON p.id = s.planet_id
        WHERE p.`name` = planet_name);
  	RETURN count_colonists;
END

-- 16. Modify spaceship
CREATE PROCEDURE udp_modify_spaceship_light_speed_rate(spaceship_name VARCHAR(50), light_speed_rate_increse INT(11))
BEGIN
    if (SELECT count(ss.name) FROM spaceships ss WHERE ss.name = spaceship_name > 0) THEN
        UPDATE spaceships ss
        SET ss.light_speed_rate = ss.light_speed_rate + light_speed_rate_increse
        WHERE name = spaceship_name;
    ELSE
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Spaceship you are trying to modify does not exists.';
    END IF;
END;
