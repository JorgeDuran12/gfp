<?= $this->extend("layouts/gfpLayout")?>

<?= $this->section('contenido'); ?>

<div class="principal__container">
  <span class="mt-4 fw-bold fs-3">Bienvenido 
    <span class="text-info text-capitalize"><?=$misDatos->usuario; ?>,</span>
    aqui tienes todas las estadisticas de tu cuenta.
  </span>
  
  <div class="principal__cont-1" >
      <div class="div__cont">
        <h4>Presupuesto actual:</h4>
        <span id="presupuesto"></span>
        <button 
        type="button" 
        class="btn btn-danger"
        data-bs-toggle="modal" data-bs-target="#modalAgregar"
        >Ingresar presupuesto</button>
      </div>

      <div class="div__cont"><canvas id="myChart2" width=""></canvas></div>
      
      <div class="div__cont">3</div>
  </div>
  
  <div class="principal__cont-2">
      <div class="div__cont"><canvas  id="myChart1" width=""></canvas></div>
      <div class="div__cont">5</div>
      <div class="div__cont">6</div> 
  </div>

</div>

<!-- Modal -->
<div class="modal fade" id="modalAgregar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Agregar un presupuesto</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        <!-- Formulario -->
        <form action="<?= base_url("agregar_presupuesto")?>" method="post">
          <div class="mb-3 flex w-100">
            <label for="presupuesto" class="form-label">De cuanto quieres que sea tu presupuesto </label>
            <input type="text" required
              class="form-control" name="presupuesto_input" id="presupuesto_input" aria-describedby="helpId" placeholder="Ej: 1000000">
          </div>

          <input type="text" required hidden
          class="form-control" id="periodo_input" name="periodo_input" aria-describedby="helpId" >
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-primary">Agregar</button>
        </div>
      </form>
    </div>
  </div>
</div>


<script>

//Referencias HTML
presupuestoContainer = document.querySelector('#presupuesto');
inputPeriodo = document.querySelector('#periodo_input');

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
  from: { color: '#FF5733', width: 1 },
  to: { color: '#FFFF33', width: 3 },
  // Set default step function for all animate calls
  step: function(state, circle) {
    circle.path.setAttribute('stroke', state.color);
    circle.path.setAttribute('stroke-width', state.width);

    var valorPresupuesto = "<?= $misDatos->presupuesto?>";
    if (valorPresupuesto == 0) {
      circle.setText(`$0`);
    } else {
      circle.setText(`$${valorPresupuesto}`);
    }

  }
});
bar.text.style.fontFamily = '"Exo", sans-serif';
bar.text.style.fontSize = '2rem';

bar.animate(1.0);  // Number from 0.0 to 1.0

</script>
            
<script>

  const periodo = new Date();
  inputPeriodo.value = periodo.getFullYear();


</script>


<?= $this->endSection('contenido'); ?>
