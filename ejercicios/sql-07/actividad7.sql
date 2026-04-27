-- =========================================================
-- EJERCICIO 07: FACTURACIÓN, PRODUCTOS Y EXISTENCIAS
-- =========================================================

-- 1. CREAR LAS TABLAS DEL DIAGRAMA
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE facturas (
    id SERIAL PRIMARY KEY,
    rut_comprador VARCHAR(12) NOT NULL,
    rut_vendedor VARCHAR(12) NOT NULL
);

CREATE TABLE detalle_facturas (
    id SERIAL PRIMARY KEY,
    id_producto INTEGER,
    id_factura INTEGER,
    CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES productos(id),
    CONSTRAINT fk_factura FOREIGN KEY (id_factura) REFERENCES facturas(id)
);

CREATE TABLE existencias (
    id SERIAL PRIMARY KEY,
    id_producto INTEGER,
    cantidad INTEGER NOT NULL,
    precio INTEGER NOT NULL,
    pesokg INTEGER,
    CONSTRAINT fk_prod_existencia FOREIGN KEY (id_producto) REFERENCES productos(id)
);

-- 2. INSERTAR 10 PRODUCTOS
INSERT INTO productos (nombre, descripcion) VALUES 
('Laptop Pro', '16GB RAM, 512GB SSD'), ('Monitor 4K', '27 pulgadas HDR'),
('Teclado Mecánico', 'RGB Switch Red'), ('Mouse Gamer', '12000 DPI'),
('Disco Externo', '2TB USB-C'), ('Auriculares BT', 'Noise Cancelling'),
('Webcam HD', '1080p 60fps'), ('Escritorio L', 'Madera Roble'),
('Silla Ergonómica', 'Ajuste Lumbar'), ('Hub USB-C', '7 en 1');

-- 3. INSERTAR EXISTENCIAS PARA TODOS LOS PRODUCTOS
INSERT INTO existencias (id_producto, cantidad, precio, pesokg) VALUES 
(1, 5, 1200, 2), (2, 8, 350, 5), (3, 15, 80, 1), (4, 20, 50, 1),
(5, 10, 100, 1), (6, 12, 150, 1), (7, 7, 90, 1), (8, 3, 250, 15),
(9, 6, 300, 12), (10, 25, 40, 1);

-- 4. INSERTAR 5 FACTURAS
INSERT INTO facturas (rut_comprador, rut_vendedor) VALUES 
('11.111.111-1', '99.999.999-K'), ('22.222.222-2', '99.999.999-K'),
('33.333.333-3', '99.999.999-K'), ('44.444.444-4', '99.999.999-K'),
('55.555.555-5', '99.999.999-K');

-- 5. INSERTAR DETALLES (3 A 5 PRODUCTOS POR FACTURA)
INSERT INTO detalle_facturas (id_factura, id_producto) VALUES 
(1,1), (1,2), (1,3), 
(2,4), (2,5), (2,6), (2,7),
(3,8), (3,9), (3,10),
(4,1), (4,5), (4,9), (4,10),
(5,2), (5,4), (5,6);

SELECT * FROM productos

SELECT * FROM existencias

SELECT * FROM facturas

SELECT * FROM detalle_facturas


-- 01. ACTUALIZAR TODAS LAS EXISTENCIAS A CANTIDAD 10
UPDATE existencias SET cantidad = 10;

-- 02. AGREGAR COLUMNA FECHA A FACTURAS
ALTER TABLE facturas ADD COLUMN fecha DATE;

-- 03. ACTUALIZAR FECHAS DISTINTAS
UPDATE facturas SET fecha = '2024-01-01' WHERE id = 1;
UPDATE facturas SET fecha = '2024-01-05' WHERE id = 2;
UPDATE facturas SET fecha = '2024-01-10' WHERE id = 3;
UPDATE facturas SET fecha = '2024-01-15' WHERE id = 4;
UPDATE facturas SET fecha = '2024-01-20' WHERE id = 5;

-- 04. ELIMINAR COLUMNA PESOKG
ALTER TABLE existencias DROP COLUMN pesokg;

-- 05. CONSULTAR FACTURA CON DETALLE, PRODUCTO Y PRECIO
SELECT f.id AS factura_nro, p.nombre, e.precio
FROM facturas f
JOIN detalle_facturas df ON f.id = df.id_factura
JOIN productos p ON df.id_producto = p.id
JOIN existencias e ON p.id = e.id_producto
WHERE f.id = 2;

-- 06. VALOR FINAL DE UNA FACTURA
SELECT f.id AS factura_nro, SUM(e.precio) AS total_factura
FROM facturas f
JOIN detalle_facturas df ON f.id = df.id_factura
JOIN productos p ON df.id_producto = p.id
JOIN existencias e ON p.id = e.id_producto
WHERE f.id = 2
GROUP BY f.id;

-- 07. ELIMINAR TODOS LOS PRODUCTOS
DELETE FROM detalle_facturas;
DELETE FROM existencias;
DELETE FROM productos;
