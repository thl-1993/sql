/*Добавьте следующие правила ограничений для существующих столбцов таблицы person_discounts.

Столбец person_id не должен иметь значение NULL (используйте имя ограничения ch_nn_person_id);
Столбец pizzeria_id не должен иметь значение NULL (используйте имя ограничения ch_nn_pizzeria_id);
Столбец скидки не должен иметь значение NULL (используйте имя ограничения ch_nn_discount);
По умолчанию в столбце скидки должно быть 0 процентов;
Столбец скидки должен находиться в диапазоне значений от 0 до 100 (используйте имя ограничения ch_range_discount).*/

ALTER TABLE person_discounts
    ADD CONSTRAINT ch_nn_person_id CHECK ( person_id IS NOT NULL ),
    ADD CONSTRAINT ch_nn_pizzeria_id CHECK ( pizzeria_id IS NOT NULL ),
    ADD CONSTRAINT ch_nn_discount CHECK ( discount IS NOT NULL),
    ADD CONSTRAINT ch_range_discount CHECK ( discount BETWEEN 0 AND 100),
    ALTER COLUMN discount SET DEFAULT 0;



/*
ALTER TABLE-изменения структуры существующей таблицы
ADD CONSTRAINT-Используется для добавления ограничений (constraints) к таблице, таких как PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK и DEFAULT.
ALTER COLUMN-Используется для изменения свойств существующих столбцов в таблице, таких как тип данных, значение по умолчанию или возможность быть NULL.
*/