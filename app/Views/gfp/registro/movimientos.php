<?= $this->extend("layouts/gfpLayout")?>

<?= $this->section("contenido")?>

<div class="titulo">
    <h1> <img class="img" src="<?= base_url("img/movimiento.png")?>">
        Movimientos</h1>
</div>
<div class="contenedorMovimiento">
    <form method="POST" action="<?php echo base_url('insertar'); ?>" autocomplete="off" class="movimiento">
        <div class="tm">
            <label for="floatingInput"> Tipo de movimiento</label>
            <select class="form-select" name="tipo_movimiento" id="tipo_movimiento"
                aria-label="Floating label select example" required>
           
                <?php foreach ($tipo_movi as $data) {?>

                <option style="color:black;" value="<?php echo $data["id_parametro_det"]; ?>">
                    <?php echo $data["nombre"];?></option>
                <?php } ?>
            </select>
        </div>

        <!-- <--------------actualizacion ----------->

        <!-- esta parte esta oculta en la vista  -->
        <div class="tx">
            <input type="hidden" class="form-control valida" placeholder="ingreso" id="ingreso" name="ingreso" required>
            <label for="floatingInput"></label>
        </div>
        <div class="tx">
            <input type="hidden" class="form-control valida" placeholder="egreso" id="egreso" name="egreso" required>
            <label for="floatingInput"></label>
        </div>
        <div class="tx">
            <input type="hidden" class="form-control valida" placeholder="presupuesto" id="presupuesto"
                name="presupuesto" required>
            <label for="floatingInput"></label>
        </div>

        <div class="tm">
            <label for="floatingInput">Clase de movimiento</label>
            <select class="form-select valida" name="clase_movimiento" id="clase_movimiento"
                aria-label="Floating label select example" required>
                <!-- <option selected required >Clase de movimiento</option>  -->
                <?php foreach ($clase_movi as $data) {?>

                <option style="color:black;" value="<?php echo $data["id_parametro_det"]; ?>">
                    <?php echo $data["nombre"];?></option>
                <?php } ?>
            </select>
        </div>
        <br>
        <div class="tx">

            <label for="floatingInput">Valor del Movimiento</label>
            <input type="number" class="form-control valida" placeholder="Valor" id="valor" name="valor" required>
        </div>
        <br>


        <div class="dc">

            <div class="container overflow-hidden">
                <div class="row gx-5">
                    <div class="col">
                        <div class="p-3 border bg-light">

                        <select class="form-select valida" name="parametro_enc" id="parametro_enc" aria-label="Floating label select example" required>
                             
                                <?php foreach ($encabezado as $data) {?>

                                <option style="color:black;" value="<?php echo $data["id_parametro_enc"]; ?>">
                                    <?php echo $data["nombre"];?></option>
                                    
                                <?php } ?>

                                <option value="otro">otro</option>

                            </select>

                        </div>
                    </div>
                    <div class="col">
                        <div class="p-3 border bg-light">

                            <select class="form-select valida" name="parametro_det" id="parametro_det" aria-label="Floating label select example" required>
                    
                                <?php foreach ($parametros as $data) { ?>

                                 <option style="color:black;" value="<?php echo $data["id_parametro_det"]; ?>">
                                    <?php echo $data["nombre"];?></option>  

                                 <?php } ?> 

                            </select>

                        </div>
                    </div>
                </div>
                <textarea class="dc" placeholder="Descripcion" id="descripcion" name="descripcion"  style="display: none;" required></textarea>
            </div>
        </div>

        <br>
        <div class="tx">
            <label for="floatingInput">Fecha del Movimiento</label>
            <input type="datetime-local" class="form-control" placeholder="name@example.com" id="fecha_movimiento"
                name="fecha_movimiento" required>
        </div>

        <div class="botondeanti">
            <br>
            <div class="b"> <button href="#" class="btn-guardar" type="Submit">
                    <span id="span1g"></span>
                    <span id="span2g"></span>
                    <span id="span3g"></span>
                    <span id="span4g"></span>
                    <img class="image" src="<?= base_url("img/Guardar.png") ?> " title="Guardar">
                </button></div>

        </div>
        <br>
        <div class="hh">
            <div class="rt">

                <div class="b" data-bs-toggle="modal" data-bs-target="#reporteMovimientosModal"> <a href="#"
                        class="btn-neon">
                        <span id="span1"></span>
                        <span id="span2"></span>
                        <span id="span3"></span>
                        <span id="span4"></span>
                        Reporte De Movimientos
                    </a></div>
            </div>&nbsp&nbsp&nbsp&nbsp&nbsp

        </div>
</div>
</form>
</div>

<div class="modal fade" id="reporteMovimientosModal" tabindex="-1" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="movimientos_modal-content">
            <div class="modal-header">

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <h5 class="modal-title" id="exampleModalLabel">Reporte De Movimientos</h5>
            </div>
            <div class="modal-body">

                <div id="contenedor_modal_Movimiento">
                    <div id="limite">
                        <div class="table-responsive">
                            <table id="miTabla" width="100%" cellspacing="0">
                                <thead>
                                    <tr>

                                        <th>valor</th>
                                        <th>fecha</th>
                                        <th>ClaseMovimiento</th>
                                        <th>tipoMovimiento</th>
                                        <th>descripcion</th>



                                    </tr>
                                </thead>
                                <tbody>

                                    <?php foreach ($movimientos as $dato) { ?>
                                    <tr>
                                        <td> <?php echo $dato ['valor'];?></td>
                                        <td> <?php echo $dato ['Fecha_movimiento'];?></td>
                                        <td> <?php echo $dato ['Tnombre2'];?></td>
                                        <td> <?php echo $dato ['Tnombre'];?></td>
                                        <td> <?php echo $dato ['descripcion'];?></td>
                                    </tr>
                                    <?php } ?>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <!-- <button type="Submit" id="pdfout" class="btn btn-primary">Descargar</button> -->
            </div>
        </div>
    </div>
</div>
</div>
</div>

<script>

const saldo_anterior = <?= $disponibles['saldo_anterior']?>;
const ingreso = <?= $disponibles['ingreso']?>;
const egreso = <?= $disponibles['egreso']?>;
const presu = <?= $disponibles['saldo_anterior'];?>;

console.log("saldo" + saldo_anterior);
console.log("ingreso" + ingreso);
console.log("egreso" + egreso);
// console.log("presu" + presu);

$(document).on('blur', '.valida', function(event) {
    let valor = parseInt(document.getElementById("valor").value);
    let tipo = parseInt(document.getElementById("clase_movimiento").value);

    let nuevoIngreso = ingreso;
    let nuevoEgreso = egreso;

    if (tipo === 3 && valor) {
        // Realizar la suma al saldo anterior y al ingreso
        let resultado = saldo_anterior + valor;
        let total = presu + valor;

        console.log("El ingreso actual es de " + nuevoIngreso + ". El presupuesto anual está en " + total);

        nuevoIngreso += valor;

    } else {
        // Realizar la resta al saldo anterior y al egreso
        let resultado = saldo_anterior - valor;
        let total = presu - valor;

        console.log("El egreso actual es de " + nuevoEgreso + ". El presupuesto anual está en " + total);

        nuevoEgreso += valor;
    }

    document.getElementById("ingreso").value = nuevoIngreso;
    document.getElementById("egreso").value = nuevoEgreso;

    presupuesto_anual = saldo_anterior + nuevoIngreso - nuevoEgreso;

    document.getElementById("presupuesto").value = presupuesto_anual;
});
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

<script>
    $(document).ready(function() {
    // Obtener el select de los parámetros de detalle
    let select = $('#parametro_det');

    // Obtener el textarea
    let textarea = $('#descripcion');

    // Vaciar el select al iniciar
    select.empty();

    // Evento change en el select de parámetros de encabezado
    $('#parametro_enc').change(function() {
        let id_parametro_enc = $(this).val();

        // Verificar si se seleccionó la opción "otro"
        if (id_parametro_enc === 'otro') {
            // Deshabilitar el select y mostrar el textarea
            select.empty();
            select.prop('disabled', true);
            textarea.show();
        } else {
            // Habilitar el select y ocultar el textarea
            select.prop('disabled', false);
            textarea.hide();

            // Verificar si se seleccionó un valor válido en el select de encabezado
            if (id_parametro_enc) {
                $.ajax({
                    url: '<?= base_url("Params"); ?>'+ '/' + id_parametro_enc,
                    method: 'POST',
                    dataType: 'json',
                    success: function(response) {
                        select.empty(); // Vaciar el select antes de agregar nuevas opciones
                        $.each(response, function(index, item) {
                            select.append($('<option>').text(item.nombre).val(item.id_parametro_det));
                        });
                    },
                    error: function() {
                        console.log('Error en la solicitud AJAX');
                    }
                });
            } else {
                select.empty(); // Vaciar el select si no se seleccionó ningún valor en el select de encabezado
            }
        }
    });
});

</script>
<?= $this->endSection("contenido")?>