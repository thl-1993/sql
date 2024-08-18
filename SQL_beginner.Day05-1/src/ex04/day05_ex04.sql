/*Создайте уникальный индекс BTree с именем idx_menu_unique в таблице меню 
для столбцов pizzeria_id и Pizza_name. Напишите и предоставьте любой SQL-код с 
доказательством (EXPLAIN ANALYZE) того, что индекс idx_menu_unique работает.*/
-- DROP INDEX idx_menu_unique;
CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);
EXPLAIN ANALYZE
SELECT *
FROM menu
ORDER BY pizzeria_id, pizza_name;

