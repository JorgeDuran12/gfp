<link rel="stylesheet" href="<?= base_url("/css/123/9876.css")?>">

<body>

    <div class="titulo"> 
      <h3>Administracion de usuarios</h3>
    </div >
<br>
 
    <div class="op">
      
    <a href="" onclick="seleccionacargo(<?php echo 1 . ',' . 1 ?>);" class="btn btn-success regresar_Btn" data-bs-toggle="modal" data-bs-target="#agregar-usuario">Crear nuevo usario</a>
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
                    <?php foreach ($usuarios as $dato){ ?>
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

<!-- <---------------------modal agregar usuario----------->
<form method="POST" action="<?php echo base_url('/cargos/insertar'); ?>" autocomplete="off">

    <div class="modal fade" id="agregar-usuario"tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">

        <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">


      <!-- lado izquierdo -->
        <div>

              <!-- nombre -->

        <div class="input_container">
            <label class="input_label" for="email_field">Nombre</label>
            <img src="<?= base_url("icons/person-fill.svg")?>" class="icon">
            <input placeholder="Ej: Daniel" name="input-name" type="text" class="input_field" id="nombre">
        </div>
      <!-- apellido -->

        <div class="input_container">
            <label class="input_label" for="email_field">Apellidos</label>
            <img src="<?= base_url("icons/person-lines-fill.svg")?>" class="icon">
            <input placeholder="Ej: Banquet" name="input-name" type="text" class="input_field" id="apellidos">
        </div>
              <!-- usuario -->

        <div class="input_container">
            <label class="input_label" for="email_field">Nombre de usuario</label>
            <img src="<?= base_url("icons/person-check-fill.svg")?>" class="icon">
            <input placeholder="Ej: Daniel" name="input-name" type="text" class="input_field" id="usuario">
        </div>
        
              <!-- tipo de documento -->

        <div class="input_container">
            <label class="input_label" for="email_field">Tipo de documento</label>
            <img src="<?= base_url("icons/person-vcard-fill.svg")?>" class="icon">
            <select class="select">
                <option value="" disabled selected> Tipo de documento</option>
                <option value="cedula" class="option">Cédula de ciudadanía</option>
                <option value="pasaporte" class="option">Pasaporte</option>
                <option value="tarjeta" class="option">Tarjeta de identidad</option>
                <option value="registro" class="option">Registro civil de nacimiento</option>
                <option value="licencia" class="option">Licencia de conducción</option>
            </select>
        </div>
      <!-- numero de documento-->

        <div class="input_container">
            <label class="input_label" for="email_field">Numero de documento</label>
            <img src="<?= base_url("icons/person-video.svg")?>" class="icon">
            <input placeholder="Ej: 1007 265 547" name="input-name" type="number" class="input_field" id="nmero_doc">
        </div>

        
        </div>
<!-- lado derecho -->
        <div>
        <div class="input_container">
            <label class="input_label" for="email_field">Teléfono</label>
            <img src="<?= base_url("icons/telephone-fill.svg")?>" class="icon">
            <input placeholder="Ej: 309 156 9347" name="input-name" type="number" class="input_field" id="telefono">
        </div>

        <div class="input_container">
            <label class="input_label" for="password_field">Contraseña</label>
            <img src="<?= base_url("icons/person-fill-lock.svg")?>" class="icon">
            <input placeholder="Contraseña" name="input-name" type="password" class="input_field" id="password">
        </div>

        <div class="input_container">
            <label class="input_label" for="email_field">Confirmar contraseña</label>
            <img src="<?= base_url("icons/shield-lock-fill.svg")?>" class="icon">
            <input placeholder="Validar contraseña" name="input-name" type="text" class="input_field"
                id="valid_password">
        </div>
        
        <div class="input_container">
            <label class="input_label" for="email_field">Correo electronico</label>
            <img src="<?= base_url("icons/envelope-fill.svg")?>" class="icon">
            <input placeholder="Ej: correo@mail.com" name="input-name" type="email" class="input_field" id="email">
        </div>

        </div>
      

      </div>
      <div class="modal-footer">

          <button type="button" class="btn btn-success">crear usuario</button>
      </div>
    </div>
</div>

        </div>
    </div>
</form>
            </div>
            </div>
            </div>





<!-- <---------------------div de header y footer-------------------> 
</div>
</div>