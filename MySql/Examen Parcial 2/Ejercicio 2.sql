CREATE DATABASE EditorialDB;
USE EditorialDB;

CREATE TABLE Sucursal (
    CodigoSucursal INT PRIMARY KEY,
    Direccion VARCHAR(150),
    Telefono VARCHAR(20)
);

CREATE TABLE Empleado (
    DNI VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(150),
    Telefono VARCHAR(20),
    CodigoSucursal INT,
    FOREIGN KEY (CodigoSucursal) REFERENCES Sucursal(CodigoSucursal)
);

CREATE TABLE Revista (
    NumRegistro INT PRIMARY KEY,
    Titulo VARCHAR(150),
    Periodicidad VARCHAR(50),
    Tipo VARCHAR(50),
    CodigoSucursal INT,
    FOREIGN KEY (CodigoSucursal) REFERENCES Sucursal(CodigoSucursal)
);

CREATE TABLE Periodista (
    DNI VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(150),
    Telefono VARCHAR(20),
    Especialidad VARCHAR(100)
);

CREATE TABLE Revista_Periodista (
    NumRegistro INT,
    DNI_Periodista VARCHAR(20),
    PRIMARY KEY (NumRegistro, DNI_Periodista),
    FOREIGN KEY (NumRegistro) REFERENCES Revista(NumRegistro),
    FOREIGN KEY (DNI_Periodista) REFERENCES Periodista(DNI)
);

CREATE TABLE NumRevista (
    Numero INT PRIMARY KEY,
    NumRegistro INT,
    Fecha DATE,
    NumPaginas INT,
    CantVendidas INT,
    FOREIGN KEY (NumRegistro) REFERENCES Revista(NumRegistro)
);

INSERT INTO Sucursal (CodigoSucursal, Direccion, Telefono) VALUES
(1, 'Av. Reforma 123', '555-1001'),
(2, 'Calle Juárez 456', '555-1002'),
(3, 'Boulevard Hidalgo 789', '555-1003'),
(4, 'Plaza Central 101', '555-1004'),
(5, 'Av. Insurgentes 202', '555-1005'),
(6, 'Calle Morelos 303', '555-1006'),
(7, 'Av. Patriotismo 404', '555-1007'),
(8, 'Calle Revolución 505', '555-1008'),
(9, 'Av. Zaragoza 606', '555-1009'),
(10, 'Calle 5 de Mayo 707', '555-1010');

INSERT INTO Empleado (DNI, Nombre, Direccion, Telefono, CodigoSucursal) VALUES
('11111111A', 'Juan Perez', 'Calle 1', '555-1111', 1),
('22222222B', 'Ana López', 'Calle 2', '555-2222', 2),
('33333333C', 'Luis Martínez', 'Calle 3', '555-3333', 3),
('44444444D', 'María García', 'Calle 4', '555-4444', 4),
('55555555E', 'Carlos Sánchez', 'Calle 5', '555-5555', 5),
('66666666F', 'Luisa Fernández', 'Calle 6', '555-6666', 6),
('77777777G', 'Pedro Gómez', 'Calle 7', '555-7777', 7),
('88888888H', 'Marta Ruiz', 'Calle 8', '555-8888', 8),
('99999999I', 'Jorge Torres', 'Calle 9', '555-9999', 9),
('10101010J', 'Sofía Moreno', 'Calle 10', '555-1010', 10);

INSERT INTO Revista (NumRegistro, Titulo, Periodicidad, Tipo, CodigoSucursal) VALUES
(101, 'Revista Ciencia', 'Mensual', 'Ciencia', 1),
(102, 'Revista Arte', 'Trimestral', 'Arte', 2),
(103, 'Revista Tecnología', 'Mensual', 'Tecnología', 3),
(104, 'Revista Deportes', 'Semanal', 'Deportes', 4),
(105, 'Revista Moda', 'Mensual', 'Moda', 5),
(106, 'Revista Cocina', 'Bimestral', 'Gastronomía', 6),
(107, 'Revista Historia', 'Trimestral', 'Historia', 7),
(108, 'Revista Viajes', 'Mensual', 'Turismo', 8),
(109, 'Revista Música', 'Mensual', 'Música', 9),
(110, 'Revista Literatura', 'Bimestral', 'Literatura', 10);

INSERT INTO Periodista (DNI, Nombre, Direccion, Telefono, Especialidad) VALUES
('55555555X', 'Laura Méndez', 'Calle A', '555-1234', 'Ciencia'),
('66666666Y', 'Miguel Ortega', 'Calle B', '555-2345', 'Arte'),
('77777777Z', 'Natalia Paredes', 'Calle C', '555-3456', 'Tecnología'),
('88888888W', 'Andrés Ramírez', 'Calle D', '555-4567', 'Deportes'),
('99999999V', 'Clara Torres', 'Calle E', '555-5678', 'Moda'),
('10101010U', 'Diego López', 'Calle F', '555-6789', 'Gastronomía'),
('12121212T', 'Sofía Díaz', 'Calle G', '555-7890', 'Historia'),
('13131313S', 'Pablo Cruz', 'Calle H', '555-8901', 'Turismo'),
('14141414R', 'Marina Flores', 'Calle I', '555-9012', 'Música'),
('15151515Q', 'Javier Gómez', 'Calle J', '555-0123', 'Literatura');

INSERT INTO Revista_Periodista (NumRegistro, DNI_Periodista) VALUES
(101, '55555555X'),
(102, '66666666Y'),
(103, '77777777Z'),
(104, '88888888W'),
(105, '99999999V'),
(106, '10101010U'),
(107, '12121212T'),
(108, '13131313S'),
(109, '14141414R'),
(110, '15151515Q'),
(101, '77777777Z'),
(103, '55555555X'),
(105, '12121212T');

INSERT INTO NumRevista (Numero, NumRegistro, Fecha, NumPaginas, CantVendidas) VALUES
(1, 101, '2025-01-01', 100, 5000),
(2, 101, '2025-02-01', 105, 5200),
(3, 102, '2025-01-15', 80, 3000),
(4, 102, '2025-04-15', 85, 3100),
(5, 103, '2025-01-10', 90, 4500),
(6, 104, '2025-01-05', 75, 4000),
(7, 104, '2025-01-12', 78, 4200),
(8, 105, '2025-01-20', 60, 3500),
(9, 106, '2025-02-01', 95, 4800),
(10, 107, '2025-03-01', 110, 2000);
