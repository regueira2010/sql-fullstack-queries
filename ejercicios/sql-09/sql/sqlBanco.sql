CREATE TABLE Tipos_Cuenta (
    tipo_id SERIAL PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL,
    interes_anual DECIMAL(5,2) DEFAULT 0.00
);

CREATE TABLE Clientes_Banco (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rut_dni VARCHAR(20) UNIQUE NOT NULL,
    direccion TEXT
);

CREATE TABLE Cuentas (
    cuenta_id SERIAL PRIMARY KEY,
    numero_cuenta VARCHAR(20) UNIQUE NOT NULL,
    cliente_id INT,
    tipo_id INT,
    saldo_actual DECIMAL(15,2) DEFAULT 0.00,
    fecha_apertura DATE DEFAULT CURRENT_DATE,
    CONSTRAINT fk_cliente_banco FOREIGN KEY (cliente_id) REFERENCES Clientes_Banco(cliente_id),
    CONSTRAINT fk_tipo_cuenta FOREIGN KEY (tipo_id) REFERENCES Tipos_Cuenta(tipo_id)
);

CREATE TABLE Transacciones (
    transaccion_id SERIAL PRIMARY KEY,
    cuenta_id INT,
    tipo_movimiento VARCHAR(20) CHECK (tipo_movimiento IN ('Deposito', 'Giro', 'Transferencia')),
    monto DECIMAL(15,2) NOT NULL,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descripcion TEXT,
    CONSTRAINT fk_cuenta_transaccion FOREIGN KEY (cuenta_id) REFERENCES Cuentas(cuenta_id)
);