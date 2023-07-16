<?= $this->extend("layouts/gfpLayout")?>

<?= $this->section("contenido")?>

<div class="titulo">
    <h1> <img class="img" src="<?= base_url("img/movimiento.png")?>">Movimientos</h1>
</div>


<div class="container overflow-hidden">
    <div class="row gx-5">
        <div class="col">
            <div class="p-3 border">

                <!-- <formulario> -->
                <form method="POST" action="<?php echo base_url('insertar'); ?>" autocomplete="off"
                    class="movimiento_form">

                    <div class="tx">
                        <input type="hidden" class="form-control valida" placeholder="ingreso" id="ingreso"
                            name="ingreso" required>
                        <label for="floatingInput"></label>
                    </div>
                    <div class="tx">
                        <input type="hidden" class="form-control valida" placeholder="egreso" id="egreso" name="egreso"
                            required>
                        <label for="floatingInput"></label>
                    </div>
                    <div class="tx">
                        <input type="hidden" class="form-control valida" placeholder="presupuesto" id="presupuesto"
                            name="presupuesto" required>
                        <label for="floatingInput"></label>
                    </div>

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
                    <br>

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

                    <div class="dc">
                        <div class="container overflow-hidden">
                            <div class="row gx-5">
                                <div class="col">
                                    <div class="p-3 border">

                                        <label for="floatingInput" class="label_movi">Categoria en: </label>
                                        <select class="form-select valida" name="parametros_enc" id="parametros_enc"
                                            aria-label="Floating label select example" required>

                                            <?php foreach ($encabezado as $data) {?>
                                            <option style="color:black;"
                                                value="<?php echo $data["id_parametro_enc"]; ?>">
                                                <?php echo $data["nombre"];?></option>
                                            <?php } ?>
                                            <option style="color:black;" value="otro">Otro</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="p-3 border">
                                        <label for="floatingInput" class="label_movi">Gasto en: </label>
                                        <select class="form-select valida" id="parametros_det" name="parametros_det"
                                            aria-label="Floating label select example" required></select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tm">

                        <textarea class="texttarea" placeholder="Descripcion" id="descripcion" name="descripcion"
                            required></textarea>
                        <br>
                        <label for="floatingInput">Valor del movimiento</label>
                        <input type="text" class="form-control valida" placeholder="Valor" id="valor" name="valor"
                            onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                            required>
                    </div>
                    <br>
                    <div class="tm">
                        <label for="floatingInput">Fecha de movimiento</label>
                        <input type="datetime-local" class="form-control" placeholder="name@example.com"
                            id="fecha_movimiento" name="fecha_movimiento" required>
                    </div>

                    <div class="botondeanti">
                        <br>

                        <div class="b">
                            <button href="#" class="btn btn-success" type="Submit">
                                <img class="image" src="<?= base_url("img/Guardar.png") ?> " title="Guardar">
                            </button>
                        </div>

                    </div>

                    <!-- </div> -->
                </form>

            </div>
        </div>
        <div class="col">
            <div class="p-3 border">
                <div class="table-responsive">
                    <!-- <tab> -->

                    <table id="miTabla" width="100%" cellspacing="0">
                        <thead>
                            <tr>

                                <th>Valor</th>
                                <th>Fecha</th>
                                <th>ClaseMovimiento</th>
                                <th>TipoMovimiento</th>
                                <th>Descripcion</th>

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
</div>
</div>



</div>
</div>

<script>
const saldo_anterior = <?= $disponibles['saldo_anterior']?>;
const ingreso = <?= $disponibles['ingreso']?>;
const egreso = <?= $disponibles['egreso']?>;
const presu = <?= $disponibles['saldo_anterior'];?>;
const presupuesto = <?= $disponibles['presupuesto_anual'];?>;

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

        if (valor > presupuesto) {
            Swal.fire({
                title: 'error!!',
                text: 'no existen fondos en  su presupuesto para realizar esta accion ',
                icon: 'info',
                confirmButtonText: 'cerrar',
            });
            $("#valor").val("");

        } else {
            // Realizar la resta al saldo anterior y al egreso
            let resultado = saldo_anterior - valor;
            let total = presu - valor;

            console.log("El egreso actual es de " + nuevoEgreso + ". El presupuesto anual está en " + total);

            nuevoEgreso += valor;

            document.getElementById("ingreso").value = nuevoIngreso;
            document.getElementById("egreso").value = nuevoEgreso;

            presupuesto_anual = saldo_anterior + nuevoIngreso - nuevoEgreso;
            console.log(presupuesto_anual);

            document.getElementById("presupuesto").value = presupuesto_anual;
        };
    }


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
    // Ocultar los div y la descripción inicialmente
    $('.dc').hide();
    $('#descripcion').show();

    // Deshabilitar el atributo 'required' del campo parametros_det al cargar la página
    $('#parametros_det').removeAttr('required');

    $('#clase_movimiento').change(function() {
        let claseSeleccionada = $(this).val();
        let select_enc = $('#parametros_enc');
        let select_det = $('#parametros_det');

        if (claseSeleccionada === '3') {
            // Si la clase seleccionada es "Ingreso", ocultar los div excepto el campo de descripción
            $('.dc').hide();
            $('#descripcion').show();
            // Deshabilitar los atributos 'required' de los selectores
            select_enc.prop('required', false);
            select_det.prop('required', false);
            // Deshabilitar el select de detalle de parámetros
            select_det.prop('disabled', true);
            select_enc.prop('disabled', true);
        } else {
            // Si la clase seleccionada no es "Ingreso", mostrar los div
            $('.dc').show();
            $('#descripcion').hide();
            // Habilitar los atributos 'required' de los selectores
            select_enc.prop('required', true);
            select_det.prop('required', true);
            // Habilitar el select de detalle de parámetros
            select_det.prop('disabled', false);
            select_enc.prop('disabled', false);

            // Realizar la petición AJAX para obtener los registros relacionados al encabezado seleccionado por defecto
            let id_encabezado = select_enc.val();
            obtenerRegistros(id_encabezado);
        }
    });

    $('#parametros_enc').change(function() {
        let id_encabezado = $(this).val();
        let selectParametrosDet = $('#parametros_det');
        let textareaDescripcion = $('#descripcion');

        if (id_encabezado === 'otro') {
            selectParametrosDet.empty();
            selectParametrosDet.prop('disabled', true);
            textareaDescripcion.show();
            textareaDescripcion.prop('required', true);
            selectParametrosDet.prop('required', false);
        } else {
            obtenerRegistros(id_encabezado);
            textareaDescripcion.hide();
            selectParametrosDet.prop('disabled', false);
            selectParametrosDet.prop('required', true);
            textareaDescripcion.prop('required', false);
        }
    });

    function obtenerRegistros(id_encabezado) {
        let selectParametrosDet = $('#parametros_det');

        // Realizar la petición AJAX para obtener los registros relacionados al encabezado seleccionado
        $.ajax({
            url: '<?= base_url("Params"); ?>' + '/' + id_encabezado,
            method: 'POST',
            dataType: 'json',
            success: function(response) {
                selectParametrosDet.empty();
                // Agregar los registros al select "parametros_det"
                $.each(response, function(id, name) {
                    selectParametrosDet.append($('<option>').text(name.nombre).val(name
                        .nombre).css('color', 'black'));
                });

                selectParametrosDet.show();
                selectParametrosDet.prop('disabled', false);
            },
            error: function() {
                console.log('Error en la solicitud AJAX');
            }
        });
    }
});



// Obtener referencia al textarea
let textarea = document.getElementById('descripcion');

// Escuchar el evento de ingreso de texto
textarea.addEventListener('input', function() {
    // Obtener el valor actual del textarea
    let valor = textarea.value;

    // Verificar si el valor no está vacío
    if (valor.length > 0) {
        // Obtener la primera letra y convertirla a mayúscula
        let primeraLetra = valor.charAt(0).toUpperCase();

        // Reemplazar la primera letra en el valor
        valor = primeraLetra + valor.slice(1);

        // Asignar el nuevo valor al textarea
        textarea.value = valor;
    }
});
</script>


<script>
document.addEventListener("DOMContentLoaded", function() {
    let formulariosEmergencia = document.getElementsByClassName("movimiento");

    for (let i = 0; i < formulariosEmergencia.length; i++) {
        formulariosEmergencia[i].addEventListener("submit", function() {
            let botonesEnviar = this.getElementsByClassName("btn_movimiento_vw");

            for (let j = 0; j < botonesEnviar.length; j++) {
                botonesEnviar[j].disabled = true;
            }
        });
    }
});
</script>



<script>

const registro = "<?= session()->getFlashdata('movimiento') ?>";

if (registro === '1') {
    Swal.fire({
        'title': 'Registro exitoso',
        'text': '',
        'icon': 'success',
        'confirmButtonText': 'Aceptar'
    })
}
</script>


<?= $this->endSection("contenido")?>