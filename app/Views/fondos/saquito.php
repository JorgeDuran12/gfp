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
<div class="form"> 
<div class="cont-form">
<h5 class="card-litle">Meta</h5>
<div class="descripcion"></div>
<label for="name">Descripcion:</label>

<input type="text" id="descripcion" name="descripcion" >
</div><br>
  <div class="mb-3">
 <label for="start">Fecha inicial:</label>
<input type="date" id="start" name="trip-start">
       
    </div><br>
 
  <div class="mb-3">
  <label for="tentacles">Valor:</label>

<input type="number" id="tentacles" name="tentacles">
      
  </div>
 
  <div class="mb-3">
  <label for="tentacles">Cuotas:</label>

<input type="number" id="tentacles" name="tentacles">
       </div>
 
       <div class="mb-3">
<label for="name">valor de cuotas:</label>

<input type="text" id="valor" name="valor" >
</div>
</div>
  </div>
 
</form>

</body>
</html>

