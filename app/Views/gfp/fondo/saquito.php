<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>

<div class="titulo">
    <h1><img class="img" src="<?= base_url("img/saquito.png")?>"> Saquito</h1>
</div><br>
<!--<form class="form" method="POST" action="<?php echo base_url('saquito/Insertar') ?>  " >
    
    <div class="form-group"  >
    <div class="input-group">
<div class="dca">
                <textarea class="dca"  name="descripcion" id=""floatingTextarea placeholder="Descripcion:" required></textarea>
            </div>
                <br>
            <div class="tma">
                <input type="date" class="form-control" name="fecha_inicial" id="floatingInput" placeholder="Fecha inicial: "required>
                <label for="floatingInput"></label>
             </div>
                <br>
            <div class="tma">
                <input type="number" class="form-control" name="valor" id="floatingInput" placeholder="Valor: "required>
                 <label for="floatingInput"></label>
            </div>
                <br>
                <div  class="txa">
                <input type="number" class="form-control" name="numero_cuota" id="floatingInput numero_cuota" placeholder="Numero cuotas:"required>
                <label for="floatingInput"></label>
                </div>
            <div class="txa">
                 <input type="number" class="form-control" name="cuota" id="floatingInput cuota" placeholder="Cuotas:"required>
                <label for="floatingInput"></label>
               </div>
                <div class="boton">
                <button data-bs-toggle="modal" data-bs-target="#exampleModal1" type="submit" class="btn btn-success"> 
                    Guardar
            </button>
            </div>
            </div>
            </div>-->
            <div class="tabla">
<h1>Progreso de saquito</h1>
<!--<div class="input-group mb-3 date ">

<span class="input-group-text" id="inputGroup-sizing-default"><img
        src="<?= base_url("icons/question-circle-fill.svg")?>"
        title="En esta opcion debera digitalizar el dia del mes donde el aplicativo debera descontar de la disponibilidad de la cuota para el saquito">
    &nbsp Ingrese  Dia</span>
<input type="week" class="ss" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>-->
<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editarModal">
  Agregar
</button>
<table class="table table-striped">
<thead>
                        <tr class="cm">
                            <th>Descripcion</th>
                            <th>Fecha inicial</th>
                            <th>valor</th>
                            <th>Numero cuota</th>
                            <th>cuota</th>
                            <th>estado</th>
                            <th colspan="2">Acciones</th>
                        
                        </tr>
                    </thead>
                    <tbody class=" jm">
                    <?php foreach ($saquito as $dato) { ?>

                  
                   <tr>
                   <td><?php echo $dato ['descripcion'];?></td>
                   <td><?php echo $dato['fecha_inicial'];?></td>
                   <td><?php echo $dato['valor'];?></td>
                   <td><?php echo $dato['numero_cuota'];?></td>
                   <td> <?php echo $dato['cuota'];?></td>
                   <td><?php echo $dato['estado'];?></td>
                  <td><button data-bs-toggle="modal" data-bs-target="#editarModal" type="button" class="btn btn-warning">
             <img class="image" src="<?= base_url("img/editar.png") ?> " title="Editar"> </button></td>
             <td> <button data-bs-toggle="modal" data-bs-target="#exampleModal2" type="button" class="btn btn-danger"> <img
                 class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar">
                  </button></td>
                 </tr>
                 <?php } ?>
                 </tbody>

</table>
</div>
</div>

</form>

<!-- Modal Eliminar-->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <h5 class="modal-title" id="exampleModalLabel">Eliminar Registro</h5>
            </div>
            <div class="modal-body">
                ¿Desea Eliminar este registro?
            </div>
            <div class="modal-footer">
                <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-success">Eliminar</button>
            </div>
</div>
        </div>
     </div>

     <!-- Modal  Editar-->
<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <img  src="<?= base_url("img/gfp.png") ?> " class="logo">
                <h2 class="modal-title" id="exampleModalLabel">Agregar Registro</h2>
            </div>
            <form  class="form" method="POST" action="<?php echo base_url('saquito/Insertar') ?>  " >
            <div class="modal-body">
             <div class="tim">
              <h3>Meta</h3>
             </div>
             <div class="dca">
                <textarea class="dca"  name="descripcion"placeholder="Descripcion:" id="floatingTextarea" required ></textarea>
            </div>
                <br>
            <div class="tma">
                <input type="date" class="form-control" name="fecha_inicial" id="floatingInput" placeholder="Fecha inicial: " required >
                <label for="floatingInput"></label>
             </div>
                <br>
            <div class="tma">
                <input type="number" class="form-control" name="valor" id="floatingInput" placeholder="Valor: " required >
                 <label for="floatingInput"></label>
            </div>
                <br>
            <div class="txa">
                 <input type="number" class="form-control" name="cuota" id="floatingInput cuota" placeholder="Cuotas:"required >
                <label for="floatingInput"></label>
                <input type="number" class="form-control" name="numero_cuota" id="floatingInput numero_cuota" placeholder="Valor cuotas:"required >
                <label for="floatingInput"></label>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-success" >guardar</button>
            </div>
        </div>
        </div>
        </div>
        


<!-- Modal  Agregar
<div class="modal fade" id="AgregarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <img  src="<?= base_url("img/gfp.png") ?> " class="logo">
                <h2 class="modal-title" id="exampleModalLabel">Agregar Registro</h2>
            </div>
            <div class="modal-body">
           <form  class="form" method="POST" action="<?php echo base_url('saquito/Insertar') ?>  " >
             <div class="tim">
              <h3>Meta</h3>
             </div>
             <div class="dca">
                <textarea class="dca"  name="descripcion"placeholder="Descripcion:"  required id="floatingTextarea"></textarea>
            </div>
                <br>
            <div class="tma">
                <input type="date" class="form-control" name="fecha_inicial" id="floatingInput" placeholder="Fecha inicial: "  required>
                <label for="floatingInput"></label>
             </div>
                <br>
            <div class="tma">
                <input type="number" class="form-control" name="valor" id="floatingInput" placeholder="Valor: "  required>
                 <label for="floatingInput"></label>
            </div>
                <br>
            <div class="txa">
                 <input type="number" class="form-control" name="cuota" id="floatingInput cuota" placeholder="Cuotas:" required>
                <label for="floatingInput"></label>
                <input type="number" class="form-control" name="numero_cuota" id="floatingInput numero_cuota" placeholder="Valor cuotas:" required>
                <label for="floatingInput"></label>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-success" >Agregar</button>
            </div>
        </div>
        </div>
        </div>-->
                    
                    

 <!-- <---------------------div de header y footer-------------------> 
 </div>

</div>
</div>



<?= $this->endSection("contenido")?>

<script>
function selecionaRegistro(id,tp){
    if(tp == 2){
    
        dataURL = "<?php echo base_url('/saquitos/buscar_Registro'); ?>"
$.ajax({
    
    type: "POST",
    url: dataURL,
    dataType: "json",
    success:function(rs){
    document.getElementById('exampleModalLabel').innerText="Actualizar Registro";
    $("#tp").val(2);
    $("#id").val(id);
   $("#descripcion").val(rs[0]['descripcion']);
   $("#fecha_inicial").val(rs[0]['fecha_inicial']);
   $("#valor").val(rs[0]['valor']);
   $("#numero_cuota").val(rs[0]['numero_cuota']);
   $("#cuota").val(rs[0]['cuota']);
   $("btn-Guardar").text('Actualizar');
   $("#saquitoModal").modal("show");
    
}


})
    }else{$("#tp").val(1);
    ducument.getElementById('exampleModalLabel').innerText="Agregar Registro";
    $("#descripcion").val('');
    $("#fecha_inicial").val('');
    $("#valor").val('');
    $("#numero_cuota").val('');
    $("#cuota").val('');
}

};  

 

</script>