<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= base_url("/css/saquito/progreso_saquito.css")?>">
  
    <title>Saquito</title>
</head>
<body>
<div class="titulo"> 
  <h1>Progreso de saquito</h1>
  <form id="formulario" method="POST" action="<?php echo base_url('Insertar') ?>  ">
  <div class="tma"><input type="date" class="form-control" name="fecha_inicial" id="fecha_inicial"
                            placeholder="Fecha inicial: " required>
                        <label for="floatingInput"></label>
                        </div>

    <div class="tma"> <input type="number" class="form-control" name="valor" id="valor"
    placeholder="Valor: " required>
 <label for="floatingInput"></label>
 </div>
 <div class="b"> <button href="#" class="btn-guardar" type="Submit"><img
        class="image" src="<?= base_url("img/Guardar.png") ?> " title="Guardar">
      </button></div> 



  </form>

  <br>
<div class="table-responsive">
                <table class="tabla" id="dataTable" cellspacing="0">
                    <thead>
                        <tr class="cm" >
                            <th>fecha</th>
                            <th>Valor</th>
                            <!-- <th>Descripcion</th>
                            <th>Mes</th> -->
                        
                        </tr>
                    </thead>
                    <tbody >
                        <tr>
                            <td>cuota</td>
                            <td>valor</td>
                        </tr>
                    </tbody>
</table> 
</div>   
</body>

</div>

</div>
</div>

<?= $this->endSection("contenido")?>