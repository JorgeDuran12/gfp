<body>
<link rel="stylesheet" href="<?= base_url("/css/registro/movimientos.css")?>">

<div class="titulo"> 
  <h2>Movimientos</h2>
</div ><br><br>
<div  >
<form action="" class="registro">
<div class="tm">
      <select class="form-select" id="floatingSelectGrid" aria-label="Floating label select example">
        <option selected class="tl">Tipo De Movimiento</option>
        <option value="1" class="tl">Egreso</option>
        <option value="2" class="tl">Ingreso</option>
       
      </select>
 </div>     
 <br>
 <div class="tm">
      <select class="form-select" id="floatingSelectGrid" aria-label="Floating label select example">
        <option selected class="tl">Clase De Movimiento</option>
        <option value="1" class="tl">Bancario</option>
        <option value="2" class="tl">No Bancario</option>
       
      </select>
 </div>  
<br>

<div class="tx">
  <input  type="number" class="form-control" id="floatingInput" placeholder="Valor ">
  <label for="floatingInput"></label>
</div>
<br>
<div class="dc">
  <textarea class="dc" placeholder="Descripcion" id="floatingTextarea"></textarea>
   
</div>
<br>
<div class="">
  <input type="date" class="form-control" id="floatingInput" placeholder="name@example.com">
  <label for="floatingInput"></label>
</div>

<div class="botondeanti">
  <button type="button" class="btn btn-success"> <img  class="image" src="<?= base_url("img/Guardar.png") ?> " title="Guardar" >
    </button>
</div>
<br>
<div class="rt">
  <button class="btn btn-secondary">
 <img src="<?= base_url("icons/file-earmark-spreadsheet-fill.svg") ?>" > 
    Reporte
  </button>
    
</div> 
</form>
</div>

</div>
</div>
</body>