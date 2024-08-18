/*Перепишите оператор SQL из упражнения № 07, используя конструкцию NATURAL JOIN. 
Результат должен быть таким же, как и в упражнении № 07.*/

SELECT order_date,
    CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM person_order
    NATURAL JOIN (SELECT id AS person_id, name, age FROM person) AS P
ORDER BY order_date, person_information ASC;