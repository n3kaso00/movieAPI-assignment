-- Active: 1731572296876@@127.0.0.1@5432@postgres@public


CREATE TABLE movie_review (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    stars int,
    Foreign Key (id) REFERENCES customer(id),
    review_text VARCHAR(255),
    Foreign Key (id) REFERENCES movie(id)
);

