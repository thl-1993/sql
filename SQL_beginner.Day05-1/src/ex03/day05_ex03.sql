/*Создайте лучший индекс B-дерева с несколькими столбцами с именем idx_person_order_multi для приведенного ниже оператора SQL.*/
/*SELECT person_id, menu_id,order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;
*/
/*Команда EXPLAIN ANALYZE должна возвращать следующий шаблон. Обратите внимание на сканирование "Index Only Scan" .*/

CREATE INDEX idx_person_order_multi 
ON person_order (person_id, menu_id, order_date);

-- Выполнение запроса и анализ его выполнения с использованием EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT 
    person_order.person_id, -- Выборка столбца person_id из таблицы person_order
    person_order.menu_id, -- Выборка столбца menu_id из таблицы person_order
    person_order.order_date -- Выборка столбца order_date из таблицы person_order
FROM 
    person_order -- Указание таблицы, из которой выполняется выборка
WHERE 
    person_order.person_id = 8 -- Условие для выборки строк, где значение столбца person_id равно 8
    AND person_order.menu_id = 19; -- Условие для выборки строк, где значение столбца menu_id равно 19