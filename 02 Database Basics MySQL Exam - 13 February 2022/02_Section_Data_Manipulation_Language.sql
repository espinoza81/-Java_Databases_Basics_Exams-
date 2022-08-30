-- 02. Insert
INSERT INTO reviews (content, rating , picture_url, published_at)
SELECT left(`description`, 15), price/8, reverse(`name`), '2010-10-10'
FROM products
WHERE id >= 5;

-- 03. Update
UPDATE products
SET quantity_in_stock = quantity_in_stock - 5
WHERE quantity_in_stock BETWEEN 60 AND 70;

-- 04. Delete
DELETE c
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL;
