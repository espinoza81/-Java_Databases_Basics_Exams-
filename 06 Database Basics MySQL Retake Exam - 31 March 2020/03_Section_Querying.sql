-- 05. Users 
SELECT username, gender, age
FROM users
ORDER BY age DESC, username;

-- 06. Extract 5 most commented photos
SELECT p.id, p.`date`, p.`description`, count(c.id) AS commentsCount
FROM comments AS c
JOIN photos AS p
ON c.photo_id = p.id
GROUP BY c.photo_id
ORDER BY commentsCount DESC, p.id
LIMIT 5;

-- 07. Lucky users
SELECT concat_ws(' ', u.id, u.username) AS id_username, u.email
FROM users AS u
JOIN users_photos AS up
ON u.id = up.user_id
WHERE up.user_id = up.photo_id
ORDER BY u.id;

-- 08. Count likes and comments 
