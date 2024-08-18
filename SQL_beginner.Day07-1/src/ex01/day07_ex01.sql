/*Измените оператор SQL из упражнения 00 и верните имя человека (а не идентификатор). 
Дополнительный пункт: нам нужно видеть только 4 лучших человека с максимальным количеством 
посещений в каждой пиццерии, отсортированных по имени человека. См. пример выходных данных ниже.*/

SELECT person.name AS person_name,
COUNT(*) AS count_of_visits
FROM person_visits
JOIN person ON person.id=person_visits.person_id
GROUP BY person.name
ORDER BY count_of_visits DESC, person.name
LIMIT 4; --Ограничивает количество строк в результате запроса до 4. То есть, возвращаются только первые 4 строки из отсортированного результата.