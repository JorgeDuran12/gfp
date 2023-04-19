<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Saquito</title>
    <link rel="stylesheet" href="<?= base_url("/css/saquito/saquito.css")?>">
</head>
<body>
<div class="card-litle"><h5 >Meta</h5>
</div>
<div class="input-group mb-3 ">
            <span class="input-group-text" id="inputGroup-sizing-default"><img src="<?= base_url("icons/question-circle-fill.svg")?>"    title="En esta opcion debera digitalizar el dia del mes donde el aplicativo debera descontar de la disponibilidad de la cuota para el saquito">  &nbsp Fecha inicial</span>
            <input type="date" class="ss" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
     </div>
<div class="form"> 
<div class="cont-form">
 

<div class="img">

</div> 


<br>
<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">Fecha inicial</span>
  <input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
  
</div>
 
    <div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">Valor</span>
  <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>
 
<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">Cuotas</span>
  <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>
 
<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">valor cuotas</span>
  <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>
<div class="dp">
  <textarea class="dc" placeholder="Descripcion" id="floatingTextarea"></textarea>
   
</div>
<br>
<div class="botones"><button type="button" class="btn btn-success">Guardar</button>
  <button type="button" class="btn btn-danger">Eliminar</button>
  <button type="button" class="btn btn-warning">Editar</button>
</div>

 
</div>
  </div>
  
 
 
</form>

</body>
</div></div>

</html>

