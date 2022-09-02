-- 05. Clients 
SELECT id, full_name
FROM clients
ORDER BY id;

-- 06. Newbies 
SELECT id, concat_ws(' ', first_name, last_name) AS full_name, concat('$', salary) AS salary_prefiks, started_on
FROM employees
WHERE salary >= 100000 AND started_on >= '2018-01-01'
ORDER BY salary DESC, id;

-- 07. Cards against Humanity
