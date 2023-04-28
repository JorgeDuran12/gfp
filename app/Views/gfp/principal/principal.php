<?= $this->extend("layouts/gfpLayout")?>

<?= $this->section('contenido'); ?>

<div class="principal__cont-1" >
    <div class="div__cont">1</div>
    <div class="div__cont"><canvas id="myChart2" width=""></canvas></div>
    <div class="div__cont">3</div>
</div>

<div class="principal__cont-2">
    <div class="div__cont"><canvas  id="myChart1" width=""></canvas></div>
    <div class="div__cont">5</div>
    <div class="div__cont">6</div> 
</div>

            
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  

  const ctx1 = document.getElementById('myChart1');

   new Chart(ctx1, {
    type: 'line',
    data: {
      labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
      datasets: [
        {
        label: 'Mis ultimos movimientos',
        data: [12, 19, 3, 5, 2, 3, 7,7 ,10,4,20,21],
        borderWidth: 1,
        backgroundColor: '#043391',
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
  
  /*  */

   const DATA_COUNT = 5;
const NUMBER_CFG = {count: DATA_COUNT, min: 0, max: 100};

let data = {
  labels: ['Enero', 'Febrero', 'Marzo', 'Abril'],
  datasets: [{
        data: [12, 1, 3, 5],
        borderWidth: 1,
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


<?= $this->endSection('contenido'); ?>
