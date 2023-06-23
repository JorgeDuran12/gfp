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

            <canvas id="myChart_presu"></canvas>

        </div>

    </div>

    <div class="principal__cont-2">

        <div class="div__cont">
            <canvas id="myChart1" width=""></canvas>
        </div>

        <div class="div__cont">
            <canvas id="myChart2" width="100"></canvas>
        </div>

        <div class="div__cont">

            <canvas id="Movimiento"></canvas>

        </div>
        
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
            circle.setText(`${formattedPresupuesto}`);
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

    const grafica_emergencia = <?= json_encode($graficas_e) ?>;

    let array_datos = []; //creamos un array vacio

    for (i = 0; i < grafica_emergencia.length; i++) {
        array_datos.push(grafica_emergencia[i].suma_total) //por cada recorrido hace un push
        // console.log(array_datos);
        }

let array_fecha= []
    for (i = 0; i < grafica_emergencia.length; i++) {
      array_fecha.push(grafica_emergencia[i].fecha_registro) //por cada recorrido hace un push
        console.table(array_fecha);
        }


    const detalle = <?=json_encode($graficas_titulo) ?>;
    // console.log(detalle);
    let array_detalle = [];

    for (t = 0; t < detalle.length; t++) {
        array_detalle.push(detalle[t].descripcion) //por cada recorrido hace un
        // console.log(array_detalle);
    }



const ctx1 = document.getElementById('myChart2');

new Chart(ctx1, {
    type: 'line',
    data: {
        labels: array_detalle,
        datasets: [{
                label: 'Enero',
                data: array_datos,
                borderWidth: 1,
                borderColor: 'black ',
                backgroundColor: 'black',
                tension: 0.1

            },

        ]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    },
});

</script>

<!-- Script de grafico de presupuesto actual, ingresos y egresos -->

<script>
    
const grafica_presupuesto = <?= json_encode($grafica_presu); ?>;

const presupuestoAnual = grafica_presupuesto.presupuesto_anual;
const ingreso = grafica_presupuesto.ingreso;
const egreso = grafica_presupuesto.egreso;

const ctx = document.getElementById('myChart_presu');

new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ['Presupuesto Anual', 'Ingreso', 'Egreso'],
    datasets: [{
      data: [presupuestoAnual, ingreso, egreso],
      borderWidth: 1,
      backgroundColor: [
        'rgba(255, 99, 132, 0.8)',  // Color para el presupuesto anual
        'rgba(54, 162, 235, 0.8)',  // Color para el ingreso
        'rgba(255, 206, 86, 0.8)',  // Color para el egreso
      ]
    }]
  },
  options: {
    responsive: true,
    maintainAspectRatio: false,
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});
</script>


<script>
    const grafica_movimiento = <?= json_encode($grafica_movi) ?>;
    const array_dat = [];
    const array_label = [];

    for (let i = 0; i < grafica_movimiento.length; i++) {
      array_dat.push(grafica_movimiento[i].descripcion);
    }

    for (let i = 0; i < grafica_movimiento.length; i++) {
      array_label.push(grafica_movimiento[i].valor);
    }

    const mv = document.getElementById('Movimiento');

    new Chart(mv, {
      type: 'line',
      data: {
        labels: array_dat,
        datasets: [{
          label: 'Valor: ',  
          fill: true,
          data: array_label,
          borderWidth: 1,
        }]
      },
      options: {
        plugins: {
          title: {
            display: true,
            text: 'Gastos Diarios',
            color: 'white'
          }
        },
        scales: {
          y: {
            beginAtZero: true,
            ticks: {
              color: 'white' 
            }
          },
          x: {
            ticks: {
              color: 'white'
            }
          }
        },
        onClick: function (event, chartElement) {
          const mv = this.chart;
          const ctx = mv.ctx;
          const activeElements = mv.getElementsAtEventForMode(event, 'nearest', { intersect: true }, true);
          if (activeElements.length > 0) {
            const index = activeElements[0].index;
            const bar = mv.data.datasets[0].data[index];
            const fecha = grafica_movimiento[index].fecha_movimiento;
            const x = activeElements[0].element.x;
            const y = activeElements[0].element.y;

            ctx.save();
            ctx.font = Chart.helpers.fontString(Chart.defaults.font.size, 'normal', Chart.defaults.font.family);
            ctx.fillStyle = 'white';
            ctx.textAlign = 'center';
            ctx.textBaseline = 'bottom';
            ctx.fillText(fecha, x, y - 10); // Ajusta la posición de la fecha
            ctx.restore();
          }
        }
      }
    });
  </script>

<?= $this->endSection('contenido'); ?>