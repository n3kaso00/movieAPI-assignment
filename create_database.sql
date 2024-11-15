/* 2024-11-14 10:41:03 [35 ms] */ 
CREATE TABLE movie (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    year int,
    genre VARCHAR(255)
);
/* 2024-11-14 10:44:00 [48 ms] */ 
CREATE TABLE genre (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255)
);
/* 2024-11-14 10:50:13 [41 ms] */ 
CREATE TABLE customer (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    username VARCHAR(255),
    password VARCHAR(255),
    birth_year int
);
/* 2024-11-14 10:53:29 [34 ms] */ 
INSERT INTO "customer"("name","username","password","birth_year") VALUES('Sonja','sonja','jee',2003);
INSERT INTO "customer"("name","username","password","birth_year") VALUES('Eetu','eetu','jee',2003);
/* 2024-11-14 11:08:19 [46 ms] */ 
CREATE TABLE movie_review (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    stars int,
    Foreign Key (id) REFERENCES customer(id),
    review_text VARCHAR(255),
    Foreign Key (id) REFERENCES movie(id)
);

