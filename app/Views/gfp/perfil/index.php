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
            
            <h3 class="mb-3 text-white fw-bold text-uppercase">Información Basica</h3>
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
            <!-- Boton editar info basica -->
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalPerfil" onclick="mostrarDatos()">
              <img type="image" src="<?= base_url("img/editar.png")?>" />
            </button>

            <h3 class="mt-5 mb-3 text-white fw-bold text-uppercase">Información de Contacto</h3>
            <ul class="d-flex">
                <li>TELEFONO PRINCIPAL:</li>
                  <span><?= $DatosPerfil['telefono']?></span>
            </ul>
            
            <ul class="d-flex">
                <li>CORREO ELECTRONICO PRINCIPAL:</li>
                <span><?= $DatosPerfil['email']?></span>
            </ul>
            <!-- Boton editar info basica -->
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalContacto" onclick="mostrarDatos()">
              <img type="image" src="<?= base_url("img/editar.png")?>" />
            </button>

            <h3 class="mt-5 mb-3 text-white fw-bold text-uppercase">Cambiar contraseña</h3>
            <form action="<?= base_url("cambiar_clave")?>" method="post" onsubmit="return verificarCampos()" class="d-flex flex-column">
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
            <form  class="d-flex flex-column" id="datosFormulario" action="<?= base_url("perfil/editar_informacion")?>" method="POST" onsubmit="return validateForm()">

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
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger"   id="btn-del"  data-bs-dismiss="modal">Cancelar</button>
              <button type="submit" class="btn btn-primary" id="btn-agg">Actualizar</button>
            </div>

          </form>
          <!-- fin Formulario -->
        </div>
      </div>
    </div>
     







    <!-- fin modal -->

    <!-- Modal contacto -->
  <div class="modal fade" id="modalContacto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
            <form  class="d-flex flex-column" method="post" action="<?= base_url("perfil/editar_informacion_contacto")?>">
                <input type="text" hidden
                  class="form-control"  name="id_telefono_pr" id="id_telefono_pr" aria-describedby="helpId" placeholder="Ej: pass"/>
                <input type="text" hidden
                  class="form-control"  name="id_email_pr" id="id_email_pr" aria-describedby="helpId" placeholder="Ej: correo"/>

              <label for="emails">Emails:</label>
                <div class="d-flex w-100 h-100 align-items-center mb-3">
                    <select class="text-body p-2" id="emails" name="emails">
                      <option value="">Seleccione un valor</option>
                      <?php foreach($emails as $row ) { ?>
                        <!-- <option class="text-body" value="">Elija un correo</option> -->
                        <option class="text-body" value="<?= $row['email']?>"><?= $row['email']?></option>
                        <?php } ?>
                    </select>
                    <button type="submit" class="btn btn-primary " id="btnPrincipal1">Establecer como principal</button>
                    <button type="button" onclick="agregarRegistro('email')" class="btn btn-warning">Nuevo</button>
                </div>
                
                <label for="telefonos">Teléfonos:</label>
                <div class="d-flex w-100 h-100 align-items-center">
                  <select class="text-body p-2" id="telefonos" name="telefonos">
                  <option value="">Seleccione un valor</option>
                    <?php foreach($telefonos as $row ) { ?>
                      <!-- <option class="text-body" value="">Elija un telefono</option> -->
                      <option class="text-body" value="<?= $row['numero']?>">
                      <?= $row['numero']?>
                    </option>
                      <?php } ?>
                    </select>
                    <button type="submit" class="btn btn-primary"  id="btnPrincipal2">Establecer como principal</button>
                    <button type="button" onclick="agregarRegistro('telefono')" class="btn btn-warning">Nuevo</button>
                </div>


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

var inputIdTelefonoPrincipal = document.querySelector('#id_telefono_pr');
var inputIdEmailPrincipal = document.querySelector('#id_email_pr');

var inputUsuario = document.querySelector('#usuario');
var inputNombres = document.querySelector('#nombres');
var inputTelefono = document.querySelector('#telefono');
var inputEmail = document.querySelector('#email');
var inputApellidos = document.querySelector('#apellidos');
var inputTipoDoc = document.querySelector('#tipo_Documento');
var inputNumDoc = document.querySelector('#num_documento');

var labelInputs = document.querySelectorAll('#titleLabel');

var selectDiv = document.querySelector('#select-id');


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
  
  
  
  function mostrarDatos( tp ) {

    $.ajax({
      url: "<?= base_url("perfil/traer_informacion")?>",
      type: "GET",
      dataType: "json",
      success: function ( data ) {
        console.log(data);
        
        inputUsuario.value = data['usuario'];
        inputNombres.value = data['nombre'];
        inputApellidos.value = data['apellido'];
        inputNumDoc.value = data['num_documento'];
        inputTipoDoc.value = data['tipo_documento'];
        
        inputIdTelefonoPrincipal.value = data['id_telefono'];
        inputIdEmailPrincipal.value = data['id_email'];
        
      }
    })
    
  }
    
  /* AGREGAR TELEFONOS O EMAIL */
  function agregarRegistro( agregar ) {
    if( agregar === 'telefono' ) {
      
      const tp = 1;
      
      $("#modalContacto").modal('hide')
      Swal.fire({
      title: `Ingrese un ${agregar} nuevo`,
      input: 'text',
      inputLabel: 'Ingrese un telefono valido',
      inputPlaceholder: 'Ej: 3238906836',
      showCancelButton: true,
      confirmButtonText: 'Guardar',
      showLoaderOnConfirm: true,
      preConfirm: (tel) => {

        if( tel.length === 10 ) {
          return fetch(`http://localhost/gfp/public/perfil/agregar_tel_email/${tel}/${tp}`)
          .then(response => {
            if( response.status == 400 ) {
              throw new Error('Telefono ya existente');
              return false;
            }
            //Si la respuesta es correcta

          })
          .catch(error => {
            Swal.showValidationMessage(
              `${error}`
            )
          })
        }else {
          Swal.fire('Error al agregar', 'La longitud debe ser de 10 caracteres', 'info', 'Aceptar')
          $("#modalContacto").modal('show')
          return false;
        }

      },
      allowOutsideClick: () => !Swal.isLoading()
    })
    .then(result => {
      if( result.isConfirmed ) {
        Swal.fire('Telefono agregado', 'Se agrego el telefono correctamente', 'success', 'Ok');
        // $("#modalPerfil").modal('reload');
          $("#modalContacto .modal-body").load(location.href + ' #modalContacto .modal-body');
          $("#modalContacto").modal('show');
      }else {

        $("#modalContacto").modal('show');
        
      }
    })


  }else if( agregar === 'email' ) {

    const tp = 2;

$("#modalContacto").modal('hide')
Swal.fire({
  title: `Ingrese un ${agregar} nuevo`,
  input: 'email',
  inputLabel: 'Ingrese un correo valido',
  inputPlaceholder: 'Ej: micorreo@correo.com',
  showCancelButton: true,
  confirmButtonText: 'Guardar',
  showLoaderOnConfirm: true,
  preConfirm: (tel) => {

    if( tel.includes('@') ) {
      return fetch(`http://localhost/gfp/public/perfil/agregar_tel_email/${tel}/${tp}`)
      .then(response => {
        if( response.status == 400 ) {
          throw new Error('Email ya existente');
        }
        //Si la respuesta es correcta


      })
      .catch(error => {
        Swal.showValidationMessage(
          `${error}`
        )
      })
    }else {
      Swal.fire('Error al agregar', 'Formato de correo incorrecto', 'info', 'Aceptar')
      $("#modalContacto").modal('show')
      return false;
    }

  },
  allowOutsideClick: () => !Swal.isLoading()
})
.then(result => {
  if( result.isConfirmed ) {
    Swal.fire('Correo agregado', 'Se agrego el correo correctamente', 'success', 'Ok');
    // $("#modalPerfil").modal('reload');
      $("#modalContacto .modal-body").load(location.href + ' #modalContacto .modal-body');
      $("#modalContacto").modal('show');
  }else {

    $("#modalContacto").modal('show');
    
  }
})

  }
}



/*  */

$("#telefonos").change(function() {
  let valor =  $(this).val();
  valor = valor.split("");

  if( valor.length === 10 ) {

    $("#emails").prop('disabled', true);
    $("#btnPrincipal1").prop('disabled', true);
  }else {
    
    $("#emails").prop('disabled', false);
    $("#btnPrincipal1").prop('disabled', false);
  }
})
/*  */

$("#emails").change(function() {
  let valor =  $(this).val();
  valor = valor.split("");

  if( valor.length > 1 ) {

    $("#telefonos").prop('disabled', true);
    $("#btnPrincipal2").prop('disabled', true);
  }else {
    
    $("#telefonos").prop('disabled', false);
    $("#btnPrincipal2").prop('disabled', false);
  }
})


</script>


<?= $this->endSection('contenido')?>