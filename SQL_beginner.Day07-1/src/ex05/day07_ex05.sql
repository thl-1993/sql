/*Напишите простой SQL-запрос, который возвращает список уникальных имен людей, 
разместивших заказы в любых пиццериях. Результат должен быть отсортирован по имени человека. См. пример ниже.*/

SELECT DISTINCT name
FROM person_order po
         INNER JOIN person p ON p.id = po.person_id
ORDER BY name;
