-- 05. Employees 
SELECT first_name, middle_name, last_name, salary, hire_date
FROM employees
ORDER BY hire_date DESC;

-- 06. Products with old pictures
SELECT p.`name`, p.price, p.best_before, concat(left(p.`description`, 10), '...') AS short_description, pi.url
FROM products AS p
JOIN pictures AS pi
ON p.picture_id = pi.id
WHERE length(p.`description`) > 100 AND year(pi.added_on) < 2019 AND p.price > 20
ORDER BY p.price DESC;

-- 07. Counts of products in stores
SELECT s.`name`, count(ps.product_id) AS product_count,	round(avg(p.price), 2) AS `avg`
FROM stores AS s
LEFT JOIN products_stores AS ps
ON s.id = ps.store_id
LEFT JOIN products AS p
ON ps.product_id = p.id
GROUP BY s.id
ORDER BY product_count DESC, `avg` DESC, s.id;

-- 08. Specific employee
SELECT concat_ws(' ', e.first_name, e.last_name) AS Full_name, 	s.`name`, a.`name`,	e.salary
FROM employees AS e
JOIN stores AS s
ON s.id = e.store_id
JOIN addresses AS a
ON s.address_id = a.id
WHERE e.salary < 4000 AND locate(5, a.`name`) > 0 AND length(s.`name`) > 8 AND right(e.last_name, 1) = 'n';

-- 09. Find all information of stores 
