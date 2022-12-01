CREATE DATABASE PizzaDelivery;
USE PizzaDelivery;
CREATE TABLE IF NOT EXISTS pizzerias (
id INTEGER AUTO_INCREMENT PRIMARY KEY, 
latitude_left DECIMAL(8,6) NOT NULL,
latitude_right DECIMAL(8,6) NOT NULL ,
longitude_left DECIMAL(9,6) NOT NULL,
longitude_right DECIMAL(9,6) NOT NULL,
phone_number VARCHAR(11) NOT NULL,
CONSTRAINT pizzeria_left_lat_chk CHECK(latitude_left>-90 and latitude_left<90),
CONSTRAINT pizzeria_right_lat_chk CHECK(latitude_right>-90 and latitude_right<90),
CONSTRAINT pizzeria_left_long_chk  CHECK(longitude_left>-180 and longitude_left<180),
CONSTRAINT pizzeria_right_long_chk  CHECK(longitude_right>-180 and longitude_right<180),
CONSTRAINT pizzeria_phone_chk  CHECK(phone_number LIKE('([0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]')));
CREATE TABLE IF NOT EXISTS couriers (
id INT PRIMARY KEY, 
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
availability BOOLEAN,
pizzeria_id INT,
CONSTRAINT pizzeria_fk FOREIGN KEY (pizzeria_id) REFERENCES pizzerias (id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT user_courier_fk FOREIGN KEY (id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS personalCars(
car_number VARCHAR(9) UNIQUE NOT NULL,
model VARCHAR(50) NOT NULL,
courier_id INT PRIMARY KEY ,
CONSTRAINT courier_fk FOREIGN KEY (courier_id) REFERENCES couriers (id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS categories(
id INT AUTO_INCREMENT PRIMARY KEY,
cat_name VARCHAR(50) UNIQUE NOT NULL,
price DECIMAL(5,2) NOT NULL,
CONSTRAINT categories_price_check CHECK(price > 0)
);
CREATE TABLE IF NOT EXISTS pizzas(
id INT AUTO_INCREMENT PRIMARY KEY,
pizza_name VARCHAR(50) UNIQUE NOT NULL,
weight TINYINT NOT NULL,
composition TINYTEXT,
category_id INT,
CONSTRAINT pizzas_weight_chk CHECK(weight > 0 and weight < 2000),
CONSTRAINT category_fk FOREIGN KEY (category_id) REFERENCES categories (id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS roles(
id INT AUTO_INCREMENT PRIMARY KEY,
role VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS users(
id INT AUTO_INCREMENT PRIMARY KEY,
phone VARCHAR(11) UNIQUE NOT NULL,
user_password VARCHAR(20) NOT NULL,
role_id INT,
CONSTRAINT user_phone_chk  CHECK(phone LIKE('([0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
CONSTRAINT user_phone_uq UNIQUE(phone),
CONSTRAINT roles_fk FOREIGN KEY (role_id) REFERENCES roles (id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS logger(
id INT AUTO_INCREMENT PRIMARY KEY,
message TINYTEXT NULL,
user_id INT,
CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS customers(
id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
latitude DECIMAL(8,6) NOT NULL ,
longitude DECIMAL(9,6) NOT NULL,
street VARCHAR(50) NOT NULL,
house TINYINT NOT NULL,
flat TINYINT DEFAULT 0,
email VARCHAR (50) NOT NULL,
CONSTRAINT user_customer_fk FOREIGN KEY (id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT customer_lat_chk CHECK(latitude>-90 and latitude<90),
CONSTRAINT customer_long_chk  CHECK(longitude>-180 and longitude<180),
CONSTRAINT customer_house CHECK(house>0 AND house<1000),
CONSTRAINT customer_flat CHECK(flat<1000),
CONSTRAINT customer_email CHECK(email IN('@'))
);
CREATE TABLE IF NOT EXISTS cart(
id INT AUTO_INCREMENT PRIMARY KEY,
totalprice DECIMAL(10,2) NOT NULL,
customer_id INT,
CONSTRAINT cart_totalprice CHECK(totalprice>0),
CONSTRAINT cart_customer_fk FOREIGN KEY (customer_id) REFERENCES customers (id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS deliveryTime(
del_from TIME PRIMARY KEY,
del_to TIME NOT NULL
);
CREATE TABLE IF NOT EXISTS delivery(
id INT AUTO_INCREMENT PRIMARY KEY,
del_date DATE NOT NULL,
time_from TIME,
courier_id INT,
cart_id INT,
CONSTRAINT del_time_fk FOREIGN KEY (time_from) REFERENCES deliveryTime (del_from) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT del_courier_fk FOREIGN KEY (courier_id) REFERENCES couriers (id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT del_cart_fk FOREIGN KEY (cart_id) REFERENCES cart (id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS cart_pizzas(
	cart_id INT REFERENCES cart (id) ON UPDATE CASCADE ON DELETE CASCADE,
	pizza_id INT REFERENCES pizzas (id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT cart_pizzas_pk PRIMARY KEY(cart_id, pizza_id)
);
