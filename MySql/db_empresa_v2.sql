CREATE DATABASE personas;
USE personas;

CREATE TABLE personas (
  id_persona INT NOT NULL
  , salario INT NULL
  , nombre VARCHAR(64) NOT NULL
  , apellido VARCHAR(64) NOT null
  , fecha_nacimiento DATE
);

CREATE TABLE nomina (
  id INT NOT NULL
  ,id_persona INT NOT NULL
  ,fecha DATE NOT null
  , concepto VARCHAR(64)
  , monto INT NOT NULL
);

INSERT INTO personas VALUES 
  (1, 1200, 'José', 'Aguilar', '1991-08-13'),
  (2, 1200, 'Carlos', 'Canepa', '1991-08-13'),
  (3, 2000, 'Mario', 'Rivero', '1970-03-20'),
  (4, 1200, 'Luis', 'Gutiérrez', '1970-12-31'),
  (5, 3600, 'Arturo', 'Calvillo', '2006-01-01'),
  (6, 2500, 'Luis', 'Soto', '1991-06-03'),
  (7, 7000, 'Alexander', 'Alvarado', '1990-09-20');

INSERT INTO nomina VALUES 
  (1, 4, '2022-07-01', 'Salario', 1200),
  (2, 3, '2022-07-01', 'Salario', 2000),
  (3, 4, '2022-08-01', 'Salario', 1200),
  (4, 3, '2022-08-01', 'Salario', 2000),
  (5, 4, '2022-08-15', 'Prima vacacional', 2000),
  (6, 7, '2022-09-01', 'Salario', 7000),
  (7, 4, '2022-09-01', 'Salario', 1200),
  (8, 1, '2022-09-01', 'Salario', 1200),
  (9, 3, '2022-09-01', 'Salario', 2000),
  (10, 3, '2022-09-01', 'Prima vacacional', 2000),
  (11, 8, '2025-10-01', 'Salario', 5000);
  
  INSERT INTO personas
  (id_persona, salario, nombre, apellido, fecha_nacimiento)
  VALUES
  (8, 6000, 'Arturo', 'Moran', '2005-09-22'),
  (9, 5000, 'Kerin', 'Gonzalez', '2002-03-25'),
  (10, 7000, 'Kevin', 'Gonzalez', '2002-03-25'),
  (11, 6000, 'Rafael', 'Inurreta', '2003-02-14');
  
  INSERT INTO nomina
  (id, id_persona, fecha, concepto, monto)
  VALUES
  (12, 9, '2025-08-21', 'Salario', 5000),
  (13, 10, '2025-08-21', 'Salario', 7000),
  (14, 11, '2025-08-21', 'Salario', 6000);
