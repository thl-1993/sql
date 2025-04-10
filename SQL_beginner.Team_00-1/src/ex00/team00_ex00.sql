/*Создайте таблицу с именованными узлами, используя структуру {point1, point2, cost}, 
и заполните данные на основе изображения (помните, что между двумя узлами существуют прямые и обратные пути). 
Напишите оператор SQL, который возвращает все туры (так называемые пути) с помощью. минимальная стоимость поездки, 
если мы начинаем с города «а». Помните, вам нужно найти самый дешевый способ посетить все города и вернуться в исходную точку. 
Например, тур выглядит как a -> b -> c -> d -. > а.*/

/*Ниже приведен пример выходных данных. Отсортируйте данные по общей стоимости, а затем по туру.*/

/*total_cost	tour
  80	        {a,b,d,c,a}
...	...*/

/*Добавьте в SQL возможность просмотра дополнительных строк с самой дорогой стоимостью 
из предыдущего упражнения. Посмотрите на пример данных ниже. Отсортируйте данные по total_cost, а затем по поездке.*/

--удаляет виртуальную таблицу, условие если существует (EXISTS), если не существует, то команда не выполнится
DROP VIEW IF EXISTS view_way; 

--удаляет таблицу nodes, условие если существует (EXISTS), если не существует, то команда не выполнится
DROP TABLE IF EXISTS nodes; 

-- Создание новой таблицы
CREATE TABLE nodes ( 
    id serial PRIMARY KEY, -- столбец id, автоинкрементный идентификатор, который также является первичным ключом
    /*id: Имя столбца.
serial: Тип данных, который автоматически увеличивает значение столбца при добавлении новой записи. Он используется для создания последовательности чисел.
PRIMARY KEY: Ограничение, которое делает столбец id уникальным и не допускает пустых значений.*/
    point1 VARCHAR NOT NULL, -- Столбец point1: строковый тип данных, не может быть пустым
    point2 VARCHAR NOT NULL, -- Столбец point2: строковый тип данных, не может быть пустым
    cost INTEGER NOT NULL -- Столбец cost: целочисленный тип данных, не может быть пустым
);

--INSERT INTO nodes VALUES: Вставляет новые строки в таблицу nodes
INSERT INTO nodes 
VALUES 
    (DEFAULT, 'a', 'b', 10), --DEFAULT: Используется для автоматической генерации значения id.--a=point1, b=point2, 10=cost
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

--чтобы убедиться, что данные вставлены верно, проверяем.
SELECT * FROM nodes; 

--создаём рекурсивное представление
--Определение рекурсивного CTE rec_way
CREATE VIEW view_way AS (
    WITH RECURSIVE rec_way ( --WITH RECURSIVE: указывает, что будет использоваться рекурсивный CTE.
        rec_way_p1, --определяет столбцы, которые будут использованы в рекурсивном запросе.
        rec_way_p2, --то же
        way_nodes_str, --то же
        cost, --то же
        level -- то же
    ) AS (
        (
            SELECT point1, --SELECT point1, point1, point1, 0, 1: выбирает point1 три раза, задает начальную стоимость 0 и начальный уровень 1.
                   point1,
                   point1,
                   0, --начальная стоимость маршрута
                   1 --начальный уровень рекурсии
            FROM nodes
            WHERE point1 = 'a'
        )
        UNION ALL ( --объединяет начальную часть с рекурсивной частью.
            SELECT point1, --начальнпя точка текущего пути
                   point2, -- конечная точка текущего пути
                   rec_way.way_nodes_str || ',' || nodes.point2,
                   rec_way.cost + nodes.cost,
                   level + 1 --Увеличение уровня рекурссии на +1
            /*рекурсивно выбирает следующие точки маршрута, добавляет их к существующему пути, суммирует стоимость и увеличивает уровень.*/
            FROM rec_way
            JOIN nodes ON rec_way.rec_way_p2 = nodes.point1
            /*JOIN nodes ON rec_way.rec_way_p2 = nodes.point1: соединяет текущую точку маршрута с таблицей nodes.*/
            WHERE rec_way.rec_way_p1 != nodes.point2 
            /*WHERE rec_way.rec_way_p1 != nodes.point2 AND (level < 4 OR (level = 4 AND nodes.point2 = 'a')): условие остановки рекурсии — избегает повторного посещения точек и возвращается в начальную точку, когда уровень достигает 4.*/
              AND (
                  level < 4 --продолжение рекурсии, если уровень меньше 4
                  OR (
                      level = 4 --условие остановки рекурсии
                      AND nodes.point2 = 'a'
                  )
              )
        )
    )
    SELECT DISTINCT cost AS total_cost,
    /*Добавляет начало и конец скобки к пути и переименовывает стоимость маршрута.*/
                    '{' || way_nodes_str || '}' AS tour -- добавили начало и конец скобки к пути
    FROM rec_way
    WHERE level = 5
    /*Фильтрует маршруты, которые достигли уровня 5.*/
);

-- запрос минимальных
SELECT total_cost, --Выбирает столбцы total_cost и tour.
       tour
FROM view_way
WHERE total_cost = (
        SELECT MIN(total_cost) --Фильтрует результаты, чтобы оставить только те маршруты, которые имеют минимальную общую стоимость.
        FROM view_way
    )
ORDER BY total_cost,
         tour;
