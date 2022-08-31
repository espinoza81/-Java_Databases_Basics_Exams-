-- 05. Cars
SELECT make, model, `condition`
FROM cars
ORDER BY id;

-- 06. Drivers and Cars
SELECT d.first_name, d.last_name, c.make, c.model, c.mileage
FROM drivers AS d
JOIN cars_drivers AS cd
ON d.id = cd.driver_id
JOIN cars AS c
ON cd.car_id = c.id
WHERE c.mileage IS NOT NULL
ORDER BY c.mileage DESC, d.first_name;

-- 07. Number of courses 
SELECT c.id, c.make, c.mileage, count(co.id) AS	count_of_courses, round(avg(co.bill), 2) AS avg_bill
FROM cars AS c
LEFT JOIN courses AS co
ON c.id = co.car_id
GROUP BY c.id
HAVING count_of_courses <> 2
ORDER BY count_of_courses DESC, c.id;

-- 08. Regular clients
SELECT c.full_name, count(co.id) AS count_of_cars,	sum(co.bill) AS total_sum
FROM clients AS c
JOIN courses AS co
ON c.id = co.client_id
GROUP BY c.id
HAVING count_of_cars > 1 AND SUBSTR(c.full_name, 2, 1) LIKE 'a'
ORDER BY c.full_name;

-- 09. Full info for courses
SELECT a.`name`, 
		IF(hour(co.`start`) BETWEEN 6 AND 20, 'Day', 'Night') AS day_time,
        co.bill, c.full_name, ca.make, ca.model, cat.`name`
FROM courses AS co
JOIN addresses AS a
ON a.id = co.from_address_id
LEFT JOIN clients AS c
ON co.client_id = c.id
LEFT JOIN cars AS ca
ON co.car_id = ca.id
LEFT JOIN categories AS cat
ON ca.category_id = cat.id
ORDER BY co.id;
