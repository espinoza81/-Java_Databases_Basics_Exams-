-- 02. Insert
INSERT INTO products_stores
SELECT p.id, 1
FROM products AS p
LEFT JOIN products_stores AS ps 
ON p.id = ps.product_id
WHERE ps.store_id IS NULL;

-- 03. Update
UPDATE employees 
SET manager_id = 3, salary = salary - 500
WHERE year(hire_date) > 2003 AND store_id NOT IN (5, 14);

-- 04. Delete
DELETE 
FROM employees
WHERE salary >= 6000 AND manager_id IS NOT NULL;
