-- =============================================
-- EJERCICIO 05: CLIENTES Y CUENTAS BANCARIAS
-- =============================================

-- 1. CREACIÓN DE TABLAS CON RESTRICCIONES
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT CHECK (edad BETWEEN 18 AND 85) NOT NULL
);

CREATE TABLE Cuentas (
    id_cuenta INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    saldo NUMERIC (10, 2) CHECK (saldo BETWEEN -5000.00 AND 100000.00) NOT NULL,
    CONSTRAINT fk_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES Clientes (id_cliente)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- 2. INSERCIÓN DE DATOS
INSERT INTO Clientes (id_cliente, nombre, edad) VALUES 
(1, 'Ana García', 78),
(2, 'Luis Pérez', 25),
(3, 'Maria Soto', 40),
(4, 'Carlos Ruiz', 80), 
(5, 'Elena Torres', 32);

INSERT INTO Cuentas (id_cuenta, id_cliente, saldo) VALUES 
(101, 1, 50000.00), (102, 1, -1200.50), (103, 1, 100.00),
(201, 2, 850.75), (202, 2, -500.00),
(301, 3, 15000.00), (302, 3, 200.00), (303, 3, -4999.99), (304, 3, 75000.00),
(401, 4, 1000.00), (402, 4, 2000.00), (403, 4, 3000.00),
(501, 5, 50.00), (502, 5, 120.00), (503, 5, 900.00);

SELECT * FROM Clientes
SELECT * FROM Cuentas

-- 3. APLICAR DML
UPDATE Cuentas SET saldo = saldo + 500.00 WHERE id_cuenta = 402;
DELETE FROM Cuentas WHERE id_cuenta = 503;

-- 4. CONSULTAS REQUERIDAS

-- (1) Saldo de cada cuenta del cliente de mayor edad

SELECT cta.id_cuenta, cta.saldo
FROM Cuentas cta
JOIN Clientes cli ON cta.id_cliente = cli.id_cliente
WHERE cli.edad = (SELECT MAX(edad) FROM Clientes);

-- (2) Promedio de edad de clientes con saldo negativo
SELECT ROUND(AVG(cli.edad)) AS promedio_edad_deudores
FROM Clientes cli
JOIN Cuentas cta ON cli.id_cliente = cta.id_cliente
WHERE cta.saldo < 0;

-- (3) Nombre y cantidad de cuentas de quienes tienen más de una
SELECT c.nombre, COUNT(cu.id_cuenta) AS total_cuentas
FROM Clientes c JOIN Cuentas cu ON c.id_cliente = cu.id_cliente
GROUP BY c.nombre HAVING COUNT(cu.id_cuenta) > 1;

-- (4) Suma de saldos por cliente para quienes tienen más de una cuenta
SELECT c.nombre, SUM(cu.saldo) AS saldo_total
FROM Clientes c JOIN Cuentas cu ON c.id_cliente = cu.id_cliente
GROUP BY c.nombre HAVING COUNT(cu.id_cuenta) > 1;

-- (5) Clientes con saldo combinado que tengan al menos una cuenta negativa
SELECT c.nombre, SUM(cu.saldo) AS saldo_combinado
FROM Clientes c JOIN Cuentas cu ON c.id_cliente = cu.id_cliente
WHERE c.id_cliente IN (SELECT id_cliente FROM Cuentas WHERE saldo < 0)
GROUP BY c.nombre;