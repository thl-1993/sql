/*Прежде чем продолжить, напишите оператор SQL, который возвращает пиццу и соответствующие названия пиццерий. 
См. пример результата ниже (сортировка не требуется).*/
/*Давайте докажем, что ваши индексы работают для вашего SQL.
Примером доказательства является вывод команды EXPLAIN ANALYZE.
Пожалуйста, взгляните на пример вывода команды.*/

SET enable_seqscan = true; -- включение посл. сканирования, будем читать всю таблицу последовательно
EXPLAIN ANALYZE --Команда, которая показывает план выполнения запроса и время выполнения.
SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON pizzeria.id=menu.pizzeria_id; --Объединяет таблицы pizzeria и menu по столбцу pizzeria_id
SET enable_seqscan = false; --выкл последовательное сканирование
EXPLAIN ANALYZE
SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON pizzeria.id=menu.pizzeria_id;