<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>



    <div class="titulo"> 
      <h3>Administracion de usuarios</h3>
    </div >
<br>
 
    <div class="op">
      
    <a href="#" onclick="seleccionausuario(<?php echo 1 . ',' . 1 ?>);" class="btn btn-success regresar_Btn" data-bs-toggle="modal" data-bs-target="#agregar_usuario">Crear nuevo usario</a>
    &nbsp <a href="<?php echo base_url('eliminados_usuario'); ?>"  class="btn btn-secondary regresar_Btn">Eliminados</a>

        &nbsp<a href="<?php echo base_url('/principal'); ?>" class="btn btn-primary regresar_Btn">Regresar</a>
    </div>
    <div id="contenedor">
  <div id="limite">
            <div class="table-responsive">
                <table class="table table-red  table-sm table-striped" id="dataTable" width="100%" cellspacing="0">
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
                                    <a  class="btn btn-warning"  href="#" onclick="seleccionausuario(<?php echo $dato['id_usuario'] . ',' . 2 ?>);" data-bs-toggle="modal" data-bs-target="#agregar_usuario"  width="16" height="16" title="Editar Registro">
                                       <img  class="image" src="<?= base_url("img/editar.png") ?> " title="Editar" >
                                    </a>     
                                 
                                    <a class="btn btn-danger"  href="#" data-href="<?php echo base_url('usuario/eliminar__usuario'). '/' .$dato['id_usuario']. '/' .'E'; ?>"  data-bs-toggle="modal" data-bs-target="#modal-confirma" src="<?php echo base_url(); ?>/icons/borrar.png" width="16" height="16"  title="Elimina Registro"> 
                                    <img
                    class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar">
                                   </a>
                                
                            </td>                              
                          </tr> 
                        <?php } ?>
                    </tbody>
                </table>

<!-- <---------------------modal agregar usuario----------->
<form method="POST" action="<?php echo base_url('/usuario/insertar'); ?>" autocomplete="off">

    <div class="modal fade" id="agregar_usuario"tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">

        <div class="modal-content">
      <div class="modal-header">            
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
        <input hidden id="tp" name ="tp">
        <input hidden id="id_usuario" name ="id_usuario">

      <!-- lado izquierdo -->
        <div>

        <div class="input_container">
                  <label class="input_label" for="email_field">Selecione rol</label>
                  <img src="<?= base_url("icons/person-vcard-fill.svg")?>" class="icon">
                  <select class="select" name="id_rol" id="id_rol" aria-label="Default select example" required>
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
      <!-- usuario -->

    <div class="input_container">
        <label class="input_label" for="email_field">Nombre de usuario</label>
        <img src="<?= base_url("icons/person-check-fill.svg")?>" class="icon">
        <input placeholder="Ej: Daniel" name="usuario" type="text" class="input_field" id="usuario" require>
    </div>

    <div class="input_container">
        <label class="input_label" for="email_field">Teléfono</label>
        <img src="<?= base_url("icons/telephone-fill.svg")?>" class="icon">
        <input placeholder="Ej: 309 156 9347" name="telefono" type="number" class="input_field" id="telefono">
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
            <input placeholder="Ej: correo@mail.com" name="email" type="email" class="input_field" id="email">
        </div>

        </div>
      
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



<!-- --------------------------------------------Modal Confirma Eliminar ---------------------------------------------------->
<div class="modal fade" id="modal-confirma" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div style="text-align:center;" class="modaal-header">
                    <h5  class="modal-title"
                    
                        id="exampleModalLabel">Eliminación de Registro<h5>


                </div>
                <div style="text-align:center;font-weight:bold;" class="modal-body">
                    <p>Seguro Desea Eliminar este Registro?</p>
                    <tr>
                           
                </div>
                <div class="modal-footer">
                    <a type="button" class="btn btn-primary close" data-bs-dismiss="modal">No</a>
                    <a class="btn btn-danger btn-ok">Si</a>
                </div>
            </div>
        </div>
    </div>


<script>

// <---------------modal confirmar eliminacion---------------------------------------------/\
$('#modal-confirma').on('show.bs.modal', function(e) {                                      
        $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));           
    });                                                                                  
$('.close').click(function() {$("#modal-confirma").modal("hide");});

 
  function seleccionausuario(id, tp) {
    if (tp == 2) {
      dataURL = "<?php echo base_url('buscar_usuario'); ?>" + "/" + id;
      $.ajax({
         type: "POST",
         url: dataURL,
         dataType: "json",
         success: function(rs) {
           document.getElementById('exampleModalLabel').innerText = "Actualizar usuario";           
           $("#tp").val(2);
           $("#id_usuario").val(id);
           $("#usuario").val(rs[0]['usuario']);
           $("#nombre").val(rs[0]['nombre']);
           $("#apellido").val(rs[0]['apellido']);
           $("#tipo_documento").val(rs[0]['tipo_documento']);
           $("#num_documento").val(rs[0]['num_documento']);
           $("#email").val(rs[0]['email']);
           $("#telefono").val(rs[0]['telefono']);
           $("#id_rol").val(rs[0]['id_rol']);
           $("#pass").val(rs[0]['pass']);
           $("#btn_guardar").text('Actualizar');
           console.log("editable");
         }
         
      });
     }else{$("#tp").val(1);
       document.getElementById('exampleModalLabel').innerText = "Crear usuario";
       $("#usuario").val('');
        $("#nombre").val('');
        $("#apellido").val('');
        $("#id_rol").val('');
        $("#tipo_documento").val('');
        $("#num_documento").val('');
        $("#email").val('');
        $("#telefono").val('');
        $("#pass").val('');
        $("#btn_guardar").text('Guardar');
        console.log("enviado");
     }
    
   }

   
</script>

<?= $this->endSection("contenido")?>