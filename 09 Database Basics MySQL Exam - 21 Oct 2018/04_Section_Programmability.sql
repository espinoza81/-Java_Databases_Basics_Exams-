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
