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
            <!-- <h2>Presupuesto Anual</h2> -->
            <canvas id="myChart_presu"></canvas>

        </div>

    </div>

    <div class="principal__cont-2">

        <div class="div__cont">
        
          <div id="mychartingreso"></div>
            <canvas id="MovimientoIgresos"></canvas>
        </div>

        <div class="div__cont">
          <div id="fondo_gra"></div>
            <canvas id="myChart2" width="100"></canvas>
        </div>

        <div class="div__cont">
            <div id="movi_cont"></div>
            <canvas id="MovimientoEgresos"></canvas>

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

if (grafica_emergencia.length === 0) {
  document.getElementById('fondo_gra').innerText = "No hay datos en el fondo de emergencia";
} else {
  let array_datos = [];

  for (let i = 0; i < grafica_emergencia.length; i++) {
    array_datos.push(grafica_emergencia[i].suma_total);
  }

  let array_detalle = [];

  // Asegúrate de obtener los datos necesarios y asignarlos correctamente a 'detalle'
  const detalle = <?= json_encode($graficas_titulo) ?>;

  for (let t = 0; t < detalle.length; t++) {
    array_detalle.push(detalle[t].descripcion);
  }

  const ctx1 = document.getElementById('myChart2');

  new Chart(ctx1, {
    type: 'line',
    data: {
      labels: array_detalle,
      datasets: [{
        label: 'Fondo',
        fill: false,
        data: array_datos,
        borderWidth: .5,
        backgroundColor: '#FDFD96',
        pointBorderColor: '#ffff'
      }]
    },
    options: {
      plugins: {
        title: {
          display: true,
          text: 'Control del fondo de emergencia',
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
    }
  });
}

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

 const grafica_egreso = <?= json_encode($grafica_movi) ?>;
    const array_dat = [];
    const array_label = [];

if (grafica_egreso.length === 0) {
  document.getElementById('movi_cont').innerText = "No hay registros de egresos";
} else {
  for (let i = 0; i < grafica_egreso.length; i++) {
    if (grafica_egreso[i].clase_movimiento === "4") { // Filtrar solo los registros de egresos
      array_dat.push(grafica_egreso[i].descripcion);
      array_label.push(grafica_egreso[i].valor);
    }
  }

  const mv = document.getElementById('MovimientoEgresos');

  new Chart(mv, {
    type: 'line',
    data: {
    labels: array_dat,
    datasets: [{
      label: 'Egreso',
      fill: false,
      data: array_label,
      borderWidth: .5,
      backgroundColor: 'rgba(255, 0, 0, 0.5)' ,// Aquí puedes especificar el color deseado en formato RGBA
      pointBorderColor: '#ffff'
    }]
  },
    options: {
      plugins: {
        title: {
          display: true,
          text: 'Control total de egresos',
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
    }
  });
}

</script>

<script>

 const grafica_ingreso = <?php echo json_encode($grafica_movi) ?>;
    const array_dato = [];
    const array_lab = [];

if (grafica_ingreso.length === 0) {
  document.getElementById('mychartingreso').innerText = "No hay registros de igresos";
} else {
  for (let i = 0; i < grafica_ingreso.length; i++) {
    if (grafica_ingreso[i].clase_movimiento === "3") { // Filtrar solo los registros de egresos
      array_dato.push(grafica_ingreso[i].descripcion);
      array_lab.push(grafica_ingreso[i].valor);
    }
  }

  const ctm = document.getElementById('MovimientoIgresos');

  new Chart(ctm, {
    type: 'line',
    data: {
      labels: array_dato,
      datasets: [{
        label: 'Ingreso',  
        fill: false,
        data: array_lab,
        borderWidth: .5 ,
        backgroundColor: '#88DC65',
        pointBorderColor: '#ffff'
      }]
    },
    options: {
      plugins: {
        title: {
          display: true,
          text: 'Control total de ingresos',
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
    }
  });
}

</script>

<?= $this->endSection('contenido'); ?>