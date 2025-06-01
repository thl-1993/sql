/*Напишите оператор SQL, который возвращает дату заказа из таблицы person_order 
и соответствующее имя человека (имя и возраст имеют формат Andrey (age:21)),
который сделал заказ из таблицы person. Добавьте сортировку по обоим столбцам в порядке возрастания.*/

SELECT order_date,
    (SELECT CONCAT(p.name, ' (age:', p.age, ')')
    FROM person p
    WHERE p.id=person_order.person_id) AS person_information
FROM person_order
ORDER BY order_date, person_information ASC;