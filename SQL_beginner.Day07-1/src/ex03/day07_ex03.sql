/*Напишите оператор SQL, чтобы увидеть, как рестораны группируются по посещениям и заказам и объединяются по названию ресторана.
Вы можете использовать внутренний SQL из упражнения 02 (Рестораны по посещениям и по заказам) без каких-либо ограничений на количество строк.
Кроме того, добавьте следующие правила.

Посчитайте сумму заказов и посещений соответствующей пиццерии (обратите внимание, что не все ключи пиццерий представлены в обеих таблицах).
Отсортируйте результаты по столбцу total_count в порядке убывания и по столбцу имени в порядке возрастания.
Взгляните на пример данных ниже.*/

SELECT 
    COALESCE(visits.pizzeria_name, orders.pizzeria_name) AS pizzeria_name, 
    COALESCE(visits.count_of_visits, 0) + COALESCE(orders.count_of_orders, 0) AS total_count
FROM 
    (
        SELECT 
            pizzeria.name AS pizzeria_name, 
            COUNT(*) AS count_of_visits
        FROM 
            person_visits
        INNER JOIN 
            pizzeria ON pizzeria.id = person_visits.pizzeria_id
        GROUP BY 
            pizzeria.name
    ) AS visits
FULL JOIN 
    (
        SELECT 
            pizzeria.name AS pizzeria_name, 
            COUNT(*) AS count_of_orders
        FROM 
            person_order
        INNER JOIN 
            menu ON person_order.menu_id = menu.id
        INNER JOIN 
            pizzeria ON menu.pizzeria_id = pizzeria.id
        GROUP BY 
            pizzeria.name
    ) AS orders 
ON visits.pizzeria_name = orders.pizzeria_name
ORDER BY 
    total_count DESC, 
    pizzeria_name ASC;