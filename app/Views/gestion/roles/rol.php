<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>


<div class="titulo">
    <h3>Administracion de rol</h3>
</div>
<br>

<div class="op">

    <a href="" onclick="seleccionarol(<?php echo 1 . ',' . 1 ?>);" class="btn btn-success regresar_Btn"
        data-bs-toggle="modal" data-bs-target="#agregar_rol">Agregar</a>
    &nbsp<a href="<?php echo base_url('eliminados_rol'); ?>" class="btn btn-secondary regresar_Btn">Eliminados</a>

    &nbsp<a href="<?php echo base_url('/principal'); ?>" class="btn btn-primary regresar_Btn">Regresar</a>
</div>
<div id="contenedor">
    <div id="limite">
        <div class="table-responsive">
            <table  id="miTabla" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>descripcion</th>


                        <th>estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>

                <?php foreach ($roles as $dato){ ?>
                <tr>
                    <td> <?php echo $dato['id_rol']; ?></td>
                    <td> <?php echo $dato['nombre']; ?></td>
                    <td> <?php echo $dato['descripcion']; ?></td>
                    <td> <?php if($dato['estado']=="A"){echo "Activo";}else{echo "Eliminado";}?></td>
                    <td>
                        <a class="btn btn-warning" href="#"
                            onclick="seleccionarol(<?php echo $dato['id_rol'] . ',' . 2 ?>);" data-bs-toggle="modal"
                            data-bs-target="#agregar_rol" width="16" height="16" title="Editar Registro">
                            <img class="image" src="<?= base_url("img/editar.png") ?> " title="Editar">
                        </a>

                        <a class="btn btn-danger"  href="#" data-href="<?php echo base_url('rol/eliminar__rol'). '/' .$dato['id_rol']. '/' .'E'; ?>"  data-bs-toggle="modal" data-bs-target="#modal-confirma" src="<?php echo base_url(); ?>/icons/borrar.png" width="16" height="16"  title="Elimina Registro"> 
                                    <img class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar">
                                   </a>

                    </td>

                </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- <---------------------modal agregar rol----------->
<form method="POST" action="<?php echo base_url('/rol/insertar'); ?>" autocomplete="off">

    <div class="modal fade" id="agregar_rol" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Crear nuevo rol</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">

                    <input hidden id="tp" name="tp">
                    <input hidden id="id" name="id">

                    <label class="input_label" for="email_field">Nombre</label>
                    <input placeholder="Ej:Administrador" name="nombre" type="text" class="input_field" id="nombre"
                        required><br>

                    <label class="input_label" for="email_field">descripcion</label>

                    <textarea class="dc" placeholder="Descripcion" name="descripcion" id="descripcion"></textarea>


                </div>
                <div class="modal-footer">

                    <button type="submit" class="btn btn-primary" id="btn_guardar">Guardar</button>
                </div>
            </div>

        </div>
    </div>
</form>


<!-- modal confirma -->
<div class="modal fade" id="modal-confirma" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div style="text-align:center;" class="modaal-header">
                    <h5  class="modal-title"
                    
                        id="exampleModalLabel">Eliminación de Registro<h5>


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






<!-- <---------------------div de header y footer------------------->
</div>
<script>
    
$('#modal-confirma').on('show.bs.modal', function(e) {
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
});
$('.close').click(function() {
    $("#modal-confirma").modal("hide");
});


function seleccionarol(id, tp) {
    if (tp == 2) {
        dataURL = "<?php echo base_url('buscar_rol'); ?>" + "/" + id;
        $.ajax({
            type: "POST",
            url: dataURL,
            dataType: "json",
            success: function(rs) {
                document.getElementById('exampleModalLabel').innerText = "Actualizar Rol";
                $("#tp").val(2);
                $("#id").val(id);
                $("#descripcion").val(rs[0]['descripcion']);
                $("#nombre").val(rs[0]['nombre']);
                $("#btn_guardar").text('Actualizar');
            }

        });
    } else {
        $("#tp").val(1);
        document.getElementById('exampleModalLabel').innerText = "Agregar Rol";
        $("#descripcion").val('');
        $("#nombre").val('');
        $("#btn_guardar").text('Guardar');

    }

}
$(document).ready(function() {
    $('#miTabla').DataTable({
        scrollY: '700px',
        scrollCollapse: true,
        paging: true,
        responsive: true,

        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }
    });
});
</script>




<?= $this->endSection("contenido")?>