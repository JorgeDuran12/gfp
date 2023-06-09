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
        <form method="POST" action="<?php echo base_url('/emergencia/insertar'); ?>" autocomplete="off" id="formulario_emergencia">

            <div class="mb-3 input-group div_date">

                <span class="input-group-text" id="inputGroup-sizing-default">
                    <img src="<?= base_url("icons/question-circle-fill.svg")?>"
                        title="El usuario ingresa la fecha para determinar el día mensual en que se realizará el descuento correspondiente de su presupuesto actual, destinado al fondo de emergencia."
                        class="icono_emergencia">Fecha de ahorro para el fondo de emergencia</span>
                <input type="date" class="ss" aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-default" id="fecha_registro" name="fecha_registro" required>
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
                <label for="floatingInput">Valor</label>
                <br>
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

<?= $this->endSection("contenido")?>