CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

WITH jumlah_item AS (
    SELECT item, COUNT(*) AS purchase_count
    FROM item_bought
    GROUP BY item
)

SELECT item
FROM jumlah_item
WHERE purchase_count NOT IN (
    SELECT MAX(purchase_count)
    FROM jumlah_item
) AND purchase_count NOT IN (
    SELECT MIN(purchase_count)
    FROM jumlah_item
);
