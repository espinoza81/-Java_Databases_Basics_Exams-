-- 05. Categories
SELECT * 
FROM categories
ORDER BY `name` DESC;

-- 06. Quantity
SELECT id, brand_id, `name`, quantity_in_stock 
FROM products
WHERE price > 1000 AND quantity_in_stock < 30
ORDER BY quantity_in_stock, id;

-- 07. Review
SELECT id, content,	rating,	picture_url, published_at 
FROM reviews
WHERE left(content, 2) = 'My' AND length(content) > 61
ORDER BY rating DESC;

-- 08. First customers

-- 09. Best categories
