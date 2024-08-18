/*Напишите оператор SQL, который возвращает заказы с фактической ценой и ценой со скидкой, 
применяемой для каждого человека в соответствующей пиццерии, отсортированные по имени человека и названию пиццы. См. пример данных ниже.*/

SELECT 
    person.name AS person_name,
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    menu.price * (100 - person_discounts.discount) / 100 AS discount_price,
    pizzeria.name AS pizzeria_name
FROM 
    person_order
JOIN 
    menu ON menu.id = person_order.menu_id
JOIN 
    person ON person.id = person_order.person_id
JOIN 
    pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN 
    person_discounts ON person.id = person_discounts.person_id
    AND person_discounts.pizzeria_id = pizzeria.id
ORDER BY 
    person.name, 
    menu.pizza_name;