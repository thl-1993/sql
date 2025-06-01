/*На самом деле нам необходимо улучшить согласованность данных с одной стороны и настройку производительности с другой. 
Создайте уникальный индекс с несколькими столбцами (с именем idx_person_discounts_unique), который предотвратит дублирование пар идентификаторов человека и пиццерии.
После создания нового индекса предоставьте любой простой оператор SQL, подтверждающий использование индекса (с помощью EXPLAIN ANALYZE).*/

CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);
SET
    enable_seqscan = off;
EXPLAIN ANALYZE
SELECT person_id, pizzeria_id
FROM person_discounts;