/*Найдите одинаковые названия пицц с одинаковой ценой, но из разных пиццерий. 
Убедитесь, что результаты упорядочены по названию пиццы. 
Пример данных показан ниже. Убедитесь, что имена столбцов совпадают с именами столбцов ниже.*/

WITH cte_pizza (pizza_name, pizzeria_name, price) AS (
    SELECT 
        menu.pizza_name, 
        pizzeria.name AS pizzeria_name, 
        menu.price
    FROM 
        menu
    JOIN 
        pizzeria ON pizzeria.id = menu.pizzeria_id
    GROUP BY 
        menu.pizza_name, 
        pizzeria.name, 
        menu.price
)

SELECT 
    cte_pizza_1.pizza_name,
    cte_pizza_1.pizzeria_name AS pizzeria_name_1,
    cte_pizza_2.pizzeria_name AS pizzeria_name_2,
    cte_pizza_1.price
FROM 
    cte_pizza AS cte_pizza_1
JOIN 
    cte_pizza AS cte_pizza_2
ON 
    (cte_pizza_1.pizza_name = cte_pizza_2.pizza_name
    AND cte_pizza_1.price = cte_pizza_2.price
    AND cte_pizza_1.pizzeria_name < cte_pizza_2.pizzeria_name)
ORDER BY 
    cte_pizza_1.pizza_name;