
USE ArtGalery;

INSERT INTO Artist VALUES
(1, 'Pablo', 'Picasso', '2020-01-01', 'Laura', '555', '1234567890', 'Calle Uno', '10001', 50000.00, 10000.00, '111223333', 'Oil', 'Cubism', 'Painting'),
(2, 'Frida', 'Kahlo', '2020-01-02', 'Jose', '555', '1234567891', 'Calle Dos', '10002', 60000.00, 20000.00, '222334444', 'Acrylic', 'Surrealism', 'Portrait'),
(3, 'Vincent', 'van Gogh', '2020-01-03', 'Ana', '555', '1234567892', 'Calle Tres', '10003', 70000.00, 30000.00, '333445555', 'Oil', 'Post-Impressionism', 'Landscape'),
(4, 'Claude', 'Monet', '2020-01-04', 'Luis', '555', '1234567893', 'Calle Cuatro', '10004', 80000.00, 40000.00, '444556666', 'Oil', 'Impressionism', 'Nature'),
(5, 'Andy', 'Warhol', '2020-01-05', 'Maria', '555', '1234567894', 'Calle Cinco', '10005', 90000.00, 50000.00, '555667777', 'Silkscreen', 'Pop Art', 'Portrait'),
(6, 'Salvador', 'Dali', '2020-01-06', 'Carmen', '555', '1234567895', 'Calle Seis', '10006', 30000.00, 15000.00, '666778888', 'Oil', 'Surrealism', 'Abstract'),
(7, 'Jackson', 'Pollock', '2020-01-07', 'Pablo', '555', '1234567896', 'Calle Siete', '10007', 40000.00, 10000.00, '777889999', 'Oil', 'Expressionism', 'Drip'),
(8, 'Georgia', 'O''Keeffe', '2020-01-08', 'Julio', '555', '1234567897', 'Calle Ocho', '10008', 20000.00, 7000.00, '888990000', 'Watercolor', 'Modernism', 'Flowers'),
(9, 'Leonardo', 'da Vinci', '2020-01-09', 'Diana', '555', '1234567898', 'Calle Nueve', '10009', 100000.00, 60000.00, '999001111', 'Oil', 'Renaissance', 'Portrait'),
(10, 'Rembrandt', 'van Rijn', '2020-01-10', 'Luis', '555', '1234567899', 'Calle Diez', '10010', 110000.00, 70000.00, '000112222', 'Oil', 'Baroque', 'Religious');

INSERT INTO Zips VALUES
('10001', 'New York', 'NY'),
('10002', 'Brooklyn', 'NY'),
('10003', 'Queens', 'NY'),
('10004', 'Bronx', 'NY'),
('10005', 'Manhattan', 'NY'),
('10006', 'Albany', 'NY'),
('10007', 'Buffalo', 'NY'),
('10008', 'Rochester', 'NY'),
('10009', 'Yonkers', 'NY'),
('10010', 'Syracuse', 'NY');

INSERT INTO PotentialCustomer VALUES
(1, 'Ana', 'Ramirez', '555', '1234567000', 'Calle Uno', '10001', '2023-01-01', 1, 'Oil', 'Cubism', 'Painting'),
(2, 'Luis', 'Fernandez', '555', '1234567001', 'Calle Dos', '10002', '2023-01-02', 2, 'Acrylic', 'Surrealism', 'Portrait'),
(3, 'María', 'López', '555', '1234567002', 'Calle Tres', '10003', '2023-01-03', 3, 'Oil', 'Post-Impressionism', 'Landscape'),
(4, 'Carlos', 'Mendez', '555', '1234567003', 'Calle Cuatro', '10004', '2023-01-04', 4, 'Oil', 'Impressionism', 'Nature'),
(5, 'Sofía', 'González', '555', '1234567004', 'Calle Cinco', '10005', '2023-01-05', 5, 'Silkscreen', 'Pop Art', 'Portrait'),
(6, 'Diego', 'Martínez', '555', '1234567005', 'Calle Seis', '10006', '2023-01-06', 6, 'Oil', 'Surrealism', 'Abstract'),
(7, 'Elena', 'Ramos', '555', '1234567006', 'Calle Siete', '10007', '2023-01-07', 7, 'Oil', 'Expressionism', 'Drip'),
(8, 'Javier', 'Ortiz', '555', '1234567007', 'Calle Ocho', '10008', '2023-01-08', 8, 'Watercolor', 'Modernism', 'Flowers'),
(9, 'Lucía', 'Castillo', '555', '1234567008', 'Calle Nueve', '10009', '2023-01-09', 9, 'Oil', 'Renaissance', 'Portrait'),
(10, 'Pablo', 'Silva', '555', '1234567009', 'Calle Diez', '10010', '2023-01-10', 10, 'Oil', 'Baroque', 'Religious');

INSERT INTO Artwork VALUES
(1, 1, 'La Guernica', 50000, '2023-01-01', NULL, '2023-02-01', 'Available', 'Oil', 'Large', 'Cubism', 'Painting', 1937, '111223333'),
(2, 2, 'Las dos Fridas', 60000, '2023-01-02', NULL, '2023-02-02', 'Sold', 'Acrylic', 'Medium', 'Surrealism', 'Portrait', 1939, '222334444'),
(3, 3, 'Starry Night', 70000, '2023-01-03', NULL, '2023-02-03', 'Available', 'Oil', 'Large', 'Post-Impressionism', 'Landscape', 1889, '333445555'),
(4, 4, 'Water Lilies', 80000, '2023-01-04', NULL, '2023-02-04', 'Available', 'Oil', 'Large', 'Impressionism', 'Nature', 1916, '444556666'),
(5, 5, 'Marilyn Monroe', 90000, '2023-01-05', NULL, '2023-02-05', 'Sold', 'Silkscreen', 'Small', 'Pop Art', 'Portrait', 1962, '555667777'),
(6, 6, 'The Persistence of Memory', 30000, '2023-01-06', NULL, '2023-02-06', 'Available', 'Oil', 'Small', 'Surrealism', 'Abstract', 1931, '666778888'),
(7, 7, 'No. 5, 1948', 40000, '2023-01-07', NULL, '2023-02-07', 'Available', 'Oil', 'Large', 'Expressionism', 'Drip', 1948, '777889999'),
(8, 8, 'Red Canna', 20000, '2023-01-08', NULL, '2023-02-08', 'Available', 'Watercolor', 'Medium', 'Modernism', 'Flowers', 1924, '888990000'),
(9, 9, 'Mona Lisa', 100000, '2023-01-09', NULL, '2023-02-09', 'Sold', 'Oil', 'Medium', 'Renaissance', 'Portrait', 1503, '999001111'),
(10, 10, 'The Night Watch', 110000, '2023-01-10', NULL, '2023-02-10', 'Available', 'Oil', 'Large', 'Baroque', 'Religious', 1642, '000112222');

INSERT INTO ShownIn VALUES
(1, 'Cubism Masters'),
(2, 'Women in Art'),
(3, 'Starry Nights'),
(4, 'Impressionist Heaven'),
(5, 'Pop Art World'),
(6, 'Surreal Dreams'),
(7, 'Modern Movements'),
(8, 'Floral Gallery'),
(9, 'Renaissance Highlights'),
(10, 'Baroque Legends');

INSERT INTO Collector VALUES
('111223333', 'Mario', 'López', 'Calle Uno', '10001', '2023-01-01', 'Clara', '555', '1234567000', 50000, 10000, 1, 'Oil', 'Cubism', 'Painting'),
('222334444', 'Paula', 'Suárez', 'Calle Dos', '10002', '2023-01-02', 'Jorge', '555', '1234567001', 60000, 20000, 2, 'Acrylic', 'Surrealism', 'Portrait'),
('333445555', 'Tomás', 'Martín', 'Calle Tres', '10003', '2023-01-03', 'Laura', '555', '1234567002', 70000, 30000, 3, 'Oil', 'Post-Impressionism', 'Landscape'),
('444556666', 'Lucía', 'Ortega', 'Calle Cuatro', '10004', '2023-01-04', 'Sonia', '555', '1234567003', 80000, 40000, 4, 'Oil', 'Impressionism', 'Nature'),
('555667777', 'Diego', 'Reyes', 'Calle Cinco', '10005', '2023-01-05', 'Luis', '555', '1234567004', 90000, 50000, 5, 'Silkscreen', 'Pop Art', 'Portrait'),
('666778888', 'Carla', 'Moreno', 'Calle Seis', '10006', '2023-01-06', 'Daniel', '555', '1234567005', 30000, 15000, 6, 'Oil', 'Surrealism', 'Abstract'),
('777889999', 'Elena', 'Delgado', 'Calle Siete', '10007', '2023-01-07', 'Sandra', '555', '1234567006', 40000, 10000, 7, 'Oil', 'Expressionism', 'Drip'),
('888990000', 'Luis', 'Carrillo', 'Calle Ocho', '10008', '2023-01-08', 'Marcela', '555', '1234567007', 20000, 7000, 8, 'Watercolor', 'Modernism', 'Flowers'),
('999001111', 'Verónica', 'Sánchez', 'Calle Nueve', '10009', '2023-01-09', 'Fernando', '555', '1234567008', 100000, 60000, 9, 'Oil', 'Renaissance', 'Portrait'),
('000112222', 'Hugo', 'Castro', 'Calle Diez', '10010', '2023-01-10', 'Natalia', '555', '1234567009', 110000, 70000, 10, 'Oil', 'Baroque', 'Religious');

INSERT INTO Shoow VALUES
('Cubism Masters', 1, '2023-05-01', 'Cubism', '2023-04-01'),
('Women in Art', 2, '2023-06-01', 'Feminist Art', '2023-05-01'),
('Starry Nights', 3, '2023-07-01', 'Night Themes', '2023-06-01'),
('Impressionist Heaven', 4, '2023-08-01', 'Impressionism', '2023-07-01'),
('Pop Art World', 5, '2023-09-01', 'Pop Culture', '2023-08-01'),
('Surreal Dreams', 6, '2023-10-01', 'Surrealism', '2023-09-01'),
('Modern Movements', 7, '2023-11-01', 'Modern Art', '2023-10-01'),
('Floral Gallery', 8, '2023-12-01', 'Flowers', '2023-11-01'),
('Renaissance Highlights', 9, '2024-01-01', 'Renaissance', '2023-12-01'),
('Baroque Legends', 10, '2024-02-01', 'Baroque', '2024-01-01');

INSERT INTO Buyer VALUES
(1, 'Ana', 'Ramirez', 'Calle Uno', '10001', '555', '1234567100', 50000, 10000),
(2, 'Luis', 'Fernandez', 'Calle Dos', '10002', '555', '1234567101', 60000, 20000),
(3, 'María', 'López', 'Calle Tres', '10003', '555', '1234567102', 70000, 30000),
(4, 'Carlos', 'Mendez', 'Calle Cuatro', '10004', '555', '1234567103', 80000, 40000),
(5, 'Sofía', 'González', 'Calle Cinco', '10005', '555', '1234567104', 90000, 50000),
(6, 'Diego', 'Martínez', 'Calle Seis', '10006', '555', '1234567105', 30000, 15000),
(7, 'Elena', 'Ramos', 'Calle Siete', '10007', '555', '1234567106', 40000, 10000),
(8, 'Javier', 'Ortiz', 'Calle Ocho', '10008', '555', '1234567107', 20000, 7000),
(9, 'Lucía', 'Castillo', 'Calle Nueve', '10009', '555', '1234567108', 100000, 60000),
(10, 'Pablo', 'Silva', 'Calle Diez', '10010', '555', '1234567109', 110000, 70000);

INSERT INTO Salesperson VALUES
('123456789', 'Andrea', 'Ruiz', 'Calle Uno', '10001'),
('234567890', 'Marco', 'Vega', 'Calle Dos', '10002'),
('345678901', 'Sandra', 'Diaz', 'Calle Tres', '10003'),
('456789012', 'Julio', 'Santos', 'Calle Cuatro', '10004'),
('567890123', 'Lucía', 'Nava', 'Calle Cinco', '10005'),
('678901234', 'Pablo', 'Robles', 'Calle Seis', '10006'),
('789012345', 'Diana', 'Rey', 'Calle Siete', '10007'),
('890123456', 'Luis', 'Guzman', 'Calle Ocho', '10008'),
('901234567', 'Sofia', 'Ibarra', 'Calle Nueve', '10009'),
('012345678', 'Mateo', 'López', 'Calle Diez', '10010');

INSERT INTO Sale VALUES
(1, 1, 4000, '2023-03-15', 5000, 500, 1, '123456789'),
(2, 2, 6000, '2023-03-20', 7000, 700, 2, '234567890'),
(3, 3, 8000, '2023-03-25', 10000, 1000, 3, '345678901'),
(4, 4, 7000, '2023-03-30', 8000, 800, 4, '456789012'),
(5, 5, 6000, '2023-04-01', 7000, 700, 5, '567890123'),
(6, 6, 7500, '2023-04-05', 8500, 850, 6, '678901234'),
(7, 7, 9000, '2023-04-10', 9500, 950, 7, '789012345'),
(8, 8, 10000, '2023-04-15', 11000, 1100, 8, '890123456'),
(9, 9, 11000, '2023-04-20', 12000, 1200, 9, '901234567'),
(10, 10, 12000, '2023-04-25', 13000, 1300, 10, '012345678');