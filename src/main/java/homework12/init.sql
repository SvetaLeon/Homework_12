CREATE TABLE IF NOT EXISTS Homework
(
    id          serial PRIMARY KEY,
    name        VARCHAR(100) UNIQUE  NOT NULL,
    description VARCHAR(1000) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Lesson
(
    id          serial PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    updatedAt   TIMESTAMP           NOT NULL,
    homework_id INT,
    FOREIGN KEY (homework_id) REFERENCES Homework (id)
);

CREATE TABLE IF NOT EXISTS Schedule
(
    id        serial PRIMARY KEY,
    name      VARCHAR(100) UNIQUE NOT NULL,
    updatedAt TIMESTAMP           NOT NULL
);

CREATE TABLE IF NOT EXISTS ScheduleLesson
(
    schedule_id INT,
    lesson_id   INT,
    FOREIGN KEY (schedule_id) REFERENCES Schedule (id),
    FOREIGN KEY (lesson_id) REFERENCES Lesson (id),
    UNIQUE (schedule_id, lesson_id)
);