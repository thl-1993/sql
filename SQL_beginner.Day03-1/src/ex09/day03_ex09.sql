/*Пожалуйста, запишите новые посещения ресторана Domino's Денисом и Ириной 24 февраля 2022 года.
Внимание: это упражнение, скорее всего, приведет к неправильному изменению данных. */

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (SELECT MAX(person_visits.id) + 1 FROM person_visits),
    (SELECT person.id FROM person WHERE person.name = 'Denis'),
    (SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name = 'Dominos'),
    '2022-02-24'
);
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (SELECT MAX(person_visits.id) + 1 FROM person_visits),
    (SELECT person.id FROM person WHERE person.name = 'Irina'),
    (SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name = 'Dominos'),
    '2022-02-24'
);