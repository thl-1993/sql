-- DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
-- DROP FUNCTION IF EXISTS fnc_trg_person_update_audit;
-- Создание или замена функции для триггера


CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
RETURNS TRIGGER AS
$BODY$
BEGIN
    INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
    VALUES(current_timestamp,'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    RETURN NULL;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit
AFTER UPDATE ON person FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
SELECT * FROM person_audit;


/*
CREATE OR REPLACE FUNCTION: Создает новую функцию или заменяет существующую функцию с таким же именем.
RETURNS TRIGGER: Указывает, что функция возвращает тип данных TRIGGER




*/