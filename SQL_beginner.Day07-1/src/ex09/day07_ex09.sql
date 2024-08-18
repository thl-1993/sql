/*Напишите оператор SQL, который возвращает агрегированную информацию по адресу человека, результат «Максимальный возраст - (Минимальный возраст / Максимальный возраст)», представленный в виде столбца формулы, затем средний возраст по адресу и результат сравнения между столбцами формулы и среднего значения. (другими словами, если формула больше среднего, то значение True, в противном случае — значение False).
Результат должен быть отсортирован по столбцу адреса. Пожалуйста, взгляните на пример выходных данных ниже.*/

WITH cte AS (
    SELECT 
        person.address AS person_address,
        ROUND(MAX(person.age)::NUMERIC - (MIN(person.age)::NUMERIC / MAX(person.age)::NUMERIC), 2) AS formula,
        ROUND(AVG(person.age), 2) AS average_age
    FROM 
        person
    GROUP BY 
        person.address
)

SELECT 
    person_address,
    formula,
    average_age,
    formula > average_age AS comparison
FROM 
    cte
ORDER BY 
    person_address;