<?=$this->extend("Layouts/authLayout")?>
<?= $this->section("contenido")?>

        <div class="recuperarPass__container">
            <div class="recuperarPass__form">

                <form onsubmit="return enviarForm()" action="<?= base_url("auth/enviar_token_pass")?>" method="post" class="form-control" id="formulario">
                
                    <h1 class="text-center mb-4" id="titulo">Recuperar contraseña</h1>

                    <label for="Nueva contraseña" id="label">Ingrese el correo electronico:</label>
                    <input required type="email" name="email" id="email" class="form-control">
                    
                    <input type="text" hidden id="id_usuario" name="id_usuario">
                    
                    <button id="btn" type="submit" class="btn btn-success" class="recuperarPass_btn">Enviar</button>
                    
                </form>
            </div>
        </div>

<script>

//referencias HTML
let tituloH1 = document.querySelector('#titulo');
let labelInput = document.querySelector('#label');
let input = document.querySelector('#email');
let btn = document.querySelector('#btn');
let inputIdUsuario = document.querySelector('#id_usuario');


//Validar formulario
function enviarForm() {
    if( input.length <= 5  ) {
        Swal.fire('Error de caracteres', 'Debe tener 5 caracteres como minimo', 'info', 'Ok')
        return;
    }
}

</script>


<script>

//Si el correo ingresado no existe en la BD
const estado_existe_email = "<?= $session->no_existe_email?>";

if( estado_existe_email === 'error') {
    Swal.fire('Error al recuperar contraseña', 'El correo ingresado no existe', 'error', 'Ok');
}

//Si hubo un error al enviar el token
const estado_recuperar_pass = "<?= $session->error_recuperar_pass?>";

if( estado_recuperar_pass === 'false') {
    Swal.fire('Error al recuperar contraseña', 'Hubo un error con el servidor, por favor intentelo nuevamente', 'info', 'Aceptar');
}


//Mensaje al usuario si se manda el token correctamente al email o lo contrario
const estado_token_enviado = "<?= $session->token_enviado?>";
if( estado_token_enviado === 'true' ) {
    Swal.fire('Revise su correo electronico', 'Se le ha enviado un mensaje con todas las instrucciones a su correo', 'info', 'Aceptar');
    
}else if( estado_token_enviado === 'false' ) {
    Swal.fire('Error al recuperar', 'Hubo un error con el servidor, intentolo mas tarde', 'error', 'Aceptar');
}


//Si se verifico el token correctamente por URL
const id_usuario_token = "<?= $session->id_usuario?>";

if( id_usuario_token ) {
    

    tituloH1.innerText = 'Escriba una nueva contraseña';
    labelInput.innerText = 'Nueva contraseña';
    input.placeholder = '*******';
    input.id = 'nuevaPass';
    input.name = 'nuevaPass';
    input.type = 'password';
    btn.innerText = 'Guardar';

    //darle el valor del id del usuario
    inputIdUsuario.value = id_usuario_token;

}




</script>

<?= $this->endSection("contenido")?>


