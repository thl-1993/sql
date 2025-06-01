/*SQL-оператор, который будет возвращать весь список имен людей, 
которые посещали (или не посещали) пиццерии в период с 1 по 3 января 2022 года 
с одной стороны и весь список названий посещенных пиццерий ( или не посещал) с другой стороны. 
Ниже показан образец данных с необходимыми именами столбцов. Обратите внимание 
на значение замены «-» для значений NULL в столбцах person_name и pizzeria_name. 
Также добавьте порядок для всех 3. столбцы.*/

--COALESCE Возвращает первый элемент списка не равный NULL пример SELECT COALESCE(NULL, NULL, 1, 2);
SELECT 
    COALESCE(person.name, '-') AS person_name,
    person_visits.visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM 
    person
LEFT JOIN 
    person_visits ON person.id = person_visits.person_id 
    AND (person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-03')
FULL JOIN 
    pizzeria ON person_visits.pizzeria_id = pizzeria.id
ORDER BY 
    person_name, 
    person_visits.visit_date, 
    pizzeria_name;


