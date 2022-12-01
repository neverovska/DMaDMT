SELECT pizza_name FROM pizzas;
SELECT first_name, last_name FROM couriers;

SELECT id, phone FROM users WHERE role_id = 3;
SELECT * FROM categories WHERE price< 25;
SELECT cat_name, price FROM categories ORDER BY  price;
SELECT * FROM couriers WHERE availability = 1;
SELECT SUM(price) FROM categories WHERE cat_name NOT IN ('Legends');
SELECT car_number FROM personalcars ORDER BY courier_id LIMIT 1, 2;
SELECT courier_id FROM delivery WHERE time_from BETWEEN '11:00:00' AND '13:00:00';
SELECT DISTINCT first_name FROM customers;
SELECT first_name FROM couriers WHERE first_name LIKE('V%');

UPDATE users SET phone ='(44)6666666' WHERE id=6;
UPDATE delivery SET del_date = '2022-12-10' WHERE time_from<'13:00:00';

DROP TABLE logger;
DELETE FROM deliverytime WHERE del_to = '17:00:00' OR del_from > '17:00:00';
DELETE FROM pizzas;


