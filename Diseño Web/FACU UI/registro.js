$(function() {
    
    // --- CONSTANTES ---
    const API_URL = 'https://fi.jcaguilar.dev/v1/escuela/persona';
    const $tbody = $('table tbody');
    const $form = $('.needs-validation');
    const $editIdField = $('#edit-id'); // El input oculto
    
    // --- NUEVO: Referencias a los botones ---
    const $submitButton = $('.btnsave');
    const $cancelEditButton = $('#btn-cancel-edit');
    const $cancelLink = $('.btncancel'); // El link original de 'Cancelar'

    // --- NUEVO: Mapeo de Rol (texto) a id_rol (número) ---
    // Esto es crucial para rellenar el <select> al editar
    const rolMap = {
        // Asegúrate que estos textos coincidan con lo que devuelve la API
        "Estudiante": "1", 
        "Profesor": "2",
        "Administrativo": "3",
        "Otro": "4"
    };

    // -----------------------------------------------------------------
    // FUNCIÓN PARA LIMPIAR Y RESETEAR EL FORMULARIO
    // -----------------------------------------------------------------
    function resetForm() {
        $form[0].reset(); // Limpia los campos
        $form.removeClass('was-validated'); // Quita estilos de validación
        $editIdField.val(''); // Limpia el ID oculto
        
        // Restaura los botones a su estado original
        $submitButton.text('Enviar');
        $cancelEditButton.hide();
        $cancelLink.show(); // Muestra el link 'Cancelar' original
    }

    // -----------------------------------------------------------------
    // 1. FUNCIÓN PARA CARGAR LAS PERSONAS EN LA TABLA (GET)
    // -----------------------------------------------------------------
    function cargarPersonas() {
        // Ajustamos el colspan a 6 (5 columnas + 1 de acciones)
        $tbody.html('<tr><td colspan="6" style="text-align: center;">Cargando datos...</td></tr>');

        $.ajax({
            url: API_URL,
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                $tbody.empty();

                if (data && data.length > 0) {
                    $.each(data, function(index, persona) {
                        
                        let sexoTexto = persona.sexo;
                        if (persona.sexo === 'h') sexoTexto = 'Hombre';
                        if (persona.sexo === 'm') sexoTexto = 'Mujer';
                        if (persona.sexo === 'o') sexoTexto = 'Otro';

                        const fecha = persona.fh_nac || 'N/D';
                        const apellido = persona.apellido || '';

                        // --- Creamos los botones con clases de Bootstrap ---
                        const $btnEditar = $(`<button class="btn btn-warning btn-sm btn-edit" data-id="${persona.id}">Editar</button>`);
                        const $btnBorrar = $(`<button class="btn btn-danger btn-sm btn-delete" data-id="${persona.id}">Borrar</button>`);

                        // Creamos la nueva fila con 6 columnas
                        const $tr = $('<tr>').append(
                            $('<td>').text(persona.nombre),
                            $('<td>').text(apellido),
                            $('<td>').text(sexoTexto),
                            $('<td>').text(fecha),
                            $('<td>').text(persona.rol),
                            // Nueva <td> para los botones
                            $('<td class="d-flex gap-2">').append($btnEditar, $btnBorrar) 
                        );
                        $tbody.append($tr);
                    });
                } else {
                    $tbody.html('<tr><td colspan="6" style="text-align: center;">No se encontraron personas.</td></tr>');
                }
            },
            error: function(error) {
                console.error("Error al cargar los datos:", error);
                $tbody.html('<tr><td colspan="6" style="text-align: center; color: red;">Error al cargar los datos.</td></tr>');
            }
        });
    }

    // -----------------------------------------------------------------
    // 2. FUNCIÓN PARA ENVIAR EL FORMULARIO (POST o PUT)
    // -----------------------------------------------------------------
    $form.on('submit', function(event) {
        event.preventDefault();
        event.stopPropagation();
        const form = this;

        if (!form.checkValidity()) {
            form.classList.add('was-validated');
            return;
        }
        form.classList.add('was-validated');

        const formData = $form.serializeArray();
        const dataParaAPI = {};
        $.each(formData, function(i, field) {
            dataParaAPI[field.name] = field.value;
        });

        // Verificamos si estamos EDITANDO o CREANDO
        const editId = $editIdField.val();
        let ajaxType = 'POST'; // Por defecto es 'POST' (Crear)
        let ajaxUrl = API_URL;

        if (editId) {
            // Si hay un ID, estamos EDITANDO (PUT)
            ajaxType = 'PUT';
            ajaxUrl = API_URL + '/' + editId;
        }

        $.ajax({
            url: ajaxUrl,
            type: ajaxType,
            contentType: 'application/json',
            data: JSON.stringify(dataParaAPI),
            success: function(response) {
                const accion = editId ? 'actualizada' : 'agregada';
                console.log(`¡Persona ${accion}!`, response);
                
                resetForm(); // Limpiamos el formulario y restauramos botones
                cargarPersonas(); // Recargamos la tabla
            },
            error: function(error) {
                const accion = editId ? 'actualizar' : 'agregar';
                console.error(`Error al ${accion} persona:`, error);
                alert('Error al guardar. Revisa la consola (F12).');
            }
        });
    });

    // -----------------------------------------------------------------
    // 3. Event Handler para el botón BORRAR (DELETE)
    // -----------------------------------------------------------------
    $tbody.on('click', '.btn-delete', function() {
        const personaId = $(this).data('id');

        // --- Pide confirmación antes de borrar ---
        if (confirm('¿Estás seguro de que quieres eliminar a esta persona?')) {
            $.ajax({
                url: API_URL + '/' + personaId,
                type: 'DELETE',
                success: function(response) {
                    console.log('Persona eliminada', response);
                    cargarPersonas(); // Recargamos la tabla
                },
                error: function(error) {
                    console.error('Error al eliminar:', error);
                    alert('No se pudo eliminar a la persona.');
                }
            });
        }
    });

    // -----------------------------------------------------------------
    // 4. Event Handler para el botón EDITAR (GET single)
    // -----------------------------------------------------------------
    $tbody.on('click', '.btn-edit', function() {
        const personaId = $(this).data('id');

        $.ajax({
            url: API_URL + '/' + personaId,
            type: 'GET',
            success: function(persona) {
                // 2. Llenamos el formulario
                $('#nom').val(persona.nombre);
                $('#apell').val(persona.apellido);
                $('#fecha').val(persona.fh_nac);
                $('#calificacion').val(persona.calificacion); // Rellenamos calificación
                
                $(`input[name="sexo"][value="${persona.sexo}"]`).prop('checked', true);
                
                // Usamos el 'rolMap' para seleccionar el ID correcto
                $('#rol').val(rolMap[persona.rol]); 

                $editIdField.val(persona.id); // Guardamos el ID en el campo oculto

                // --- Lógica de botones para "Modo Edición" ---
                $submitButton.text('Actualizar'); // Cambiamos texto del botón
                $cancelEditButton.show(); // Mostramos "Cancelar Edición"
                $cancelLink.hide(); // Ocultamos el link "Cancelar" original

                // Movemos la vista al formulario
                $('html, body').animate({ scrollTop: 0 }, 300);
            },
            error: function(error) {
                console.error('Error al cargar datos para editar:', error);
                alert('No se pudieron cargar los datos para editar.');
            }
        });
    });

    // -----------------------------------------------------------------
    // 5. NUEVO: Event Handler para el botón "Cancelar Edición"
    // -----------------------------------------------------------------
    $cancelEditButton.on('click', function() {
        resetForm(); // Simplemente resetea el formulario
    });


    // -----------------------------------------------------------------
    // 6. EJECUCIÓN INICIAL
    // -----------------------------------------------------------------
    cargarPersonas();
    
});