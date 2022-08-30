-- 10. Extract client cards count 
CREATE FUNCTION udf_customer_products_count(name VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE total_products INT;
    SEt total_products := (
		SELECT count(op.product_id)
        FROM orders_products AS op
        JOIN orders AS o
        ON op.order_id = o.id
        JOIN customers AS c
        ON o.customer_id = c.id
        WHERE c.first_name = `name`
    );
    RETURN total_products;
END

-- 11. Reduce price
