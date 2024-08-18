/*Напишите оператор SQL, который возвращает уникальные названия пиццы из таблицы меню 
и сортирует их по столбцу Pizza_name в порядке убывания. 
Обратите внимание на раздел «Запрещено».*/

SELECT pizza_name FROM menu
UNION
SELECT pizza_name FROM menu
ORDER BY pizza_name DESC;


