/*Найдите имена всех женщин, которые заказывали пиццу с пепперони и сыром 
(в любое время и в любых пиццериях). Убедитесь, что результат упорядочен по имени человека.*/

WITH cheese (name) AS (
    SELECT person.name
    FROM person_order
    JOIN person ON person.id = person_order.person_id
    JOIN menu ON menu.id = person_order.menu_id
    WHERE person.gender = 'female'
      AND menu.pizza_name = 'cheese pizza'
),

pepperoni (name) AS (
    SELECT person.name
    FROM person_order
    JOIN person ON person.id = person_order.person_id
    JOIN menu ON menu.id = person_order.menu_id
    WHERE person.gender = 'female'
      AND menu.pizza_name = 'pepperoni pizza'
)

SELECT 
    cheese.name
FROM 
    cheese
JOIN 
    pepperoni ON cheese.name = pepperoni.name
ORDER BY 
    cheese.name;