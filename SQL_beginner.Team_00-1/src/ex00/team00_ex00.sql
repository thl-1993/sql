DROP VIEW IF EXISTS view_way;
DROP TABLE IF EXISTS nodes;

CREATE TABLE nodes (
    id serial PRIMARY KEY,
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INTEGER NOT NULL
);

INSERT INTO nodes 
VALUES 
    (DEFAULT, 'a', 'b', 10), 
    (DEFAULT, 'b', 'a', 10), 
    (DEFAULT, 'a', 'c', 15),
    (DEFAULT, 'c', 'a', 15),
    (DEFAULT, 'a', 'd', 20),
    (DEFAULT, 'd', 'a', 20),
    (DEFAULT, 'b', 'c', 35),
    (DEFAULT, 'c', 'b', 35),
    (DEFAULT, 'b', 'd', 25),
    (DEFAULT, 'd', 'b', 25),
    (DEFAULT, 'c', 'd', 30),
    (DEFAULT, 'd', 'c', 30);

SELECT * FROM nodes;

CREATE VIEW view_way AS (
    WITH RECURSIVE rec_way (
        rec_way_p1,
        rec_way_p2,
        way_nodes_str,
        cost,
        level
    ) AS (
        (
            SELECT point1,
                   point1,
                   point1,
                   0,
                   1
            FROM nodes
            WHERE point1 = 'a'
        )
        UNION ALL (
            SELECT point1,
                   point2,
                   rec_way.way_nodes_str || ',' || nodes.point2,
                   rec_way.cost + nodes.cost,
                   level + 1
            FROM rec_way
            JOIN nodes ON rec_way.rec_way_p2 = nodes.point1
            WHERE rec_way.rec_way_p1 != nodes.point2 
              AND (
                  level < 4
                  OR (
                      level = 4
                      AND nodes.point2 = 'a'
                  )
              )
        )
    )
    SELECT DISTINCT cost AS total_cost,
                    '{' || way_nodes_str || '}' AS tour
    FROM rec_way
    WHERE level = 5
);

SELECT total_cost,
       tour
FROM view_way
WHERE total_cost = (
        SELECT MIN(total_cost)
        FROM view_way
    )
ORDER BY total_cost,
         tour;
