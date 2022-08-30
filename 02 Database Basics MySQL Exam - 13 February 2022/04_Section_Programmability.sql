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
CREATE PROCEDURE udp_reduce_price(category_name VARCHAR(50))
BEGIN
	UPDATE products AS p
	JOIN categories AS c
    ON c.id = p.category_id
    JOIN reviews AS r
    ON p.review_id = r.id
    SET p.price = p.price * 0.7
	WHERE r.rating < 4.00 AND c.`name` = category_name;
END
