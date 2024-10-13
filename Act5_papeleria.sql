CREATE DATABASE IF NOT EXISTS papeleria;
USE papeleria;


CREATE TABLE Proveedor (
    ID_Proveedor INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Dirección VARCHAR(255) NOT NULL,
    Teléfono VARCHAR(20),
    Correo_Electrónico VARCHAR(255),
    PRIMARY KEY (ID_Proveedor)
);


CREATE TABLE Producto (
    ID_Producto INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Descripción TEXT,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    Cantidad_En_Stock INT NOT NULL,
    ID_Proveedor INT,
    PRIMARY KEY (ID_Producto),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor)
);


CREATE TABLE Cliente (
    ID_Cliente INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20),
    Correo_Electrónico VARCHAR(255),
    PRIMARY KEY (ID_Cliente)
);


CREATE TABLE Venta (
    ID_Venta INT NOT NULL AUTO_INCREMENT,
    Fecha_Venta DATE NOT NULL,
    ID_Cliente INT,
    PRIMARY KEY (ID_Venta),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);


CREATE TABLE Venta_Producto (
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT NOT NULL,
    Valor_Unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ID_Venta, ID_Producto),
    FOREIGN KEY (ID_Venta) REFERENCES Venta(ID_Venta),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

INSERT INTO Proveedor (Nombre, Dirección, Teléfono, Correo_Electrónico) 
VALUES 
('Papelería ABC', 'Calle Falsa 123', '555-1234', 'contacto@papeleriaabc.com'),
('Proveedora XYZ', 'Avenida Principal 456', '555-5678', 'info@proveedoraxyz.com');
INSERT INTO Producto (Nombre, Descripción, Precio_Unitario, Cantidad_En_Stock, ID_Proveedor) 
VALUES 
('Cuaderno A4', 'Cuaderno de 100 hojas', 2.50, 200, 1),
('Bolígrafo Azul', 'Bolígrafo con tinta azul', 0.50, 500, 1),
('Calculadora Científica', 'Calculadora con funciones científicas', 15.00, 50, 2),
('Marcador Permanente', 'Marcador para escribir en superficies no porosas', 1.20, 150, 1);

INSERT INTO Cliente (Nombre, Dirección, Teléfono, Correo_Electrónico) 
VALUES 
('Juan Pérez', 'Avenida Siempre Viva 742', '555-5678', 'juan.perez@email.com'),
('Ana López', 'Calle de la Luna 21', '555-8765', 'ana.lopez@email.com'),
('Luis Gómez', 'Calle del Sol 12', '555-3456', 'luis.gomez@email.com');

INSERT INTO Venta (Fecha_Venta, ID_Cliente) 
VALUES 
('2024-09-15', 1),
('2024-09-16', 2),
('2024-09-17', 3);

INSERT INTO Venta_Producto (ID_Venta, ID_Producto, Cantidad, Valor_Unitario) 
VALUES 
(1, 1, 3, 2.50),
(1, 2, 2, 0.50),
(2, 3, 1, 15.00),
(3, 4, 5, 1.20);

-- 1. Identificar el No. de productos asociados a cada proveedor
SELECT Proveedor.ID_Proveedor, 
       Proveedor.Nombre, 
       COUNT(Producto.ID_Producto) AS Numero_Productos
FROM Proveedor
LEFT JOIN Producto ON Proveedor.ID_Proveedor = Producto.ID_Proveedor
GROUP BY Proveedor.ID_Proveedor, Proveedor.Nombre;

-- Identificar el valor promedio de todas las ventas totales
SELECT AVG(Total_Venta) AS Promedio_Ventas
FROM (
    SELECT V.ID_Venta, 
           SUM(VP.Cantidad * VP.Valor_Unitario) AS Total_Venta
    FROM Venta V
    JOIN Venta_Producto VP ON V.ID_Venta = VP.ID_Venta
    GROUP BY V.ID_Venta
) AS VentasTotales;

-- Identificar los tres (o más) días en el que se registran mayor número de productos vendidos
SELECT V.Fecha_Venta, 
       SUM(VP.Cantidad) AS Total_Productos_Vendidos
FROM Venta V
JOIN Venta_Producto VP ON V.ID_Venta = VP.ID_Venta
GROUP BY V.Fecha_Venta
ORDER BY Total_Productos_Vendidos DESC
LIMIT 5; 

--  Identificar los tres (o más) clientes que registran mayores ventas
SELECT C.ID_Cliente, 
       C.Nombre, 
       SUM(VP.Cantidad * VP.Valor_Unitario) AS Total_Ventas
FROM Cliente C
JOIN Venta V ON C.ID_Cliente = V.ID_Cliente
JOIN Venta_Producto VP ON V.ID_Venta = VP.ID_Venta
GROUP BY C.ID_Cliente, C.Nombre
ORDER BY Total_Ventas DESC
LIMIT 3;


select  * from Proveedor;
select  * from Producto;
select  * from Cliente;
select  * from Venta;
select  * from Venta_Producto; 

SHOW tables;
