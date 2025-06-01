/*Просим зарегистрировать новые заказы всех лиц на «греческую пиццу» 25 февраля 2022 года.
Внимание: это упражнение, вероятно, приведет к неправильному изменению данных.*/

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    person.id + (SELECT COUNT(person_order.id) FROM person_order),
    person.id,
    (SELECT menu.id FROM menu WHERE menu.pizza_name = 'greek pizza'),
    '2022-02-25'::date
FROM 
    person;