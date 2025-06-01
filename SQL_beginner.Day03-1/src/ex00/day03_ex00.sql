/*Напишите оператор SQL, который возвращает список названий пицц, цен на пиццы, 
названий пиццерий и дат посещения для Кати и для цен от 800 до 1000 рублей. 
Пожалуйста, отсортируйте по пицце, цене и названию пиццерии. данные ниже.*/

SELECT 
    menu.pizza_name,
    menu.price,
    pizzeria.name AS pizzeria_name,
    person_visits.visit_date
FROM 
    menu
JOIN 
    pizzeria ON pizzeria.id = menu.pizzeria_id --Соединяет таблицу menu с таблицей pizzeria по столбцу pizzeria_id.
JOIN 
    person_visits ON pizzeria.id = person_visits.pizzeria_id --Соединяет таблицу pizzeria с таблицей person_visits по столбцу pizzeria_id.
JOIN 
    person ON person_visits.person_id = person.id --Соединяет таблицу person_visits с таблицей person по столбцу person_id.
WHERE 
    person.name = 'Kate'
    AND menu.price BETWEEN 800 AND 1000
ORDER BY 
    menu.pizza_name, 
    menu.price, 
    pizzeria.name;