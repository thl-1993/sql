--Напишите оператор select, который возвращает имена людей (на основе внутреннего запроса в предложении SELECT), 
--которые разместили заказы на меню с идентификаторами 13, 14 и 18, а дата заказов должна быть 7 января 2022 года. 
--Будьте осторожны с «Запрещенным разделом» перед работой.

SELECT (SELECT p.name
        FROM person AS p
        WHERE p.id = o.person_id) AS NAME
        FROM person_order as o
WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) AND order_date = '2022-01-07'