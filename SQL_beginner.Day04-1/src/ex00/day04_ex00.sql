/*Создайте 2 представления базы данных (с атрибутами, аналогичными исходной таблице) 
на основе простой фильтрации по полу людей. Установите соответствующие имена 
для представлений базы данных: v_persons_female и v_persons_male.*/
--CREATE создаёт таблицы, представления (view)
--VIEW -создаёт представления(view)(виртуальные таблицы)
CREATE VIEW v_person_male AS
SELECT * FROM person
WHERE person.gender = 'male';

CREATE VIEW v_person_female AS
SELECT * FROM person
WHERE person.gender = 'female';