<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>


<div class="titulo">
    <h3>Administracion de parametros</h3>
</div>

<!-- <acomodacion de formularion> -->
<div class="op">

    <a href="" onclick="seleccionaparametro(<?php echo 1 . ',' . 1 ?>);" class="btn btn-success regresar_Btn"
        data-bs-toggle="modal" data-bs-target="#parametro_encabezado" id="btn_agr">Agregar</a>
    &nbsp
    <!-- <a href="<?php echo base_url('eliminados_parametro'); ?>" class="btn btn-secondary regresar_Btn">Eliminados</a> -->
    &nbsp
    <a href="<?php echo base_url('/principal'); ?>" class="btn btn-primary regresar_Btn">Regresar</a>
</div>



<div id="contenedor">
    <div id="limite">
        <div class="table-responsive">
            <table id="miTabla">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>estado</th>
                        <th>acciones</th>


                    </tr>
                </thead>
                <?php foreach ($encabezado as $dato) { ?>
                <tr>
                    <td> <?php echo $dato ['id_parametro_enc'];?></td>
                    <td data-bs-toggle="modal" data-bs-target="#parametro_encabezado"
                        onclick="seleccionaparametro(<?php echo $dato['id_parametro_enc'] . ',' . 2 ?>);">
                        <?php echo $dato ['nombre'];?> <img src="<?= base_url("icons/pencil-square.svg")?>" class="btn"
                            title="editar encabezado">
                    </td>
                    <td> <?php if($dato['estado']=="A"){echo "Activo";}else{echo "Eliminado";}?></td>
                    <td>
                        <!-- editar -->
                        <a class="btn btn-warning" href="#"
                            onclick="seleccionaencabezado(<?php echo $dato['id_parametro_enc'] . ',' . 2 ?>);"
                            data-bs-toggle="modal" data-bs-target="#parametro_detallle" width="16" height="16"
                            title="Editar Registro">
                            <img class="image" src="<?= base_url("img/documento.png") ?> " title="Editar">
                        </a>
                        <!-- eliminar -->
                        <!-- <a class="btn btn-danger" href="#"
                            data-href="<?php echo base_url('Parametros/eliminar__parametro'). '/' .$dato['id_parametro_enc']. '/' .'E'; ?>"
                            data-bs-toggle="modal" data-bs-target="#modal-confirma"
                            src="<?php echo base_url(); ?>/icons/borrar.png" width="16" height="16"
                            title="Elimina Registro">
                            <img class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar">
                        </a> -->
                    </td>


                    <?php } ?>

                    </tbody>
            </table>
        </div>
    </div>
</div>



<!-- CREAR ENCABEZADO -->

<form method="POST" action="<?php echo base_url('/parametros/insertar'); ?>" autocomplete="off">
    <div class="modal fade" id="parametro_encabezado" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    <img src="<?= base_url("img/gfp.png")?>" alt="" class="w-25 p-3">
                    <h3 class="modal-title" id="exampleModalLabel">Crear nuevo parametro </h3>
                </div>
                <div class="modal-body">
                    <input hidden id="tp" name="tp">
                    <input hidden id="id" name="id">
                    <div>
                        <h4>
                            Encabezado
                        </h4>
                        <input placeholder="Ej:categoria" name="encabezado" type="text" class="input_field"
                            id="encabezado" required>
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="submit" class="btn btn-primary" id="btn_guardar2">Guardar</button>
                </div>
            </div>

        </div>
    </div>
</form>

<!-- CREAR detalle -->

<form autocomplete="off">
    <div class="modal fade" id="parametro_detallle" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    <img src="<?= base_url("img/gfp.png")?>" alt="" class="w-25 p-3">
                    <h3 class="modal-title" id="exampleModalLabel">Crear nuevo parametro </h3>
                </div>
                <div class="modal-body">
                    <input hidden id="tp" name="tp">
                    <input hidden id="id" name="id">
                    <div>
                        <h4>
                            detalle
                        </h4>
                        <!-- tabla de detalles -->
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Nombre</th>
                                    <th>estado</th>
                                    <!-- <th colspan="2">acciones</th> -->
                                </tr>
                            </thead>
                            <tbody id="bodytb">

                            </tbody>


                        </table>
                        <button class="btn btn-success" type="button" id="agregarDetalle">
                            crear
                        </button>
                    </div>
                </div>
                <div class="modal-footer">

                    <!-- <button type="submit" class="btn btn-primary" id="btn_guardar2">Guardar</button> -->
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




<!-- scrip para librerias de tabla -->
<script>
/******* Data - Table ***********/
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

<!-- //  script para manipular encabezado -->
<script>
let titulo = document.getElementById('titulo');
let agregar = document.getElementById('agregar');
let prueba = document.getElementById('prueba');


//  en estas funcion solo se manipula el encabezado 
function seleccionaparametro(id, tp) {

    if (tp == 2) {
        dataURL = "<?php echo base_url('buscar_parametro'); ?>" + "/" + id;
        $.ajax({
            type: "POST",
            url: dataURL,
            dataType: "json",
            success: function(rs) {
                $("#tp").val(2);
                $("#id").val(id);
                $("#encabezado").val(rs[0]['nombre']);
                $("#btn_guardar2").text('Actualizar');

            }

        });
    } else {
        $("#tp").val(1);
        document.getElementById('exampleModalLabel');
        $("#nombre").val('');
        $("#btn_guardar").text('Guardar');


    }

}

function seleccionausuario(id, tp) {

    console.log({
        id,
        tp
    })
}

function crear_detalle(idEncabezado) {



    $("#agregarDetalle").click(function() {

        $("#parametro_detallle").modal('hide');

        Swal.fire({
                title: "CREAR UN NUEVO DETALLE",
                input: "text",
                inputLabel: 'Ingrese un detalle',
                inputPlaceholder: 'Ej: Tipo documento',
                showCancelButton: true,
                confirmButtonText: 'Guardar',
                showLoaderOnConfirm: true,
                preConfirm: (detalle) => {

                    if (detalle.length >= 5) {

                        return fetch(
                                `http://localhost/gfp/public/parametros/insertar_detalle/${detalle}/${idEncabezado}`
                                )
                            .then(response => {
                                if (response.status == 400) {
                                    throw new Error('Parametro ya existente');
                                    return false;
                                }
                                //Si la respuesta es correcta

                            })
                            .catch(error => {
                                Swal.showValidationMessage(
                                    `${error}`
                                )
                            })
                    } else {
                        Swal.fire('Error al agregar', 'La longitud debe ser mayor a 5 caracteres',
                            'info', 'Aceptar')
                        $("#parametro_detallle").modal('show')
                        return false;
                    }

                },
                allowOutsideClick: () => !Swal.isLoading()
            })
            .then(result => {
                if (result.isConfirmed) {
                    Swal.fire('Detalle agregado', 'Se agrego el detalle correctamente', 'success', 'Ok');
                    $("#parametro_detallle .modal-body").load(location.href + '.modal-content');
                    $("#parametro_detallle").modal('show');
                    seleccionaencabezado(idEncabezado, 2)

                } else {
                    seleccionaencabezado(idEncabezado, 2)

                    $("#parametro_detallle").modal('show');

                }
            })

    })

}




//  en estas funcion solo se manipula el detalle 
function seleccionaencabezado(id, tp) {
    console.log(id, tp);
    crear_detalle(id);


    if (tp == 2) {
        var contador = 0

        dataURL = "<?php echo base_url('buscar_detalles'); ?>" + "/" + id;
        $.ajax({
            type: "POST",
            url: dataURL,
            dataType: "json",
            success: function(rs) {
                console.log(rs);

                let contenido = '';
                rs[0].forEach(parametro => {
                    contador++
                    contenido += `
            <tr id="util${contador}">
            <td class="text-center">${parametro.id_parametro_det}</td>
            <td class="text-center">${parametro.nombre}</td>
            <td class="text-center">${parametro.estado}</td>
            
                      
                            </tr>`
                });
                $('#bodytb').html(contenido);

            }


        });
    } else {
        $("#tp").val(1);
        document.getElementById('exampleModalLabel');
        $("#nombre").val('');
        $("#btn_guardar").text('Guardar');


    }


}




$('#modal-confirma').on('show.bs.modal', function(e) {
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
});
$('.close').click(function() {
    $("#modal-confirma").modal("hide");
});

</script>

<?= $this->endSection("contenido")?>

<!-- <td class="text-center">
                                <button class="btn btn-warning" onclick="seleccionausuario(${parametro.id_parametro_det} ${","} ${2});">
                                    </i><img class="image" src="<?= base_url("img/editar.png") ?>" title="Editar">
                                </button>
                            </td>
                            <td>
                                <button class="btn btn-danger"  data-href="${window.location.origin}/gpf/public/usuarios/eliminar/${parametro.id_parametro_det}/E" >
                                    </i><img class="image" src="<?= base_url("img/eliminar.png") ?>"  title="Editar">
                                </button>
                            </td> -->