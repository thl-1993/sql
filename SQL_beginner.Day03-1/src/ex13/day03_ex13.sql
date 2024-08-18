/*Напишите два оператора SQL (DML), которые удаляют все новые заказы из упражнения № 12 в зависимости от даты заказа. Затем удалите из меню «греческую пиццу».*/

DELETE
FROM person_order
WHERE order_date = '2022-02-25';

-- SELECT *
-- FROM person_order;

DELETE
FROM menu
WHERE pizza_name = 'greek pizza';

-- SELECT *
-- FROM menu;