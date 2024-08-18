/*Напишите оператор SQL, чтобы видеть в списке 3 любимых ресторана по посещениям 
и заказам (добавьте столбец action_type со значениями «заказ» или «посещение», 
это зависит от данных из соответствующей таблицы). Пожалуйста, взгляните на пример 
данных ниже. Результат должен быть отсортирован по возрастанию по столбцу action_type 
и по убыванию по столбцу count.*/

(
    SELECT 
        pizzeria.name AS pizzeria_name,
        COUNT(*) AS count,
        'visit' AS action_type
    FROM 
        person_visits
    INNER JOIN 
        pizzeria ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY 
        pizzeria.name
    ORDER BY 
        count DESC
    LIMIT 
        3
)
UNION
(
    SELECT 
        pizzeria.name AS pizzeria_name,
        COUNT(*) AS count,
        'order' AS action_type
    FROM 
        person_order
    INNER JOIN 
        menu ON menu.id = person_order.menu_id
    INNER JOIN 
        pizzeria ON pizzeria.id = menu.pizzeria_id
    GROUP BY 
        pizzeria.name
    ORDER BY 
        count DESC
    LIMIT 
        3
)
ORDER BY action_type, count DESC;