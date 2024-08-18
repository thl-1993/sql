/*создайте материализованное представление mv_dmitriy_visits_and_eats (с включенными данными) 
на основе оператора SQL, который находит название пиццерии, которую Дмитрий посетил 8 января 2022 года 
и мог есть пиццу менее чем за 800 рублей (этот SQL можно найти в День #02). Упражнение № 07).
Чтобы проверить себя, вы можете написать SQL в материализованное представление mv_dmitriy_visits_and_eats
 и сравнить результаты с предыдущим запросом.*/

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS  --создает материализованное представление, которое хранит данные физически
(
SELECT 
    pizzeria.name AS pizzeria_name
FROM 
    person_visits
INNER JOIN 
    person ON person_visits.person_id = person.id
INNER JOIN 
    pizzeria ON pizzeria.id = person_visits.pizzeria_id
INNER JOIN 
    menu ON pizzeria.id = menu.pizzeria_id
WHERE 
    person.name = 'Dmitriy'
    AND person_visits.visit_date = '2022-01-08'
    AND menu.price < 800
);