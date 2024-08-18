-- DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
-- DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
-- DELETE FROM person WHERE id = 10;
-- DROP TABLE person_audit;

 create table person_audit
      (
      created timestamp with time zone not null default current_timestamp,
      type_event char(1) not null default 'I',
      row_id      bigint not null ,
      name    varchar ,
      age     integer ,
      gender  varchar ,
      address varchar,
      constraint ch_type_event check ( type_event in ('I','U', 'D') )
      );

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit( )
      RETURNS TRIGGER AS
      $BODY$
      BEGIN
      INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
      VALUES(current_timestamp,'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
      RETURN NULL;
      END;
      $BODY$
      LANGUAGE plpgsql;

  CREATE  TRIGGER trg_person_insert_audit
      AFTER    INSERT ON person FOR EACH ROW
      EXECUTE FUNCTION  fnc_trg_person_insert_audit( );
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
  select * from person_audit


/*
CREATE TABLE person_audit 
timestamp with time zone: Тип данных для столбца created. Этот тип данных хранит дату и время с учетом часового пояса.
NOT NULL: Ограничение, указывающее, что столбец не может содержать значение NULL, т.е. он всегда должен иметь значение.
DEFAULT current_timestamp: Значение по умолчанию для столбца. current_timestamp возвращает текущую дату и время, и это значение будет автоматически вставляться в столбец created, если явное значение не указано при вставке строки.
type_event: Имя столбца.
char(1): Тип данных для столбца type_event. Это символьный тип данных фиксированной длины 1.
NOT NULL: Ограничение, указывающее, что столбец не может содержать значение NULL.
DEFAULT 'I': Значение по умолчанию для столбца type_event. Если при вставке строки значение для этого столбца не указано, будет использовано значение 'I'.
CONSTRAINT ch_type_event: Имя ограничения для столбца. Ограничения могут иметь имена, чтобы их можно было легко идентифицировать.
CHECK (type_event IN ('I', 'D', 'U')): Ограничение CHECK, которое проверяет, что значение столбца type_event является одним из значений: 'I', 'D', или 'U'.
row_id: Имя столбца.
bigint: Тип данных для столбца row_id. Это целочисленный тип данных, который может хранить большие целые числа.
varchar: символьный тип данных

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS $$
CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger: Создает функцию с именем fnc_trg_person_insert_audit, которая возвращает тип данных trigger.
AS $$ ... $$ LANGUAGE plpgsql: Определяет тело функции на языке plpgsql.
BEGIN: Начало блока PL/pgSQL. В этом блоке находятся все инструкции, которые выполняет функция.
INSERT INTO person_audit (row_id, name, age, gender, address) VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address): Вставляет новые значения в таблицу person_audit. NEW содержит значения новой строки, которая вставляется в таблицу person.
RETURN NEW: Возвращает новую строку, чтобы вставка могла продолжиться.
trigger. Это специальный тип данных, используемый для функций, которые вызываются триггерами.
$$ ... $$: Делимитеры для определения тела функции. В PostgreSQL можно использовать $$ как разделители для тела функции. Это позволяет избежать экранирования одинарных кавычек внутри тела функции. 
INSERT INTO person_audit (...) для вставки новой записи в тиблицу. NEW это спец запись доступная в триггерных функциях.
RETURN NEW: Возвращает новую строку, чтобы вставка могла продолжиться. Это необходимо для завершения работы триггера.
END: Конец блока PL/pgSQL.
LANGUAGE plpgsql: Указывает, что функция написана на языке PL/pgSQL

CREATE TRIGGER trg_person_insert_audit
CREATE TRIGGER trg_person_insert_audit: Создает триггер с именем trg_person_insert_audit.
AFTER INSERT ON person: Указывает, что триггер будет выполняться после вставки новой строки в таблицу person.
FOR EACH ROW: Указывает, что триггер будет выполняться для каждой вставленной строки.
EXECUTE PROCEDURE fnc_trg_person_insert_audit(): Указывает, что триггер будет выполнять функцию fnc_trg_person_insert_audit.
INSERT INTO
SELECT
*/