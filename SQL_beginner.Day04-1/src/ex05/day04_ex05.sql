/*Создайте представление базы данных v_price_with_discount, которое возвращает заказы 
человека с именем человека, названием пиццы, реальной ценой и расчетным столбцом 
Discount_price (с примененной скидкой 10% и удовлетворяющей формулой ценой - цена*0,1. 
Отсортируйте результат по именам людей и). названия пиццы и преобразуйте столбец Discount_price в целочисленный тип.*/

CREATE VIEW v_price_with_discount AS
(
SELECT 
    person.name AS name,
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    ROUND(menu.price - menu.price * 0.1) AS discount_price
FROM 
    person
JOIN 
    person_order ON person.id = person_order.person_id
JOIN 
    menu ON menu.id = person_order.menu_id
ORDER BY 
    person.name, menu.pizza_name
);

-- SELECT *
-- FROM v_price_with_discount;
-- DROP VIEW IF EXISTS v_price_with_discount;