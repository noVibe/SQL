
-- Получите имена и фамилии сотрудников, а также города, в которых они проживают.

SELECT first_name, last_name, c.city_name
FROM employee
         JOIN city c ON employee.city_id = c.city_id;

-- Получите города, а также имена и фамилии сотрудников, которые в них проживают.
-- Если в городе никто из сотрудников не живет, то вместо имени должен стоять null.

SELECT city_name, e.first_name, e.last_name
FROM city
         LEFT JOIN employee e ON e.city_id = city.city_id;

-- Получите имена всех сотрудников и названия всех городов.
-- Если в городе не живет никто из сотрудников, то вместо имени должен стоять null.
-- Аналогично, если города для какого-то из сотрудников нет в списке, должен быть получен null.

SELECT city_name, e.first_name, e.last_name
FROM city
         FULL JOIN employee e ON e.city_id = city.city_id;

-- Получите таблицу, в которой каждому имени должен соответствовать каждый город

SELECT first_name, city_name
FROM employee,
     city;

-- Получите имена городов, в которых никто не живет.

SELECT city_name
FROM city
         LEFT JOIN employee ON city.city_id = employee.city_id
WHERE employee.city_id IS NULL;
