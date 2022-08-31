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
