-- 10. Find name of top paid employee by store name
CREATE FUNCTION udf_top_paid_employee_by_store(store_name VARCHAR(50))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE full_info VARCHAR (255);
	DECLARE full_name  VARCHAR (40);
	DECLARE years INT;
	DECLARE employee_id INT;
    
	SET employee_id := (
		SELECT e.id
		FROM employees AS e
		JOIN stores AS s
		ON e.store_id = s.id
		WHERE s.`name` = store_name
		ORDER BY e.salary DESC
		LIMIT 1);
        
	SET full_name := (
		SELECT concat_ws(' ', first_name, concat(middle_name, '.'), last_name)
		FROM employees AS e
    WHERE e.id = employee_id);
	
  SET years := (
		SELECT floor(DATEDIFF("2020-10-18", hire_date)/365)
		FROM employees AS e
		WHERE e.id = employee_id);
    
  SET full_info := concat_ws(' ', full_name, 'works in store for', years, 'years');
  RETURN full_info;
END

-- 11. Update product price by address
