-- Moran Escalante Bryan Arturo
-- Matricula 67046
-- Fecha de elaboración: 2025-09-01

CREATE DATABASE db_molduplastic;
USE db_molduplastic;

/* 1) Registra el siniestro de un Nissan Sentra 2020 gris, el cual ocurrió el día de hoy. */
INSERT INTO siniestros
  (num_siniestro, id_recoleccion, id_aseguradora, fecha, marca, modelo, version, color, anio, fecha_inicio, id_estatus, notas)
VALUES
  ('SENT-20250901-001', NULL, 
   (SELECT id_aseguradora FROM aseguradoras WHERE nombre='GNP' LIMIT 1),
   '01/09/2025', 'Nissan', 'Sentra', NULL, 'gris', '2020', '2025-09-01 00:00:00', NULL, 'Alta manual de tarea');

/* 2) Elimina todos los siniestros que no tienen fecha de finalización. */
SET @old_fk := @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM siniestros WHERE fecha_finalizado IS NULL;
SET FOREIGN_KEY_CHECKS = @old_fk;

/* 3) Las piezas del siniestro 212 acaban de ser recolectadas. Cambia su estatus a ‘1’
(Recolectado) para reflejarlo en el sistema. */
UPDATE piezas SET id_estatus = 1 WHERE id_siniestro = 212;

/* 4) Registra un nuevo taller que se encuentre en algún punto de la ciudad de Mérida. */
SET @nombre_taller_merida := 'Taller Mérida Norte';
INSERT INTO talleres (nombre, nombre_contacto, direccion_completa, calle, colonia, cp, municipio, telefono_contacto, estado, numero_exterior, coordenadas)
VALUES
(@nombre_taller_merida, 'Encargado Mérida',
 'Calle 40 #200, Col. Norte, Mérida, Yucatán, CP 97010',
 'Calle 40', 'Norte', '97010', 'Mérida', '9996543210', 'Yucatán', '200',
 '20.96821,-89.62205');

 
/* 5) Borra todos los talleres que no tengan su dirección registrada. */
SET @old_fk := @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM talleres WHERE direccion_completa IS NULL OR direccion_completa = '';
SET FOREIGN_KEY_CHECKS = @old_fk;

/* 6) El taller “BMW Lindavista” acaba de cambiar su teléfono a 55 5078 0860. */
UPDATE talleres SET telefono_contacto = '5550780860' WHERE nombre = 'BMW Lindavista';

/* 7) Regístrate como un recolector. Recuerda no usar datos personales (salvo tu nombre). */
INSERT INTO recolectores (nombre, email, password, numero_celular, tmp)
VALUES ('Bryan A. Moran', 'arturo@sql', '123', '99999999', 'sql');

/* 8) Elimina todas las piezas que tengan notas. */
SET @old_fk := @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM piezas WHERE notas IS NOT NULL AND notas <> '';
SET FOREIGN_KEY_CHECKS = @old_fk;

/* 9) El taller “Roco Xochimilco” cambió su dirección fiscal a la Calzada de Tlalpan 3465, Coapa, Coyoacán, Ciudad de México, 04650. */
UPDATE talleres
SET direccion_completa = 'Calzada de Tlalpan 3465, Coapa, Coyoacán, Ciudad de México, 04650'
WHERE UPPER(nombre) LIKE '%XOCHIMILCO%';

/* 10) Registra un nuevo estatus que sea “Cancelado” */
INSERT INTO estatus (nombre) VALUES ('Cancelado');

/* 11) Elimina todos los siniestros que tengan una fecha de inicio registrada hace más de 6 meses. */
SET @old_fk := @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM siniestros
WHERE fecha_inicio IS NOT NULL
  AND fecha_inicio < DATE_SUB('2025-09-01', INTERVAL 6 MONTH);
SET FOREIGN_KEY_CHECKS = @old_fk;

/* 12) El taller “Tecno Car” tiene un nuevo encargado, el Lic. Roberto Mijares Ayala. */
UPDATE talleres
SET nombre_contacto = 'Lic. Roberto Mijares Ayala'
WHERE UPPER(nombre) = 'TECNO CAR';

/* 13) Del vehículo accidentado en el siniestro 320, se recuperó una pieza del “parachoques delantero” . Regístrala. */
INSERT INTO piezas (nombre, id_siniestro, id_estatus, notas)
VALUES ('parachoques delantero', 320, 1, 'Alta generada desde tarea');

/* 14) La aseguradora GNP ha terminado el contrato con la empresa, por lo que todos los siniestros deben registrar su fecha de finalización el día de hoy. */
UPDATE siniestros
SET fecha_finalizado = '2025-09-01 00:00:00'
WHERE id_aseguradora = (SELECT id_aseguradora FROM aseguradoras WHERE nombre='GNP' LIMIT 1);

/* 15) Cambia el password del recolector Leonardo Daniel por la huella hash de la palabra “ventilador”. */
UPDATE recolectores
SET password = SHA2('ventilador', 256)
WHERE nombre = 'Leonardo Daniel';

/* 16) El taller que registraste en el ejercicio 4 acaba de firmar un contrato con la aseguradora BBVA. Registra esta relación en la tabla talleres_aseguradoras. */
INSERT INTO talleres_aseguradoras (id_taller, id_aseguradora)
SELECT t.id_taller, a.id_aseguradora
FROM talleres t
JOIN aseguradoras a ON a.nombre = 'BBVA'
WHERE t.nombre = CONVERT(@nombre_taller_merida USING utf8mb4) COLLATE utf8mb4_general_ci;

/* 17) *Elimina todas las piezas que pertenezcan a siniestros que ya tengan el estatus “Finalizado”. */
SET @old_fk := @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;
DELETE p FROM piezas p
JOIN siniestros s ON s.id_siniestro = p.id_siniestro
JOIN estatus e ON e.id_estatus = s.id_estatus
WHERE e.nombre = 'Finalizada';
SET FOREIGN_KEY_CHECKS = @old_fk;

/* 18) *Cambia el estatus de todas las recolecciones que no tengan fecha de inicio a ‘Pendiente’. */
UPDATE recolecciones
SET estatus = (SELECT id_estatus FROM estatus WHERE nombre='Pendiente' LIMIT 1)
WHERE fecha_completado IS NULL;

/* 19) *Registra tu primera recolección como trabajador (el registro que hiciste en el ejercicio 7) al taller que registraste en el ejercicio 4. 
Esta recolección debe tener el estatus ‘Recolectado’. */
INSERT INTO recolecciones (id_taller, estatus, id_recolector, fecha_completado)
SELECT t.id_taller,
       (SELECT id_estatus FROM estatus WHERE nombre='Recolectado' LIMIT 1),
       r.id_recolector,
       '2025-09-01 08:00:00'
FROM talleres t
JOIN recolectores r ON r.nombre = 'Bryan A. Moran'
WHERE t.nombre = CONVERT(@nombre_taller_merida USING utf8mb4) COLLATE utf8mb4_general_ci;


/* 20) *Elimina todos los talleres que no estén relacionados con alguna aseguradora.*/
SET @old_fk := @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM talleres t
WHERE NOT EXISTS (
  SELECT 1 FROM talleres_aseguradoras ta WHERE ta.id_taller = t.id_taller
);
SET FOREIGN_KEY_CHECKS = @old_fk;