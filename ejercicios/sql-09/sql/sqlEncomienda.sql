CREATE TABLE Clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    documento VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Sucursales (
    sucursal_id SERIAL PRIMARY KEY,
    nombre_sucursal VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE Encomiendas (
    encomienda_id SERIAL PRIMARY KEY,
    descripcion TEXT,
    peso DECIMAL(10,2),
    dimensiones VARCHAR(50)
);

CREATE TABLE Envios (
    envio_id SERIAL PRIMARY KEY,
    cliente_remitente_id INT,
    encomienda_id INT,
    sucursal_origen_id INT,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) CHECK (estado IN ('Pendiente', 'En Transito', 'Entregado')),
    costo_total DECIMAL(12,2),
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_remitente_id) REFERENCES Clientes(cliente_id),
    CONSTRAINT fk_encomienda FOREIGN KEY (encomienda_id) REFERENCES Encomiendas(encomienda_id),
    CONSTRAINT fk_sucursal FOREIGN KEY (sucursal_origen_id) REFERENCES Sucursales(sucursal_id)
);