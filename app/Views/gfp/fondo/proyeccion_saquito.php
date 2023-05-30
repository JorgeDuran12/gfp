<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>

<div class="titulo">
    <h1>Progreso de saquito</h1>
</div>   
<div class="formulario_proyeccion">

        <form id="formulario" method="POST" action="<?php echo base_url('Insertar_proyeccion'); ?>">

            <div class="tma   input_group"><input type="date" class="form-control" name="fecha_cuota" id="fecha_cuota"
                    placeholder="Fecha inicial: " required>
                <label for="floatingInput"></label> 
        

             <input type="number" class="form-control valida" name="valor_cuota" id="valor_cuota"
                    placeholder="Valor: " required>
                <label for="floatingInput"></label> 
            </div>
            <div  class="tx">
            <input type="hidden" class="form-control valida" placeholder="egreso" id="egreso" name="egreso" required>
            <label for="floatingInput"></label>
        </div>
        <div   class="tx">
            <input type="hidden" class="form-control valida" placeholder="presupuesto" id="presupuesto" name="presupuesto" required>
            <label for="floatingInput"></label>
        </div>

            <div> 
                <button class="btn btn-success" href="#" class="btn-guardar" type="Submit">
                    <img class="image" src="<?= base_url("img/Guardar.png") ?>" title="Guardar">
                </button>
            </div>

        </form>
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
<div class="container">

<table class="table">
  <thead class="table-dark">
    <tr>
    <th translucido></th>
    <th>Cuotas</th>
    <th>valor de meta</th>
    
    </tr>
  </thead>
  <tbody>
    <tr>
        <td>cantidad de cuotas</td>   
        <td><?= $traer_sqto['numero_cuota']?></td>
        <td><?= $traer_sqto['valor']?></td>  
       
    </tr>
    <tr>
        <td>cuotas registrada</td> 
         <td>
            <div id="cuotas" name="cuotas" >

            </div>
        </td>
        <td ><div id="num_cuotas" name="num_cuotas"> </div></td>
    </tr>
    <tr>
        <td>Cuotas restantes</td>   
        <td>
            <div id="num_cr">

            </div>
        </td> 
        
        <td>
            <div id="saldo_restante">

            </div>
        </td>  
        
    </tr>

  </tbody>
</table>
</div>

    
<!-- <---------------------div de header y footer------------------->
                                                                                     
</div>
</div>
</div>

<script>
    
    const egreso = <?= $disponibles['egreso']?>;
    const presu = <?= $disponibles['presupuesto_anual']?>;

    $(document).on('blur', '.valida', function(event) {
    let valor_cuota= parseInt(document.getElementById("valor_cuota").value);
    let resultado = presu - valor_cuota
    // console.log("resultado" + resultado);
     let resultado2 = valor_cuota + egreso
    //  console.log("resultado-------"+resultado2);
    document.getElementById("egreso").value = resultado2;
    document.getElementById("presupuesto").value = resultado;

    })

// poribles
</script>

<script>
/******* Data - Table ***********/
$(document).ready(function() {
    $('#miTabla').DataTable({
        scrollY: '500px',
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
for (let  i = 0 ; i < suma_cuotas.length; i++) {
   suma = parseFloat(suma) + parseFloat(suma_cuotas[i]['valor_cuota']);
   document.getElementById('num_cuotas').innerText = suma;
   document.getElementById('cuotas').innerText = suma_cuotas.length;
//    alert(suma_cuotas)

 } 
 let num1 = <?= $traer_sqto['numero_cuota']?>;
 let num2 = <?= $traer_sqto['valor']?>;


 resultado1 = num1- suma_cuotas.length;
 console.log(resultado1) 

 resultado2 = num2 - suma;
 console.log(resultado2) 

 
//console.log("La suma total es: " + suma);       
</script>

<?= $this->endSection("contenido")?>.