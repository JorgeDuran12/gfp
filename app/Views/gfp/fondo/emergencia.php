<?= $this->extend("layouts/gfpLayout")?>

<?= $this->section("contenido")?>

<div class="titulo">
    <h3><img class="img" src="<?= base_url("img/emergen.png")?>"> Fondo De Emergencia</h3>
</div>
<br><br>

<!-- <div class="contenedorEmergencia"> -->

<!-- fecha de creacion del registro -->



<div class="container px-4 text-center">
    <div class="row gx-5">
        <div class="col">
            <div class="p-3 border">
                <br>
                <!-- formulario fondo de emergencia -->
                <form method="POST" action="<?php echo base_url('/emergencia/insertar'); ?>" autocomplete="off"
                    id="formulario_emergencia">

                    <div class="mb-3 input-group div_date">

                        <span class="input-group-text" id="inputGroup-sizing-default">
                            <img src="<?= base_url("icons/question-circle-fill.svg")?>"
                                title="El usuario ingresa la fecha para determinar el día mensual en que se realizará el descuento correspondiente de su presupuesto actual, destinado al fondo de emergencia."
                                class="icono_emergencia">Fecha de ahorro para el fondo de emergencia</span>
                        <input type="date" class="ss" aria-label="Sizing example input"
                            aria-describedby="inputGroup-sizing-default" id="fecha_registro" name="fecha_registro"
                            required>
                    </div>

                    <!-- fin del codigo de fecha creacion -->


                    <div class="p_emergencia">

                        <div class="emergencia_container_form">

                            <div class="center-label">

                                <label for="floatingInput">Fondo</label>

                                <select class="form-select valida " name="params" id="params"
                                    aria-label="Floating label select example" required>

                                    <?php foreach ($params as $data) {?>

                                    <option style="color:black;" value="<?php echo $data["id_parametro_det"]; ?>">
                                        <?php echo $data["nombre"];?></option>
                                    <?php } ?>

                                </select>
                            </div>

                            <br>
                            <label for="floatingInput">Descripción</label>
                            <textarea class="fd_text" placeholder="Descripcion" id="descripcion" name="descripcion"
                                required></textarea>
                            <br>
                            <br>

                            <div class="form_container__emergencia">
                                <label for="floatingInput">Valor</label>
                                <br>
                                <input type="text" class="emergencia__input valida" name="emergencia__valor"
                                    id="emergencia__valor"
                                    onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                    required>
                            </div>
                            <br>


                        </div>

                        <br>

                        <button class="btn btn-success regresar_Btn" type="submit" id="btn_enviar">Enviar</button>
                        <br>
                </form>
            </div>
        </div>
    </div>

    <div class="col">
        <div class="p-3 border ">
            <!-- tabla fondo de emergencia -->
            <div class="tabla_emergencia">

                <table id="miTabla">
                    <thead>
                        <tr>
                            <th scope="col">Fecha</th>
                            <th scope="col">Monto total</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Valor</th>


                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($fondos as $dato) { ?>
                        <tr>
                            <td> <?php echo $dato ['fecha_registro'];?></td>
                            <td> <?php echo $dato ['suma_total'];?></td>
                            <td> <?php echo $dato ['descripcion'];?></td>
                            <td> <?php echo $dato ['valor'];?></td>


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

<!-- 32	Registro de fondo	
33	Uso del fondo -->

<!-- valoracion de presupuesto uso de fondo/registro -->
<script>
$(document).on('blur', '.valida', function(event) {
    const presupuesto_anual = <?= $disponibles['presupuesto_anual']?>;
    const suma_total = <?= $emergencia['suma_total']?>;


    let valor = parseInt(document.getElementById("emergencia__valor").value);
    let parametro = parseInt(document.getElementById("params").value);



    if (parametro === 32 && valor) {
        if (valor > presupuesto_anual) {
            Swal.fire({
                title: 'error!!',
                text: 'No existen fondos en su presupuesto para realizar esta accion ',
                icon: 'info',
                confirmButtonText: 'cerrar',
            });
            $("#emergencia__valor").val("");
        }
        //  else if (valor < presupuesto_anual ){
        //      Swal.fire({
        //          title: 'guardado',
        //          text: 'este movimiento se registro correctamente ',
        //          icon: 'success',
        //          confirmButtonText: 'cerrar',});
        //  };

    } else if (parametro === 33 && valor) {
        if (valor > suma_total) {
            Swal.fire({
                title: 'error!!',
                text: 'Su fondo de emergencia no cuenta con esos recursos',
                icon: 'info',
                confirmButtonText: 'cerrar',
            });
            $("#emergencia__valor").val("");
        }


    };




});
</script>

<script>
document.getElementById("formulario_emergencia").addEventListener("submit", function() {
    // Deshabilitar el botón de envío después de hacer clic
    document.getElementById("btn_enviar").disabled = true;
});
</script>

<script>
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
// Obtener el elemento del campo de fecha
let fechaInput = document.getElementById('fecha_registro');

// Obtener la fecha actual en formato AAAA-MM-DD
let fechaActual = new Date().toISOString().split('T')[0];

// Establecer la fecha actual como valor predeterminado en el campo de fecha
fechaInput.value = fechaActual;
</script>

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


<script>

    const registro = "<?= session()->getFlashdata('emergencia') ?>";

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