CREATE TABLE employee
(
    id         SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name  TEXT NOT NULL,
    gender     TEXT NOT NULL,
    age        INT  NOT NULL

);

INSERT INTO employee(first_name, last_name, gender, age)
VALUES ('Pam', 'Halpert', 'female', 32),
       ('Rob', 'Scarn', 'male', 44),
       ('Michal', 'Sott', 'male', 50),
       ('Kelly', 'Kapour', 'female', 28),
       ('Jim', 'Halpert', 'male', 35);

-- Получите информацию об именах и фамилиях по всем сотрудникам.
-- Колонки должны называться «Имя» и «Фамилия».
SELECT first_name Name, last_name Family
FROM employee;

-- Получите всю информацию о сотрудниках, которые
-- младше 30 или старше 50 лет.
SELECT *
FROM employee
WHERE age NOT BETWEEN 30 AND 50;

-- Получите всю информацию о сотрудниках,
-- которым от 30 до 50 лет.
SELECT *
FROM employee
WHERE age BETWEEN 30 AND 50;

--Выведите полный список сотрудников, которые
--отсортированы по фамилиям в обратном порядке.
SELECT *
FROM employee
ORDER BY last_name DESC;

--Выведите сотрудников, имена которых длиннее 4 символов.
SELECT *
FROM employee
WHERE length(first_name) > 4;

--Измените имена у двух сотрудников так,
--чтобы на 5 сотрудников было только 3 разных имени,
--то есть чтобы получились две пары тезок
--и один сотрудник с уникальным именем.
UPDATE employee
SET first_name = 'Pam'
WHERE first_name = 'Kelly';

UPDATE employee
SET first_name = 'Michal'
WHERE last_name = 'Scarn';

--Посчитайте суммарный возраст для каждого имени.
--Выведите в двух столбцах «имя» и «суммарный возраст».
SELECT first_name Name,
       sum(age)
FROM employee
GROUP BY first_name;

--Выведите имя и самый юный возраст, соответствующий имени.
SELECT first_name,
       min(age)
FROM employee
GROUP BY first_name;

--Выведите имя и максимальный возраст
--только для неуникальных имен.
--Результат отсортируйте по возрасту в порядке возрастания.
SELECT first_name, max(age) max_age
FROM employee
GROUP BY first_name
HAVING count(first_name) > 1
ORDER BY max_age;


