<body>
    <link rel="stylesheet" href="<?= base_url("/css/123/987654.css")?>">

    <div class="titulo"> 
      <h3>Administracion de usuarios</h3>
    </div >
<br>
 
    <div class="op">
      
        &nbsp<a href="<?php echo base_url('eliminados_cargo'); ?>"  class="btn btn-success regresar_Btn">Crear usuario</a>
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
                            <th>Usuario</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Contraseña</th>
                           
                            <th>estado</th>
                            <th colspan="2">Acciones</th>
                        </tr>
                    </thead>
                    <?php foreach ($admin as $dato){ ?>
                          <tr>
                            <td> <?php echo $dato['id_usuario']; ?></td>
                            <td> <?php echo $dato['usuario']; ?></td>
                            <td> <?php echo $dato['nombre']; ?></td>
                            <td> <?php echo $dato['apellido']; ?></td>
                            <td> <?php echo $dato['pass']; ?></td>
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