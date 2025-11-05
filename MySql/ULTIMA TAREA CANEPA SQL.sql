/*
UNIVERSIDAD AUTONOMA DE CAMPECHE
MORAN ESCALANTE BRYAN ARTURO 67406
*/
CREATE DATABASE db_escuela_full;
USE db_escuela_full;

-- 1. ¿Cuántos alumnos reprobaron al menos una materia? La nota mínima aprobatoria es 8.
SELECT CONCAT(id_estudiante) AS alumnos_reprobados
FROM inscripciones
WHERE calificacion < 8;

-- 2. ¿Quiénes reprobaron al menos una materia?
SELECT DISTINCT CONCAT(p.nombre, ' ', p.apellido) AS Alumno
FROM inscripciones i
JOIN personas p ON i.id_estudiante = p.id_persona
WHERE i.calificacion < 8;

-- 3. Genera la boleta de calificaciones del alumno 107 usando el siguiente formato: CLAVE. MATERIA. NOTA
SELECT m.id_materia AS CLAVE, m.descripcion AS CLAVE_MATERIA, i.calificacion AS NOTA
FROM inscripciones i
JOIN materias m ON i.id_materia = m.id_materia
WHERE i.id_estudiante = 107;


-- 4. La escuela ofrece una beca a los alumnos con promedio igual o mayor a 9. ¿Quiénes tienen derecho a ella?
SELECT DISTINCT CONCAT(p.nombre, ' ', p.apellido) AS Alumno
FROM inscripciones i
JOIN personas p ON i.id_estudiante = p.id_persona
GROUP BY i.id_estudiante
HAVING AVG(i.calificacion) >= 9;

-- 5. Para tener derecho a presentar examen final, se requiere tener el 90% de asistencia. ¿Hay algún alumno que no tenga derecho a presentarlo?
select
id_estudiante, nombre, apellido, id_materia, count(fecha) as total
from asistencias a
join inscripciones i on a.id_inscripcion = i.id_inscripcion
join personas p on i.id_estudiante = p.id_persona
group by id_estudiante, id_materia
having count(fecha) < 9

-- 6. ¿Cuál fue el profesor a cargo del grupo que tuvo el índice de desempeño más bajo?
SELECT CONCAT(p.nombre, ' ', p.apellido) AS Profesor
FROM asignaciones a
JOIN personas p ON a.id_profesor = p.id_persona
JOIN inscripciones i ON i.id_materia = a.id_materia
GROUP BY a.id_profesor
ORDER BY AVG(i.calificacion) ASC
LIMIT 1;


-- 7. Inserta las asignaciones para el semestre 2 usando los siguientes datos:
INSERT INTO asignaciones (id_asignacion, id_profesor, id_materia, periodo)
VALUES
(104, (SELECT id_persona FROM personas WHERE CONCAT(nombre, ' ', apellido) = 'El profesor con el mejor desempeño'), (SELECT id_materia FROM materias WHERE descripcion = 'Redacción'), 2024),
(105, (SELECT id_persona FROM personas WHERE CONCAT(nombre, ' ', apellido) = 'Maricela Araujo'), (SELECT id_materia FROM materias WHERE descripcion = 'Geometría'), 2024),
(106, (SELECT id_persona FROM personas WHERE CONCAT(nombre, ' ', apellido) = 'Manuel Estrada'), (SELECT id_materia FROM materias WHERE descripcion = 'Biología'), 2024),
(107, (SELECT id_persona FROM personas WHERE CONCAT(nombre, ' ', apellido) = 'El profesor con el segundo mejor desempeño'), (SELECT id_materia FROM materias WHERE descripcion = 'Inglés'), 2024);


-- 8. Inscribe a los alumnos a las materias del semestre 2. Los alumnos que reprobaron materias deben volver a llevarlas.
INSERT INTO inscripciones (id_estudiante, id_materia, calificacion)
SELECT i.id_estudiante, i.id_materia, 8
FROM inscripciones i
WHERE i.calificacion < 8;

-- 9. Visualiza la carga académica para cada estudiante para el semestre 2 utilizando el siguiente formato: ID_ALUMNO ALUMNO CVE_MATERIA MATERIA PROFESOR
SELECT i.id_estudiante AS ID_ALUMNO, CONCAT(p.nombre, ' ', p.apellido) AS ALUMNO, m.id_materia AS CVE_MATERIA, m.descripcion AS MATERIA, CONCAT(pr.nombre, ' ', pr.apellido) AS PROFESOR
FROM inscripciones i
JOIN materias m ON i.id_materia = m.id_materia
JOIN personas p ON i.id_estudiante = p.id_persona
JOIN asignaciones a ON a.id_materia = m.id_materia
JOIN personas pr ON a.id_profesor = pr.id_persona
WHERE a.periodo = 2024;

-- 10. Registra la asistencia para todos los alumnos inscritos al semestre 2 el día de hoy (12 de septiembre de 2024)
INSERT INTO asistencias (id_inscripcion, fecha)
SELECT i.id_inscripcion, '2024-09-12'
FROM inscripciones i
WHERE EXISTS (SELECT 1 FROM asignaciones a WHERE a.id_materia = i.id_materia AND a.periodo = 2024);

-- 11. Asigna las calificaciones del semestre 2 usando los siguientes datos:
-- Redacción
UPDATE inscripciones SET calificacion = 8 WHERE id_estudiante IN (100, 102, 107, 109);
UPDATE inscripciones SET calificacion = 7 WHERE id_estudiante = 112;
UPDATE inscripciones SET calificacion = 9 WHERE id_estudiante NOT IN (100, 102, 107, 109, 112);

-- Geometría
UPDATE inscripciones SET calificacion = 7 WHERE id_estudiante = 120;
UPDATE inscripciones SET calificacion = 8 WHERE id_estudiante IN (102, 112, 122);
UPDATE inscripciones SET calificacion = 9 WHERE id_estudiante NOT IN (120, 102, 112, 122);

-- Biología
UPDATE inscripciones SET calificacion = 7 WHERE id_estudiante IN (100, 101, 102, 103, 104, 105);
UPDATE inscripciones SET calificacion = 8 WHERE id_estudiante IN (106, 107, 108, 109, 110);
UPDATE inscripciones SET calificacion = 9 WHERE id_estudiante NOT IN (100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110);

-- Inglés
UPDATE inscripciones SET calificacion = 7 WHERE id_estudiante IN (110, 111, 112, 113, 114);
UPDATE inscripciones SET calificacion = 10 WHERE id_estudiante = 120;
UPDATE inscripciones SET calificacion = 9 WHERE id_estudiante NOT IN (110, 111, 112, 113, 114, 120);

-- Materias recursadas
UPDATE inscripciones SET calificacion = 8 WHERE id_estudiante IN (SELECT id_estudiante FROM inscripciones WHERE calificacion < 8);





