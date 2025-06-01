/*Напишите оператор SQL, который возвращает список пиццерий, которые Андрей посетил, 
но не сделал заказ. Заказывайте по названию пиццерии.*/

WITH andrey_visit (pizzeria_name) AS (
    SELECT DISTINCT pizzeria.name
    FROM pizzeria
    JOIN person_visits ON pizzeria.id=person_visits.pizzeria_id
    JOIN person ON person.id=person_visits.person_id
    WHERE person.name = 'Andrey'
),
andrey_order (pizzeria_name) AS (
    SELECT DISTINCT pizzeria.name
    FROM pizzeria
    JOIN menu ON pizzeria.id=menu.pizzeria_id
    JOIN person_order ON menu.id=person_order.menu_id
    JOIN person ON person.id=person_order.person_id
    WHERE person.name = 'Andrey'
)
SELECT pizzeria_name 
FROM andrey_visit
EXCEPT
SELECT pizzeria_name
FROM andrey_order
