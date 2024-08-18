/*Найдите имена людей, живущих по одному и тому же адресу. 
Убедитесь, что результат отсортирован по имени первого человека, имени второго человека и общему адресу.
Пример данных показан ниже. Убедитесь, что имена ваших столбцов совпадают с именами столбцов ниже.*/

SELECT 
    person1.name AS person_name1,
    person2.name AS person_name2,
    person1.address AS common_address
FROM 
    person AS person1
INNER JOIN 
    person AS person2
    ON person1.address = person2.address
    AND person1.id > person2.id
ORDER BY 
    person_name1, 
    person_name2;