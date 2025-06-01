/*Найдите объединение пиццерий, у которых есть заказы как от женщин, 
так и от мужчин. Другими словами, вам нужно найти набор названий пиццерий, 
которые заказывали только женщины, и выполнить операцию «СОЮЗ» с набором названий заказанных пиццерий. 
только для мужчин. Пожалуйста, будьте осторожны со словом «только» для обоих полов. 
Для всех операторов SQL с наборами не сохраняйте дубликаты (UNION, EXCEPT, INTERSECT). 
Пожалуйста, отсортируйте результат по названию пиццерии. показано ниже.*/

WITH pizzeria_gender(pizzeria_name, gender) AS(
    SELECT pizzeria.name, person.gender
    FROM pizzeria
    JOIN menu ON pizzeria.id=menu.pizzeria_id
    JOIN person_order ON menu.id=person_order.menu_id
    JOIN person ON person.id=person_order.person_id
),
male_pizzerias(pizzeria_name) AS (
    SELECT pizzeria_name
    FROM pizzeria_gender
    WHERE gender = 'male'
),
female_pizzerias(pizzeria_name) AS (
    SELECT pizzeria_name
    FROM pizzeria_gender
    WHERE gender = 'female'
),
male_exlusive_pizzerias (pizzeria_name) AS (
    SELECT pizzeria_name
    FROM male_pizzerias
    EXCEPT
    SELECT pizzeria_name
    FROM female_pizzerias
),
female_exlusive_pizzerias (pizzeria_name) AS (
    SELECT pizzeria_name
    FROM female_pizzerias
    EXCEPT
    SELECT pizzeria_name
    FROM male_pizzerias
)
SELECT *
FROM male_exlusive_pizzerias
UNION
SELECT *
FROM female_exlusive_pizzerias
ORDER BY pizzeria_name;
