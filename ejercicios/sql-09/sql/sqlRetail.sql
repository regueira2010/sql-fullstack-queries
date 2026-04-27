CREATE TABLE Categorias (
    categoria_id SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE Productos (
    producto_id SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio_actual DECIMAL(12,2) NOT NULL,
    stock INT DEFAULT 0,
    categoria_id INT,
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

CREATE TABLE Ventas (
    venta_id SERIAL PRIMARY KEY,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_venta DECIMAL(12,2) DEFAULT 0
);

CREATE TABLE Detalle_Venta (
    detalle_id SERIAL PRIMARY KEY,
    venta_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario_historico DECIMAL(12,2) NOT NULL,
    CONSTRAINT fk_venta FOREIGN KEY (venta_id) REFERENCES Ventas(venta_id),
    CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);