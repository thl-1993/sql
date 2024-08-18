/*Найдите имена всех мужчин из Москвы или Самары, которые заказывают пепперони или пиццу с грибами 
(или и то, и другое). Отсортируйте результат по именам людей в порядке убывания.*/

SELECT 
    person.name 
FROM
    person_order
JOIN    
    person ON person.id=person_order.person_id
JOIN
    menu ON menu.id=person_order.menu_id
WHERE
    person.gender = 'male'
    AND person.address IN ('Moscow', 'Samara')
    AND menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY person.name DESC;