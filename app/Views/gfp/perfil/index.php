<?= $this->extend('layouts/gfpLayout')?>
<?= $this->section('contenido')?>

<div class="perfil__container">

    <div class="perfil__carta">
        <div class="perfil__img">
    <h1>
        Administracion de perfil
    </h1>        
    </div>
    <div class="perfil__info-container">
        <div class="ubicacion">
            <img src="<?= base_url("img/perfil.png")?>" alt="iconoPerfil" class="perfil__icono">
    
        </div>
            
        <div class="perfil__informacion">
            
            <h3 class="mb-3 text-white fw-bold text-uppercase">Información</h3>
            <ul class="d-flex">
                <li>USUARIO:</li>
                <span><?= $DatosPerfil['usuario']?></span>
            </ul>
            <ul class="d-flex">
                <li>NOMBRE COMPLETO:</li>
                <span><?= $DatosPerfil['nombre']?> <?= $DatosPerfil['apellido']?></span>
            </ul>
            <ul class="d-flex">
                <li>ROL ACTUAL:</li>
                <span><?= $DatosPerfil['rol_nombre']?></span>
            </ul>
            <ul class="d-flex">
                <li>DOCUMENTO:</li>
                <span><?= $DatosPerfil['pf_tp']?> - <?= $DatosPerfil['num_documento']?></span>
            </ul>

            <h3 class="mt-5 mb-3 text-white fw-bold text-uppercase">Contacto</h3>
            <ul class="d-flex">
                <li>TELEFONO PRINCIPAL:</li>
                <span><?= $DatosPerfil['telefono']?></span>
            </ul>
            <ul class="d-flex">
                <li>CORREO ELECTRONICO PRINCIPAL:</li>
                <span><?= $DatosPerfil['email']?></span>
            </ul>
            <!-- Editar contacto (Button) -->
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalPerfil" onclick="mostrarDatos()">
                <img type="image" src="<?= base_url("img/editar.png")?>" />
            </button>

            <h3 class="mt-5 mb-3 text-white fw-bold text-uppercase">Cambiar contraseña</h3>
            <form action="<?= base_url("perfil/cambiar_clave")?>" method="post" onsubmit="return verificarCampos()" class="d-flex flex-column">
                <input id="old_pass" name="old_pass" type="password" placeholder="Contraseña actual" class="mb-3">
                <input id="new_pass" name="new_pass" type="password" placeholder="Nueva contraseña" class="mb-3">
                <button class="btn btn-outline-primary" type="submit">Cambiar</button>
            </form>

            <!-- Modal -->
  <div class="modal fade" id="modalPerfil" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" id="agendaPago__modal-header">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <img src="<?= base_url("img/gfp.png")?>" alt="" class="w-25 p-3">
            <h3 class="modal-title" id="modal-title">Editar</h3>
          </div>
          <div class="alert alert-danger" role="alert" id="mensajeError" hidden></div>
          <div class="modal-body">
            <!-- Formulario -->
            <form class="d-flex flex-column" id="datosFormulario" action="<?= base_url("perfil/editar_informacion")?>" method="POST" onsubmit="return validateForm()">
                <input type="text" hidden
                  class="form-control"  name="id" id="id" aria-describedby="helpId" placeholder="Ej: Henrry1">
              
                <input type="number" hidden
                  class="form-control"  name="tp" id="tp" aria-describedby="helpId" placeholder="Ej: Henrry1">
              
              <div class="mb-3" id="divINput">
                <label for="usuario" class="form-label" id="titleLabel">Nombre de Usuario o Apodo: </label>
                <input type="text"
                  class="form-control" name="usuario" id="usuario" aria-describedby="helpId" placeholder="Ej: Henrry1">
              </div>

              <div class="w-100 d-flex" id="divINput">
                <div class="mb-3">
                  <label for="nombres" class="form-label" id="titleLabel">Nombres: </label>
                  <input type="text"
                    class="form-control" name="nombres" id="nombres"  placeholder="Ej: Carlos andres">
                </div>
    
                <div class="mb-3 l-3" id="divINput">
                  <label for="apellidos" class="form-label" id="titleLabel">Apellidos: </label>
                  <input type="text"
                    class="form-control" name="apellidos" id="apellidos" aria-describedby="helpId" placeholder="Ej: De la hoz">
                </div>
              </div>

              <div class="mb-3" id="select-id">
                <label for="documento" class="form-label" id="titleLabel">Documento de identidad:</label>
                <div class="d-flex" id="">
                    <select name="tipo_Documento" id="tipo_Documento" value="tipo Documento" class="text-body">
                      <?php foreach($tipoDoc as $row ) { ?>
                          <option class="text-body" value="<?= $row['id_parametro_det']?>"><?= $row['resumen']?></option>
                      <?php } ?>
                    </select>
                    <input type="text"
                    class="form-control" name="num_documento" id="num_documento" aria-describedby="helpId" placeholder="Ej: 1048264444"/>
                </div>
              </div>

              <label for="">Emails: </label>
              <div class="d-flex w-100 h-100 align-items-center">
                <select class="text-body p-2">
                    <?php foreach($prioridad as $row ) { ?>
                        <option class="text-body" value="<?= $row['id_parametro_det']?>"><?= $row['resumen']?></option>
                    <?php } ?>
                  </select>
                  <select class="text-body p-2">
                      <?php foreach($emails as $row ) { ?>
                          <option class="text-body" value="<?= $row['id_email']?>"><?= $row['email']?></option>
                      <?php } ?>
                    </select>
                  <button type="button" onclick="" class="btn btn-danger m-1">-</button>
                  <button type="button" onclick="agregarRegistro('email')" class="btn btn-warning">+</button>
                </div>
                
                <label for="">Telefonos: </label>
                <div class="d-flex w-100 h-100 align-items-center">
                  <select class="text-body p-2">
                    <?php foreach($prioridad as $row ) { ?>
                      <option class="text-body" value="<?= $row['id_parametro_det']?>"><?= $row['resumen']?></option>
                      <?php } ?>
                    </select>
                    <select class="text-body p-2">
                      <?php foreach($telefonos as $row ) { ?>
                        <option class="text-body" value="<?= $row['id_telefono']?>"><?= $row['numero']?></option>
                        <?php } ?>
                    </select>
                    <button type="button" onclick="" class="btn btn-danger m-1">-</button>
                    <button type="button" onclick="agregarRegistro('telefono')" class="btn btn-warning">+</button>
              </div>


        
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" id="btn-del">Cancelar</button>
              <button type="submit" class="btn btn-primary" id="btn-agg">Actualizar</button>
            </div>

          </form>
          <!-- fin Formulario -->
        </div>
      </div>
    </div>
    <!-- fin modal -->

        </div>
    </div>

    </div>
</div>


<script>

var inputOldPass = document.querySelector('#old_pass');
var inputNewPass = document.querySelector('#new_pass');

  /* Cambiar clave */
  function verificarCampos() {

    let oldPass = inputOldPass.value;
    let newPass = inputNewPass.value;

    if( oldPass.length <= 1  || newPass.length <= 1  ) {
      return false;
    }
  }                   

  const estadopass = "<?= $misDatos->estado_perfil_pass?>";
  if( estadopass === 'true' ) {
    Swal.fire({
      title: 'Contraseña actualizada',
      text: 'Se ha actualizado la contraseña correctamente',
      confirmButtonText: 'Aceptar'
    })

  }else if( estadopass === 'false' ) {
    Swal.fire({
      title: 'Error al actualizar contraseña',
      text: 'La contraseña antigua no es la correcta, intentelo nuevamente',
      confirmButtonText: 'Aceptar'
    })

  }

  /* Fin cambiar clave */

var inputTp = document.querySelector('#tp');
var inputUsuario = document.querySelector('#usuario');
var inputNombres = document.querySelector('#nombres');
var inputTelefono = document.querySelector('#telefono');
var inputEmail = document.querySelector('#email');
var inputApellidos = document.querySelector('#apellidos');
var inputTipoDoc = document.querySelector('#tipo_Documento');
var inputNumDoc = document.querySelector('#num_documento');

var labelInputs = document.querySelectorAll('#titleLabel');

var selectDiv = document.querySelector('#select-id');


function mostrarDatos( id ) {

  $.ajax({
      url: "<?= base_url("perfil/traer_informacion")?>",
      type: "GET",
      dataType: "json",
      success: function ( data ) {
          // console.log(data);
          
          inputTp.value = 1
          inputUsuario.value = data['usuario'];
          inputNombres.value = data['nombre'];
          inputApellidos.value = data['apellido'];
          // inputApellidos.value = data['apellido'];
          inputNumDoc.value = data['num_documento'];
      }
  })

}


function agregarRegistro(tipo) {

  if( tipo === 'email') {


  }else if( tipo === 'telefono') {
   
  
  }

}


</script>

<?= $this->endSection('contenido')?>