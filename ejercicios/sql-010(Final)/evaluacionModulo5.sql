DROP TABLE IF EXISTS reparto_soltera_otra_vez;

CREATE TABLE reparto_soltera_otra_vez
(
    nombre character varying(255) NOT NULL,
    temporadas integer,
    protagonico boolean,
    sueldo integer,
    PRIMARY KEY (nombre)
);

insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Paz Bascuñán', 3, true, 100);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Pablo Macaya', 3, true, 100);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Cristián Arriagada', 3, true, 95);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Josefina Montaná', 2, true, 90);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Loreto Aravena', 3, true, 95);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Lorena Bosch', 2, true, 90);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Nicolás Poblete', 2, true, 85);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Héctor Morales', 3, true, 80);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Aranzazú Yankovic', 2, true, 80);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Luis Gnecco', 3, true, 95);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Catalina Guerra', 3, true, 90);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Solange Lackington', 2, true, 70);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Ignacio Garmendia', 2, true, 70);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Julio González', 3, true, 75);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Antonella Orsini', 3, true, 70);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Tamara Acosta', 1, false, 60);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Silvia Santelices', 1, false, 55);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Alejandro Trejo', 1, false, 55);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Grimanesa Jiménez', 1, false, 60);

SELECT * FROM reparto_soltera_otra_vez

DROP TABLE IF EXISTS reparto_papi_ricky;

CREATE TABLE reparto_papi_ricky
(
    nombre character varying(255) NOT NULL,
    capitulos integer,
    protagonico boolean,
    sueldo integer,
    PRIMARY KEY (nombre)
);

insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Jorge Zabaleta', 135, true, 100);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Belén Soto', 135, true, 100);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Tamara Acosta', 135, true, 100);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('María Elena Swett', 135, true, 100);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Juan Falcón', 135, true, 95);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Silvia Santelices', 135, true, 85);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Leonardo Perucci', 135, true, 85);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Teresita Reyes', 135, true, 80);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Luis Gnecco', 135, true, 75);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Alejandro Trejo', 135, true, 65);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Grimanesa Jiménez', 135, true, 60);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Remigio Remedy', 135, true, 60);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('María Paz Grandjean', 135, true, 55);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Héctor Morales', 135, true, 50);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('César Caillet', 135, true, 40);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('José Tomás Guzmán', 135, true, 25);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Manuel Aguirre', 135, true, 30);

SELECT * FROM reparto_papi_ricky

--1. Crear una consulta para obtener todos los actores que participaron en ambas teleseries, el
--sueldo que obtuvieron en cada una y la suma de ambos sueldos, todo esto ordenado por el
--nombre del actor.

SELECT s.nombre, s.sueldo AS sueldo_soltera, p.sueldo AS sueldo_papi, (s.sueldo + p.sueldo) AS sueldo_sumado
FROM reparto_soltera_otra_vez s
JOIN reparto_papi_ricky p ON s.nombre = p.nombre
ORDER BY s.nombre ASC;

--2. Crear  una  consulta  para  obtener  todos  los  actores  que  participaron  exclusivamente  en
--soltera otra vez, con un sueldo mayor a 90.
SELECT s.nombre, s.sueldo
FROM reparto_soltera_otra_vez s
LEFT JOIN reparto_papi_ricky p ON s.nombre = p.nombre
WHERE p.nombre IS NULL AND s.sueldo > 90;

--3. Crear una consulta para obtener solo los actores con sueldo inferior a 85 que actuaron en
--cualquiera de las dos teleseries, pero no en las dos.
SELECT COALESCE(s.nombre, p.nombre) AS nombre, COALESCE(s.sueldo, p.sueldo) AS sueldo
FROM reparto_soltera_otra_vez s
FULL OUTER JOIN reparto_papi_ricky p ON s.nombre = p.nombre
WHERE (s.nombre IS NULL OR p.nombre IS NULL) AND COALESCE(s.sueldo, p.sueldo) < 85;


-- 1. Tabla de Actores
CREATE TABLE actores (
    actor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE
);

-- 2. Tabla de Teleseries
CREATE TABLE teleseries (
    teleserie_id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL UNIQUE
);

-- 3. Tabla Relacional (Puente)
CREATE TABLE reparto_actores (
    actor_id INT,
    teleserie_id INT,
    es_protagonico BOOLEAN,
    sueldo INT,
    PRIMARY KEY (actor_id, teleserie_id),
    FOREIGN KEY (actor_id) REFERENCES actores(actor_id),
    FOREIGN KEY (teleserie_id) REFERENCES teleseries(teleserie_id)
);

SELECT * FROM actores
SELECT * FROM teleseries
SELECT * FROM reparto_actores

--Poblar Actores
INSERT INTO actores (nombre)
SELECT nombre FROM reparto_soltera_otra_vez
UNION
SELECT nombre FROM reparto_papi_ricky;

--Poblar Teleseries
INSERT INTO teleseries (titulo) VALUES ('Soltera Otra Vez'), ('Papi Ricky');

--Poblar tabla Puente
-- Insertar datos de Soltera Otra Vez
INSERT INTO reparto_actores (actor_id, teleserie_id, es_protagonico, sueldo)
SELECT a.actor_id, t.teleserie_id, r.protagonico, r.sueldo
FROM reparto_soltera_otra_vez r
JOIN actores a ON r.nombre = a.nombre
JOIN teleseries t ON t.titulo = 'Soltera Otra Vez';

-- Insertar datos de Papi Ricky
INSERT INTO reparto_actores (actor_id, teleserie_id, es_protagonico, sueldo)
SELECT a.actor_id, t.teleserie_id, r.protagonico, r.sueldo
FROM reparto_papi_ricky r
JOIN actores a ON r.nombre = a.nombre
JOIN teleseries t ON t.titulo = 'Papi Ricky';

--4. Crear  una  consulta  que  muestre  todas  las  teleseries  y  todos  los  actores  de  reparto
--asociados. No incluya los actores de rol secundario.
SELECT t.titulo AS teleserie, a.nombre AS actor FROM reparto_actores ra
JOIN actores a ON ra.actor_id = a.actor_id
JOIN teleseries t ON ra.teleserie_id = t.teleserie_id
WHERE ra.es_protagonico = true;
