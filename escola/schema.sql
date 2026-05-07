CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(150) UNIQUE
);

CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL
);

CREATE TABLE subjects (
    subject_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE classes (
    class_id SERIAL PRIMARY KEY,
    subject_id INT NOT NULL,
    teacher_id INT NOT NULL,
    semester VARCHAR(20) NOT NULL,

    CONSTRAINT fk_classes_subject
        FOREIGN KEY (subject_id)
        REFERENCES subjects(subject_id),

    CONSTRAINT fk_classes_teacher
        FOREIGN KEY (teacher_id)
        REFERENCES teachers(teacher_id)
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    class_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    final_grade NUMERIC(4,2),

    CONSTRAINT fk_enrollments_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_enrollments_class
        FOREIGN KEY (class_id)
        REFERENCES classes(class_id),

    CONSTRAINT uq_student_class
        UNIQUE (student_id, class_id)
);