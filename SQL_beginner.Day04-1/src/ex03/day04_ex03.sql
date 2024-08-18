/*Напишите инструкцию SQL, которая возвращает пропущенные 
дни для посещений людей в январе 2022 года. Используйте для 
этой задачи представление v_generated_dates и отсортируйте результат по столбцу Missing_date.*/

SELECT generated_date AS missing_date
FROM v_generated_dates
EXCEPT --С помощью оператора EXCEPT из набора missing_date исключаются все даты, которые присутствуют в visit_date.
SELECT person_visits.visit_date
FROM person_visits
ORDER BY missing_date;
