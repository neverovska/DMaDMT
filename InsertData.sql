USE pizzadelivery;
INSERT categories(cat_name, price)
VALUES
('Classic', 23),
('Premium', 28.5),
('Legends', 30.5);
INSERT pizzas(pizza_name, weight, composition, category_id) 
VALUES 
('Pepperoni', 515,'Tomato sauce, pepperoni, mozzarella cheese', 1),
('Ham&Mushrooms', 580,'Champignon, ham, mozzarella cheese, tomato sauce', 1),
('Tuskany', 540,'Tomatoes, feta, chicken, mozzarella cheese, garlic sauce, spinach', 2),
('4 seasons', 715,'Tomatoes, honey agaric, garlic sauce, pepperoni, shrimps, pineapple, mozzarella cheese, feta', 2),
('Meatzza', 585,'Bacon, mozzarella cheese, ham, parmesan, boiled pork, veal, pepperoni, tomato sauce', 3),
('Extravaganzza', 630,'Veal, champignon, mozzarella cheese, tomato sauce, bell pepper, pepperoni, onion, olives, ham', 3);
INSERT pizzerias(latitude_left, latitude_right, longitude_left, longitude_right, phone_number)
VALUES 
(53.918056,  53.909360, 27.552184, 27.574162, '(17)2346834'),
(53.908754, 53.896280, 27.574677, 27.592534, '(17)1845582');
INSERT roles(role)
VALUES
('admin'),
('courier'),
('customer');
INSERT users(phone, user_password, role_id)
VALUES
('(44)1111111', 'admin', 1),
('(29)2222222','12345', 2),
('(29)3333333','12345', 2),
('(29)4444444','12345', 2),
('(29)5555555','12345', 2),
('(29)6666666','12345', 3),
('(29)7777777','12345', 3),
('(29)8888888','12345', 3);
INSERT deliverytime(del_from, del_to)
VALUES 
('11:00:00','12:30:00'),
('12:30:00','14:00:00'),
('14:00:00','15:30:00'),
('15:30:00','17:00:00'),
('17:00:00','18:30:00'),
('18:30:00','20:00:00');
INSERT couriers(id, first_name, last_name, availability, pizzeria_id)
VALUES
(2,'Petr','Sidorenko', 1, 1),
(3, 'Dmitry', 'Novikov', 1, 1),
(4, 'Valeriy', 'Alexandrov', 1, 2),
(5, 'Vladislav', 'Kreed', 1, 2);
INSERT personalcars(courier_id, car_number, model)
VALUES
(2, '2222 AB-7', 'Renault Logan'),
(3,'3333 AC-7', 'Volkswagen Polo' ),
(4, '4444 AN-7', 'Kia Rio'),
(5, '5555 AM-7', 'Hyundai Solaris');
INSERT customers(id, first_name, last_name, latitude, longitude, street, house, flat, email)
VALUES 
(6, 'Alexandra', 'Neverovskaya', 53.907473, 27.579484, 'Polevaya', 32, DEFAULT, '6@gmail.com'),
(7, 'Maria', 'Koslova', 53.926109,27.609031 , 'Solnechnaya', 5, 39, '7@gmail.com'),
(8, 'Georgiy', 'Voronich', 53.916253, 27.557296, 'Bolshaya', 101 , 89, '8@gmail.com' );
INSERT cart(totalprice, customer_id)
VALUES
(DEFAULT, 6),
(DEFAULT, 8);
INSERT delivery(del_date, time_from, courier_id, cart_id)
VALUES 
('2022-12-12', '12:30:00', 5, 1),
('2022-12-11', '14:00:00', 2, 2);
INSERT cart_pizzas(cart_id, pizza_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4);
