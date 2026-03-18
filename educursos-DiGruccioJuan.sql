use Carrera_BD

CREATE TABLE users (        --users: contiene nombre, email y fecha de registro.
    user_id INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    email NVARCHAR(255) UNIQUE NOT NULL,
    registration_date DATE DEFAULT CAST(GETDATE() AS DATE)
);

CREATE TABLE courses (                     --courses: guarda información de los cursos ofrecidos: título, categoría y fecha de publicación.
    course_id INT PRIMARY KEY,
    title NVARCHAR(100) NOT NULL,
    category NVARCHAR(100) NOT NULL,
    publication_date DATE DEFAULT CAST(GETDATE() AS DATE)
);

CREATE TABLE subscriptions  (        --subscriptions: representa las inscripciones de usuarios a cursos (relación muchos a muchos). Se debe guarda la fecha de inscripción.
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    subscription_date DATE DEFAULT CAST(GETDATE() AS DATE),
    PRIMARY KEY (user_id, course_id),  
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE instructors (      --instructors: identifica quién dicta cada curso. De los instructores guardamos nombre y una identificación.
    instructor_id INT IDENTITY (1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL
);
CREATE TABLE instructores_cursos (
    instructor_id INT,
    course_id INT,
    PRIMARY KEY (instructor_id, course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


insert into users (user_id, name, email, registration_date)
VALUES
(1, 'García', 'ana.garcia@email.com', '2022-09-01'),
(2, 'Fernández', 'carlos.fernandez@email.com', '2021-08-15'),
(3, 'Martínez', 'luisa.martinez@email.com', '2023-01-10'),
(4, 'López', 'jorge.lopez@email.com', '2020-07-22'),
(5, 'Pérez', 'sofia.perez@email.com', '2022-05-30');

INSERT INTO courses (course_id,title, category,publication_date)
VALUES
(1,'Matemáticas Básicas', 'A', '2022-03-15'),
(2,'Literatura Española', 'B', '2025-10-15'),
(3,'Física General', 'A', '2026-03-06'),
(4,'Programación 101', 'B', '2020-12-25'),
(5,'Historia Mundial', 'C', '2012-08-20');

INSERT INTO subscriptions(user_id, course_id, subscription_date)
VALUES
(1,3,'2025-01-15'),
(2,4,'2025-05-20'),
(3,5,'2025-02-28'),
(4,1,'2025-03-17'),
(5,2,'2025-04-16');

insert into instructors(name)
values
('Juan'),
('Pedro'),
('Lucas'),
('Gabriel'),
('Marcos');


select * from users
select * from courses
select * from subscriptions
select * from instructors

