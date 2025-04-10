/*Давайте создадим последовательность базы данных с именем seq_person_discounts (начиная со значения 1) и 
установим значение по умолчанию для атрибута id таблицы person_discounts, чтобы каждый раз автоматически брать значение из seq_person_discounts.
Обратите внимание, что ваш следующий порядковый номер равен 1. В этом случае установите фактическое 
значение для последовательности базы данных на основе формулы «количество строк в таблице person_discounts» + 1. 
В противном случае вы получите ошибки, связанные с ограничением нарушения первичного ключа.*/

CREATE SEQUENCE seq_person_discounts
    INCREMENT 1
    START 1;

SELECT setval('seq_person_discounts', (SELECT max(id) FROM person_discounts));

ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');













/*SEQUENCE — это специальный объект базы данных, который используется для генерации последовательных чисел. Эти числа обычно используются для создания уникальных идентификаторов для строк в таблицах. SEQUENCE обеспечивает автоматическое увеличение значений при каждой их генерации.
CREATE SEQUENCE: Создает новую последовательность.
NEXTVAL: Возвращает следующее значение последовательности и увеличивает её текущее значение.
CURRVAL: Возвращает текущее значение последовательности (без увеличения).
SETVAL: Устанавливает текущее значение последовательности.*/