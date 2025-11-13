-- Crear la base de datos y usarla
CREATE DATABASE almacenrural;
USE almacenrural;


CREATE TABLE Cliente (
  id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
  Nombre1 VARCHAR(30),
  Nombre2 VARCHAR(30),
  Apellido1 VARCHAR(30),
  Apellido2 VARCHAR(30),
  Direccion VARCHAR(80),
  Telefono VARCHAR(8)
);

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

CREATE TABLE Producto (
  id_Producto INT AUTO_INCREMENT PRIMARY KEY,
  Nombre_Prod VARCHAR(30),
  Tipo_Prod VARCHAR(20),
  Existencia_Prod DECIMAL(6,2),
  stock INT ,
  Precio_Costo DECIMAL(10,2),
  Precio_Venta DECIMAL(10,2),
  Fe_caducidad DATE
);


CREATE TABLE Proveedor (
    id_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Proveedor VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20),
    Email VARCHAR(100),
    Direccion VARCHAR(200),
    Tipo_Distribuidor VARCHAR(50),
    Condiciones_Pago VARCHAR(50),
    Estado ENUM('Activo','Inactivo') DEFAULT 'Activo',
    Fecha_Registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Compra (
  id_compra INT AUTO_INCREMENT PRIMARY KEY,
  id_Proveedor INT,
  Fe_compra DATETIME,
  FOREIGN KEY (id_Proveedor) REFERENCES Proveedor(id_Proveedor) ON DELETE CASCADE
);


CREATE TABLE DetalleCompra (
  id_DetalleCompra INT AUTO_INCREMENT PRIMARY KEY,
  id_compra INT,
  id_Producto INT,
  Fe_Ingresado DATE,
  Fe_caducidad DATE,
  Precio DECIMAL(10,2) NOT NULL, 
  Cantidad INT,
  FOREIGN KEY (id_Producto) REFERENCES Producto(id_Producto) ON DELETE CASCADE,
  FOREIGN KEY (id_compra) REFERENCES Compra(id_compra) ON DELETE CASCADE
);

CREATE TABLE Venta (
  id_ventas INT AUTO_INCREMENT PRIMARY KEY,
  id_Cliente INT,
  Fe_Venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente) ON DELETE CASCADE
);


CREATE TABLE Detalles_venta (
  id_DetalleVenta INT AUTO_INCREMENT PRIMARY KEY,
  id_Venta INT,
  id_Producto INT,
  Precio_venta DECIMAL(10,2) NOT NULL,
  Cantidad_Producto INT,
  FOREIGN KEY (id_Producto) REFERENCES Producto(id_Producto) ON DELETE CASCADE,
  FOREIGN KEY (id_Venta) REFERENCES Venta(id_ventas) ON DELETE CASCADE
);


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


-- Clientes
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono)
VALUES
('Carlos', 'Andrés', 'Pérez', 'Mendoza', 'Calle 10 #25-34', '31012345'),
('Laura', 'María', 'Gómez', 'Ríos', 'Carrera 15 #12-80', '31123456'),
('David','Jose' , 'Ruiz', 'Cano', 'Av. Central 45-90', '31234567'),
('Ana', 'Lucía', 'Fernández', 'Zapata', 'Calle 8 #10-12', '31345678'),
('Sofía', 'Isabel', 'Torres', 'López', 'Cra 20 #5-67', '31456789'),
('Miguel', 'Ángel', 'Rodríguez', 'Pardo', 'Calle 12 #30-15', '31567890'),
('Juliana', 'Beatriz', 'Ramírez', 'Duarte', 'Carrera 9 #8-23', '31678901'),
('Andrés', 'Carlos', 'Martínez', 'Salas', 'Av. Sur #7-50', '31789012'),
('Daniela', 'Camila', 'Castaño', 'Luna', 'Calle 5 #11-44', '31890123');

-- Usuarios
INSERT INTO Usuarios (nombre, apellido, correo_electronico, contrasena, telefono, genero, rol)
VALUES
('Juan', 'Pérez', 'juan.perez@correo.com', '123456789', '55512345', 'masculino', 'cajero'),
('Ana', 'Gómez', 'ana.gomez@correo.com', '123456789', '55523456', 'femenino', 'admin'),
('Luis', 'Martínez', 'luis.mtz@correo.com', '123456789', '55534567', 'masculino', 'cajero'),
('María', 'Lopez', 'maria.lopez@correo.com', '123456789', '55545678', 'femenino', 'cajero'),
('Carlos', 'Ruiz', 'carlos.ruiz@correo.com', '123456789', '55556789', 'masculino', 'admin');


INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Email, Direccion, Tipo_Distribuidor, Condiciones_Pago)
VALUES
('Distribuidora AnimalCare', '58236323', 'contacto@animalcare.com', 'Calle 1 #12-34', 'Alimentos', 'Contado'),
('Pet Health S.A.', '84182003', 'ventas@pethealth.com', 'Av. Central 22-15', 'Medicamentos', '30 días'),
('CleanPet Co.', '57249865', 'info@cleanpet.com', 'Cra 5 #10-20', 'Aseo', 'Contado'),
('Mascotas Feliz Ltda', '38053806', 'ventas@mascotasfeliz.com', 'Calle 8 #15-10', 'Accesorios', 'Contado'),
('SuperPet Import', '88557677', 'import@superpet.com', 'Av. Norte 18-30', 'Variado', '30 días'),
('Almacen Macota', '87444546', 'contacto@almacenmacota.com', 'Cra 10 #7-25', 'Accesorios de Baño', 'Contado'),
('BioMascotas S.A.', '52725534', 'bio@biomascotas.com', 'Calle 15 #5-12', 'Medicamentos', '30 días'),
('Veterinaria Global', '68017605', 'global@veterinaria.com', 'Av. Sur #20-18', 'Medicamentos', 'Contado'),
('PetCare Solutions', '77136453', 'info@petcare.com', 'Cra 25 #12-14', 'Alimentos', '30 días'),
('Mascota Sana', '62288756', 'ventas@mascotasana.com', 'Calle 18 #9-8', 'Aseo', 'Contado');


-- Productos
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta, Fe_caducidad, stock)
VALUES
('Dog Chow Adulto 15kg', 'Alimento', 25, 90000, 120000, '2025-12-31', 25),
('Cat Chow Gato 8kg', 'Alimento', 18, 60000, 85000, '2025-11-30', 18),
('Antipulgas Frontline', 'Medicamento', 30, 25000, 40000, '2026-06-30', 30),
('Shampoo Canino 500ml', 'Aseo', 50, 12000, 20000, '2026-01-15', 50),
('Juguete Hueso de Goma', 'Accesorio', 40, 8000, 15000, '2026-01-15', 40),
('Arena para Gato 10kg', 'Aseo', 35, 18000, 30000,'2026-07-15', 35),
('Vitaminas para Perro', 'Medicamento', 20, 15000, 25000, '2025-05-01', 20),
('Comedero Doble Acero', 'Accesorio', 45, 16000, 28000, '2026-01-15', 45),
('Collar Antipulgas', 'Accesorio', 60, 12000, 22000, '2026-03-15', 60),
('Pelota con sonido', 'Accesorio', 70, 6000, 10000, '2028-01-15', 70);


-- Compras
INSERT INTO Compra (id_Proveedor, Fe_compra)
VALUES
(1, '2025-01-10 08:15'),
(2, '2025-02-14 09:30'),
(3, '2025-03-20 10:45'),
(4, '2025-04-05 11:00'),
(5, '2025-05-01 12:20');

-- DetalleCompra (IDs válidos ahora)
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad)
VALUES
(1, 1, '2025-01-10', '2025-12-31', 90000, 60),
(2, 2, '2025-02-14', '2025-11-30', 60000, 50),
(3, 3, '2025-03-20', '2026-06-30', 25000, 70),
(4, 4, '2025-04-05', '2026-01-15', 12000, 80),
(5, 5, '2025-05-01', NULL, 8000, 30);

-- Ventas
INSERT INTO Venta (id_Cliente, Fe_Venta)
VALUES
(1, '2025-04-01 10:00:00'),
(2, '2025-04-02 11:30:00'),
(3, '2025-04-03 09:45:00');

-- Detalle de ventas
INSERT INTO Detalles_venta (id_Venta, id_Producto, Precio_venta, Cantidad_Producto)
VALUES
(1, 2, 85000, 1),
(2, 4, 20000, 2),
(3, 1, 120000, 1);

-- Procedimientos almacenados

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


-- No lo veo necesario ya que ya tienen un procedimiento almacenado que actualiza los usuarios con eso vasta.
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

-- Procedimiento para agregar un nuevo producto (con stock)
CREATE PROCEDURE agregar_producto(
  IN p_Nombre_Prod VARCHAR(30),
  IN p_Tipo_Prod VARCHAR(20),
  IN p_Existencia_Prod DECIMAL(6,2),
  IN p_stock INT,
  IN p_Precio_Venta DECIMAL(10,2),
  IN p_Precio_Costo DECIMAL(10,2),
  IN p_Fe_caducidad DATE
)
BEGIN
  INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, stock, Precio_Venta, Precio_Costo, Fe_caducidad)
  VALUES (p_Nombre_Prod, p_Tipo_Prod, p_Existencia_Prod, p_stock, p_Precio_Venta, p_Precio_Costo, p_Fe_caducidad);
END //

-- Procedimiento para contar la cantidad total de productos
CREATE PROCEDURE contar_productos()
BEGIN
  SELECT COUNT(*) AS cantidad_productos FROM Producto;
END //

-- Procedimiento para obtener un producto por ID (incluye stock)
CREATE PROCEDURE obtener_producto_por_id(
  IN p_id_producto INT
)
BEGIN
  SELECT Nombre_Prod, Tipo_Prod, Existencia_Prod, stock, Precio_Venta, Precio_Costo, Fe_caducidad
  FROM Producto
  WHERE id_Producto = p_id_producto;
END //

-- Procedimiento para actualizar el precio de un producto
CREATE PROCEDURE actualizar_precio_producto(
  IN p_id_producto INT,
  IN p_nuevo_precio DECIMAL(10,2)
)
BEGIN
  UPDATE Producto
  SET Precio_Venta = p_nuevo_precio
  WHERE id_Producto = p_id_producto;
END //

-- Procedimiento para verificar existencia y stock de un producto
CREATE PROCEDURE verificar_existencia_producto(
  IN p_id_producto INT
)
BEGIN
  DECLARE existencia DECIMAL(6,2);
  DECLARE stock_actual INT;

  SELECT Existencia_Prod, stock INTO existencia, stock_actual
  FROM Producto
  WHERE id_Producto = p_id_producto;

  IF existencia > 0 AND stock_actual > 0 THEN
    SELECT 'Disponible' AS estado;
  ELSE
    SELECT 'No Disponible' AS estado;
  END IF;
END //

DELIMITER ;


DELIMITER //
CREATE PROCEDURE agregar_proveedores(
  IN p_Nombre_Proveedor VARCHAR(50),
  IN p_Telefono VARCHAR(20),
  IN p_Email VARCHAR(100),
  IN p_Direccion VARCHAR(200),
  IN p_Tipo_Distribuidor VARCHAR(50),
  IN p_Condiciones_Pago VARCHAR(50)
)
BEGIN
  INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Email, Direccion, Tipo_Distribuidor, Condiciones_Pago)
  VALUES (p_Nombre_Proveedor, p_Telefono, p_Email, p_Direccion, p_Tipo_Distribuidor, p_Condiciones_Pago);
END ;

-- Actualizar Proveedor
CREATE PROCEDURE ActualizarProveedor(
  IN pId INT,
  IN pNombre VARCHAR(50),
  IN pTelefono VARCHAR(20),
  IN pEmail VARCHAR(100),
  IN pDireccion VARCHAR(200),
  IN pTipoDistribuidor VARCHAR(50),
  IN pCondicionesPago VARCHAR(50),
  IN pEstado ENUM('Activo','Inactivo')
)
BEGIN
  UPDATE Proveedor
  SET Nombre_Proveedor = pNombre,
      Telefono = pTelefono,
      Email = pEmail,
      Direccion = pDireccion,
      Tipo_Distribuidor = pTipoDistribuidor,
      Condiciones_Pago = pCondicionesPago,
      Estado = pEstado
  WHERE id_Proveedor = pId;
END;

-- Eliminar Proveedor
CREATE PROCEDURE EliminarProveedor(
  IN pId INT
)
BEGIN
  DELETE FROM Proveedor
  WHERE id_Proveedor = pId;
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
  INSERT INTO DetalleCompra (id_Producto, id_compra, Fe_Ingresado, Fe_caducidad, Precio, cantidad)
  VALUES (p_id_producto, p_id_compra, p_Fe_Ingresado, p_Fe_caducidad, p_Valor_Compra, NULL); -- Ajustado para coincidir con tabla
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
  SELECT id_Producto, id_compra, Fe_Ingresado, Fe_caducidad, Precio, cantidad
  FROM DetalleCompra
  WHERE id_DetalleCompra = p_id_detallecompra;
END //
DELIMITER ;

-- Vistas

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

-- Funciones

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

-- Roles

CREATE ROLE 'admin190';
CREATE ROLE 'cajero001';
CREATE ROLE 'cajero181';
CREATE ROLE 'lector215';

-- Asignar permisos a roles (corregido y simplificado)
GRANT ALL PRIVILEGES ON almacenrural.Venta TO 'admin72';
GRANT SELECT, INSERT, UPDATE ON almacenrural.Venta TO 'cajero9';

-- Usuarios y privilegios

CREATE USER IF NOT EXISTS 'welvin'@'localhost' IDENTIFIED BY 'welvin123';
GRANT SELECT ON almacenrural.* TO 'welvin'@'localhost';

CREATE USER IF NOT EXISTS 'Stiven'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON almacenrural.* TO 'Stiven'@'localhost';

CREATE USER IF NOT EXISTS 'Azter'@'localhost' IDENTIFIED BY 'Cli231';
GRANT INSERT, UPDATE ON almacenrural.Cliente TO 'Azter'@'localhost';

FLUSH PRIVILEGES;

-- Asignar roles a usuarios (corregido)
GRANT 'admin72' TO 'Stiven'@'localhost';
GRANT 'cajero9' TO 'Azter'@'localhost';
GRANT 'lector' TO 'welvin'@'localhost';

FLUSH PRIVILEGES;

-- Modificar contraseña
ALTER USER 'welvin'@'localhost' IDENTIFIED BY 'nuevaClave456';

-- Revoke privilegios
REVOKE SELECT ON almacenrural.* FROM 'welvin'@'localhost';

-- Eliminar usuario
DROP USER 'welvin'@'localhost';

-- Eventos

DELIMITER $$
CREATE EVENT cierre_compra_automatico
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(CURRENT_DATE, '23:59:00')
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
STARTS TIMESTAMP(CURRENT_DATE, '23:59:00')
DO
BEGIN
    UPDATE Venta v
    SET v.total_venta = (
        SELECT IFNULL(SUM(dv.Precio_venta * dv.Cantidad_Producto), 0)
        FROM Detalles_venta dv
        WHERE dv.id_Venta = v.id_ventas
    )
    WHERE DATE(v.Fe_Venta) = CURRENT_DATE;
END$$
DELIMITER ;

-- Triggers (corregidos y organizados)

-- Triggers para Cliente
DELIMITER //
CREATE TRIGGER trg_insert_cliente
AFTER INSERT ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_nuevos)
    VALUES ('Cliente', 'INSERT', CURRENT_USER(), NEW.id_Cliente,
     CONCAT('Nombre1: ', NEW.Nombre1, ', Nombre2: ', NEW.Nombre2, ', Apellido1: ', NEW.Apellido1, 
     ', Apellido2: ', NEW.Apellido2, ', Direccion: ', NEW.Direccion, ', Telefono: ', NEW.Telefono));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_update_cliente
AFTER UPDATE ON Cliente
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores, valores_nuevos)
  VALUES ('Cliente', 'UPDATE', CURRENT_USER(), NEW.id_Cliente,
    CONCAT('Nombre1: ', OLD.Nombre1, ', Nombre2: ', OLD.Nombre2, ', Apellido1: ', OLD.Apellido1, ', Apellido2: ', OLD.Apellido2, ', Direccion: ', OLD.Direccion, ', Telefono: ', OLD.Telefono),
    CONCAT('Nombre1: ', NEW.Nombre1, ', Nombre2: ', NEW.Nombre2, ', Apellido1: ', NEW.Apellido1, ', Apellido2: ', NEW.Apellido2, ', Direccion: ', NEW.Direccion, ', Telefono: ', NEW.Telefono));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_delete_cliente
AFTER DELETE ON Cliente
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores)
  VALUES ('Cliente', 'DELETE', CURRENT_USER(), OLD.id_Cliente,
    CONCAT('Nombre1: ', OLD.Nombre1, ', Nombre2: ', OLD.Nombre2, 
           ', Apellido1: ', OLD.Apellido1, ', Apellido2: ', OLD.Apellido2, 
           ', Direccion: ', OLD.Direccion, ', Telefono: ', OLD.Telefono));
END //
DELIMITER ;

DELIMITER //

-- Trigger: INSERT
CREATE TRIGGER trg_insert_producto
AFTER INSERT ON Producto
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_cliente, valores_nuevos
  )
  VALUES (
    'Producto', 
    'INSERT', 
    CURRENT_USER(), 
    NEW.id_Producto,
    CONCAT(
      'Nombre_Prod: ', NEW.Nombre_Prod, 
      ', Tipo_Prod: ', NEW.Tipo_Prod, 
      ', Existencia_Prod: ', NEW.Existencia_Prod,
      ', stock: ', NEW.stock,
      ', Precio_Costo: ', NEW.Precio_Costo, 
      ', Precio_Venta: ', NEW.Precio_Venta, 
      ', Fe_caducidad: ', NEW.Fe_caducidad
    )
  );
END //

-- Trigger: UPDATE
CREATE TRIGGER trg_update_producto
AFTER UPDATE ON Producto
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores, valores_nuevos
  )
  VALUES (
    'Producto', 
    'UPDATE', 
    CURRENT_USER(), 
    NEW.id_Producto,
    CONCAT(
      'Nombre_Prod: ', OLD.Nombre_Prod, 
      ', Tipo_Prod: ', OLD.Tipo_Prod, 
      ', Existencia_Prod: ', OLD.Existencia_Prod,
      ', stock: ', OLD.stock,
      ', Precio_Costo: ', OLD.Precio_Costo, 
      ', Precio_Venta: ', OLD.Precio_Venta, 
      ', Fe_caducidad: ', OLD.Fe_caducidad
    ),
    CONCAT(
      'Nombre_Prod: ', NEW.Nombre_Prod, 
      ', Tipo_Prod: ', NEW.Tipo_Prod, 
      ', Existencia_Prod: ', NEW.Existencia_Prod,
      ', stock: ', NEW.stock,
      ', Precio_Costo: ', NEW.Precio_Costo, 
      ', Precio_Venta: ', NEW.Precio_Venta, 
      ', Fe_caducidad: ', NEW.Fe_caducidad
    )
  );
END //

-- Trigger: DELETE
CREATE TRIGGER trg_delete_producto
AFTER DELETE ON Producto
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (
    tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores
  )
  VALUES (
    'Producto', 
    'DELETE', 
    CURRENT_USER(), 
    OLD.id_Producto,
    CONCAT(
      'Nombre_Prod: ', OLD.Nombre_Prod, 
      ', Tipo_Prod: ', OLD.Tipo_Prod, 
      ', Existencia_Prod: ', OLD.Existencia_Prod,
      ', stock: ', OLD.stock,
      ', Precio_Costo: ', OLD.Precio_Costo, 
      ', Precio_Venta: ', OLD.Precio_Venta, 
      ', Fe_caducidad: ', OLD.Fe_caducidad
    )
  );
END //

DELIMITER ;

-- Triggers para Usuarios
DELIMITER //
CREATE TRIGGER trg_insert_usuarios
AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_nuevos)
  VALUES ('Usuarios', 'INSERT', CURRENT_USER(), NEW.id,
    CONCAT('nombre: ', NEW.nombre, ', apellido: ', NEW.apellido, ', correo_electronico: ', NEW.correo_electronico, ', telefono: ', NEW.telefono, ', genero: ', NEW.genero, ', rol: ', NEW.rol));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_update_usuarios
AFTER UPDATE ON Usuarios
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores, valores_nuevos)
  VALUES ('Usuarios', 'UPDATE', CURRENT_USER(), NEW.id,
    CONCAT('nombre: ', OLD.nombre, ', apellido: ', OLD.apellido, ', correo_electronico: ', OLD.correo_electronico, ', telefono: ', OLD.telefono, ', genero: ', OLD.genero, ', rol: ', OLD.rol),
    CONCAT('nombre: ', NEW.nombre, ', apellido: ', NEW.apellido, ', correo_electronico: ', NEW.correo_electronico, ', telefono: ', NEW.telefono, ', genero: ', NEW.genero, ', rol: ', NEW.rol));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_delete_usuarios
AFTER DELETE ON Usuarios
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores)
  VALUES ('Usuarios', 'DELETE', CURRENT_USER(), OLD.id,
    CONCAT('nombre: ', OLD.nombre, ', apellido: ', OLD.apellido,
           ', correo_electronico: ', OLD.correo_electronico, ', telefono: ', OLD.telefono,
           ', genero: ', OLD.genero, ', rol: ', OLD.rol));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_insert_proveedor
AFTER INSERT ON Proveedor
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_nuevos)
  VALUES ('Proveedor', 'INSERT', CURRENT_USER(), NEW.id_Proveedor,
    CONCAT('Nombre_Proveedor: ', NEW.Nombre_Proveedor, ', Telefono: ', NEW.Telefono, ', Email: ', NEW.Email, ', Direccion: ', NEW.Direccion, ', Tipo_Distribuidor: ', NEW.Tipo_Distribuidor, ', Condiciones_Pago: ', NEW.Condiciones_Pago, ', Estado: ', NEW.Estado));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_update_proveedor
AFTER UPDATE ON Proveedor
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores, valores_nuevos)
  VALUES ('Proveedor', 'UPDATE', CURRENT_USER(), NEW.id_Proveedor,
    CONCAT('Nombre_Proveedor: ', OLD.Nombre_Proveedor, ', Telefono: ', OLD.Telefono, ', Email: ', OLD.Email, ', Direccion: ', OLD.Direccion, ', Tipo_Distribuidor: ', OLD.Tipo_Distribuidor, ', Condiciones_Pago: ', OLD.Condiciones_Pago, ', Estado: ', OLD.Estado),
    CONCAT('Nombre_Proveedor: ', NEW.Nombre_Proveedor, ', Telefono: ', NEW.Telefono, ', Email: ', NEW.Email, ', Direccion: ', NEW.Direccion, ', Tipo_Distribuidor: ', NEW.Tipo_Distribuidor, ', Condiciones_Pago: ', NEW.Condiciones_Pago, ', Estado: ', NEW.Estado));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_delete_proveedor
AFTER DELETE ON Proveedor
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores)
  VALUES ('Proveedor', 'DELETE', CURRENT_USER(), OLD.id_Proveedor,
    CONCAT('Nombre_Proveedor: ', OLD.Nombre_Proveedor, ', Telefono: ', OLD.Telefono, ', Email: ', OLD.Email, ', Direccion: ', OLD.Direccion, ', Tipo_Distribuidor: ', OLD.Tipo_Distribuidor, ', Condiciones_Pago: ', OLD.Condiciones_Pago, ', Estado: ', OLD.Estado));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_insert_compra
AFTER INSERT ON Compra
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_nuevos)
  VALUES ('Compra', 'INSERT', CURRENT_USER(), NEW.id_compra,
    CONCAT('id_Proveedor: ', NEW.id_Proveedor, ', Fe_compra: ', NEW.Fe_compra));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_update_compra
AFTER UPDATE ON Compra
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores, valores_nuevos)
  VALUES ('Compra', 'UPDATE', CURRENT_USER(), NEW.id_compra,
    CONCAT('id_Proveedor: ', OLD.id_Proveedor, ', Fe_compra: ', OLD.Fe_compra),
    CONCAT('id_Proveedor: ', NEW.id_Proveedor, ', Fe_compra: ', NEW.Fe_compra));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_delete_compra
AFTER DELETE ON Compra
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores)
  VALUES ('Compra', 'DELETE', CURRENT_USER(), OLD.id_compra,
    CONCAT('id_Proveedor: ', OLD.id_Proveedor, ', Fe_compra: ', OLD.Fe_compra));
END //
DELIMITER ;

-- Triggers para DetalleCompra (corregido basado en patrón)
DELIMITER //
CREATE TRIGGER trg_insert_detallecompra
AFTER INSERT ON DetalleCompra
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_nuevos)
  VALUES ('DetalleCompra', 'INSERT', CURRENT_USER(), NEW.id_DetalleCompra,
    CONCAT('id_compra: ', NEW.id_compra, ', id_Producto: ', NEW.id_Producto, ', Fe_Ingresado: ', NEW.Fe_Ingresado, ', Fe_caducidad: ', NEW.Fe_caducidad, ', Precio: ', NEW.Precio, ', cantidad: ', NEW.cantidad));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_update_detallecompra
AFTER UPDATE ON DetalleCompra
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores, valores_nuevos)
  VALUES ('DetalleCompra', 'UPDATE', CURRENT_USER(), NEW.id_DetalleCompra,
    CONCAT('id_compra: ', OLD.id_compra, ', id_Producto: ', OLD.id_Producto, ', Fe_Ingresado: ', OLD.Fe_Ingresado, ', Fe_caducidad: ', OLD.Fe_caducidad, ', Precio: ', OLD.Precio, ', cantidad: ', OLD.cantidad),
    CONCAT('id_compra: ', NEW.id_compra, ', id_Producto: ', NEW.id_Producto, ', Fe_Ingresado: ', NEW.Fe_Ingresado, ', Fe_caducidad: ', NEW.Fe_caducidad, ', Precio: ', NEW.Precio, ', cantidad: ', NEW.cantidad));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_delete_detallecompra
AFTER DELETE ON DetalleCompra
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores)
  VALUES ('DetalleCompra', 'DELETE', CURRENT_USER(), OLD.id_DetalleCompra,
    CONCAT('id_compra: ', OLD.id_compra, ', id_Producto: ', OLD.id_Producto, ', Fe_Ingresado: ', OLD.Fe_Ingresado, ', Fe_caducidad: ', OLD.Fe_caducidad, ', Precio: ', OLD.Precio, ', cantidad: ', OLD.cantidad));
END //
DELIMITER ;

-- Triggers para Venta
DELIMITER // 
CREATE TRIGGER trg_insert_venta
AFTER INSERT ON Venta
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_nuevos)
  VALUES ('Venta', 'INSERT', CURRENT_USER(), NEW.id_ventas,
    CONCAT('id_Cliente: ', NEW.id_Cliente, ', Fe_Venta: ', NEW.Fe_Venta));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_update_venta
AFTER UPDATE ON Venta
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores, valores_nuevos)
  VALUES ('Venta', 'UPDATE', CURRENT_USER(), NEW.id_ventas,
    CONCAT('id_Cliente: ', OLD.id_Cliente, ', Fe_Venta: ', OLD.Fe_Venta),
    CONCAT('id_Cliente: ', NEW.id_Cliente, ', Fe_Venta: ', NEW.Fe_Venta));
END //
DELIMITER ;

DELIMITER // 
CREATE TRIGGER trg_delete_venta
AFTER DELETE ON Venta
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores)
  VALUES ('Venta', 'DELETE', CURRENT_USER(), OLD.id_ventas,
    CONCAT('id_Cliente: ', OLD.id_Cliente, ', Fe_Venta: ', OLD.Fe_Venta));
END //
DELIMITER ;

-- Triggers para Detalles_venta
DELIMITER //
CREATE TRIGGER trg_insert_detalles_venta
AFTER INSERT ON Detalles_venta
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_nuevos)
  VALUES ('Detalles_venta', 'INSERT', CURRENT_USER(), NEW.id_DetalleVenta,
    CONCAT('id_Venta: ', NEW.id_Venta, ', id_Producto: ', NEW.id_Producto, ', Precio_venta: ', NEW.Precio_venta, ', Cantidad_Producto: ', NEW.Cantidad_Producto));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_update_detalles_venta
AFTER UPDATE ON Detalles_venta
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores, valores_nuevos)
  VALUES ('Detalles_venta', 'UPDATE', CURRENT_USER(), NEW.id_DetalleVenta,
    CONCAT('id_Venta: ', OLD.id_Venta, ', id_Producto: ', OLD.id_Producto, ', Precio_venta: ', OLD.Precio_venta, ', Cantidad_Producto: ', OLD.Cantidad_Producto),
    CONCAT('id_Venta: ', NEW.id_Venta, ', id_Producto: ', NEW.id_Producto, ', Precio_venta: ', NEW.Precio_venta, ', Cantidad_Producto: ', NEW.Cantidad_Producto));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_delete_detalles_venta
AFTER DELETE ON Detalles_venta
FOR EACH ROW
BEGIN
  INSERT INTO bitacora_general (tabla_afectada, tipo_cambio, usuario, id_cliente, valores_anteriores)
  VALUES ('Detalles_venta', 'DELETE', CURRENT_USER(), OLD.id_DetalleVenta,
    CONCAT('id_Venta: ', OLD.id_Venta, ', id_Producto: ', OLD.id_Producto, ', Precio_venta: ', OLD.Precio_venta, ', Cantidad_Producto: ', OLD.Cantidad_Producto));
END //
DELIMITER ;