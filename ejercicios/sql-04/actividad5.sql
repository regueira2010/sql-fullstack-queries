DROP TABLE IF EXISTS serie_netflix;
CREATE TABLE serie_netflix
(
    nombre character varying NOT NULL,
    temporadas integer,
    genero character varying(50),
    anio_estreno integer,
    PRIMARY KEY (nombre)
);

INSERT INTO serie_netflix (nombre, temporadas, genero, anio_estreno) VALUES 
('Black Mirror', 5, 'Ciencia ficción', 2011);

SELECT * FROM serie_netflix 

INSERT INTO serie_netflix (nombre, temporadas, genero, anio_estreno) VALUES 
('The Bear', 2, 'Drama', 2022),
('The Mandalorian', 3, 'Ciencia ficción', 2007),
('Ted Lasso', 3, 'Comedia', 2020),
('Severance', 1, 'Ciencia ficción', 2022),
('The White Lotus', 2, 'Sátira', 2021),
('Yellowstone', 5, 'Drama', 2008),
('Euphoria', 2, 'Drama', 2009),
('Lupin', 3, 'Crimen', 2021),
('Beef', 7, 'Comedia Drama', 2023);

SELECT * FROM serie_netflix 
WHERE temporadas > 3 ORDER BY anio_estreno DESC;

SELECT MIN(anio_estreno) AS anio_antiguo 
FROM serie_netflix;

SELECT MAX(anio_estreno) AS anio_nuevo 
FROM serie_netflix;

SELECT ROUND(AVG(anio_estreno)) 
AS anio_promedio FROM serie_netflix 

SELECT ROUND(AVG(temporadas)) 
AS temporada_promedio FROM serie_netflix 

SELECT * FROM serie_netflix
WHERE temporadas IN (1, 2, 4, 5, 7)
ORDER BY temporadas ASC;

SELECT * FROM serie_netflix
WHERE temporadas NOT IN (1, 2, 4, 5, 7)
ORDER BY temporadas ASC;

DELETE FROM serie_netflix WHERE anio_estreno > 2010;

INSERT INTO serie_netflix (nombre, temporadas, genero, anio_estreno) VALUES 
('Black Mirror', 5, 'Ciencia ficción', 2011),
('The Bear', 2, 'Drama', 2022),
('Ted Lasso', 3, 'Comedia', 2020),
('Severance', 1, 'Ciencia ficción', 2022),
('The White Lotus', 2, 'Sátira', 2021),
('Lupin', 3, 'Crimen', 2021),
('Beef', 7, 'Comedia Drama', 2023);

INSERT INTO serie_netflix (nombre, temporadas, genero, anio_estreno) 
VALUES ('Doctor House', 8, 'Drama Médico', 2004);

SELECT * FROM serie_netflix
WHERE anio_estreno BETWEEN 2005 AND 2020
ORDER BY anio_estreno ASC;

SELECT * FROM serie_netflix
WHERE nombre LIKE 'b%' OR nombre LIKE '%e'

SELECT nombre, (anio_estreno + temporadas) AS calculo 
FROM serie_netflix WHERE (anio_estreno + temporadas) > 2010;

