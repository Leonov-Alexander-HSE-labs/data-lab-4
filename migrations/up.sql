CREATE TABLE users
(
    id              SERIAL PRIMARY KEY,
    last_name       VARCHAR(255) NOT NULL,
    client_computer VARCHAR(255) NOT NULL,
    quota           INT          NOT NULL,
    operation_fee   INT          NOT NULL
);

CREATE TABLE tasks
(
    id                  SERIAL PRIMARY KEY,
    name                VARCHAR(255) NOT NULL,
    computer_server     VARCHAR(255) NOT NULL,
    overhead_percentage INT          NOT NULL
);

CREATE TABLE operations
(
    id            SERIAL PRIMARY KEY,
    type          VARCHAR(255) NOT NULL,
    resource_cost INT          NOT NULL
);

CREATE TABLE audit
(
    id                  SERIAL PRIMARY KEY,
    weekday             VARCHAR(50) NOT NULL,
    user_id             INT REFERENCES users (id),
    operation_id        INT REFERENCES operations (id),
    task_id             INT REFERENCES tasks (id),
    operation_count     INT         NOT NULL,
    total_resource_cost INT         NOT NULL
);

INSERT INTO users (id, last_name, client_computer, quota, operation_fee)
VALUES (1, 'Сапунова', 'Pentium_1', 10000, 70),
       (2, 'Гущин', 'SUN4_1', 7000, 90),
       (3, 'Желтикова', 'Pentium_2', 14000, 76),
       (4, 'Ковалев', 'PentiumII_1', 10000, 80),
       (5, 'Новичков', 'SUN4_1', 12000, 92),
       (6, 'Без-операции-юзерова', 'SUN4_1', 12000, 92);


INSERT INTO tasks (id, name, computer_server, overhead_percentage)
VALUES (1, 'Текстовый редактор', 'PentiumII_1', 8),
       (2, 'САПР', 'SUN4_1', 7),
       (3, 'СУБД', 'AS400_1', 12),
       (4, 'Граф.редактор', 'SUN4_1', 4),
       (5, 'Электронная таблица', 'Pentium_2', 6),
       (6, 'Компилятор', 'Pentium_1', 6),
       (7, 'Браузер', 'SUN4_1', 10);

INSERT INTO operations (id, type, resource_cost)
VALUES (1, 'Чтение последовательного файла', 200),
       (2, 'Запись в последовательный файл', 300),
       (3, 'Обращение к внешним устройствам', 150),
       (4, 'Обращение к графическому контроллеру', 400),
       (5, 'Печать', 90),
       (6, 'Чтение произвольного файла', 220),
       (7, 'Запись в произвольный файл', 320);

INSERT INTO audit (id, weekday, user_id, operation_id, task_id, operation_count, total_resource_cost)
VALUES (55501, 'Понедельник', 2, 2, 7, 80, 25600),
       (55502, 'Понедельник', 3, 5, 4, 100, 40000),
       (55503, 'Понедельник', 5, 6, 4, 20, 8000),
       (55504, 'Вторник', 1, 4, 2, 200, 60000),
       (55505, 'Вторник', 2, 1, 3, 10, 1500),
       (55506, 'Вторник', 5, 5, 4, 90, 36000),
       (55507, 'Вторник', 5, 6, 7, 10, 3200),
       (55508, 'Вторник', 5, 3, 3, 7, 1050),
       (55509, 'Четверг', 2, 2, 6, 70, 15400),
       (55510, 'Четверг', 4, 6, 2, 4, 1200),
       (55511, 'Пятница', 1, 6, 3, 50, 7500),
       (55512, 'Пятница', 4, 2, 3, 21, 3150),
       (55513, 'Суббота', 5, 1, 3, 60, 9000),
       (55514, 'Воскресенье', 2, 6, 2, 7, 2100),
       (55515, 'Воскресенье', 2, 5, 3, 2, 300),
       (55516, 'Воскресенье', 2, 5, 6, 10, 2200),
       (55517, 'Воскресенье', 2, 6, 5, 200, 18000);
