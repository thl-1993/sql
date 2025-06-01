/*Измените оператор SQL из «Упражнения 00», удалив столбец object_id. 
Затем измените порядок по имени объекта для части данных из таблицы person, 
а затем из таблицы меню (как показано в примере ниже).*/

--object
--UNION ALL

SELECT pizza_name AS object_name FROM menu 
UNION ALL
SELECT name AS object_name FROM person
ORDER BY object_name ASC;
