--Session #1
BEGIN
    ISOLATION LEVEL READ COMMITTED;
--Session #2
BEGIN
    ISOLATION LEVEL READ COMMITTED;

--Session #1
SELECT SUM(rating)
FROM pizzeria;

--Session #2
UPDATE pizzeria
SET rating = 1
WHERE name = 'Pizza Hut';
COMMIT;

--Session #1
SELECT SUM(rating)
FROM pizzeria;
COMMIT;

--Session #1
SELECT SUM(rating)
FROM pizzeria;
--Session #1
SELECT SUM(rating)
FROM pizzeria;