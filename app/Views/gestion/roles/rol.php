<link rel="stylesheet" href="<?= base_url("/css/123/987.css")?>">
<body>

    <div class="titulo"> 
      <h3>Administracion de rol</h3>
    </div >
<br>
 
    <div class="op">
      
    <a href="" onclick="seleccionacargo(<?php echo 1 . ',' . 1 ?>);" class="btn btn-success regresar_Btn" data-bs-toggle="modal" data-bs-target="#paisModal_Agregar">Agregar</a>
        &nbsp<a href="<?php echo base_url('eliminados_cargo'); ?>"  class="btn btn-secondary regresar_Btn">Eliminados</a>

        &nbsp<a href="<?php echo base_url('/principal'); ?>" class="btn btn-primary regresar_Btn">Regresar</a>
    </div>
    <div id="contenedor">
  <div id="limite">
            <div class="table-responsive">
                <table class="table table-dark table-sm table-striped" id="dataTable" width="100%" cellspacing="0">
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
                                <button>sssss</button>
                            </td>   
                            
                          </tr> 
                        <?php } ?>
                    </tbody>
                </table>
            </div>
            </div>
            </div>





<!-- <---------------------div de header y footer-------------------> 
</div>
</div>
</div>
</div>