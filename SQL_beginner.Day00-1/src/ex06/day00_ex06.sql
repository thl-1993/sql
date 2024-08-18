--Используйте конструкцию SQL из упражнения 05 и добавьте новый вычисляемый столбец 
-- (используйте имя столбца «check_name») с оператором проверки 
-- (псевдокод для этой проверки приведен ниже) в предложении SELECT.

SELECT (SELECT p.name
        FROM person AS p
        WHERE p.id = o.person_id) AS NAME,
       (SELECT (CASE
                    WHEN p.name = 'Denis' THEN true
                    ELSE false END)
        FROM person AS p
        WHERE p.id = o.person_id) AS check_name
FROM person_order AS o
WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18)
  AND order_date = '2022-01-07';
