<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= base_url("/css/saquito/saquito1.css")?>">
  
    <title>Saquito</title>
</head>

<body>

<div class="titulo"> 
  <h1>Meta</h1>
</div ><br><br>
<div class="input-group mb-3 ">
            <span class="input-group-text" id="inputGroup-sizing-default"><img src="<?= base_url("icons/question-circle-fill.svg")?>"    title="En esta opcion debera digitalizar el dia del mes donde el aplicativo debera descontar de la disponibilidad de la cuota para el saquito">  &nbsp Fecha inicial</span>
            <input type="date" class="ss" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
     </div>
<div>
<form action="" class="registro">
<div class="tm">
<input  type="date" class="form-control" id="floatingInput" placeholder="fecha inicial: ">
  <label for="floatingInput"></label>
     
 </div>     
 <br>
 <div class="tm">
 <input  type="number" class="form-control" id="floatingInput" placeholder="Valor ">
  <label for="floatingInput"></label>
 </div>  
<br>

<div class="tx">
  <input  type="number" class="form-control" id="floatingInput" placeholder="cuotas">
  <label for="floatingInput"></label>
  <input type="number" class="form-control" id="floatingInput" placeholder="valor cuotas">
  <label for="floatingInput"></label>
</div>
<br>
<div class="dc">
  <textarea class="dc" placeholder="Descripcion" id="floatingTextarea"></textarea>
   
</div>
<br><br> <br> <br> <br>



<div class="botondeanti">
  <button type="button" class="btn btn-success"> <img  class="image" src="<?= base_url("img/Guardar.png") ?> " title="Guardar" >
    </button>
  <button type="button" class="btn btn-danger"> <img  class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar" >
    </button>
  <button type="button" class="btn btn-warning">
    <img  class="image" src="<?= base_url("img/editar.png") ?> " title="Editar" >
    
  </button>
</div>
    
</div> 
</form>
</body>
</div>
</div>

</html>

