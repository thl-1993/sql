/*Найдите все идентификаторы меню, которые никем не упорядочены. 
Результат должен быть отсортирован по идентификатору.*/

SELECT menu.id AS menu_id
FROM menu
WHERE menu.id NOT IN (SELECT menu_id
    FROM person_order
    GROUP BY menu_id);