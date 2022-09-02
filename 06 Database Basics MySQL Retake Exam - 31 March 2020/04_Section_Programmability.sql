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
