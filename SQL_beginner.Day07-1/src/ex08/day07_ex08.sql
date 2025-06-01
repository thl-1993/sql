/*Мы знаем личные адреса из наших данных. Предположим, что этот человек посещает только пиццерии своего города. Напишите оператор SQL, который возвращает адрес, название пиццерии и сумму заказов человека. Результат следует отсортировать по адресу, а затем по названию ресторана. Пожалуйста, взгляните на пример выходных данных ниже.*/

SELECT 
    person.address AS person_address,
    pizzeria.name AS pizzeria_name,
    COUNT(*) AS count_of_orders
FROM 
    person
INNER JOIN 
    person_order ON person.id = person_order.person_id
INNER JOIN 
    menu ON menu.id = person_order.menu_id
INNER JOIN 
    pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY 
    person.address, 
    pizzeria.name
ORDER BY 
    person.address, 
    pizzeria.name;