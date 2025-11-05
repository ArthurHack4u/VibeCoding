
CREATE DATABASE IF NOT EXISTS ExamenBiblioteca;

USE ExamenBiblioteca;

CREATE TABLE Autores (
  AutorID INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  FechaNacimiento DATE
);

CREATE TABLE Libros (
  ISBN VARCHAR(20) PRIMARY KEY,
  Titulo VARCHAR(100) NOT NULL,
  AutorID INT,
  AnioPublicacion INT,
  Precio DECIMAL(10,2),
  FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

INSERT INTO Autores (Nombre, FechaNacimiento) VALUES
('Gabriel García Márquez', '1927-03-06'),
('Isabel Allende', '1942-08-02'),
('Mario Vargas Llosa', '1936-03-28'),
('J.K. Rowling', '1965-07-31'),
('Stephen King', '1947-09-21'),
('Jane Austen', '1775-12-16'),
('Ernest Hemingway', '1899-07-21'),
('F. Scott Fitzgerald', '1896-09-24'),
('Toni Morrison', '1931-02-18'),
('George Orwell', '1903-06-25'),
('J.R.R. Tolkien', '1892-01-03'),
('Agatha Christie', '1890-09-15'),
('Leo Tolstoy', '1828-09-09'),
('Mark Twain', '1835-11-30');

ALTER TABLE Libros
ADD COLUMN Editorial VARCHAR(50);

ALTER TABLE Libros
CHANGE COLUMN Precio Costo DECIMAL(10,2);

ALTER TABLE Autores
DROP COLUMN FechaNacimiento;

DROP TABLE Libros;

RENAME TABLE Autores TO Escritores;
