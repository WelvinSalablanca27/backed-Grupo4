Create database almacenrural;
use almacenrural;

-- Crear tabla Cliente --
CREATE TABLE Cliente (
  id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
  Nombre1 VARCHAR(30),
  Nombre2 VARCHAR(30),
  Apellido1 VARCHAR(30),
  Apellido2 VARCHAR(30),
  Direccion VARCHAR(80),
  Telefono VARCHAR(8)
);

-- Crear tabla Usuarios --
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    correo_electronico VARCHAR(40) NOT NULL UNIQUE,
    contrasena VARCHAR(18) NOT NULL,
    telefono VARCHAR(8),
    genero ENUM('masculino', 'femenino'),
    rol ENUM('admin', 'cajero') DEFAULT 'cajero'
);

-- Crear tabla Producto --
CREATE TABLE Producto (
  id_Producto INT AUTO_INCREMENT PRIMARY KEY,
  Nombre_Prod VARCHAR(30),
  Tipo_Prod VARCHAR(20),
  Existencia_Prod decimal(6,2),
  Precio_Costo decimal(10,2),
  Precio_Venta Decimal(10,2),
  Fe_caducidad DATE
);

-- Crear tabla Proveedor --
CREATE TABLE Proveedor (
  id_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
  Nombre_Proveedor VARCHAR(30),
  Telefono VARCHAR(8),
  Tipo_distribuidor VARCHAR(30)
);

-- Crear tabla Compra --
CREATE TABLE Compra (
  id_compra INT AUTO_INCREMENT PRIMARY KEY,
  id_Proveedor INT,
  Fe_compra DATE,
  FOREIGN KEY (id_Proveedor) REFERENCES Proveedor(id_Proveedor) ON DELETE CASCADE
);

-- Crear tabla DetalleCompra
CREATE TABLE DetalleCompra (
  id_DetalleCompra INT AUTO_INCREMENT PRIMARY KEY,
  id_compra INT,
  id_Producto INT,
  Fe_Ingresado DATE,
  Fe_caducidad DATE,
  Precio DECIMAL(10,2) NOT NULL, 
  cantidad INT,
  FOREIGN KEY (id_Producto) REFERENCES Producto(id_Producto) ON DELETE CASCADE,
  FOREIGN KEY (id_compra) REFERENCES Compra(id_compra) ON DELETE CASCADE
);

-- Crear tabla Venta --
CREATE TABLE Venta (
  id_ventas INT AUTO_INCREMENT PRIMARY KEY,
  id_Cliente INT,
  Fe_Venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente) ON DELETE CASCADE
);

-- Crear tabla Detalles_venta --
CREATE TABLE Detalles_venta (
  id_DetalleVenta INT AUTO_INCREMENT PRIMARY KEY,
  id_Venta INT,
  id_Producto INT,
  Precio_venta DECIMAL(10,2) NOT NULL,
  Cantidad_Producto INT,
  FOREIGN KEY (id_Producto) REFERENCES Producto(id_Producto) ON DELETE CASCADE,
  FOREIGN KEY (id_Venta) REFERENCES Venta(id_ventas) ON DELETE CASCADE
);

-- Crear tabla bitacora_general --
CREATE TABLE IF NOT EXISTS bitacora_general (
    id_bitacora INT AUTO_INCREMENT PRIMARY KEY,
    tabla_afectada VARCHAR(50) NOT NULL,
    tipo_cambio VARCHAR(20) NOT NULL,
    usuario VARCHAR(100) NOT NULL,
    id_cliente INT,
    valores_anteriores TEXT,
    valores_nuevos TEXT,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- INSERT INTO Cliente --
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Carlos', 'Andrés', 'Pérez', 'Mendoza', 'Calle 10 #25-34', '31012345');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Laura', 'María', 'Gómez', 'Ríos', 'Carrera 15 #12-80', '31123456');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('David','Jose' , 'Ruiz', 'Cano', 'Av. Central 45-90', '31234567');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Ana', 'Lucía', 'Fernández', 'Zapata', 'Calle 8 #10-12', '31345678');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Sofía', 'Isabel', 'Torres', 'López', 'Cra 20 #5-67', '31456789');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Miguel', 'Ángel', 'Rodríguez', 'Pardo', 'Calle 12 #30-15', '31567890');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Juliana', 'Beatriz', 'Ramírez', 'Duarte', 'Carrera 9 #8-23', '31678901');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Andrés', 'Carlos', 'Martínez', 'Salas', 'Av. Sur #7-50', '31789012');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Daniela', 'Camila', 'Castaño', 'Luna', 'Calle 5 #11-44', '31890123');

-- INSERT INTO Usuarios --
INSERT INTO Usuarios (nombre, apellido, correo_electronico, contrasena, telefono, genero, rol) VALUES
('Juan', 'Pérez', 'juan.perez@correo.com', '123456789', '55512345', 'masculino', 'cajero'),
('Ana', 'Gómez', 'ana.gomez@correo.com', '123456789', '55523456', 'femenino', 'admin'),
('Luis', 'Martínez', 'luis.mtz@correo.com', '123456789', '55534567', 'masculino', 'cajero'),
('María', 'Lopez', 'maria.lopez@correo.com', '123456789', '55545678', 'femenino', 'cajero'),
('Carlos', 'Ruiz', 'carlos.ruiz@correo.com', '123456789', '55556789', 'masculino', 'admin');

-- INSERT Producto --
INSERT INTO Producto (Nombre_Prod, Num, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Dog Chow Adulto 15kg', 'Alimento', 25, 120000, 90000, '2025-12-31');
INSERT INTO Producto (Nombre_Prod, Num, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Cat Chow Gato 8kg', 'Alimento', 18, 85000, 60000, '2025-11-30');
INSERT INTO Producto (Nombre_Prod, Num, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Antipulgas Frontline', 'Medicamento', 30, 40000, 25000, '2026-06-30');
INSERT INTO Producto (Nombre_Prod, Num, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Shampoo Canino 500ml', 'Aseo', 50, 20000, 12000, '2026-01-15');
INSERT INTO Producto (Nombre_Prod, Num, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Juguete Hueso de Goma', 'Accesorio', 40, 15000, 8000, NULL);
INSERT INTO Producto (Nombre_Prod, Num, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Arena para Gato 10kg', 'Aseo', 35, 30000, 18000, NULL);
INSERT INTO Producto (Nombre_Prod, Num, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Vitaminas para Perro', 'Medicamento', 20, 25000, 15000, '2026-05-01');
INSERT INTO Producto (Nombre_Prod, Num, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Comedero Doble Acero', 'Accesorio', 45, 28000, 16000, NULL);
INSERT INTO Producto (Nombre_Prod, Num, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Collar Antipulgas', 'Accesorio', 60, 22000, 12000, '2026-03-15');
INSERT INTO Producto (Nombre_Prod, Num, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Pelota con sonido', 'Accesorio', 70, 10000, 6000, NULL);

-- INSERT Proveedores --
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Distribuidora AnimalCare', '30012345', 'Alimentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Pet Health S.A.', '30123456', 'Medicamentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('CleanPet Co.', '30234567', 'Aseo');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Mascotas Feliz Ltda', '30345678', 'Accesorios');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('SuperPet Import', '30456789', 'Variado');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Almacen Macota', '30656789', 'Accesorios de Baño');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('BioMascotas S.A.', '30712345', 'Medicamentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Veterinaria Global', '30823456', 'Medicamentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('PetCare Solutions', '30934567', 'Alimentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Mascota Sana', '31045678', 'Aseo');

-- INSERT Compra --
INSERT INTO Compra (id_Proveedor, Fe_compra) VALUES (1, '2025-01-10');
INSERT INTO Compra (id_Proveedor, Fe_compra) VALUES (2, '2025-02-14');
INSERT INTO Compra (id_Proveedor, Fe_compra) VALUES (3, '2025-03-20');
INSERT INTO Compra (id_Proveedor, Fe_compra) VALUES (4, '2025-04-05');
INSERT INTO Compra (id_Proveedor, Fe_compra) VALUES (5, '2025-05-01');
INSERT INTO Compra (id_Proveedor, Fe_compra) VALUES (6, '2025-07-01');
INSERT INTO Compra (id_Proveedor, Fe_compra) VALUES (7, '2025-01-15');
INSERT INTO Compra (id_Proveedor, Fe_compra) VALUES (8, '2025-02-20');
INSERT INTO Compra (id_Proveedor, Fe_compra) VALUES (9, '2025-03-01');
INSERT INTO Compra (id_Proveedor, Fe_compra) VALUES (10, '2025-04-10');

-- INSERT Detalle Compra --
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (1, 1, '2025-01-10', '2025-12-31', 900, 60);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (2, 2, '2025-01-10', '2025-11-30', 6000, 50);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (3, 3, '2025-02-14', '2026-06-30', 25000, 70);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (4, 4, '2025-03-20', '2026-01-15', 12000, 80);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (5, 5, '2025-04-05', NULL, 8000, 30);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (6, 6, '2025-04-10', '2026-02-28', 15000, 40);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (7, 7, '2025-04-12', NULL, 3200, 25);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (8, 8, '2025-04-15', '2025-12-15', 7200, 55);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (9, 9, '2025-04-20', '2025-12-31', 4500, 45);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (10, 10, '2025-04-25', NULL, 9800, 35);

-- INSERT INTO Venta --
INSERT INTO Venta (id_Cliente, Fe_Venta) VALUES (1, '2025-04-01 10:00:00');
INSERT INTO Venta (id_Cliente, Fe_Venta) VALUES (2, '2025-04-02 11:30:00');
INSERT INTO Venta (id_Cliente, Fe_Venta) VALUES (3, '2025-04-03 09:45:00');
INSERT INTO Venta (id_Cliente, Fe_Venta) VALUES (4, '2025-04-04 15:00:00');
INSERT INTO Venta (id_Cliente, Fe_Venta) VALUES (5, '2025-04-05 14:15:00');
INSERT INTO Venta (id_Cliente, Fe_Venta) VALUES (6, '2025-04-06 13:25:00');
INSERT INTO Venta (id_Cliente, Fe_Venta) VALUES (7, '2025-04-07 12:00:00');
INSERT INTO Venta (id_Cliente, Fe_Venta) VALUES (8, '2025-04-08 16:45:00');
INSERT INTO Venta (id_Cliente, Fe_Venta) VALUES (9, '2025-04-09 10:30:00');

-- INSERT Detalle Venta --
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (1, 2, 15000, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (2, 4, 18000, 2);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (3, 1, 12000, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (4, 5, 22000, 3);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (5, 3, 9000, 2);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (6, 6, 30000, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (7, 7, 12000, 4);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (8, 2, 15000, 2);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (9, 3, 18000, 1);


-- Procedimiento almacenado --
DELIMITER //
CREATE PROCEDURE agregar_cliente(
  IN p_Nombre1 VARCHAR(30),
  IN p_Nombre2 VARCHAR(30),
  IN p_Apellido1 VARCHAR(30),
  IN p_Apellido2 VARCHAR(30),
  IN p_Direccion VARCHAR(60),
  IN p_Telefono VARCHAR(8)
)
BEGIN
  INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono)
  VALUES (p_Nombre1, p_Nombre2, p_Apellido1, p_Apellido2, p_Direccion, p_Telefono);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE contar_clientes()
BEGIN
  SELECT COUNT(*) AS cantidad_clientes FROM Cliente;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE obtener_cliente_por_id(
  IN p_id_cliente INT
)
BEGIN
  SELECT Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono
  FROM Cliente
  WHERE id_Cliente = p_id_cliente;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE buscar_clientes_por_nombre(
  IN p_nombre_cliente VARCHAR(30)
)
BEGIN
  SELECT id_Cliente, CONCAT(Nombre1, ' ', Apellido1) AS Nombre_Cliente
  FROM Cliente
  WHERE Nombre1 LIKE CONCAT('%', p_nombre_cliente, '%') 
     OR Apellido1 LIKE CONCAT('%', p_nombre_cliente, '%');
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE actualizar_direccion_cliente(
  IN p_id_cliente INT,
  IN p_nueva_direccion VARCHAR(60)
)
BEGIN
  UPDATE Cliente
  SET Direccion = p_nueva_direccion
  WHERE id_Cliente = p_id_cliente;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE agregar_producto(
  IN p_Nombre_Prod VARCHAR(30),
  IN p_Num VARCHAR(20),
  IN p_Existencia_Prod DECIMAL(6,2),
  IN p_Precio_Venta DECIMAL(10,2),
  IN p_Precio_Costo DECIMAL(10,2),
  IN p_Fe_caducidad DATE
)
BEGIN
  INSERT INTO Producto (Nombre_Prod, Num, Existencia_Prod, Precio_Venta, Precio_Costo, Fe_caducidad)
  VALUES (p_Nombre_Prod, p_Num, p_Existencia_Prod, p_Precio_Venta, p_Precio_Costo, p_Fe_caducidad);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE contar_productos()
BEGIN
  SELECT COUNT(*) AS cantidad_productos FROM Producto;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE obtener_producto_por_id(
  IN p_id_producto INT
)
BEGIN
  SELECT Nombre_Prod, Num, Existencia_Prod, Precio_Venta, Precio_Costo, Fe_caducidad
  FROM Producto
  WHERE id_Producto = p_id_producto;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE actualizar_precio_producto(
  IN p_id_producto INT,
  IN p_nuevo_precio DECIMAL(10,2)
)
BEGIN
  UPDATE Producto
  SET Precio_Venta = p_nuevo_precio
  WHERE id_Producto = p_id_producto;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE verificar_existencia_producto(
  IN p_id_producto INT
)
BEGIN
  DECLARE stock DECIMAL(6,2);
  SELECT Existencia_Prod INTO stock FROM Producto WHERE id_Producto = p_id_producto;
  IF stock > 0 THEN
    SELECT 'Disponible' AS estado;
  ELSE
    SELECT 'No Disponible' AS estado;
  END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE agregar_proveedor(
  IN p_Nombre_Proveedor VARCHAR(30),
  IN p_Telefono VARCHAR(8),
  IN p_Tipo_distribuidor VARCHAR(30)
)
BEGIN
  INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor)
  VALUES (p_Nombre_Proveedor, p_Telefono, p_Tipo_distribuidor);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE contar_proveedores()
BEGIN
  SELECT COUNT(*) AS cantidad_proveedores FROM Proveedor;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE obtener_proveedor_por_id(
  IN p_id_proveedor INT
)
BEGIN
  SELECT Nombre_Proveedor, Telefono, Tipo_distribuidor
  FROM Proveedor
  WHERE id_Proveedor = p_id_proveedor;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE actualizar_telefono_proveedor(
  IN p_id_proveedor INT,
  IN p_nuevo_telefono VARCHAR(8)
)
BEGIN
  UPDATE Proveedor
  SET Telefono = p_nuevo_telefono
  WHERE id_Proveedor = p_id_proveedor;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE buscar_proveedores_por_tipo(
  IN p_tipo_distribuidor VARCHAR(30)
)
BEGIN
  SELECT id_Proveedor, Nombre_Proveedor
  FROM Proveedor
  WHERE Tipo_distribuidor LIKE CONCAT('%', p_tipo_distribuidor, '%');
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE agregar_compra(
  IN p_id_proveedor INT,
  IN p_Fe_compra DATE
)
BEGIN
  INSERT INTO Compra (id_Proveedor, Fe_compra)
  VALUES (p_id_proveedor, p_Fe_compra);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE contar_compras()
BEGIN
  SELECT COUNT(*) AS cantidad_compras FROM Compra;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE obtener_compra_por_id(
  IN p_id_compra INT
)
BEGIN
  SELECT id_Proveedor, Fe_compra
  FROM Compra
  WHERE id_compra = p_id_compra;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE actualizar_fecha_compra(
  IN p_id_compra INT,
  IN p_nueva_fecha DATE
)
BEGIN
  UPDATE Compra
  SET Fe_compra = p_nueva_fecha
  WHERE id_compra = p_id_compra;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE obtener_compras_por_proveedor(
  IN p_id_proveedor INT
)
BEGIN
  SELECT id_compra, Fe_compra
  FROM Compra
  WHERE id_Proveedor = p_id_proveedor;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE agregar_detalle_compra(
  IN p_id_producto INT,
  IN p_id_compra INT,
  IN p_Fe_Ingresado DATE,
  IN p_Fe_caducidad DATE,
  IN p_Valor_Compra INT
)
BEGIN
  INSERT INTO DetalleCompra (id_Producto, id_compra, Fe_Ingresado, Fe_caducidad, Valor_Compra)
  VALUES (p_id_producto, p_id_compra, p_Fe_Ingresado, p_Fe_caducidad, p_Valor_Compra);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE contar_detalles_compra()
BEGIN
  SELECT COUNT(*) AS cantidad_detalles_compra FROM DetalleCompra;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE obtener_detalle_compra_por_id(
  IN p_id_detallecompra INT
)
BEGIN
  SELECT id_Producto, id_compra, Fe_Ingresado, Fe_caducidad, Valor_Compra
  FROM DetalleCompra
WHERE id_Producto = p_id_producto;
  SELECT total_valor AS Valor_Total_Compra;
END //
DELIMITER ;

-- vista --
CREATE VIEW Vista_Producto_Menos_Vendido AS
SELECT 
    p.Nombre_Prod AS Producto,
    prov.Nombre_Proveedor AS Proveedor,
    dc.Fe_caducidad AS Fecha_Caducidad,
    COALESCE(SUM(dv.Cantidad_Producto), 0) AS Total_Vendido
FROM Producto p
LEFT JOIN Detalles_venta dv ON p.id_Producto = dv.id_Producto
LEFT JOIN DetalleCompra dc ON p.id_Producto = dc.id_Producto
LEFT JOIN Compra c ON dc.id_compra = c.id_compra
LEFT JOIN Proveedor prov ON c.id_Proveedor = prov.id_Proveedor
GROUP BY p.id_Producto, p.Nombre_Prod, prov.Nombre_Proveedor, dc.Fe_caducidad
ORDER BY Total_Vendido ASC
LIMIT 1;

CREATE VIEW Vista_Clientes_Mas_Compras AS
SELECT 
    c.Nombre1, 
    c.Apellido1, 
    COUNT(v.id_ventas) AS Total_Compras
FROM Cliente c
JOIN Venta v ON c.id_Cliente = v.id_Cliente
GROUP BY c.id_Cliente
ORDER BY Total_Compras DESC;

CREATE VIEW Vista_Clientes_Completos AS
SELECT 
    c.Nombre1, 
    c.Nombre2, 
    c.Apellido1, 
    c.Apellido2, 
    c.Direccion, 
    c.Telefono
FROM Cliente c;

CREATE VIEW Vista_Clientes_Sin_Compras AS
SELECT 
    c.Nombre1, 
    c.Apellido1, 
    c.Direccion
FROM Cliente c
LEFT JOIN Venta v ON c.id_Cliente = v.id_Cliente
WHERE v.id_ventas IS NULL;
   

CREATE VIEW Vista_Productos_Mas_Vendidos AS
SELECT 
    p.Nombre_Prod, 
    SUM(dv.Cantidad_Producto) AS Total_Vendido
FROM Producto p
JOIN Detalles_venta dv ON p.id_Producto = dv.id_Producto
GROUP BY p.id_Producto
ORDER BY Total_Vendido DESC;

CREATE VIEW Vista_Productos_Baja_Existencia AS
SELECT 
    p.Nombre_Prod, 
    p.Existencia_Prod
FROM Producto p
WHERE p.Existencia_Prod < 10;

CREATE VIEW Vista_Productos_Sin_Ventas AS
SELECT 
    p.Nombre_Prod
FROM Producto p
LEFT JOIN Detalles_venta dv ON p.id_Producto = dv.id_Producto
WHERE dv.id_DetalleVenta IS NULL;

CREATE VIEW Vista_Productos_Con_Proveedores AS
SELECT 
    p.Nombre_Prod, 
    prov.Nombre_Proveedor
FROM Producto p
JOIN DetalleCompra dc ON p.id_Producto = dc.id_Producto
JOIN Compra c ON dc.id_compra = c.id_compra
JOIN Proveedor prov ON c.id_Proveedor = prov.id_Proveedor;

CREATE VIEW Vista_Productos_Precio_Costo AS
SELECT 
    p.Nombre_Prod, 
    p.Precio_Venta, 
    p.Precio_Costo
FROM Producto p;

CREATE VIEW Vista_Proveedores_Mas_Productos AS
SELECT 
    prov.Nombre_Proveedor, 
    COUNT(p.id_Producto) AS Total_Productos
FROM Proveedor prov
JOIN Compra c ON prov.id_Proveedor = c.id_Proveedor
JOIN DetalleCompra dc ON c.id_compra = dc.id_compra
JOIN Producto p ON dc.id_Producto = p.id_Producto
GROUP BY prov.id_Proveedor
ORDER BY Total_Productos DESC;


CREATE VIEW Vista_Proveedores_Completos AS
SELECT 
    prov.Nombre_Proveedor, 
    prov.Telefono, 
    prov.Tipo_distribuidor
FROM Proveedor prov;

CREATE VIEW Vista_Proveedores_Sin_Compras AS
SELECT 
    prov.Nombre_Proveedor
FROM Proveedor prov
LEFT JOIN Compra c ON prov.id_Proveedor = c.id_Proveedor
WHERE c.id_compra IS NULL;

CREATE VIEW Vista_Proveedores_Productos_Suministrados AS
SELECT 
    prov.Nombre_Proveedor, 
    p.Nombre_Prod
FROM Proveedor prov
JOIN Compra c ON prov.id_Proveedor = c.id_Proveedor
JOIN DetalleCompra dc ON c.id_compra = dc.id_compra
JOIN Producto p ON dc.id_Producto = p.id_Producto;


CREATE VIEW Vista_Compras_Rango_Fechas AS
SELECT 
    c.id_compra, 
    prov.Nombre_Proveedor, 
    c.Fe_compra
FROM Compra c
JOIN Proveedor prov ON c.id_Proveedor = prov.id_Proveedor
WHERE c.Fe_compra BETWEEN '2023-01-01' AND '2023-12-31';


CREATE VIEW Vista_Compras_Sin_Ventas AS
SELECT 
    c.id_compra, 
    prov.Nombre_Proveedor, 
    p.Nombre_Prod
FROM Compra c
JOIN Proveedor prov ON c.id_Proveedor = prov.id_Proveedor
JOIN DetalleCompra dc ON c.id_compra = dc.id_compra
JOIN Producto p ON dc.id_Producto = p.id_Producto
LEFT JOIN Detalles_venta dv ON p.id_Producto = dv.id_Producto
WHERE dv.id_DetalleVenta IS NULL;

DELIMITER // 
CREATE FUNCTION obtener_stock_producto(p_id_Producto INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE stock_total DECIMAL(10,2);

  SELECT Existencia_Prod INTO stock_total
  FROM Producto
  WHERE id_Producto = p_id_Producto;

  RETURN stock_total;
END //
DELIMITER ;

SELECT obtener_stock_producto(1);


DELIMITER //
CREATE FUNCTION ganancia_unidad(p_id_Producto INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE ganancia DECIMAL(10,2);

  SELECT (Precio_Venta - Precio_Costo) INTO ganancia
  FROM Producto
  WHERE id_Producto = p_id_Producto;

  RETURN ganancia;
END //
DELIMITER ;

SELECT ganancia_unidad(1);

DELIMITER //
CREATE FUNCTION productos_caducados()
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total INT;

  SELECT COUNT(*) INTO total
  FROM Producto
  WHERE Fe_caducidad < CURDATE();

  RETURN total;
END //
DELIMITER ;

SELECT productos_caducados();

DELIMITER //
CREATE FUNCTION total_ventas_cliente(p_id_Cliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total INT;

  SELECT COUNT(*) INTO total
  FROM Venta
  WHERE id_Cliente = p_id_Cliente;

  RETURN total;
END //
DELIMITER ;
SELECT total_ventas_cliente(2);

DELIMITER //
CREATE FUNCTION total_vendido_producto(p_id_Producto INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total INT;

  SELECT SUM(Cantidad_Producto) INTO total
  FROM Detalles_venta
  WHERE id_Producto = p_id_Producto;

  RETURN IFNULL(total, 0);
END //
DELIMITER ;

SELECT total_vendido_producto(1);


-- Usuario y PRIVILEGES--
 Create USER IF NOT EXISTS 'welvin'@'localhost' IDENTIFIED BY 'welvin123';
GRANT SELECT ON almacenrural.* TO 'welvin'@'localhost';

Create USER IF NOT EXISTS 'Stiven'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON almacenrural.* TO 'Stiven'@'localhost';

Create USER IF NOT EXISTS 'Azter'@'localhost' IDENTIFIED BY 'Cli231';
GRANT INSERT, UPDATE ON almacenrural.Cliente TO 'Azter'@'localhost';
FLUSH PRIVILEGES;


SHOW GRANTS FOR 'welvin'@'localhost';
SHOW GRANTS FOR 'Stiven'@'localhost';
SHOW GRANTS FOR 'Azter'@'localhost';

  -- modificar CONTRASEÑA --

ALTER USER 'welvin'@'localhost' IDENTIFIED BY 'nuevaClave456';

-- revoke los privilegio --

REVOKE SELECT ON almacenrural.* FROM 'welvin'@'localhost';

-- ELIMINAR USUARIO
DROP USER 'welvin'@'localhost';

-- Verificar privilegios
SHOW GRANTS FOR 'editor1'@'localhost';
SHOW GRANTS FOR 'lector2'@'localhost';
SHOW GRANTS FOR 'gestor'@'localhost';

DELIMITER $$
CREATE EVENT cierre_compra_automatico
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(CURRENT_DATE, '23:59:00')  -- se ejecuta a las 11:59 PM
DO
BEGIN
    UPDATE Compra c
    SET c.total_compra = (
        SELECT IFNULL(SUM(dc.Precio * dc.cantidad), 0)
        FROM DetalleCompra dc
        WHERE dc.id_compra = c.id_compra
    )
    WHERE DATE(c.Fe_compra) = CURRENT_DATE;
END$$

DELIMITER ;

DELIMITER $$

CREATE EVENT cierre_venta_automatico
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(CURRENT_DATE, '23:59:00') -- se ejecuta a las 11:59 PM
DO
BEGIN
    UPDATE Venta v
    SET v.total_venta = (
        SELECT IFNULL(SUM(dv.Precio_venta * dv.Cantidad_Producto), 0)
        FROM DetalleVenta dv
        WHERE dv.id_Venta = v.id_ventas
    )
    WHERE DATE(v.Fe_Venta) = CURRENT_DATE;
END$$

DELIMITER ;

-- TIGGER PARA LA BITACORA --
-- Trigger Insert Cliente--
Delimiter //
CREATE TRIGGER trg_insert_cliente
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_cliente, valores_nuevos
    )
     VALUES ( 'Cliente', 'INSERT', CURRENT_USER(), NEW.id_cliente,
     CONCAT('Nombre1: ', NEW.Nombre1, ', Nombre2: ', NEW.Nombre2, ', Apellido1: ', NEW.Apellido1, ', Apellido2: ', NEW.Apellido2, ', Direccion: ', NEW.Direccion, ', Telefono: ', NEW.Telefono)
     );
     END //
     DELIMITER ;
     
     DELIMITER //
CREATE TRIGGER trg_update_cliente
AFTER UPDATE ON cliente
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_cliente,
    valores_anteriores, valores_nuevos
  )
  VALUES (
    'Producto', 'UPDATE', CURRENT_USER(), NEW.id_cliente,
    CONCAT('Nombre1: ', OLD.Nombre1, ', Nombre2: ', OLD.Nombre2, ', Aoellido1: ', OLD.Apellido1, ', Apellido2: ', OLD.Apellido2, ', Direccion: ', OLD.Direccion, ', Telefono: ', OLD.Telefono),
    CONCAT('Nombre1: ', OLD.Nombre1, ', Nombre2: ', OLD.Nombre2, ', Aoellido1: ', OLD.Apellido1, ', Apellido2: ', OLD.Apellido2, ', Direccion: ', OLD.Direccion, ', Telefono: ', OLD.Telefono));
END //
DELIMITER ;

DELIMITER // 
CREATE TRIGGER trg_delete_cliente
AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores
  )
  VALUES (
    'Producto', 'DELETE', CURRENT_USER(), OLD.id_cliente,
    CONCAT('Nombre1: ', OLD.Nombre1, ', Nombre2: ', OLD.Nombre2, ', Aoellido1: ', OLD.Apellido1, ', Apellido2: ', OLD.Apellido2, ', Direccion: ', OLD.Direccion, ', Telefono: ', OLD.Telefono)
  );
END //
DELIMITER ;


-- Producto ---
-- Trigger para INSERT Producto ---
DELIMITER // 
CREATE TRIGGER trg_insert_producto
AFTER INSERT ON Producto
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_producto, valores_nuevos
  )
  VALUES (
    'Producto', 'INSERT', CURRENT_USER(), NEW.id_Producto,
    CONCAT('Nombre_Prod: ', NEW.Nombre_Prod, ', Num: ', NEW.Num, ', Existencia_Prod: ', NEW.Existencia_Prod, ', Precio_Costo: ', NEW.Precio_Costo, ', Precio_Venta: ', NEW.Precio_Venta, ', Fe_caducidad: ', NEW.Fe_caducidad)
  );
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_update_producto
AFTER UPDATE ON Producto
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_producto,
    valores_anteriores, valores_nuevos
  )
  VALUES (
    'Producto', 'UPDATE', CURRENT_USER(), NEW.id_Producto,
    CONCAT('Nombre_Prod: ', OLD.Nombre_Prod, ', Num: ', OLD.Num, ', Existencia_Prod: ', OLD.Existencia_Prod, ', Precio_Costo: ', OLD.Precio_Costo, ', Precio_Venta: ', OLD.Precio_Venta, ', Fe_caducidad: ', OLD.Fe_caducidad),
    CONCAT('Nombre_Prod: ', NEW.Nombre_Prod, ', Num: ', NEW.Num, ', Existencia_Prod: ', NEW.Existencia_Prod, ', Precio_Costo: ', NEW.Precio_Costo, ', Precio_Venta: ', NEW.Precio_Venta, ', Fe_caducidad: ', NEW.Fe_caducidad));
END //
DELIMITER ;

DELIMITER // 
CREATE TRIGGER trg_delete_producto
AFTER DELETE ON Producto
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_producto, valores_anteriores
  )
  VALUES (
    'Producto', 'DELETE', CURRENT_USER(), OLD.id_Producto,
    CONCAT('Nombre_Prod: ', OLD.Nombre_Prod, ', Num: ', OLD.Num, ', Existencia_Prod: ', OLD.Existencia_Prod, ', Precio_Costo: ', OLD.Precio_Costo, ', Precio_Venta: ', OLD.Precio_Venta, ', Fe_caducidad: ', OLD.Fe_caducidad)
  );
END //
DELIMITER ;

INSERT INTO Producto (Nombre_Prod, Num, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Señillas alimenticias', 'Alimento', 25, 120000, 90000, '2027-10-20');

UPDATE Producto SET Nombre_Prod = 'aveyanas', Num = 'alimentos', Existencia_Prod = 150.00, Precio_Costo = 25.50, Precio_Venta = 40.00, Fe_caducidad = '2025-12-31'
WHERE id_Producto = 1;

DELETE FROM Producto
WHERE id_Producto = 1;

-- Usuario--
DELIMITER //
CREATE TRIGGER trg_insert_usuarios
AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_producto, valores_nuevos
  )
  VALUES (
    'Usuarios', 'INSERT', CURRENT_USER(), NEW.id,
    CONCAT('nombre: ', NEW.nombre, ', apellido: ', NEW.apellido, ', correo: ', NEW.correo_electronico, ', telefono: ', NEW.telefono, ', genero: ', NEW.genero, ', rol: ', NEW.rol)
  );
END//

DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_update_usuarios
AFTER UPDATE ON Usuarios
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_producto, valores_anteriores, valores_nuevos
  )
  VALUES (
    'Usuarios', 'UPDATE', CURRENT_USER(), NEW.id,
    CONCAT('nombre: ', OLD.nombre, ', apellido: ', OLD.apellido, ', correo: ', OLD.correo_electronico, ', telefono: ', OLD.telefono, ', genero: ', OLD.genero, ', rol: ', OLD.rol),
    CONCAT('nombre: ', NEW.nombre, ', apellido: ', NEW.apellido, ', correo: ', NEW.correo_electronico, ', telefono: ', NEW.telefono, ', genero: ', NEW.genero, ', rol: ', NEW.rol)
  );
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_delete_usuarios
AFTER DELETE ON Usuarios
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_producto, valores_anteriores
  )
  VALUES (
    'Usuarios', 'DELETE', CURRENT_USER(), OLD.id,
    CONCAT('nombre: ', OLD.nombre, ', apellido: ', OLD.apellido, ', correo: ', OLD.correo_electronico, ', telefono: ', OLD.telefono, ', genero: ', OLD.genero, ', rol: ', OLD.rol)
  );
END //

DELIMITER ;

INSERT INTO Usuarios (nombre, apellido, correo_electronico, contrasena, telefono, genero, rol)
VALUES ('Carlos', 'Ramírez', 'carlos.ramirez@example.com', 'clave123', '88887777', 'masculino', 'admin');

UPDATE Usuarios
SET telefono = '77778888', rol = 'cajero'
WHERE id = 1;

DELETE FROM Usuarios
WHERE id = 1;

-- Proveedor ---

DELIMITER //
CREATE TRIGGER trg_insert_proveedor
AFTER INSERT ON Proveedor
FOR EACH ROW
BEGIN
 
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, proveedor
  )
  VALUES (
  'Proveedor', 'INSERT',  CURRENT_USER(), NEW.id,
  CONCAT ( 'id_Proveedor', NEW.id_Proveedor,'Nombre_Proveedor', NEW.Nombre_Proveedor, 'Telefono', NEW.Telefono, 'Tipo_distribuidor', NEW.Tipo_distribuidor)
  );
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_proveedor_update
AFTER UPDATE ON Proveedor
FOR EACH ROW
BEGIN
  -- Insertar en bitácora general
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, proveedor
  )
  VALUES ('Proveedor', 'UPDATE',CURRENT_USER(), NEW.id_Proveedor,
 CONCAT ( 'Nombre_Proveedor', OLD.Nombre_Proveedor, 'Telefono', OLD.Telefono, 'Tipo_distribuidor', OLD.Tipo_distribuidor),
 CONCAT ( 'Nombre_Proveedor', NEW.Nombre_Proveedor, 'Telefono', NEW.Telefono, 'Tipo_distribuidor', NEW.Tipo_distribuidor)
  );
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg__delete_proveedor
AFTER DELETE ON Proveedor
FOR EACH ROW
BEGIN
  
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario)
  VALUES ('Proveedor', 'DELETE',  CURRENT_USER(), OLD.id_Proveedor,
 CONCAT ('Nombre_Proveedor', OLD.Nombre_Proveedor, 'Telefono', OLD.Telefono, 'Tipo_distribuidor', OLD.Tipo_distribuidor)
 );
END //
DELIMITER ;

-- Insertar proveedor--
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor)
VALUES ('Distribuidora X', '80012345', 'Alimentos');

-- Actualizar proveedor --
UPDATE Proveedor
SET Telefono = '88889999'
WHERE id_Proveedor = 1;

-- Eliminar proveedor
DELETE FROM Proveedor 
WHERE id_Proveedor = 1;

-- Compra --

DELIMITER //
CREATE TRIGGER trg_insert_compra
AFTER INSERT ON Compra
FOR EACH ROW
BEGIN

  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, proveedor
  )
  VALUES (
  'Compra', 'INSERT',  CURRENT_USER(), NEW.id,
  CONCAT ( 'id_Proveedor', NEW.id_Proveedor,'Fe_compra', NEW.Fe_compra)
  );
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_compra_update
AFTER UPDATE ON Compra
FOR EACH ROW
BEGIN
  -- Insertar en bitácora general
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, proveedor
  )
  VALUES ('Compra', 'UPDATE',CURRENT_USER(), NEW.id_Proveedor,
 CONCAT ( 'id_Proveedor', OLD.id_Proveedor, 'Fe_compra', OLD.Fe_compra),
 CONCAT ( 'id_Proveedor', NEW.id_Proveedor, 'Fe_compra', NEW.Fe_compra)
  );
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg__delete_proveedor
AFTER DELETE ON Proveedor
FOR EACH ROW
BEGIN
  
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario)
  VALUES ('Compra', 'DELETE',  CURRENT_USER(), OLD.id_Proveedor,
 CONCAT ('id_Proveedor', OLD.id_Proveedor, 'Fe_compra', OLD.Fe_compra)
 );
END //
DELIMITER ;

-- Insertar Compra--
INSERT INTO Compra (id_Proveedor, Fe_compra)
VALUES (1,'24-09-17');

-- Actualizar Compra --
UPDATE Compra
SET Fe_compra = '24-09-17'
WHERE id_Proveedor = 1;

-- Eliminar Compra
DELETE FROM Compra 
WHERE id_Proveedor = 1;

-- DeatlleCompra --
DELIMITER //
CREATE TRIGGER trg_insert_compra
AFTER INSERT ON Compra
FOR EACH ROW
BEGIN

  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, proveedor
  )
  VALUES (
  'Compra', 'INSERT',  CURRENT_USER(), NEW.id,
  CONCAT ( 'id_Proveedor', NEW.id_Proveedor,'Fe_compra', NEW.Fe_compra)
  );
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_compra_update
AFTER UPDATE ON Compra
FOR EACH ROW
BEGIN
  -- Insertar en bitácora general
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, proveedor
  )
  VALUES ('Compra', 'UPDATE',CURRENT_USER(), NEW.id_Proveedor,
 CONCAT ( 'id_Proveedor', OLD.id_Proveedor, 'Fe_compra', OLD.Fe_compra),
 CONCAT ( 'id_Proveedor', NEW.id_Proveedor, 'Fe_compra', NEW.Fe_compra)
  );
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg__delete_proveedor
AFTER DELETE ON Proveedor
FOR EACH ROW
BEGIN
  
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario)
  VALUES ('Compra', 'DELETE',  CURRENT_USER(), OLD.id_Proveedor,
 CONCAT ('id_Proveedor', OLD.id_Proveedor, 'Fe_compra', OLD.Fe_compra)
 );
END //
DELIMITER ;

-- Insertar Compra--
INSERT INTO Compra (id_Proveedor, Fe_compra)
VALUES (1,'24-09-17');

-- Actualizar Compra --
UPDATE Compra
SET Fe_compra = '24-09-17'
WHERE id_Proveedor = 1;

-- Eliminar Compra
DELETE FROM Compra 
WHERE id_Proveedor = 1;

-- Ventas --
DELIMITER // 
CREATE TRIGGER trg_insert_venta
AFTER INSERT ON Venta
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_venta, valores_nuevos
  )
  VALUES (
    'Venta', 'INSERT', CURRENT_USER(), NEW.id_ventas,
    CONCAT('id_Cliente: ', NEW.id_Cliente, ', Fe_Venta: ', NEW.Fe_Venta)
  );
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_update_venta
AFTER UPDATE ON Venta
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_venta,
    valores_anteriores, valores_nuevos
  )
  VALUES (
    'Venta', 'UPDATE', CURRENT_USER(), NEW.id_Ventas,
      CONCAT('id_Cliente: ', old.id_Cliente, ', Fe_Venta: ', old.Fe_Venta),
       CONCAT('id_Cliente: ', NEW.id_Cliente, ', Fe_Venta: ', NEW.Fe_Venta));
END //
DELIMITER ;

DELIMITER // 
CREATE TRIGGER trg_delete_venta
AFTER DELETE ON Venta
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_producto
  )
  VALUES (
    'Venta', 'DELETE', CURRENT_USER(), OLD.id_Ventas,
   CONCAT('id_Cliente: ', old.id_Cliente, ', Fe_Venta: ', old.Fe_Venta)
  );
END //
DELIMITER ;

INSERT INTO Venta (id_Cliente, Fe_Venta) VALUES (1, '2025-04-01 10:00:00');

UPDATE Venta SET id_Cliente = '1', Fe_Venta = '2025-09-10 06:00:00'
WHERE id_Ventas = 1;

DELETE FROM Venta
WHERE id_Ventas = 1;

-- DetallesVentas---
DELIMITER $$
CREATE TRIGGER after_detalles_venta_insert
AFTER INSERT ON Detalles_venta
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario)
    VALUES ('Detalles_venta', 'INSERT', current_user());
END$$
DELIMITER ;



DELIMITER $$
CREATE TRIGGER after_detalles_venta_update
AFTER UPDATE ON Detalles_venta
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario)
    VALUES ('Detalles_venta', 'UPDATE', current_user());
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER after_detalles_venta_delete
AFTER DELETE ON Detalles_venta
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario)
    VALUES ('Detalles_venta', 'DELETE', current_user());
END$$
DELIMITER ; 

