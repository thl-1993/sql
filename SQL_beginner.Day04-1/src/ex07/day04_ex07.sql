/*Давайте обновим данные в нашем материализованном представлении mv_dmitriy_visits_and_eats из упражнения № 06. Перед этим действием создайте еще одно посещение Дмитрия, которое удовлетворяет предложению SQL материализованного представления, за исключением пиццерии, которую мы видим в результате упражнения № 06.
После добавления нового посещения обновите состояние данных для mv_dmitriy_visits_and_eats.*/

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (SELECT MAX(person_visits.id) + 1 FROM person_visits),
    (SELECT person.id FROM person WHERE person.name = 'Dmitriy'),
    (SELECT pizzeria.id
     FROM pizzeria
     JOIN menu ON pizzeria.id = menu.pizzeria_id
     WHERE pizzeria.name NOT IN (
         SELECT mv_dmitriy_visits_and_eats.pizzeria_name
         FROM mv_dmitriy_visits_and_eats
     )
     AND menu.price < 800
     LIMIT 1),
    '2022-01-08'::DATE
);