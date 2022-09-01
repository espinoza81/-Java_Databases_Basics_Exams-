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
