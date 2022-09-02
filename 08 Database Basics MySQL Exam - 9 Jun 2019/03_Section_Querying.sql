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
SELECT c.id, concat_ws(' ', c.card_number, ':', cl.full_name) AS card_token
FROM cards AS c
JOIN bank_accounts AS ba
ON c.bank_account_id = ba.id
JOIN clients AS cl
ON ba.client_id = cl.id
ORDER BY c.id DESC;

-- 08. Top 5 Employees
SELECT concat_ws(' ', first_name, last_name) AS `name`, started_on, count(ec.client_id) AS count_of_clients
FROM employees AS e
JOIN employees_clients AS ec
ON e.id = ec.employee_id
GROUP BY e.id
ORDER BY count_of_clients DESC, e.id
LIMIT 5;

-- 09. Branch cards
