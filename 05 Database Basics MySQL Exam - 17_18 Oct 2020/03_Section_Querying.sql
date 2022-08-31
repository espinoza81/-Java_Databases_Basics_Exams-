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
