/*Найдите пиццерии, которые чаще посещают женщины или мужчины. 
Сохраните дубликаты для любых операторов SQL с наборами 
(конструкции UNION ALL, EXCEPT ALL, INTERSECT ALL. 
Отсортируйте результат по названию пиццерии).*/

WITH pizzeria_gender (name, gender) AS (
    SELECT pizzeria.name, person.gender
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person.id = person_visits.person_id
),
male_pizzerias(name) AS (
    SELECT name 
    FROM pizzeria_gender
    WHERE gender = 'male'
),
female_pizzerias(name) AS (
    SELECT name 
    FROM pizzeria_gender
    WHERE gender = 'female'
),
male_only_pizzerias(pizzeria_name) AS (
    SELECT name 
    FROM male_pizzerias
    EXCEPT ALL
    SELECT name
    FROM female_pizzerias
),
female_only_pizzerias(pizzeria_name) AS (
    SELECT name
    FROM female_pizzerias
    EXCEPT ALL
    SELECT name
    FROM male_pizzerias
)
SELECT *
FROM male_only_pizzerias
UNION ALL
SELECT *
FROM female_only_pizzerias
ORDER BY pizzeria_name;