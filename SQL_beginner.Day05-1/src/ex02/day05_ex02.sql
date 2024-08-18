/*Создайте функциональный индекс B-Tree с именем idx_person_name для имени столбца таблицы person. 
Индекс должен содержать имена людей в верхнем регистре.
Напишите и предоставьте любой SQL с доказательством (EXPLAIN ANALYZE) того, что индекс idx_person_name работает.*/
-- DROP INDEX idx_person_name;
CREATE INDEX idx_person_name ON person (UPPER(name)); -- upper делает верхний регистр
SET enable_seqscan = false;

EXPLAIN ANALYZE
SELECT 
    person.name AS person_name,
    person.address,
    person_order.order_date,
    menu.pizza_name,
    menu.price,
    pizzeria.name AS pizzeria_name,
    pizzeria.rating
FROM 
    person
INNER JOIN 
    person_order ON person.id = person_order.person_id
INNER JOIN 
    menu ON menu.id = person_order.menu_id
INNER JOIN 
    pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE 
    UPPER(person.name) = 'KATE';