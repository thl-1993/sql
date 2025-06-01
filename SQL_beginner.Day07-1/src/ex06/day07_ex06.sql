/*Напишите оператор SQL, который возвращает количество заказов, среднюю цену, максимальную цену и минимальную цену пиццы, продаваемой каждой пиццерией. Результат следует отсортировать по названию пиццерии. См. пример данных ниже.
Округлите среднюю цену до двух плавающих чисел.*/

SELECT 
    pizzeria.name AS pizzeria_name,
    COUNT(*) AS count_of_orders,
    ROUND(AVG(menu.price), 2) AS average_price,
    MAX(menu.price) AS max_price,
    MIN(menu.price) AS min_price
FROM 
    person_order
INNER JOIN 
    menu ON menu.id = person_order.menu_id
INNER JOIN 
    pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY 
    pizzeria.name
ORDER BY 
    pizzeria.name;