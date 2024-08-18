/*Давайте вернемся к упражнению № 03 и изменим наш оператор SQL, 
чтобы он возвращал имена людей вместо идентификаторов людей, и изменим порядок по action_date 
в возрастающем режиме, а затем по person_name в нисходящем режиме.*/

SELECT order_date AS action_date,
    (SELECT name FROM person
    WHERE person_id = id) AS person_name
    FROM person_order
INTERSECT
SELECT visit_date AS action_date,
    (SELECT name FROM person
    WHERE person_id = id) AS person_name
    FROM person_visits
ORDER BY action_date ASC, person_name DESC;


