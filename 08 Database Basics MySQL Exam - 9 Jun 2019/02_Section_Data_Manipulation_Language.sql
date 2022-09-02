-- 02. Insert 
INSERT INTO cards (card_number, card_status, bank_account_id)
SELECT reverse(full_name), 'Active', id
FROM clients 
WHERE id BETWEEN 191 AND 200;

-- 03. Update
UPDATE employees_clients
SET employee_id = (SELECT * 
                   FROM (SELECT employee_id 
			FROM employees_clients
                   	GROUP BY employee_id
                   	ORDER BY count(client_id), employee_id
                   	LIMIT 1) 
                   AS s)
WHERE client_id = employee_id;

-- 04. Delete 
DELETE e
FROM employees AS e
LEFT JOIN employees_clients AS ec
ON e.id = ec. employee_id
WHERE ec.client_id IS NULL;
