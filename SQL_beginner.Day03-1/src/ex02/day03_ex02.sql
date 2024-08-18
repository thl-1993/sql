/*Используйте оператор SQL из упражнения № 01 и отобразите названия пицц из пиццерии, 
которые никто не заказал, включая соответствующие цены. 
Результат должен быть отсортирован по названию и цене.*/

SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
WHERE menu.id NOT IN (SELECT person_order.menu_id
    FROM person_order
    GROUP BY person_order.menu_id)
ORDER BY menu.pizza_name, menu.price;