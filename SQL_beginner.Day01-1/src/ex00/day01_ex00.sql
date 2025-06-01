/*Напишите оператор SQL, который возвращает идентификатор меню и названия пиццы из таблицы меню, 
а также идентификатор человека и имя человека из таблицы person в одном глобальном списке 
(с именами столбцов, как показано в примере ниже), 
упорядоченном по object_id, а затем по object_name. столбцы.*/

--object
--UNION

SELECT id AS object_id, pizza_name AS object_name FROM menu
UNION
SELECT id AS object_id, name AS object_name FROM person
ORDER BY object_id ASC, object_name ASC;
