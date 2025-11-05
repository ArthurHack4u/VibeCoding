USE db_molduplastic;

SELECT CONCAT('SELECT * FROM ', table_name, ';')
FROM information_schema.tables 
WHERE table_schema = 'db_molduplastic';

SHOW TABLES;
SELECT * FROM aseguradoras;
SELECT * FROM estatus;
SELECT * FROM piezas;
SELECT * FROM recolecciones;
SELECT * FROM recolectores;
SELECT * FROM siniestros;
SELECT * FROM talleres;
SELECT * FROM talleres_aseguradoras;
