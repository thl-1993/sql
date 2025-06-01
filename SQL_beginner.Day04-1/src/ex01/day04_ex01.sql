/*Используйте 2 представления базы данных из упражнения № 00 и напишите SQL, 
чтобы получить имена женщин и мужчин в одном списке. Укажите порядок по имени человека.*/

SELECT name
FROM v_person_male
UNION ALL
SELECT name
FROM v_person_female
ORDER BY name;