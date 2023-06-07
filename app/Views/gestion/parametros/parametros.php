
<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>


<div class="titulo">
    <h3>Administracion de parametros</h3>
</div>

<!-- <acomodacion de formularion> -->
<div class="op">

    <a href="" onclick="seleccionaparametro(<?php echo 1 . ',' . 1 ?>);" class="btn btn-success regresar_Btn"
        data-bs-toggle="modal" data-bs-target="#parametro">Agregar</a>
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
                        <th>descripcion</th>


                        <th>estado</th>
                        <th colspan="2">Acciones</th>
                    </tr>
                </thead>

                </tbody>
            </table>
        </div>
    </div>
</div>

<form method="POST" action="<?php echo base_url('/parametros/insertar'); ?>" autocomplete="off">

    <div class="modal fade" id="parametro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                <img src="<?= base_url("img/gfp.png")?>" alt="" class="w-25 p-3">
                    <h3 class="modal-title" id="exampleModalLabel">Crear nuevo parametro </h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">

                    <input hidden id="tp" name="tp">
                    <input hidden id="id" name="id">

                    <div class="container px-4 text-center">
                    <div class="row gx-5">
                      <div class="col">
                      <div class="p-3">
                          <!-- titulo -->
                          <h4>
                               Encabezado
                          </h4> 
                          <!-- cuerpo -->

                          <label class="input_label" for="email_field">Nombre</label>
                            <input placeholder="Ej:categoria" name="encabezado" type="text" class="input_field" id="encabezado"  required>
                      

                      </div>
                      </div>
                      <div class="col">
                        <div class="p-3">
                          <h4>
                               Detalles
                          </h4> 
                          <button id="agregar">Agregar</button>
                         <div id="dinamic"></div>
                        </div>
                      </div>
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

<script>
  const contenedor = document.querySelector('#dinamic');
const btnAgregar = document.querySelector('#agregar');

// Variable para el total de elementos agregados
let total = 1;

/**
 * Método que se ejecuta cuando se da clic al botón de agregar elementos
 */
btnAgregar.addEventListener('click', e => {
    let div = document.createElement('div');
    div.innerHTML = `<label class="input_label" >${total++}</label> - <input class="input_label" type="text"  id="detalle[]"name="detalle[]" placeholder="Nombre del deatlle" required><button  class="btn btn-outline-danger" onclick="eliminar(this)">Eliminar</button>`;
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
</script>

<?= $this->endSection("contenido")?>