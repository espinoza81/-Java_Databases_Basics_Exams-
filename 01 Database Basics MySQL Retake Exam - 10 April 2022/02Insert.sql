INSERT INTO actors (first_name, last_name, birthdate, height, awards, country_id)
SELECT reverse(first_name), reverse(last_name), date_sub(birthdate, INTERVAL 2 DAY), height + 10, country_id, (SELECT id FROM countries WHERE `name` LIKE 'Armenia')
    FROM actors
    WHERE id <= 10;
