/*Напишите оператор SQL, который возвращает список имен людей, 
заказавших пиццу в соответствующей пиццерии.
Пример результата (с именованными столбцами) представлен ниже, и да... пожалуйста, 
упорядочите по 3 столбцам (имя_человека, имя_пиццы, название_пиццерии) в порядке возрастания.*/

SELECT p.name       AS person_name,
       m.pizza_name AS pizza_name,
       pz.name      AS pizzeria_name
FROM person_order po
         JOIN person p on po.person_id = p.id
         JOIN menu m on m.id = po.menu_id
         JOIN pizzeria pz on m.pizzeria_id = pz.id
ORDER BY person_name, pizza_name, pizzeria_name;