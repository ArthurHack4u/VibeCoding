$(function () {
    const API_URL = 'https://fi.jcaguilar.dev/v1/escuela/persona';
    const $tbody = $('table tbody');

    function cargarPersonas() {
        $tbody.html('<tr><td colspan="6" class="text-center">Cargando datos...</td></tr>');
        $.get(API_URL, function (data) {
            $tbody.empty();
            if (data && data.length > 0) {
                data.forEach(p => {
                    const sexo = p.sexo === 'h' ? 'Hombre' : p.sexo === 'm' ? 'Mujer' : 'Otro';
                    const $row = $(`
                        <tr>
                            <td>${p.nombre}</td>
                            <td>${p.apellido ?? ''}</td>
                            <td>${sexo}</td>
                            <td>${p.fh_nac ?? 'N/D'}</td>
                            <td>${p.rol ?? 'Sin rol'}</td>
                            <td class="d-flex gap-2">
                                <button class="btn btn-warning btn-sm btn-edit" data-id="${p.id_persona ?? p.id}">Editar</button>
                                <button class="btn btn-danger btn-sm btn-delete" data-id="${p.id_persona ?? p.id}">Borrar</button>
                            </td>
                        </tr>
                    `);
                    $tbody.append($row);
                });
            } else {
                $tbody.html('<tr><td colspan="6" class="text-center">No hay datos.</td></tr>');
            }
        }).fail(err => {
            console.error('Error al cargar:', err);
            $tbody.html('<tr><td colspan="6" class="text-danger text-center">Error al cargar datos.</td></tr>');
        });
    }

    $('#form-add').on('submit', function (e) {
        e.preventDefault();
        const form = this;
        if (!form.checkValidity()) {
            form.classList.add('was-validated');
            return;
        }

        const data = {
            nombre: $('#nom').val(),
            apellido: $('#apell').val(),
            sexo: $('input[name="sexo"]:checked').val(),
            fh_nac: $('#fecha').val(),
            id_rol: parseInt($('#rol').val(), 10)
        };

        $.ajax({
            url: API_URL,
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function () {
                alert('Persona registrada correctamente.');
                form.reset();
                form.classList.remove('was-validated');
                cargarPersonas();
            },
            error: function (xhr) {
                console.error('Error al registrar:', xhr.responseText);
                alert('Error al registrar persona.');
            }
        });
    });

    $tbody.on('click', '.btn-delete', function () {
        const id = $(this).data('id');
        if (confirm('¿Eliminar esta persona?')) {
            $.ajax({
                url: API_URL, 
                type: 'DELETE',
                contentType: 'application/json',
                data: JSON.stringify({ id_persona: id }), 
                success: function () {
                    alert('Persona eliminada correctamente.');
                    cargarPersonas();
                },
                error: function (xhr) {
                    console.error('Error al eliminar:', xhr.responseText);
                    alert('Error al eliminar persona.');
                }
            });
        }
    });

    $tbody.on('click', '.btn-edit', function () {
        const id = $(this).data('id');
        $.get(`${API_URL}/${id}`, function (p) {
            $('#edit-id').val(p.id_persona ?? p.id);
            $('#edit-nombre').val(p.nombre);
            $('#edit-apellido').val(p.apellido);
            $('#edit-fecha').val(p.fh_nac);
            $(`#form-edit input[name="sexo"][value="${p.sexo}"]`).prop('checked', true);
            $('#edit-rol').val(p.id_rol);
            const modal = new bootstrap.Modal('#modalEdit');
            modal.show();
        }).fail(err => {
            console.error('Error al cargar persona:', err.responseText);
            alert('Error al cargar datos para edición.');
        });
    });
    $('#form-edit').on('submit', function (e) {
        e.preventDefault();
        const form = this;
        if (!form.checkValidity()) {
            form.classList.add('was-validated');
            return;
        }

        const data = {
            id_persona: parseInt($('#edit-id').val(), 10), 
            nombre: $('#edit-nombre').val(),
            apellido: $('#edit-apellido').val(),
            sexo: $('input[name="sexo"]:checked', form).val(),
            fh_nac: $('#edit-fecha').val(),
            id_rol: parseInt($('#edit-rol').val(), 10)
        };

        console.log('Datos enviados para actualización:', data);

        $.ajax({
            url: API_URL, 
            type: 'PATCH',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function () {
                alert('Persona actualizada correctamente.');
                $('#modalEdit').modal('hide');
                form.classList.remove('was-validated');
                cargarPersonas();
            },
            error: function (xhr) {
                console.error('Error al actualizar:', xhr.responseText);
                alert('Error al actualizar persona.');
            }
        });
    });

    cargarPersonas();
});