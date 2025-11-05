USE personas;

/*select CONCAT_WS(',', nombre, apellido, salario) as nombre_completo
from nomina
join personas on nomina.id_persona = personas.id_persona
where concepto = 'prima vacacional'
	and month(fecha) = 9 */
    
/*select CONCAT_WS(' ', nombre, apellido) as NombreCompleto, concepto, fecha
from personas
left join nomina
on personas.id_persona = nomina.id_persona
where concepto is null
*/

select concepto, fecha, nomina.id_persona, CONCAT_WS(' ', nombre, apellido) as NombreCompleto
from personas
right join nomina on personas.id_persona = nomina.id_persona = nomina.id_persona
