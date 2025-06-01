/*Напишите оператор SQL, который возвращает общие строки для атрибутов order_date, person_id 
из таблицы person_orders с одной стороны и visit_date, person_id из таблицы person_visits 
с другой стороны (другими словами, давайте найдем идентификаторы людей, которые это делают). 
посетили и заказали пиццу в тот же день. На самом деле, добавьте заказ по action_date в возрастающем режиме, 
а затем по person_id в нисходящем режиме.*/

--INTERSECT

SELECT order_date AS action_date, person_id FROM person_order
INTERSECT
SELECT visit_date AS action_date, person_id FROM person_visits
ORDER BY action_date ASC, person_id DESC;