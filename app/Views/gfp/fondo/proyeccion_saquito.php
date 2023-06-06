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
                                <td><?= $traer_sqto['numero_cuota']?></td>
                                <td><?= $traer_sqto['valor']?></td>
                            </tr>
                            <tr>
                                <td>Cuotas Registrada</td>
                                <td>
                                    <div id="cuotas" name="cuotas">

                                    </div>
                                </td>
                                <td>
                                    <div id="num_cuotas" name="num_cuotas"> </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">Dinero faltante </td>
                                <!-- <td>Cuotas restantes</td> -->
                                <!-- <td>
                <div id="num_cr">

                </div> -->
                                </td>

                                <td>
                                    <div id="saldo_restante">

                                    </div>
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
                                <tbody>
                                    <?php foreach ($proyeccion as $dato){ ?>
                                    <tr>
                                        <td><?php echo $dato['fecha_cuota'];?></td>
                                        <td><?php echo $dato['valor_cuota'];?></td>
                                        <td><?php echo $dato['descripcion'];?></td>
                                        <td><?php echo $dato['estado'];?></td>
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


<!-- 

<div class="contenedor_principal_py">

    <div class="formulario_proyeccion">


    </div>
</div>
 -->

<!-- <---------------------div de header y footer------------------->


<script>

const egreso = <?= $disponibles['egreso']?>;
const presu = <?= $disponibles['presupuesto_anual']?>;

$(document).on('blur', '.valida', function(event) {

    let valor_cuota = parseInt(document.getElementById("valor_cuota").value);
    let resultado = presu - valor_cuota;
    let resultado2 = valor_cuota + egreso;


    //  console.log("resultado-------"+resultado2);
    document.getElementById("egreso").value = resultado2;
    document.getElementById("presupuesto").value = resultado;

})

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
console.log(suma_cuotas)
let suma = 0;
for (let i = 0; i < suma_cuotas.length; i++) {
    suma = parseFloat(suma) + parseFloat(suma_cuotas[i]['valor_cuota']);
    document.getElementById('num_cuotas').innerText = suma;
    document.getElementById('cuotas').innerText = suma_cuotas.length;
    //    alert(suma_cuotas)

}
let num1 = <?= $traer_sqto['numero_cuota']?>;
let num2 = <?= $traer_sqto['valor']?>;


// resultado1 = num1 - suma_cuotas.length;
// console.log(resultado1)
// document.getElementById('num_cr').innerText = resultado1;

resultado2 = num2 - suma;
console.log(resultado2)
document.getElementById('saldo_restante').innerText = resultado2;

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
            console.log(resp);
        }
    });
    window.location.href = "<?= base_url('mi_saquito') ?>";



}


//console.log("La suma total es: " + suma);       
</script>


<?= $this->endSection("contenido")?>.


egreso