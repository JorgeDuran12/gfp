<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>


    <div class="titulo"> 
      <h3>Administracion de rol</h3>
    </div >
<br>
 
    <div class="op">
      
    <a href="" onclick="seleccionarol(<?php echo 1 . ',' . 1 ?>);" class="btn btn-success regresar_Btn" data-bs-toggle="modal" data-bs-target="#agregar_rol">Agregar</a>
        &nbsp<a href="<?php echo base_url('eliminados_cargo'); ?>"  class="btn btn-secondary regresar_Btn">Eliminados</a>

        &nbsp<a href="<?php echo base_url('/principal'); ?>" class="btn btn-primary regresar_Btn">Regresar</a>
    </div>
    <div id="contenedor">
  <div id="limite">
            <div class="table-responsive">
                <table class="table table table-sm table-striped" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr >
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>descripcion</th>
                            
                           
                            <th>estado</th>
                            <th colspan="2">Acciones</th>
                        </tr>
                    </thead>
                    <?php foreach ($roles as $dato){ ?>
                          <tr>
                            <td> <?php echo $dato['id_rol']; ?></td>
                            <td> <?php echo $dato['nombre']; ?></td>
                            <td> <?php echo $dato['descripcion']; ?></td>
                            <td>  <?php if($dato['estado']=="A"){echo "Activo";}else{echo "Eliminado";}?></td>
                            <td>      
                                    <a  class="btn btn-warning"  href="#" onclick="seleccionarol(<?php echo $dato['id_rol'] . ',' . 2 ?>);" data-bs-toggle="modal" data-bs-target="#agregar_rol"  width="16" height="16" title="Editar Registro">
                                       <img  class="image" src="<?= base_url("img/editar.png") ?> " title="Editar" >
                                    </a>     
                                 
                                    <button data-bs-toggle="modal" data-bs-target="#eliminaremergenModal" type="button" class="btn btn-danger">
                                        <img  class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar" >
                                    </button>
                                
                            </td>   
                            
                          </tr> 
                        <?php } ?>
                    </tbody>
                </table>
            </div>
            </div>
            </div>

            <!-- <---------------------modal agregar rol----------->
<form method="POST" action="<?php echo base_url('/rol/insertar'); ?>" autocomplete="off">

<div class="modal fade" id="agregar_rol"tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">

    <div class="modal-content">
  <div class="modal-header">            
    <h5 class="modal-title">Crear nuevo rol</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
  </div>
  <div class="modal-body">
 
        <label class="input_label" for="email_field">Nombre</label>
            <input placeholder="Ej:Administrador" name="nombre" type="text" class="input_field" id="nombre"  required><br>

            <label class="input_label" for="email_field">descripcion</label>

            <textarea class="dc" placeholder="Descripcion" id="floatingTextarea"></textarea>
 
    
    <input hidden id="tp" name ="tp" >
    <input hidden id="id_rol" name ="id_rol">

  </div>
  <div class="modal-footer">
  

       

  <button type="submit" class="btn btn-primary" id="btn_guardar">Guardar</button>      
</div>
</div>

    </div>
</div>
</form>




<!-- <---------------------div de header y footer-------------------> 
</div>
<script>


</script>




<?= $this->endSection("contenido")?>