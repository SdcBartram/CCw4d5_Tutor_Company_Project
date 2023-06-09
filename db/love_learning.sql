DROP TABLE IF EXISTS students_in_lessons CASCADE;
DROP TABLE IF EXISTS lessons CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS educators CASCADE;
DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS learning_styles CASCADE;



CREATE TABLE learning_styles (
id SERIAL PRIMARY KEY,
learning_style VARCHAR(255) NOT NULL
);

CREATE TABLE subjects (
id SERIAL PRIMARY KEY,
subject_name VARCHAR(255) NOT NULL,
learning_style_id INT NOT NULL REFERENCES learning_styles(id) ON DELETE CASCADE
);

CREATE TABLE students (
id SERIAL PRIMARY KEY,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
comment TEXT,
subject_id INT REFERENCES subjects(id) ON DELETE CASCADE,
learning_style_id INT REFERENCES learning_styles(id) ON DELETE CASCADE
);

CREATE TABLE educators (
id SERIAL PRIMARY KEY,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
subject_id INT REFERENCES subjects(id) ON DELETE CASCADE,
learning_style_id INT REFERENCES learning_styles(id) ON DELETE CASCADE
);

CREATE TABLE lessons (
id SERIAL PRIMARY KEY,
date DATE NOT NULL,
time TIME NOT NULL,
subject_id INT NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
educator_id INT NOT NULL REFERENCES educators(id) ON DELETE CASCADE,
learning_style_id INT NOT NULL REFERENCES learning_styles(id) ON DELETE CASCADE
);

CREATE TABLE students_in_lessons (
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL REFERENCES students(id) ON DELETE CASCADE,
    lesson_id INT NOT NULL REFERENCES lessons(id) ON DELETE CASCADE
)