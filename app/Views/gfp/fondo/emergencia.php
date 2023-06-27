<?= $this->extend("layouts/gfpLayout")?>

<?= $this->section("contenido")?>

<div class="titulo">
    <h3><img class="img" src="<?= base_url("img/emergen.png")?>"> Fondo De Emergencia</h3>
</div>

<div class="contenedorEmergencia">

    <!-- fecha de creacion del registro -->
    <form method="POST" action="<?php echo base_url('/emergencia/insertar'); ?>" autocomplete="off"
        id="formulario_emergencia">

        <div class="emergencia">
            <div class="input-group mb-3 ss">
                <span class="input-group-text span_id_emergencia" id="inputGroup-sizing-default">

                    <img src="<?= base_url("icons/question-circle-fill.svg")?>"
                        title="El usuario ingresa la fecha para determinar el día mensual en que se realizará el descuento correspondiente de su presupuesto actual, destinado al fondo de emergencia."
                        class="icono_emergencia">Fecha de ahorro para el fondo de emergencia</span>
                <input type="date" class="ss input_fecha__emergencia" aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-default" id="fecha_registro" name="fecha_registro" required>
            </div>
        </div>
        <!-- fin del codigo de fecha creacion -->


        <div class="p_emergencia">

            <div class="emergencia_container_form">

                            
                <div class="center-label">

                     <label for="floatingInput">Fondo</label>

                </div>

                <select class="form-select " name="params" id="params" aria-label="Floating label select example"
                    required>

                    <?php foreach ($params as $data) {?>

                    <option style="color:black;" value="<?php echo $data["id_parametro_det"]; ?>">
                        <?php echo $data["nombre"];?></option>
                    <?php } ?>

                </select>
                <br>
                <div class="form_container__emergencia">
                    <input type="number" class="emergencia__input" name="emergencia__valor" id="emergencia__valor"
                        required>
                </div>
                <br>

                <textarea class="fd_text" placeholder="Descripcion" id="descripcion" name="descripcion" required></textarea>

            </div>

            <br>

            <button class="btn btn-success regresar_Btn" type="submit" id="btn_enviar">Enviar</button>
            <br>
    </form>

    <div class="tabla_emergencia">

        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Monto total</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td id="suma_total"></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!--- Modal Actualizar --->
<!-- 
    <form action="<php echo base_url('/emergencia/update'); ?>" method="POST" autocomplete="off">

        <div class="modal fade" id="ActualizarModal" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" id="movimientos_modal-content">
                    <div class="modal-header">
                        <img src="<= base_url("img/gfp.png")?>" alt="" class="w-25 p-3">
                        <h5 class="modal-title" id="exampleModalLabel">Actualizar Registro</h5>
                    </div>
                    <div class="modal-body">

                        <input hidden id="id" name="id">

                        <div>
                            <div>
                                <input type="date" class="ss input_fecha__emergencia" aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing-default" id="editar_fecha_registra"
                                    name="editar_fecha_registra" required>
                            </div>
                            <br>
                            <div>
                                <input type="number" class="emergencia__input" name="editar_emergencia__valor"
                                    id="editar_emergencia__valor" style="color:black;" required>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary" id="btn_actualizar">Actualizar</button>
                    </div>
                </div>
            </div>
        </div>

    </form> -->

</div>
</div>


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

    const suma = parseFloat(<?php echo $emergencia['suma_total'];?>).toLocaleString();
    document.getElementById('suma_total').innerText = suma;

</script>

<script>

// Obtener el elemento del campo de fecha
let fechaInput = document.getElementById('fecha_registro');

// Obtener la fecha actual en formato AAAA-MM-DD
let fechaActual = new Date().toISOString().split('T')[0];

// Establecer la fecha actual como valor predeterminado en el campo de fecha
fechaInput.value = fechaActual;

</script>

<?= $this->endSection("contenido")?>