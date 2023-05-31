<script src="<?php echo base_url(); ?>/jsPDF-1.3.2/dist/jspdf.debug.js"></script>
<script src="<?php echo base_url(); ?>/jsPDF-1.3.2/dist/jspdf.min.js"></script>
<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>



<div class="titulo">
    <h3>Administracion de usuarios</h3>
</div>
<br>

<div class="op">

    <a href="#" onclick="seleccionausuario(<?php echo 1 . ',' . 1 ?>);" class="btn btn-success regresar_Btn"
        data-bs-toggle="modal" data-bs-target="#agregar_usuario">Crear nuevo usario</a>
    &nbsp <a href="<?php echo base_url('eliminados_usuario'); ?>" class="btn btn-secondary regresar_Btn">Eliminados</a>

    &nbsp<a href="<?php echo base_url('/principal'); ?>" class="btn btn-primary regresar_Btn">Regresar</a> &nbsp


</div>
<div id="contenedor">
    <div id="limite">
        <table id="miTabla" class="display">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Usuario</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Rol</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($usuarios as $dato){ ?>
                <tr>
                    <td><?= $dato['id_usuario']?></td>
                    <td><?= $dato['usuario']?></td>
                    <td><?= $dato['nombre']?></td>
                    <td><?= $dato['apellido']?></td>
                    <td><?= $dato['id_rol']?></td>
                    <td><?= $dato['estado']?></td>
                    <td>
                        <a class="btn btn-warning" href="#"
                            onclick="seleccionausuario(<?php echo $dato['id_usuario'] . ',' . 2 ?>);"
                            data-bs-toggle="modal" data-bs-target="#agregar_usuario" width="16" height="16"
                            title="Editar Registro">
                            <img class="image" src="<?= base_url("img/editar.png") ?> " title="Editar">
                        </a>

                        <a class="btn btn-danger" href="#"
                            data-href="<?php echo base_url('usuario/eliminar__usuario'). '/' .$dato['id_usuario']. '/' .'E'; ?>"
                            data-bs-toggle="modal" data-bs-target="#modal-confirma"
                            src="<?php echo base_url(); ?>/icons/borrar.png" width="16" height="16"
                            title="Elimina Registro">
                            <img class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar">
                        </a>

                    </td>
                </tr>
                <?php } ?>
            </tbody>
        </table>

        <!-- <---------------------modal agregar usuario----------->
        <form method="POST" action="<?php echo base_url('/usuario/insertar'); ?>" autocomplete="off">

            <div class="modal fade" id="agregar_usuario" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">

                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel"></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            <input hidden id="id" name="id">
                            <input hidden id="tp" name="tp">

                            <div>

                                <div class="input_container">
                                    <label class="input_label" for="email_field">Selecione rol</label>
                                    <img src="<?= base_url("icons/person-vcard-fill.svg")?>" class="icon">
                                    <select class="select_administrador" name="id_rol" id="id_rol"
                                        aria-label="Default select example" required>
                                        <?php foreach ($roles as $data) {?>

                                        <option value="<?php echo $data['id_rol'];?>" class="black_opcion">
                                            <?php echo $data["nombre"];?></option>
                                        <?php } ?>
                                    </select>
                                </div>

                                <!-- nombre -->
                                <div class="input_container">
                                    <label class="input_label" for="email_field">Nombre</label>
                                    <img src="<?= base_url("icons/person-fill.svg")?>" class="icon">
                                    <input placeholder="Ej: Daniel" name="nombre" type="text" class="input_field"
                                        id="nombre" required>
                                </div>

                                <!-- apellido -->
                                <div class="input_container">
                                    <label class="input_label" for="email_field">Apellidos</label>
                                    <img src="<?= base_url("icons/person-lines-fill.svg")?>" class="icon">
                                    <input placeholder="Ej: Banquet" name="apellido" type="text" class="input_field"
                                        id="apellido" required>
                                </div>

                                <!-- tipo de documento -->
                                <div class="input_container">
                                    <label class="input_label" for="email_field">Tipo de documento</label>
                                    <img src="<?= base_url("icons/person-vcard-fill.svg")?>" class="icon">
                                    <select class="select_administrador" name="tipo_documento" id="tipo_documento"
                                        aria-label="Default select example" required>
                                        <?php foreach ($parametros as $data) {?>
                                        <option value="<?php echo $data['id_parametro_det']; ?>">
                                            <?php echo $data["nombre"];?></option>
                                        <?php } ?>
                                    </select>
                                </div>

                                <!-- numero de documento-->
                                <div class="input_container">
                                    <label class="input_label" for="email_field">Numero de documento</label>
                                    <img src="<?= base_url("icons/person-video.svg")?>" class="icon">
                                    <input placeholder="Ej: 1007 265 547" name="num_documento" type="number"
                                        class="input_field" id="num_documento" required>
                                </div>
                            </div>
                            <div>
                                <!-- usuario -->
                                <div class="input_container">
                                    <label class="input_label" for="email_field">Nombre de usuario</label>
                                    <img src="<?= base_url("icons/person-check-fill.svg")?>" class="icon">
                                    <input placeholder="Ej: Daniel" name="usuario" type="text" class="input_field"
                                        id="usuario" required>
                                </div>

                                <div class="input_container">
                                    <label class="input_label" for="email_field">Teléfono</label>
                                    <img src="<?= base_url("icons/telephone-fill.svg")?>" class="icon">
                                    <input placeholder="Ej: 309 156 9347" name="telefono" type="number"
                                        class="input_field" id="telefono" required>
                                </div>

                                <div class="input_container">
                                    <label class="input_label" for="password_field">Contraseña</label>
                                    <img src="<?= base_url("icons/person-fill-lock.svg")?>" class="icon">
                                    <input placeholder="Contraseña" name="pass" type="password" class="input_field"
                                        id="pass" required>
                                </div>

                                <div class="input_container">
                                    <label class="input_label" for="email_field">Correo electronico</label>
                                    <img src="<?= base_url("icons/envelope-fill.svg")?>" class="icon">
                                    <input placeholder="Ej: correo@mail.com" name="email" type="email"
                                        class="input_field" id="email" required>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" id="btn_guardar">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</div>

<!-- --------------------------------------------Modal Confirma Eliminar ---------------------------------------------------->
<div class="modal fade" id="modal-confirma" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div style="text-align:center;" class="modaal-header">
                <h5 class="modal-title" id="exampleModalLabel">Eliminación de Registro<h5>

            </div>
            <div style="text-align:center;font-weight:bold;" class="modal-body">
                <p>Seguro Desea Eliminar este Registro?</p>
                <tr>

            </div>
            <div class="modal-footer">
                <a type="button" class="btn btn-primary close" data-bs-dismiss="modal">No</a>
                <a class="btn btn-danger btn-ok">Si</a>
            </div>
        </div>
    </div>
</div>


<script>
// <---------------modal confirmar eliminacion---------------------------------------------//
$('#modal-confirma').on('show.bs.modal', function(e) {
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
});
$('.close').click(function() {
    $("#modal-confirma").modal("hide");
});


function seleccionausuario(id, tp) {

    $(".input_container").hide();

    if (tp === 2) {

        dataURL = "<?php echo base_url('buscar_usuario'); ?>" + "/" + id;

        $.ajax({

            type: "POST",
            url: dataURL,
            dataType: "json",
            success: function(rs) {
                // console.log(rs);
                document.getElementById('exampleModalLabel').innerText = "Actualizar usuario";

                $("#tp").val(2);
                $("#id").val(id);
                limpiarCampos();

                $("#nombre, #apellido, #tipo_documento, #num_documento,#telefono,#email,#pass").prop('required', false);

                $("#id_rol").closest(".input_container").show();
                $("#usuario").closest(".input_container").show();

                $("#usuario").val(rs[0]['usuario']).prop('readonly', true);

                // $("#usuario").val(rs[0]['usuario']).prop('disabled', true);
                $("#id_rol").val(rs[0]['id_rol']);

                $("#btn_guardar").text('Actualizar');
            }
        });    

    } else {
        $("#tp").val(1);
        limpiarCampos();
        document.getElementById('exampleModalLabel').innerText = "Crear usuario";
        $("#usuario").val('').prop('readonly', false);
        $(".input_container").show();
        $("#btn_guardar").text('Guardar');
    }
}

function limpiarCampos() {

    $("#usuario").val('');
    $("#nombre").val('');
    $("#apellido").val('');
    $("#id_rol").val('');
    $("#tipo_documento").val('');
    $("#num_documento").val('');
    $("#email").val('');
    $("#telefono").val('');
    $("#pass").val('');

}

</script>


<script>
/******* Data - Table ***********/
$(document).ready(function() {
    $('#miTabla').DataTable({
        scrollY: '700px',
        scrollCollapse: true,
        paging: true,
        language: {
            lengthMenu: 'Display _MENU_ records per page',
            zeroRecords: 'No se encontro nada - Lo siento',
            info: 'Mostrando pagina _PAGE_ de _PAGES_',
            infoEmpty: 'No se encontro el registro',
            infoFiltered: '(Filtrado de _MAX_ registros totales)',
        },
        responsive: true


    });
});
</script>




<?= $this->endSection("contenido")?>