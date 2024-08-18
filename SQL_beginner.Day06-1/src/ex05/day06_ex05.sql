/*Чтобы соответствовать политике управления данными, вам необходимо добавить комментарии к таблице и ее столбцам. 
Давайте применим эту политику к таблице person_discounts. Пожалуйста, добавьте комментарии н
а английском или русском языке (на ваше усмотрение), объясняющие, какова бизнес-цель таблицы и всех ее атрибутов.*/

COMMENT
    ON TABLE person_discounts IS 'Персональные скидки системы лояльности';
COMMENT
    ON COLUMN person_discounts.id IS 'Первичный ключ';
COMMENT
    ON COLUMN person_discounts.person_id IS 'ID клиента';
COMMENT
    ON COLUMN person_discounts.pizzeria_id IS 'ID пиццерии';
COMMENT
    ON COLUMN person_discounts.discount IS 'Скидка в процентах';



--проверка
-- SELECT obj_description('person_discounts'::regclass, 'pg_class') AS table_comment;
-- -- Запрос для просмотра комментариев столбцов
-- SELECT 
--     column_name, 
--     col_description('person_discounts'::regclass, ordinal_position) AS column_comment
-- FROM 
--     information_schema.columns
-- WHERE 
--     table_name = 'person_discounts';