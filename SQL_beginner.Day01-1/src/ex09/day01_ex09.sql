/*Напишите 2 оператора SQL, которые возвращают список пиццерий, 
которые не посещали люди, используя IN для первого и EXISTS для второго.*/

SELECT name FROM pizzeria
WHERE id NOT IN (SELECT pizzeria_id FROM person_visits);

SELECT name FROM pizzeria
WHERE NOT EXISTS (SELECT pizzeria_id FROM person_visits
    WHERE person_visits.pizzeria_id = pizzeria.id);