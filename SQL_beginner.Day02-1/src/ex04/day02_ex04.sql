/*Найдите полную информацию обо всех возможных названиях и ценах пиццерий, 
чтобы получить пиццу с грибами или пепперони. 
Затем отсортируйте результат по названию пиццы и названию пиццерии. 
Результат примера данных показан ниже (используйте те же имена столбцов в своем операторе SQL).*/

SELECT 
    m.pizza_name,
    p.name AS pizzeria_name,
    m.price
FROM 
    menu m
JOIN 
    pizzeria p ON p.id = m.pizzeria_id
WHERE 
    m.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY 
    m.pizza_name, 
    pizzeria_name;