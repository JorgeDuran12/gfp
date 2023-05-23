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
            <!-- Editar informacion (Button) -->
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalPerfil" onclick="mostrarDatos(1)">
                <img type="image" src="<?= base_url("img/editar.png")?>" />
            </button>
            
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
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalPerfil" onclick="mostrarDatos(2)">
                <img type="image" src="<?= base_url("img/editar.png")?>" />
            </button>

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
            <form class="d-flex flex-column" id="datosFormulario" action="<?= base_url("actualizar_perfil")?>" method="POST" onsubmit="return validateForm()">
                <input type="text" hidden
                  class="form-control"  name="id" id="id" aria-describedby="helpId" placeholder="Ej: Henrry1">
              
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

              <div class="mb-3">
                <label for="documento" class="form-label" id="titleLabel">Documento de identidad:</label>
                <div class="d-flex" id="divINput">
                    <select name="tipo Documento" id="tipo Documento" value="tipo Documento" class="text-body">
                        <option class="text-body" value="">C.C</option>
                        <option class="text-body" value="">C.E</option>
                        <option class="text-body" value="">T.I</option>
                        <option class="text-body" value="">P.E</option>
                    </select>
                    <input type="text"
                    class="form-control" name="num_documento" id="num_documento" aria-describedby="helpId" placeholder="Ej: 1048264444"/>
                </div>
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

var inputUsuario = document.querySelector('#usuario');
var inputNombres = document.querySelector('#nombres');
var inputApellidos = document.querySelector('#apellidos');
var inputTipoDoc = document.querySelector('#tipo Documento');
var inputNumDoc= document.querySelector('#num_documento');

var labelInputs = document.querySelectorAll('#titleLabel');


    function mostrarDatos( id ) {
        if( id === 1 ) {
            limpiarCampos( id );
            $.ajax({
                url: "<?= base_url("perfil/traer_informacion")?>",
                type: "GET",
                dataType: "json",
                success: function ( data ) {
                    console.log(data);

                    inputUsuario.value = data['usuario'];
                    inputNombres.value = data['nombre'];
                    inputApellidos.value = data['apellido'];
                    // inputApellidos.value = data['apellido'];
                    inputNumDoc.value = data['num_documento'];

                }
            })
        }else if( id === 2 ) {
            limpiarCampos( id )



        }
    }

    function limpiarCampos( id ) {

            if( id === 1 ) {
                inputUsuario.hidden = false;
                inputNombres.hidden = false;
                inputApellidos.hidden = false;
                inputNumDoc.hidden = false;

            }else {
                inputUsuario.hidden = true;
                inputNombres.hidden = true;
                inputApellidos.hidden = true;
                inputNumDoc.hidden = true;

                labelInputs.forEach((item, i) => {
                    item.innerText = '';
                    item.hidden = true;
                })

                // inputTipoDoc.innerHTML = '';
            }
    }
</script>

<?= $this->endSection('contenido')?>