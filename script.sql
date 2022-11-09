/* Eliminar todas la tablas si existen */
DROP TABLE IF EXISTS VIVERO CASCADE;
DROP TABLE IF EXISTS ZONA CASCADE;
DROP TABLE IF EXISTS PRODUCTO CASCADE;
DROP TABLE IF EXISTS EMPLEADO CASCADE;
DROP TABLE IF EXISTS CLIENTE CASCADE;
DROP TABLE IF EXISTS PEDIDO CASCADE;

/* Crear tabla VIVERO */
CREATE TABLE VIVERO (
	VIVERO_ID INT NOT NULL PRIMARY KEY,
	DIRECCION CHAR(100) NOT NULL,
    CODIGO_POSTAL INT NOT NULL
);

/* Crear tabla ZONA */
CREATE TABLE ZONA (
	ZONA_ID INT NOT NULL PRIMARY KEY,
	VIVERO_ID INT NOT NULL,
	FOREIGN KEY (VIVERO_ID) REFERENCES VIVERO ON DELETE SET NULL
);

/* Crear tabla PRODUCTO */
CREATE TABLE PRODUCTO (
	PRODUCTO_ID INT NOT NULL PRIMARY KEY,
	NOMBRE CHAR(30) NOT NULL,
	PRECIO FLOAT NOT NULL,
	ZONA_ID INT NOT NULL,
	FOREIGN KEY (ZONA_ID) REFERENCES ZONA ON DELETE SET NULL
);

/* Crear tabla EMPLEADO */
CREATE TABLE EMPLEADO (
	DNI CHAR(9) NOT NULL PRIMARY KEY,
	NOMBRE CHAR(40) NOT NULL,
	APELLIDOS CHAR(60) NOT NULL,
	TELF INT NOT NULL,
    PRODUCTIVIDAD FLOAT NOT NULL,
	ZONA_ID INT NOT NULL,
	FOREIGN KEY (ZONA_ID) REFERENCES ZONA ON DELETE SET NULL
);

/* Crear tabla CLIENTE*/
CREATE TABLE CLIENTE (
    DNI CHAR(9) NOT NULL PRIMARY KEY,
	NOMBRE CHAR(40) NOT NULL,
	APELLIDOS CHAR(60) NOT NULL,
    CORREO CHAR(30) NOT NULL,
    AFILIADO BIT NOT NULL,
    BONIFICACIONES INT
);

/* Crear tabla PEDIDO */
CREATE TABLE PEDIDO (
	PEDIDO_ID INT NOT NULL PRIMARY KEY,
	FECHA DATE NOT NULL,
	PRECIO FLOAT NOT NULL,
	PRODUCTOS INT[] NOT NULL,
    CLIENTE_ID CHAR(9) NOT NULL,
    EMPLEADO_ID CHAR(9) NOT NULL,
    FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTE ON DELETE SET NULL,
	FOREIGN KEY (EMPLEADO_ID) REFERENCES EMPLEADO ON DELETE SET NULL
);

/* Insertar filas a la tabla VIVERO */
INSERT INTO VIVERO
VALUES 
    (1, 'Santa Cruz de La Palma', 38700),
    (2, 'Breña Alta', 38710),
    (3, 'Los Llanos de Aridane', 38760),
    (4, 'Fuencaliente', 38740),
    (5, 'Barlovente', 38726);

/* Insertar filas a la tabla ZONA */
INSERT INTO ZONA
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 4),
    (8, 4);

/* Insetar filas a la tabla PRODUCTO */
INSERT INTO PRODUCTO
VALUES
    (1, 'Guano', 14.25, 1),
    (2, 'Humus Lombriz', 11.99, 1),
    (3, 'Ciruelo', 35.5, 2),
    (4, 'Kaki', 40.99, 2),
    (5, 'Abelia', 27.33, 3),
    (6, 'Acebo', 22.15, 3),
    (7, 'Abies', 12.5, 4),
    (8, 'Thuya', 19.99, 4),
    (9, 'Bignonia', 22.35, 5),
    (10, 'Boganvillea', 11.15, 5),
    (11, 'Turba', 24.12, 6),
    (12, 'Tierra con matillo', 34.25, 6),
    (13, 'Planta del dinero', 44.11, 7),
    (14, 'Kolanchoe', 11.99, 7),
    (15, 'Alisum', 14.99, 8),
    (16, 'Ciclamen', 69.99, 8);

/* Insertar filas a la tabla EMPLEADO */
INSERT INTO EMPLEADO
VALUES
    ('42281428B', 'Davinia', 'Sanchez Sanchez', 111111111, 0.7, 1),
    ('42241239M', 'Maria', 'Hernandez Perez', 222222222, 0.6, 2),
    ('39284281C', 'Dunia', 'Caria', 333333333, 0.65, 3),
    ('38291238C', 'Lucia', 'Estrada Armas', 444444444, 0.52, 4),
    ('38213438C', 'Jose Angel', 'Rodriguez Hernandez', 5555555, 0.72, 5),
    ('31414138K', 'Cristian', 'Trabucco Armas', 6666666, 0.69, 6),
    ('38414152L', 'Romina', 'Messi Gasol', 7777777, 0.89, 7),
    ('38211490P', 'Leo', 'Valverde Armas', 8888888, 0.9, 8);

/* Insertar filas a la tabla CLIENTE */
INSERT INTO CLIENTE
VALUES
    ('42281228B', 'Josua', 'Muller Sainz', 'josua@gmail.com', '1', 11),
    ('42141414M', 'Elena', 'Nadal Perez', 'elena@gmail.com', '0', NULL),
    ('44151515C', 'Chero', 'Plata Oro', 'chero@gmail.com', '1', 13),
    ('41512525K', 'Carlos', 'Mahtuerso Lopez', 'carlos@gmail.com', '0', NULL),
    ('45151252P', 'Paula', 'Orellan Rioja', 'paula@gmail.com', '0', NULL);    

/* Insertar filas a la tabla PEDIDO */
INSERT INTO PEDIDO
VALUES
    (1, '2001-06-27', 19.99, ARRAY [1, 4, 5], '42281228B', '42281428B'),
    (2, '2003-12-22', 20.11, ARRAY [2, 4, 6, 7], '41512525K', '42241239M'),
    (3, '2012-07-01', 35.25, ARRAY [1, 2, 6], '44151515C', '39284281C'),
    (4, '2013-08-14', 46.12, ARRAY [1, 11, 14], '42141414M', '38291238C'),
    (5, '2009-05-11', 66.5, ARRAY [3, 7, 8], '45151252P', '38213438C');
