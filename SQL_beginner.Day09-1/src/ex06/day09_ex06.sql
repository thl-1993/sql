CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy', 
pprice numeric default 500, pdate date default '2022-01-08')
RETURNS TABLE(name varchar) AS $$
BEGIN
RETURN QUERY
    SELECT p.name AS pizzeria_name
    FROM menu INNER JOIN pizzeria p ON p.id = menu.pizzeria_id
        INNER JOIN person_visits pv ON menu.pizzeria_id = pv.pizzeria_id
        INNER JOIN person p2 ON p2.id = pv.person_id
    WHERE price < pprice AND p2.name = pperson AND visit_date = pdate;
END;
$$ LANGUAGE PLPGSQL;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');