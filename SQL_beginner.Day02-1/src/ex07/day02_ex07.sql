/*Найдите название пиццерии, которую Дмитрий посетил 8 января 2022 года 
и где мог съесть пиццу менее чем за 800 рублей.*/

SELECT 
    pizzeria.name AS pizzeria_name
FROM 
    person_visits
INNER JOIN 
    person ON person_visits.person_id = person.id
INNER JOIN 
    pizzeria ON person_visits.pizzeria_id = pizzeria.id
INNER JOIN 
    menu ON pizzeria.id = menu.pizzeria_id
WHERE 
    person.name = 'Dmitriy'
    AND person_visits.visit_date = '2022-01-08'
    AND menu.price < 800;