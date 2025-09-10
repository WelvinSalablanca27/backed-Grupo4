Create database almacenrural;
use almacenrural;

-- Crear tabla Cliente
CREATE TABLE Cliente (
  id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
  Nombre1 VARCHAR(30),
  Nombre2 VARCHAR(30),
  Apellido1 VARCHAR(30),
  Apellido2 VARCHAR(30),
  Direccion VARCHAR(60),
  Telefono VARCHAR(8)
);

CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    correo_electronico VARCHAR(40) NOT NULL UNIQUE,
    contrasena VARCHAR(60) NOT NULL,
    telefono VARCHAR(8),
    genero ENUM('masculino', 'femenino'),
    rol ENUM('admin', 'cajero') DEFAULT 'cajero'
);


-- Crear tabla Producto
CREATE TABLE Producto (
  id_Producto INT AUTO_INCREMENT PRIMARY KEY,
  Nombre_Prod VARCHAR(30),
  Tipo_Prod VARCHAR(20),
  Existencia_Prod decimal(6,2),
  Precio_Costo decimal(10,2),
  Precio_Venta Decimal(10,2),
  Fe_caducidad DATE
);

-- Crear tabla Proveedor
CREATE TABLE Proveedor (
  id_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
  Nombre_Proveedor VARCHAR(30),
  Telefono VARCHAR(8),
  Tipo_distribuidor VARCHAR(30)
);

-- Crear tabla Compra (corregida)
CREATE TABLE Compra (
  id_compra INT AUTO_INCREMENT PRIMARY KEY,
  id_Proveedor INT,
  Fe_compra DATE,
  total_compra DECIMAL(10,2) NOT NULL CHECK (total_compra >= 0),
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
-- Crear tabla Venta
CREATE TABLE Venta (
  id_ventas INT AUTO_INCREMENT PRIMARY KEY,
  id_Cliente INT,
  Fe_Venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  total_venta DECIMAL(10,2) NOT NULL CHECK (total_venta >= 0),
  FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente) ON DELETE CASCADE
);

-- Crear tabla Detalles_venta
CREATE TABLE Detalles_venta (
  id_DetalleVenta INT AUTO_INCREMENT PRIMARY KEY,
  id_Venta INT,
  id_Producto INT,
  Precio_venta DECIMAL(10,2) NOT NULL,
  Cantidad_Producto INT,
  FOREIGN KEY (id_Producto) REFERENCES Producto(id_Producto) ON DELETE CASCADE,
  FOREIGN KEY (id_Venta) REFERENCES Venta(id_ventas) ON DELETE CASCADE
);

INSERT INTO Usuarios (
    nombre, apellido, correo_electronico, contrasena, telefono, genero, rol
) VALUES
('Juan', 'Pérez', 'juan.perez@correo.com', '123456789', '55512345', 'masculino', 'cajero'),
('Ana', 'Gómez', 'ana.gomez@correo.com', '123456789', '55523456', 'femenino', 'admin'),
('Luis', 'Martínez', 'luis.mtz@correo.com', '123456789', '55534567', 'masculino', 'cajero'),
('María', 'Lopez', 'maria.lopez@correo.com', '123456789', '55545678', 'femenino', 'cajero'),
('Carlos', 'Ruiz', 'carlos.ruiz@correo.com', '123456789', '55556789', 'masculino', 'admin');


-- Insert Cliente--
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Carlos', 'Andrés', 'Pérez', 'Mendoza', 'Calle 10 #25-34', '31012345');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Laura', 'María', 'Gómez', 'Ríos', 'Carrera 15 #12-80', '31123456');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('David','Jose' , 'Ruiz', 'Cano', 'Av. Central 45-90', '31234567');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Ana', 'Lucía', 'Fernández', 'Zapata', 'Calle 8 #10-12', '31345678');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Sofía', 'Isabel', 'Torres', 'López', 'Cra 20 #5-67', '31456789');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Miguel', 'Ángel', 'Rodríguez', 'Pardo', 'Calle 12 #30-15', '31567890');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Juliana', 'Beatriz', 'Ramírez', 'Duarte', 'Carrera 9 #8-23', '31678901');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Andrés', 'Carlos', 'Martínez', 'Salas', 'Av. Sur #7-50', '31789012');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Daniela', 'Camila', 'Castaño', 'Luna', 'Calle 5 #11-44', '31890123');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Felipe', 'José', 'Morales', 'García', 'Cra 14 #9-90', '31901234');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Valentina', NULL, 'Navarro', 'Torres', 'Calle 6 #14-25', '32012345');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Esteban', 'Iván', 'Vargas', 'Mejía', 'Carrera 17 #10-88', '32123456');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Paula', 'Andrea', 'Silva', 'Ortiz', 'Av. Libertador #100-20', '32234567');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Camilo', NULL, 'Herrera', 'Nieves', 'Calle 2 #9-12', '32345678');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Gabriela', 'Fernanda', 'Patiño', 'Quintero', 'Cra 19 #20-56', '32456789');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Julián', 'Alejandro', 'Montoya', 'Bautista', 'Carrera 1 #3-78', '32567890');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Mariana', NULL, 'Rojas', 'Suárez', 'Calle 3 #7-67', '32678901');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Sebastián', 'Enrique', 'Guzmán', 'Castañeda', 'Av. Norte #34-21', '32789012');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Isabella', 'Natalia', 'León', 'Carrillo', 'Cra 11 #12-56', '32890123');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Tomás', 'Mauricio', 'Cruz', 'Delgado', 'Calle 7 #4-89', '32901234');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Lucía', NULL, 'Álvarez', 'Moreno', 'Carrera 5 #3-45', '33012345');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Santiago', 'Eduardo', 'Peña', 'Rincón', 'Cra 13 #6-78', '33123456');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Antonia', 'Victoria', 'Bermúdez', 'Acosta', 'Av. Oriental #12-01', '33234567');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Mateo', NULL, 'Molina', 'Guerrero', 'Calle 11 #19-98', '33345678');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Emilia', 'Rocío', 'Valencia', 'Sepúlveda', 'Cra 2 #2-34', '33456789');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Simón', 'Ricardo', 'Arias', 'Gómez', 'Carrera 6 #17-71', '33567890');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Renata', NULL, 'Del Valle', 'Escobar', 'Calle 13 #8-92', '33678901');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Juan', 'Esteban', 'Pineda', 'Vega', 'Av. Boyacá #78-40', '33789012');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Regina', 'Marcela', 'Soto', 'Maldonado', 'Cra 21 #23-12', '33890123');
INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES ('Pedro', NULL, 'Gallego', 'Villalba', 'Calle 4 #5-15', '33901234');


-- INSERT Producto --
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Dog Chow Adulto 15kg', 'Alimento', 25, 120000, 90000, '2025-12-31');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Cat Chow Gato 8kg', 'Alimento', 18, 85000, 60000, '2025-11-30');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Antipulgas Frontline', 'Medicamento', 30, 40000, 25000, '2026-06-30');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Shampoo Canino 500ml', 'Aseo', 50, 20000, 12000, '2026-01-15');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Juguete Hueso de Goma', 'Accesorio', 40, 15000, 8000, NULL);
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Arena para Gato 10kg', 'Aseo', 35, 30000, 18000, NULL);
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Vitaminas para Perro', 'Medicamento', 20, 25000, 15000, '2026-05-01');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Comedero Doble Acero', 'Accesorio', 45, 28000, 16000, NULL);
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Collar Antipulgas', 'Accesorio', 60, 22000, 12000, '2026-03-15');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Pelota con sonido', 'Accesorio', 70, 10000, 6000, NULL);
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Alimento Húmedo Perro 340g', 'Alimento', 80, 9000, 6000, '2025-10-10');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Alimento Húmedo Gato 340g', 'Alimento', 75, 9500, 6500, '2025-09-30');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Cepillo para Perro', 'Aseo', 40, 18000, 10000, NULL);
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Toallitas Húmedas Mascota', 'Aseo', 55, 12000, 8000, '2026-02-28');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Antibiótico Veterinario', 'Medicamento', 25, 50000, 30000, '2026-04-30');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Suplemento Articular', 'Medicamento', 15, 60000, 35000, '2026-07-31');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Juguete Cuerda Trenzada', 'Accesorio', 30, 13000, 7000, NULL);
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Rascador para Gato', 'Accesorio', 10, 40000, 25000, NULL);
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Transportadora Pequeña', 'Accesorio', 12, 75000, 50000, NULL);
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Pipeta Antiparásitos', 'Medicamento', 22, 30000, 20000, '2026-08-15');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Alimento Puppy 10kg', 'Alimento', 28, 100000, 70000, '2026-01-31');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Alimento Kitten 5kg', 'Alimento', 24, 65000, 45000, '2025-10-31');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Desparasitante Interno', 'Medicamento', 32, 27000, 18000, '2026-09-30');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Juguete Ratón Catnip', 'Accesorio', 50, 8000, 5000, NULL);
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Correa Extensible 5m', 'Accesorio', 35, 30000, 18000, NULL);
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Tapete Entrenador', 'Aseo', 60, 22000, 15000, NULL);
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Shampoo Antipulgas', 'Aseo', 38, 26000, 16000, '2026-02-28');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Snacks de Pollo 500g', 'Alimento', 45, 18000, 12000, '2025-12-01');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Snacks de Pescado 500g', 'Alimento', 47, 19000, 13000, '2025-12-01');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Perfume para Mascotas', 'Aseo', 20, 25000, 15000, '2026-03-31');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Kit Higiene Dental', 'Aseo', 30, 28000, 18000, '2026-04-15');
INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta , Fe_caducidad) VALUES ('Ropa Invierno Mascota', 'Accesorio', 20, 35000, 22000, NULL);

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
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Accesorios PetZone', '31156789', 'Accesorios');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Distribuidora Zootec', '31267890', 'Alimentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Salud Animal Express', '31378901', 'Medicamentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('EcoPet Proveedor', '31489012', 'Aseo');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Pet Accesorios Deluxe', '31590123', 'Accesorios');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('MercadoPet', '31601234', 'Variado');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Pet Natura', '31712345', 'Alimentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Veterinaria y Más', '31823456', 'Medicamentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('CleanVet Ltda.', '31934567', 'Aseo');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('ZooAccesorios S.A.', '32045678', 'Accesorios');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Pet Universal', '32156789', 'Variado');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Animal Life Suministros', '32267890', 'Alimentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('VetBio Group', '32378901', 'Medicamentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Mascotas Limpias', '32489012', 'Aseo');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Distribuciones PetHouse', '32590123', 'Accesorios');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Alianza Animal', '32601234', 'Variado');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('Animal Foods Inc.', '32712345', 'Alimentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('VetMed Express', '32823456', 'Medicamentos');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('HigienePet', '32934567', 'Aseo');
INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES('PetFashion Store', '33045678', 'Accesorios');

-- INSERT Compra --
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (1, '2025-01-10', 3015.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (2, '2025-02-14', 8100.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (3, '2025-03-20', 5300.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (4, '2025-04-05', 1900.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (5, '2025-05-01', 359.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (6, '2025-07-01', 440.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (7, '2025-01-15', 672.50);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (8, '2025-02-20', 1890.75);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (9, '2025-03-01', 2550.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (10, '2025-04-10', 1040.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (11, '2025-05-12', 300.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (12, '2025-06-15', 740.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (13, '2025-07-20', 1299.99);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (14, '2025-08-01', 2880.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (15, '2025-09-05', 3980.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (16, '2025-10-11', 500.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (17, '2025-11-01', 1675.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (18, '2025-12-24', 7800.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (19, '2025-01-30', 625.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (20, '2025-02-25', 940.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (21, '2025-03-15', 470.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (22, '2025-04-22', 1590.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (23, '2025-05-30', 2200.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (24, '2025-06-05', 760.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (25, '2025-07-10', 3330.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (26, '2025-08-14', 1475.50);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (27, '2025-09-18', 880.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (28, '2025-10-25', 1920.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (29, '2025-11-29', 2399.00);
INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES (30, '2025-12-31', 6000.00);

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
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (11, 11, '2025-05-01', '2026-03-31', 11000, 60);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (12, 12, '2025-05-05', NULL, 5000, 20);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (13, 13, '2025-05-10', '2025-11-30', 7600, 70);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (14, 14, '2025-05-15', NULL, 2300, 15);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (15, 15, '2025-05-20', '2026-01-31', 6700, 33);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (16, 16, '2025-05-25', '2026-05-01', 8800, 90);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (17, 17, '2025-06-01', NULL, 9100, 45);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (18, 18, '2025-06-05', '2026-07-15', 13400, 50);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (19, 19, '2025-06-10', NULL, 3300, 22);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (20, 20, '2025-06-15', '2026-02-10', 4400, 55);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (21, 21, '2025-06-20', '2025-12-31', 10200, 60);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (22, 22, '2025-06-25', NULL, 8900, 70);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (23, 23, '2025-07-01', '2026-08-20', 12000, 50);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (24, 24, '2025-07-05', NULL, 2500, 18);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (25, 25, '2025-07-10', '2025-11-30', 3900, 27);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (26, 26, '2025-07-15', '2026-01-15', 7400, 48);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (27, 27, '2025-07-20', NULL, 9100, 42);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (28, 28, '2025-07-25', '2026-03-10', 6600, 36);
INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES (29, 29, '2025-07-30', NULL, 5400, 24);

-- INSERT --
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (1, '2025-04-01 10:00:00', 452.25);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (2, '2025-04-02 11:30:00', 1275.00);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (3, '2025-04-03 09:45:00', 640.00);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (4, '2025-04-04 15:00:00', 200.00);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (5, '2025-04-05 14:15:00', 180.00);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (6, '2025-04-06 13:25:00', 950.75);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (7, '2025-04-07 12:00:00', 305.00);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (8, '2025-04-08 16:45:00', 1220.50);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (9, '2025-04-09 10:30:00', 780.90);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (10, '2025-04-10 09:00:00', 620.00);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (11, '2025-04-11 14:10:00', 512.80);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (12, '2025-04-12 15:20:00', 298.40);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (13, '2025-04-13 11:35:00', 875.00);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (14, '2025-04-14 10:50:00', 999.99);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (15, '2025-04-15 13:40:00', 310.20);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (16, '2025-04-16 12:25:00', 455.60);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (17, '2025-04-17 17:00:00', 150.00);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (18, '2025-04-18 16:10:00', 825.45);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (19, '2025-04-19 09:50:00', 215.90);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (20, '2025-04-20 11:15:00', 999.00);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (21, '2025-04-21 10:45:00', 470.30);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (22, '2025-04-22 13:05:00', 678.00);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (23, '2025-04-23 12:30:00', 385.75);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (24, '2025-04-24 14:00:00', 420.50);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (25, '2025-04-25 15:45:00', 888.88);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (26, '2025-04-26 10:10:00', 299.99);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (27, '2025-04-27 11:55:00', 730.20);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (28, '2025-04-28 16:35:00', 601.00);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (29, '2025-04-29 13:20:00', 570.30);
INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES (30, '2025-04-30 12:45:00', 777.77);

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
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (10, 4, 25000, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (11, 5, 27000, 2);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (12, 1, 11000, 3);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (13, 6, 32000, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (14, 2, 14000, 2);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (15, 7, 16000, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (16, 4, 21000, 2);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (17, 3, 9500, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (18, 5, 27000, 3);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (19, 6, 31000, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (20, 1, 11500, 2);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (21, 2, 15500, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (22, 7, 17000, 2);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (23, 3, 10000, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (24, 4, 20000, 2);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (25, 5, 28000, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (26, 6, 29500, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (27, 1, 13000, 3);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (28, 2, 16000, 1);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (29, 4, 24000, 2);
INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES (30, 7, 18000, 1);

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
  IN p_Tipo_Prod VARCHAR(20),
  IN p_Existencia_Prod DECIMAL(6,2),
  IN p_Precio_Venta DECIMAL(10,2),
  IN p_Precio_Costo DECIMAL(10,2),
  IN p_Fe_caducidad DATE
)
BEGIN
  INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Venta, Precio_Costo, Fe_caducidad)
  VALUES (p_Nombre_Prod, p_Tipo_Prod, p_Existencia_Prod, p_Precio_Venta, p_Precio_Costo, p_Fe_caducidad);
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
  SELECT Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Venta, Precio_Costo, Fe_caducidad
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

GRANT CREATE, DROP ON gestion_usuarios.usuarios TO 'jose'@'localhost';

SHOW GRANTS FOR 'welvin'@'localhost';
SHOW GRANTS FOR 'Stiven'@'localhost';
SHOW GRANTS FOR 'Azter'@'localhost';
SHOW GRANTS FOR 'jose'@'localhost';

  -- modificar CONTRASEÑA --

ALTER USER 'welvin'@'localhost' IDENTIFIED BY 'nuevaClave456';

-- revoke los privilegio --

REVOKE SELECT ON almacenrural.* FROM 'welvin'@'localhost';
REVOKE ALL PRIVILEGES ON almacenrural.* FROM 'welvin'@'localhost';

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


#----------#
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
