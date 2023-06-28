<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>

<div class="titulo">
    <h1>Progreso de saquito</h1>
</div>

<div class="container overflow-hidden">
    <div class="row gy-5">
        <div class="col-6">
            <div class="p-3 border ">
                <form id="formulario" method="POST" action="<?php echo base_url('Insertar_proyeccion'); ?>">

                    <div class="tma input_group">
                        <label for="floatingInput">Fecha de la cuota</label>
                        <input type="date" class="form-control" name="fecha_cuota" id="fecha_cuota"
                            placeholder="Fecha inicial: " required>
<br>
                            <label for="floatingInput">Prespupuesto</label>

                            <select class="form-select valida" name="parametros_enc" id="parametros_enc" aria-label="Floating label select example" required>

                                <?php foreach ($encabezado as $data) {?>
                                <option style="color:black;" value="<?php echo $data["id_parametro_det"]; ?>">
                                    <?php echo $data["nombre"];?></option>
                                <?php } ?>
    
                            </select>
                            <input type="hidden" name="id_parametro_det" id="id_parametro_det" value="">

                            <input type="hidden" class="form-control valida" id="suma_total" name="suma_total" required>
<br>
                        <label for="floatingInput">Valor de la cuota </label>
                        <input type="number" class="form-control valida" name="valor_cuota" id="valor_cuota"
                            placeholder="Valor: " required>
                    </div>
                    
                     <div class="tx">
                        <label for="floatingInput"></label>
                        <input type="hidden" class="form-control valida" placeholder="egreso" id="egreso" name="egreso" required>
                    </div> 

                    <div class="tx">
                        <input type="hidden" class="form-control valida" placeholder="presupuesto" id="presupuesto"
                            name="presupuesto" required>

                    <button class="btn btn-success" href="#" class="btn-guardar" type="Submit">
                        <img class="image" src="<?= base_url("img/Guardar.png") ?>" title="Guardar">
                    </button>
                    </div>
                </form>
               

                <div class="pp_sq_table">

                    <table class="table">
                        <thead class="table-dark">
                            <tr>
                                <th translucido></th>
                                <th>Cuotas</th>
                                <th>Valor de Meta</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Cantidad de cuotas</td>
                                <td> <?= $traer_sqto['numero_cuota']?> </td>
                                    <td id="valor12"></td>
                            </tr>
                            <tr>
                                <td>Cuotas Registrada</td>
                                <td>
                                    <div id="cuotas" name="cuotas"> </div>
                                </td>
                                <td>
                                    <div id="num_cuotas" name="num_cuotas"> </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">Dinero faltante </td>
                                <!-- <td>Cuotas restantes</td> -->
                                <!-- <td> <div id="num_cr"></div> -->
                                </td>

                                <td>
                                    <div id="saldo_restante"></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


            </div>
        </div>
        <div class="col-6">
            <div class="p-3 border ">
                <div id="contenedor">
                    <div id="limite">
                        <div class="table table-striped">

                            <table id="miTabla" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Fecha cuota</th>
                                        <th>Valor cuota</th>
                                        <th>Saquito</th>
                                        <th>estado</th>
                                    </tr>
                                </thead>
                                <tbody id="tablaCuerpo">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 

<div class="contenedor_principal_py">

    <div class="formulario_proyeccion">


    </div>
</div>
 -->


  <!-- funcion para manipular el fondo de emegerncia para registrar saquito -->

<script>

$(document).ready(function() {
  const egreso = <?= $disponibles['egreso']?>;
  const presu = <?= $disponibles['presupuesto_anual']?>;
  const proyeccion_enc = <?= $proyeccion_enc['suma_total']?>;
  
  $(document).on('blur', '.valida', function(event) {
    let valor_cuota = parseInt($("#valor_cuota").val());
    let tomar_valor = parseInt($("#parametros_enc").val());

    if (tomar_valor === 35 && valor_cuota) {
      let fondo_emergencia = proyeccion_enc - valor_cuota;
      let condicional = 35;
      $("#suma_total").val(fondo_emergencia);
      $("#id_parametro_det").val(condicional);
    } else if (tomar_valor === 34 && valor_cuota) {
      let resultado = presu - valor_cuota;
      let resultado2 = valor_cuota + egreso;
      let condicional = 34;
      $("#egreso").val(resultado2);
      $("#presupuesto").val(resultado);
      $("#id_parametro_det").val(condicional);
    }
  });
});



// Obtener el elemento del campo de fecha
let fechaInput = document.getElementById('fecha_cuota');

// Obtener la fecha actual en formato AAAA-MM-DD
let fechaActual = new Date().toISOString().split('T')[0];

// Establecer la fecha actual como valor predeterminado en el campo de fecha
fechaInput.value = fechaActual;


</script>




<script>
/******* Data - Table ***********/
$(document).ready(function() {
    $('#miTabla').DataTable({
        scrollY: '400px',
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

const suma_cuotas = <?= json_encode($traer_proye) ?>;
// console.log(suma_cuotas);
let suma = 0;
let conversion = suma;

for (let i = 0; i < suma_cuotas.length; i++) {
    suma = parseFloat(suma) + parseFloat(suma_cuotas[i]['valor_cuota']);
    conversion = suma.toLocaleString();
    document.getElementById('num_cuotas').innerText = conversion;
    document.getElementById('cuotas').innerText = suma_cuotas.length;
    //    alert(suma_cuotas)
}

let num1 = <?= $traer_sqto['numero_cuota']?>;
let num2 = <?= $traer_sqto['valor']?>;


// resultado1 = num1 - suma_cuotas.length;
// console.log(resultado1)
// document.getElementById('num_cr').innerText = resultado1;

resultado2 = num2 - suma;

let decimal_Resultado = parseFloat(resultado2).toLocaleString();

// console.log(resultado2)
document.getElementById('saldo_restante').innerText = decimal_Resultado;

let num3 = <?= $traer_sqto['valor']?>

if (num3 === 0) {

} else if (suma == num3) {
    Swal.fire({
                title: 'Felicitaciones!!',
                text: 'Usted ha completado las cuotas del saquitos exitosamente, ya puede comprar su producto.',
                icon: 'success',
                confirmButtonText: 'Ok'

                
            });

    //Actualizar tabla saquito 
    $.ajax({
        type: "POST",
        url: "<?php echo base_url('Saquito/completado'); ?>",
        dataType: "json",
        success: function(resp) {
           
            // console.log(resp);
        }
    });

        setTimeout(function() {
        window.location.href = "<?= base_url('mi_saquito') ?>";
         }, 2000);
}

//console.log("La suma total es: " + suma);  

</script>



<script>
// convertir datos tipo string a tipo numerico con separaciones por coma, registros de las cuotas
let valorstring = <?= $traer_sqto['valor'] ?>;
let numeroDecimal = parseFloat(valorstring);
let valorFormateado = numeroDecimal.toLocaleString();
document.getElementById("valor12").innerText = valorFormateado;
</script>


<script>

    // Obtener los datos de proyeccion
    let proyeccion = <?php echo json_encode($proyeccion); ?>;
    // Obtener referencia al cuerpo de la tabla
    let tablaCuerpo = document.getElementById("tablaCuerpo");

    // Recorrer los datos de proyeccion y generar las filas de la tabla
    for (let i = 0; i < proyeccion.length; i++) {
        // Crear una nueva fila
        let fila = document.createElement("tr");

        // Crear y agregar celda para la fecha de la cuota
        let fechaCuota = document.createElement("td");
        fechaCuota.textContent = proyeccion[i]['fecha_cuota'];
        fila.appendChild(fechaCuota);

        // Crear y agregar celda para el valor de la cuota
        let valorCuota = document.createElement("td");
        valorCuota.id = "valor_cuota_" + i;
        let valorCuotaString = proyeccion[i]['valor_cuota'];
        let valorCuotaDecimal = parseFloat(valorCuotaString).toLocaleString();
        valorCuota.textContent = valorCuotaDecimal;
        fila.appendChild(valorCuota);

        // Crear y agregar celda para la descripción
        let descripcion = document.createElement("td");
        descripcion.textContent = proyeccion[i]['descripcion'];
        fila.appendChild(descripcion);

        // Crear y agregar celda para el estado
        let estado = document.createElement("td");
        estado.textContent = proyeccion[i]['estado'];
        fila.appendChild(estado);

        // Agregar la fila al cuerpo de la tabla
        tablaCuerpo.appendChild(fila);
    }



</script>

<?= $this->endSection("contenido")?>


