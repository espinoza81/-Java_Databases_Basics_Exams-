-- 10. Get user’s photos count 
CREATE FUNCTION udf_users_photos_count(username VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE photosCount INT;
	SET photosCount := (
		SELECT count(up.photo_id)
		FROM users_photos AS up
		JOIN users AS u
		ON u.id = up.user_id
		WHERE u.username = username);
  	RETURN photosCount;
END

-- 11. Increase user age
CREATE PROCEDURE udp_modify_user (address VARCHAR(30), town VARCHAR(30))
BEGIN
	UPDATE users AS u
		JOIN addresses AS a
		ON a.user_id = u.id
	SET u.age = u.age + 10
	WHERE a.address = address AND a.town = town;
END
