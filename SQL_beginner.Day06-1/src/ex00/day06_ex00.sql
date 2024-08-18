/*Давайте добавим новую бизнес-функцию в нашу модель данных.
Каждый человек хочет видеть персональную скидку, а каждый бизнес хочет быть ближе для клиентов.
Подумайте о персональных скидках для людей с одной стороны и пиццерий с другой. Необходимо создать новую реляционную таблицу (задайте имя person_discounts) со следующими правилами.
Установите атрибут id как первичный ключ (пожалуйста, посмотрите столбец id в существующих таблицах и выберите тот же тип данных).
Установите атрибуты person_id и pizzeria_id как внешние ключи для соответствующих таблиц (типы данных должны быть такими же, как для столбцов id в соответствующих родительских таблицах).
Задайте явные имена для ограничений внешнего ключа, используя шаблон fk_{table_name}_{column_name}, например fk_person_discounts_person_id.
Добавьте атрибут скидки для хранения значения скидки в процентах. Помните, что значение скидки может быть числом с плавающей запятой (просто используйте числовой тип данных), чтобы учесть эту возможность.*/

CREATE TABLE person_discounts(
    id BIGINT PRIMARY KEY, --bigint тип данных
    person_id BIGINT,
    pizzeria_id BIGINT,
    discount numeric, --Тип данных для хранения чисел с плавающей запятой
    constraint fk_person_duscounts_person_id FOREIGN KEY (person_id) REFERENCES person(id),
    /*Это определение внешнего ключа для столбца person_id.
    constraint fk_person_discounts_person_id: Имя ограничения внешнего ключа.
    foreign key (person_id): Указывает, что столбец person_id является внешним ключом.
    references person (id): Указывает, что person_id ссылается на столбец id в таблице person.*/
    constraint fk_person_discounts_pizzeria_id foreign key (pizzeria_id) references pizzeria (id)
    /*Имя ограничения внешнего ключа.
    foreign key (pizzeria_id): Указывает, что столбец pizzeria_id является внешним ключом.
    references pizzeria (id): Указывает, что pizzeria_id ссылается на столбец id в таблице pizzeria.*/
);
-- SELECT count(*) = 1 as check
-- FROM pg_tables
-- WHERE tablename = 'person_discounts'