
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
    <a href="<?php echo base_url('eliminados_rol'); ?>" class="btn btn-secondary regresar_Btn">Eliminados</a>
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
                                        <td> <?php echo $dato ['nombre'];?></td>
                                        <td> <?php echo $dato ['estado'];?></td>
                                        <td>
                                            <!-- editar -->
                                                <a class="btn btn-warning" href="#"
                                                    onclick="seleccionaparametro(<?php echo $dato['id_parametro_enc'] . ',' . 2 ?>);"
                                                    data-bs-toggle="modal" data-bs-target="#parametro_encabezado" width="16" height="16"
                                                    title="Editar Registro">
                                                    <img class="image" src="<?= base_url("img/documento.png") ?> " title="Editar">
                                                </a>
                                                <!-- eliminar -->
                                                <a class="btn btn-danger" href="#"
                                                    data-href="<?php echo base_url('parametro/eliminar__parametro'). '/' .$dato['id_parametro_enc']. '/' .'E'; ?>"
                                                    data-bs-toggle="modal" data-bs-target="#modal-confirma"
                                                    src="<?php echo base_url(); ?>/icons/borrar.png" width="16" height="16"
                                                    title="Elimina Registro">
                                                    <img class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar">
                                                </a>
                                        </td>         
                                        
                                    
                                    <?php } ?>

                                    </tbody>
            </table>
        </div>
    </div>
</div>



<!-- CREAR ENCABEZADO -->

<form method="POST" action="<?php echo base_url('/parametros/insertar'); ?>" autocomplete="off">

<div class="modal fade" id="parametro_encabezado" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                          <!-- titulo -->
                          <h4>
                               Encabezado
                          </h4> 
                          <!-- cuerpo -->

                         
                            <input placeholder="Ej:categoria" name="encabezado" type="text" class="input_field" id="encabezado"  required>
                      

                      </div>


                </div>
                <div class="modal-footer">

                    <button type="submit" class="btn btn-primary" id="btn_guardar2">Guardar</button>
                </div>
            </div>

        </div>
    </div>
</form>






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

        responsive: true,

    });
});


</script>

<!-- <script>
  const contenedor = document.querySelector('#dinamic');
const btnAgregar = document.querySelector('#agregar');

// Variable para el total de elementos agregados
let total = 0;

/**
 * Método que se ejecuta cuando se da clic al botón de agregar elementos
 */


btnAgregar.addEventListener('click', e => {
    total++;
    let div = document.createElement('div');
    div.innerHTML = `<label class="input_label" >${total}</label> - <input class="input_label" type="text"  id="detalle${total} "name="detalle${total}" placeholder="Nombre del deatlle" required><button  class="btn btn-outline-danger" onclick="eliminar(this)">Eliminar</button>`;
    contenedor.appendChild(div);
})

/**
 * Método para eliminar el div contenedor del input
 * @param {this} e 
 */
const eliminar = (e) => {
    const divPadre = e.parentNode;
    contenedor.removeChild(divPadre);
    actualizarContador();
};

/**
 * Método para actualizar el contador de los elementos agregados
*/
const actualizarContador = () => {
    let divs = contenedor.children;
    total = 1;
    for (let i = 0; i < divs.length; i++) {
        divs[i].children[0].innerHTML = total++;
    }//end for
};
</script> -->


<script>
    function seleccionaparametro(id, tp) {
    if (tp == 2) {
        dataURL = "<?php echo base_url('buscar_parametro'); ?>" + "/" + id;
        $.ajax({
            type: "POST",
            url: dataURL,
            dataType: "json",
            success: function(rs) {
                // $("#tp").val(2);
                // $("#id").val(id);
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
</script>
<?= $this->endSection("contenido")?>