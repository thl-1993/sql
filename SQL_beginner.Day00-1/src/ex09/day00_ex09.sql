--Создайте оператор выбора, который возвращает имена людей и названия пиццерий 
-- на основе таблицы person_visits с датой посещения в период с 7 по 9 января 2022 г. 
-- (включая все дни) (на основе внутреннего запроса в предложении FROM).

SELECT 
    (SELECT name FROM person WHERE person_visits.person_id = person.id) AS person_name,
    (SELECT name FROM pizzeria WHERE pizzeria.id = person_visits.pizzeria_id) AS pizzeria_name
FROM person_visits
WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09'
ORDER BY person_name ASC, pizzeria_name DESC
