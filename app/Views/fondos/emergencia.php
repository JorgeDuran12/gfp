<body>
    <link rel="stylesheet" href="<?= base_url("/css/123/123456.css")?>">

    <div class="titulo"> 
      <h3>Fondo de emergencia</h3>
    </div ><br>



    <div class="input-group mb-3 ss ">
            <span class="input-group-text" id="inputGroup-sizing-default"><img src="<?= base_url("icons/question-circle-fill.svg")?>"    title="En esta opcion debera digitalizar el dia del mes donde el aplicativo debera descontar de la disponibilidad de la cuota para el saquito">  &nbsp Fecha inicial</span>
            <input type="date" class="ss" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
     </div>


    <div class="registro">
      <div>
         <h4>Asignar cuota </h4>
      </div>
      <br>
      Valor:
      <div class="tm">
        <input type="number" class="tl aria-label="Dollar amount (with dot and two decimal places)"  >
        
      </div>
      <br>
      
      
      
      <div class="botondeanti">
        <button type="button" class="btn btn-outline-success">Guardar</button>
        <button type="button" class="btn btn-outline-danger">Eliminar</button>
        <button type="button" class="btn btn-outline-warning">Editar</button>
      </div>
      
      <div>
        <label>Presupuesto actual:</label>

      </div>
    </div>
    <!-- <--------div of footer, nav-bar and hear -->
    </div>
    </div>
    </div>
</body>