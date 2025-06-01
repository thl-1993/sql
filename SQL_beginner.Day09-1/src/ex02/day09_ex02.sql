-- DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
-- DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
-- DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit;

DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;
CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS
$BODY$
BEGIN
INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
VALUES(current_timestamp,'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
RETURN NULL;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person FOR EACH ROW
EXECUTE FUNCTION  fnc_trg_person_delete_audit();
DELETE FROM person WHERE id = 10;


select * from person_audit order by created;
