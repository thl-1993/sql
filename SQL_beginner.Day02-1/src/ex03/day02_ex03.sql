/*Вернемся к упражнению № 01. Перепишите свой SQL, используя шаблон CTE (Общее табличное выражение). 
Перейдите к части CTE вашего «генератора дней». Результат должен выглядеть аналогично упражнению № 01.*/
WITH date_series AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS missing_date
)
SELECT 
    date_series.missing_date::date 
FROM 
    date_series
LEFT JOIN 
    person_visits ON date_series.missing_date = person_visits.visit_date 
    AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
WHERE 
    person_visits.visit_date IS NULL
ORDER BY 
    date_series.missing_date;