/*Напишите оператор SQL, который возвращает список пиццерий 
с соответствующим значением рейтинга, которые еще не посещали люди.*/

SELECT 
    pizzeria.name, 
    pizzeria.rating 
FROM 
    pizzeria
LEFT JOIN 
    person_visits ON pizzeria.id = person_visits.pizzeria_id 
WHERE 
    person_visits.id IS NULL;