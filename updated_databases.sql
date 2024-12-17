-- Active: 1731572296876@@127.0.0.1@5432@postgres@public

CREATE TABLE movie (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    genre VARCHAR(255),
    genre_id INT,
    Foreign Key (genre_id) REFERENCES genre(id) ON DELETE SET NULL
);


CREATE TABLE genre (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE customer (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255),
    birth_year INT NOT NULL
);

CREATE TABLE movie_review (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(255),
    Foreign Key (username) REFERENCES customer(username) ON DELETE CASCADE,
    stars INT CHECK (stars BETWEEN 1 AND 5),
    review_text VARCHAR(255),
    movie_id INT,
    Foreign Key (movie_id) REFERENCES movie(id) ON DELETE CASCADE
);

INSERT INTO genre (name) VALUES 
('comedy'),('scifi'),('fantasy'),('action'),('triller');

INSERT INTO movie (name, year, genre) VALUES 
('Inception', 2010, 'action'),
('The Terminator', 1984, 'action'),
('Tropic Thunder', 2008, 'comedy'),
('Borat', 2006, 'comedy'),
('Interstellar', 2014, 'drama'),
('Joker', 2019, 'drama');

INSERT INTO customer (name, username, password, birth_year) VALUES
('Sonja', 'sonja', 'jeejee', 2003),
('Eetu', 'eetu', 'jeejee', 2003 );