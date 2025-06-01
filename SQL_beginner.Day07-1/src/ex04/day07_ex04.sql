/*Напишите оператор SQL, который возвращает имя человека и соответствующее 
количество посещений любой пиццерии, если человек посетил более 3 раз (> 3). 
Пожалуйста, взгляните на пример данных ниже.*/

SELECT 
    person.name AS person_name, 
    COUNT(*) AS count_of_visits
FROM 
    person_visits
INNER JOIN 
    person ON person.id = person_visits.person_id
GROUP BY 
    person.name
HAVING 
    COUNT(*) > 3
ORDER BY 
    COUNT(*) DESC;