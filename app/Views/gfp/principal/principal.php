<?= $this->extend("layouts/gfpLayout")?>

<?= $this->section('contenido');  ?>

<div class="principal__container">
    <span class="mt-4 fw-bold fs-3">Bienvenido
        <span class="text-info text-capitalize"> <?=$misDatos->usuario; ?>,

        </span>
        aqui tienes todas las estadisticas de tu cuenta.
    </span>

    <div class="principal__cont-1">
        <div class="div__cont">
            <h4>Presupuesto actual:</h4>
            <span id="presupuesto"></span>
            <button type="submit" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalAgregar"
                id="btn-agregarPresupuesto">Ingresar presupuesto</button>
        </div>
        <!-- <--------------trasabilidad---------------------->
        <div class="div__cont">
            <table class="table table-bordered table-sm table-striped" id="dataTable1" width="100%" cellspacing="0">
                <thead>
                    <tr>

                        <th>Periodo</th>
                        <th>Saldo Anterior</th>
                        <th>Ingreso</th>
                        <th>Egreso</th>
                        <th>Presupuesto Anual</th>



                    </tr>
                </thead>
                <tbody>


                    <?php foreach ($trasabilidad as $dato) { ?>
                    <tr>
                        <td><?php echo $dato ['periodo'];?></td>
                        <td><?php echo $dato ['saldo_anterior'];?></td>
                        <td><?php echo $dato ['ingreso'];?></td>
                        <td><?php echo $dato ['egreso'];?></td>
                        <td><?php echo $dato ['presupuesto_anual'];?></td>

                    </tr>
                    <?php } ?>

                </tbody>
            </table>
        </div>

        <div class="div__cont"> <canvas id="myChart2" width="100"></canvas></div>
    </div>

    <div class="principal__cont-2">

        <div class="div__cont"><canvas id="myChart1" width=""></canvas></div>

        <div class="div__cont">
            <canvas id="grafica"></canvas>
        </div>

        <div class="div__cont">6</div>
    </div>

</div>

<!-- Modal -->

<form action="<?= base_url('agregar_presupuesto');?>" method="POST" id="form_principal">

    <div class="modal fade" id="modalAgregar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Agregar un presupuesto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <!-- Formulario -->
                    <div class="mb-3 flex w-100">
                        <label for="presupuesto" class="form-label">De cuanto quieres que sea tu presupuesto
                            inicial</label>
                        <input type="text" required class="form-control" name="presupuesto_input" id="presupuesto_input"
                            aria-describedby="helpId" placeholder="Ej: 1000000">

                    </div>

                    <input type="text" required hidden class="form-control" id="periodo_input" name="periodo_input"
                        aria-describedby="helpId">
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Agregar</button>
                </div>
</form>

</div>
</div>
</div>

</form>


<script>
//Referencias HTML
let presupuestoContainer = document.querySelector('#presupuesto');
let inputPeriodo = document.querySelector('#periodo_input');
let btnPresupuesto = document.querySelector('#btn-agregarPresupuesto');

var bar = new ProgressBar.Circle(presupuestoContainer, {
    color: '#aaa',
    // This has to be the same size as the maximum width to
    // prevent clipping
    strokeWidth: 4,
    trailWidth: 1,
    easing: 'easeInOut',
    duration: 1500,
    text: {
        autoStyleContainer: false
    },
    from: {
        color: '#FF5733',
        width: 1
    },
    to: {
        color: '#FFFF33',
        width: 3
    },
    // Set default step function for all animate calls
    step: function(state, circle) {
        circle.path.setAttribute('stroke', state.color);
        circle.path.setAttribute('stroke-width', state.width);

        let valorPresupuesto = <?= $presupuestoActual ?>;
        let formattedPresupuesto = valorPresupuesto.toLocaleString(); // Formatear con separación de comas

        if (valorPresupuesto == 0) {
            circle.setText(`$0`);
        } else {
            circle.setText(`$${formattedPresupuesto}`);
            btnPresupuesto.hidden = true;
        }

    }
});

bar.text.style.fontFamily = '"Exo", sans-serif';
bar.text.style.fontSize = '2rem';

bar.animate(1.0);

</script>

<script>
//Colocar año actual al input 
const periodo = new Date();
inputPeriodo.value = periodo.getFullYear();

//Quitar botono si ya agrego un presupuesto
</script>

<script>
   $(document).ready(function() {
    $.ajax({
        url: "<?php echo base_url("Proyeccion/buscar_Proyeccion")?>",
        dataType: 'json',
        method: "GET",
        success: function(data) {
            console.log(data);
            var saquito =<?php ['']?>
            var cuotas= <?php ['']?>
            var color = ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)'];
            var bordercolor = ['rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)'];
            console.log(data);
 
            for (var i in data) {
                saquito.push(data[i].saquito);
                cuotas.push(data[i].cuotas);
            }
 
            var chartdata = {
                labels: saquito,
                datasets: [{
                    label: saquito,
                    backgroundColor: color,
                    borderColor: color,
                    borderWidth: 2,
                    hoverBackgroundColor: color,
                    hoverBorderColor: bordercolor,
                    data: cuotas
                }]
            };
 
            var mostrar = $("#myChart2");
 
            var grafico = new Chart(mostrar, {
                type: 'doughnut',
                data: chartdata,
                options: {
                    responsive: true,
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });
        },
        error: function(data) {
            console.log(data);
        }
    });
});
   

 let data = {
  labels: ['Enero', 'Febrero', 'Marzo', 'Abril',],
  datasets: [{
        data: [12, 1, 3, 5,],
        borderWidth: 1,
         backgroundcolor:'white'
     }]
};

  const ctx2 = document.getElementById('myChart2');
 new Chart(ctx2, {
     type: 'doughnut',
  data: data,
  options: {
     responsive: true,
     plugins: {
     legend: {
       position: 'top',
      },
     title: {
        display: true,
       text: 'Grafica de mis ahorros'
      }
   }
 },
  }); 
  
</script> 

<!-- 
<script>

$(document).ready(function() {
  var fechas = <php echo json_encode($fechas); ?>; // Obtener los datos de fechas desde el controlador
  var valores = <php echo json_encode($valores); ?>; // Obtener los datos de valores desde el controlador

  // Configurar la gráfica
  var ctx = document.getElementById('grafica').getContext('2d');
  var grafica = new Chart(ctx, {
    type: 'line',
    data: {
      labels: fechas, // Utilizar el arreglo de fechas como etiquetas en el eje x
      datasets: [{
        label: 'Valores de inserción', // Etiqueta para la leyenda
        data: valores, // Utilizar el arreglo de valores para los datos
        // backgroundColor: '#FFFFFF',
        borderColor: 'white', // Color de borde de la línea
        fill: false // No rellenar el área bajo la línea
      }]
    },
    options: {
      responsive: true, // Hacer la gráfica responsive
      scales: {
        x: {
          display: true, // Mostrar el eje x
          title: {
            display: true,
            text: 'Fechas' // Etiqueta del eje x
          }
        },
        y: {
          display: true, // Mostrar el eje y
          title: {
            display: true,
            text: 'Valores' // Etiqueta del eje y
          }
        }
      }
    }
  });
});

</script> -->

<?= $this->endSection('contenido'); ?>