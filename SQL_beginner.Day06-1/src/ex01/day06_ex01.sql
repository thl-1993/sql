/*есть таблица person_order, в которой хранится история заказов человека. 
Напишите оператор DML (INSERT INTO... SELECT...), который вставляет новые записи в таблицу person_discounts на основе следующих правил.
Возьмите агрегированное состояние из столбцов person_id и pizzeria_id.
Рассчитайте величину персональной скидки по следующему псевдокоду:
если «количество заказов» = 1, то «скидка» = 10,5 иначе, если «количество заказов» = 2, то «скидка» = 22, иначе «скидка» = 30
Чтобы создать первичный ключ для таблицы person_discounts, используйте следующую конструкцию SQL (эта конструкция взята из раздела SQL WINDOW FUNCTION).
... ROW_NUMBER( ) OVER ( ) AS id ...*/

INSERT INTO person_discounts --вставляем данные 
SELECT 
    ROW_NUMBER() OVER() AS id, 
    person_order.person_id AS person_id,
    menu.pizzeria_id AS pizzeria_id,
    CASE 
        WHEN COUNT(*) = 1 THEN 10.5
        WHEN COUNT(*) = 2 THEN 22
        ELSE 30
        END AS discount
FROM person_order 
INNER JOIN menu ON person_order.menu_id = menu.id
GROUP BY person_order.person_id, menu.pizzeria_id;
SELECT *
FROM person_discounts;


-- SELECT count(*) > 0 as check
-- from person_discounts














/*
ROW_NUMBER():

Это оконная функция (window function), которая назначает уникальный номер (начиная с 1) каждой строке в результирующем наборе запроса.
Номера присваиваются в порядке, в котором строки возвращаются запросом.
OVER ():

Ключевое слово OVER указывает, что функция ROW_NUMBER() является оконной функцией.
Пустые скобки () означают, что функция ROW_NUMBER() применяется ко всему набору результатов без разделения на отдельные группы (partitions) или упорядочения строк.

CASE: Выражение CASE используется для вычисления значения столбца discount на основе количества заказов (COUNT(*)).
WHEN COUNT(*) = 1 THEN 10.5: Если количество заказов равно 1, то скидка составляет 10.5.
WHEN COUNT(*) = 2 THEN 22: Если количество заказов равно 2, то скидка составляет 22.
ELSE 30: В остальных случаях (если количество заказов больше 2), скидка составляет 30.
*/