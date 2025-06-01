/*Напишите оператор SQL, который возвращает пропущенные дни с 1 по 10 января 2022 года 
(включая все дни) для посещений людей с идентификаторами 1 или 2 (т. е. дни, пропущенные обоими). 
​​Упорядочите дни посещений в порядке возрастания. Пример данных с именами столбцов показан ниже.*/

SELECT 
    generated_dates.generated_date::date 
FROM 
    generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS generated_dates(generated_date)
LEFT JOIN 
    person_visits ON generated_dates.generated_date = person_visits.visit_date 
    AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
WHERE 
    person_visits.visit_date IS NULL
ORDER BY 
    generated_dates.generated_date;