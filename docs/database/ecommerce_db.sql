-- BASE DE DATOS
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- TABLA USUARIOS
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) 


-- TABLA CLIENTES
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(30) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_clientes_usuarios
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
        ON DELETE RESTRICT
) 

CREATE INDEX idx_clientes_usuario ON clientes(usuario_id);


-- TABLA CATEGORIAS
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
) 


-- TABLA PRODUCTOS
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT chk_precio_positivo CHECK (precio >= 0),
    CONSTRAINT chk_stock_positivo CHECK (stock >= 0)
) 

CREATE INDEX idx_productos_activo ON productos(activo);


-- N:M PRODUCTOS - CATEGORIAS
CREATE TABLE producto_categoria (
    producto_id INT NOT NULL,
    categoria_id INT NOT NULL,
    fecha_asignacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (producto_id, categoria_id),

    CONSTRAINT fk_pc_productos
        FOREIGN KEY (producto_id)
        REFERENCES productos(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_pc_categorias
        FOREIGN KEY (categoria_id)
        REFERENCES categorias(id)
        ON DELETE CASCADE
) 

CREATE INDEX idx_pc_productos ON producto_categoria(producto_id);
CREATE INDEX idx_pc_categorias ON producto_categoria(categoria_id);


-- PEDIDOS
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    estado ENUM('CARRITO','PAGADO','ENVIADO','CANCELADO','ENTREGADO') NOT NULL,
    direccion_envio VARCHAR(100) NOT NULL,
    total DECIMAL(10,2) NOT NULL DEFAULT 0,
    carrito_activo BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_pedidos_clientes
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(id)
        ON DELETE RESTRICT
) 

CREATE INDEX idx_pedidos_clientes ON pedidos(cliente_id);

-- Solo un carrito activo por cliente (mejor controlado)
CREATE UNIQUE INDEX ux_carrito_activo
ON pedidos (cliente_id, carrito_activo);


-- DETALLE DE PEDIDOS
CREATE TABLE detalle_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_dp_pedidos
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_dp_productos
        FOREIGN KEY (producto_id)
        REFERENCES productos(id)
        ON DELETE RESTRICT,

    UNIQUE (pedido_id, producto_id)
) 

CREATE INDEX idx_dp_pedidos ON detalle_pedidos(pedido_id);
CREATE INDEX idx_dp_productos ON detalle_pedidos(producto_id);