
CREATE TABLE movie (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    year INT,
    genre VARCHAR(255)
);


CREATE TABLE genre (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255)
);

CREATE TABLE customer (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    username VARCHAR(255),
    password VARCHAR(255),
    birth_year INT
);

CREATE TABLE movie_review (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id INT,
    Foreign Key (user_id) REFERENCES customer(id),
    stars INT,
    review_text VARCHAR(255),
    movie_id INT,
    Foreign Key (movie_id) REFERENCES movie(id)
);