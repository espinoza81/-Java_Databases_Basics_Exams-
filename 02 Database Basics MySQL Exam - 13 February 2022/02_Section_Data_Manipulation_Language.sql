-- 02. Insert
INSERT INTO reviews (content, rating , picture_url, published_at)
SELECT left(`description`, 15), price/8, reverse(`name`), '2010-10-10'
FROM products
WHERE id >= 5;

-- 03. Update
