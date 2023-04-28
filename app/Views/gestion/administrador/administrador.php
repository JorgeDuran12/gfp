<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>



    <div class="titulo"> 
      <h3>Administracion de usuarios</h3>
    </div >
<br>
 
    <div class="op">
      
    <a href="#" onclick="seleccionausuario(<?php echo 1 . ',' . 1 ?>);" class="btn btn-success regresar_Btn" data-bs-toggle="modal" data-bs-target="#agregar-usuario">Crear nuevo usario</a>

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
                                    <a  class="btn btn-warning"  href="#" onclick="seleccionausuario(<?php echo $dato['id_usuario'] . ',' . 2 ?>);" data-bs-toggle="modal" data-bs-target="#agregar-usuario"  width="16" height="16" title="Editar Registro">
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

<!-- <---------------------modal agregar usuario----------->
<form method="POST" action="<?php echo base_url('/usuario/insertar'); ?>" autocomplete="off">

    <div class="modal fade" id="agregar-usuario"tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">

        <div class="modal-content">
      <div class="modal-header">            
        <h5 class="modal-title">Crear usuario</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
     

      <!-- lado izquierdo -->
        <div>

        <div class="input_container">
                  <label class="input_label" for="email_field">selecione rol</label>
                  <img src="<?= base_url("icons/person-vcard-fill.svg")?>" class="icon">
                  <select class="select"   name="id_rol" id="id_rol"aria-label="Default select example" required>
                  <?php foreach ($roles as $data) {?>
                    
                      <option value="<?php echo $data['id_rol']; ?>"><?php echo $data["nombre"];?></option>
                <?php } ?>
            </select>
        </div>
       

      

              <!-- nombre -->

        <div class="input_container">
            <label class="input_label" for="email_field">Nombre</label>
            <img src="<?= base_url("icons/person-fill.svg")?>" class="icon">
            <input placeholder="Ej: Daniel" name="nombre" type="text" class="input_field" id="nombre"  required>
        </div>
      <!-- apellido -->

        <div class="input_container">
            <label class="input_label" for="email_field">Apellidos</label>
            <img src="<?= base_url("icons/person-lines-fill.svg")?>" class="icon">
            <input placeholder="Ej: Banquet" name="apellido" type="text" class="input_field" id="apellido"  required >
        </div>
              <!-- usuario -->

              
              <!-- tipo de documento -->
              
              <div class="input_container">
                  <label class="input_label" for="email_field">Tipo de documento</label>
                  <img src="<?= base_url("icons/person-vcard-fill.svg")?>" class="icon">
                  <select class="select"  name="tipo_documento" id="tipo_documento"aria-label="Default select example" required>
                  <?php foreach ($parametros as $data) {?>
                      <option value="<?php echo $data['id_parametro_det']; ?>"><?php echo $data["nombre"];?></option>
                <?php } ?>
            </select>
        </div>
        <!-- numero de documento-->
        
        <div class="input_container">
            <label class="input_label" for="email_field">Numero de documento</label>
            <img src="<?= base_url("icons/person-video.svg")?>" class="icon">
            <input placeholder="Ej: 1007 265 547" name="num_documento" type="number" class="input_field" id="num_documento" require>
        </div>
        
        
    </div>
<!-- lado derecho -->
<div>
    <div class="input_container">
        <label class="input_label" for="email_field">Nombre de usuario</label>
        <img src="<?= base_url("icons/person-check-fill.svg")?>" class="icon">
        <input placeholder="Ej: Daniel" name="usuario" type="text" class="input_field" id="usuario" require>
    </div>

    <div class="input_container">
        <label class="input_label" for="email_field">Teléfono</label>
        <img src="<?= base_url("icons/telephone-fill.svg")?>" class="icon">
        <input placeholder="Ej: 309 156 9347" name="nun_telefono" type="number" class="input_field" id="nun_telefono">
    </div> 
    
    <div class="input_container">
        <label class="input_label" for="password_field">Contraseña</label>
        <img src="<?= base_url("icons/person-fill-lock.svg")?>" class="icon">
        <input placeholder="Contraseña" name="pass" type="password" class="input_field" id="pass"  require >
    </div>
    
     <div class="input_container">
        <label class="input_label" for="email_field">Confirmar contraseña</label>
        <img src="<?= base_url("icons/shield-lock-fill.svg")?>" class="icon">
        <input placeholder="Validar contraseña" name="input-name" type="password"  class="input_field" id="valid_password">
        </div> 
        
         <div class="input_container">
            <label class="input_label" for="email_field">Correo electronico</label>
            <img src="<?= base_url("icons/envelope-fill.svg")?>" class="icon">
            <input placeholder="Ej: correo@mail.com" name="input-name" type="email" class="input_field" id="email">
        </div>

        </div>
        
        <input hidden id="tp" name ="tp" >
        <input hidden id="id" name ="id" >

      </div>
      <div class="modal-footer">

      <button type="submit" class="btn btn-primary" id="btn_guardar">Guardar</button>      
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




<script>

  
   
 
  function seleccionausuario(id, tp) {
    if (tp == 2) {
      dataURL = "<?php echo base_url('/usuario/buscar_usuario'); ?>" + "/" + id;
      $.ajax({
         type: "POST",
         url: dataURL,
         dataType: "json",
         success: function(rs) {
           document.getElementById('exampleModalLabel').innerht="Actualizar usuario";
           $("#tp").val(2);
           $("#id_usuario").val(id);
           $("#usuario").val(rs[0]['usuario']);
           $("#nombre").val(rs[0]['nombre']);
           $("#apellido").val(rs[0]['apellido']);
           $("#tipo_documento").val(rs[0]['tipo_documento']);
           $("#num_documento").val(rs[0]['num_documento']);
           $("#id_rol").val(rs[0]['id_rol']);
           $("#pass").val(rs[0]['pass']);
           $("#btn_guardar").text('Actualizar');
           console.log("editable")
         }
         
      })
     }else{$("#tp").val(1);
       document.getElementById('exampleModalLabel');
       $("#usuario").val('');
        $("#nombre").val('');
        $("#apellido").val('');
        $("#id_rol").val('');
        $("#tipo_documento").val('');
        $("#num_documento").val('');
        $("#pass").val('');
        $("#btn_guardar").text('Guardar');
        console.log("enviado")
     }
    
   }
 ; 

   
</script>

<?= $this->endSection("contenido")?>