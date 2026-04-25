/*************************************************************
 * EJERCICIO SQL-01: GESTIÓN Y FILTRADO DE CLIENTES
 * Descripción: Creación de base de datos, tablas y 
 *              aplicación de filtros avanzados (DQL).
 *************************************************************/

-- 1. CREACIÓN DE LA ESTRUCTURA
-- Crear la base de datos (Ejecutar primero y conectar a ella)
CREATE DATABASE db_sql_01;

-- Crear la tabla 'clientes' con sus respectivos tipos de datos y restricciones
CREATE TABLE clientes (
    rut VARCHAR(12) PRIMARY KEY, -- Llave primaria: Identificador único, no nulo
    nombre VARCHAR(50) NOT NULL, -- Obligatorio: El nombre no puede estar vacío
    edad INTEGER                 -- Tipo entero para años
);

-- 2. POBLACIÓN DE DATOS (DML)
-- Insertar registros iniciales en la tabla clientes
INSERT INTO clientes (rut, nombre, edad) VALUES
('12122122-2', 'Pepa', 33),
('13133133-3', 'Diego', 21),
('13675924-7', 'Mario', 85),
('14144251-1', 'Paula', 35),
('16555444-1', 'Muriela', 22),
('18188188-8', 'Pato', 44);

-- 3. CONSULTAS Y FILTRADO (DQL)

-- 4.0: Visualizar la tabla completa
SELECT * FROM clientes;

-- 4.1: Cliente específico mediante búsqueda exacta por RUT
SELECT * FROM clientes
WHERE rut = '13133133-3';

-- 4.2: Filtrar clientes mayores de 25 años usando operadores relacionales
SELECT * FROM clientes
WHERE edad > 25;

-- 4.3: Excluir un registro específico por nombre (operador diferente a)
SELECT * FROM clientes
WHERE nombre <> 'Mario';

-- 4.4: Búsqueda por patrón: RUTs que comienzan con los dígitos '13'
SELECT * FROM clientes
WHERE rut LIKE '13%';

-- 4.5: Búsqueda por patrón: Nombres que finalizan con la letra 'a'
SELECT * FROM clientes
WHERE nombre LIKE '%a';

-- 4.6: Uso de operadores lógicos (AND): Nombre empieza con 'P' y edad mayor a 34
SELECT * FROM clientes 
WHERE nombre LIKE 'P%' AND edad > 34;

-- 4.7: Filtro múltiple: RUT inicia con '1', nombre NO inicia con 'M' y edad menor a 40
SELECT * FROM clientes 
WHERE rut LIKE '1%' AND nombre NOT LIKE 'M%' AND edad < 40;

-- 4.8: Consulta Avanzada: Combinación de OR, IN para conjuntos y BETWEEN para rangos
SELECT * FROM clientes 
WHERE (rut LIKE '13%' OR rut LIKE '%1') 
  AND nombre IN ('Diego', 'Mario', 'Pato', 'Pepa') 
  AND edad BETWEEN 20 AND 80;