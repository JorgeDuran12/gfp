<?=$this->extend("Layouts/authLayout")?>
<?= $this->section("contenido")?>

        <div class="recuperarPass__container">
            <div class="recuperarPass__form">

                <form action="<?= base_url("auth/enviar_token_pass")?>" method="post" class="form-control" id="formulario">
                
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


const usuarioId = "<?= $session->usuarioId?>";
// console.log(usuarioId)

// const status = "<?= $session->statusRecuperarPass?>";
// console.log(status);

    if(usuarioId) {

        Swal.fire({
            'title': 'Ingrese el codigo enviado',
            'text': 'Se le ha enviado un codigo al correo ingresado',
            'input': 'text',
            'inputAttributes': {
            'autocapitalize': 'off'
            },
            'showCancelButton': true,
            'confirmButtonText': 'Enviar',
            'cancelButtonText': 'Cancelar',
            'showLoaderOnConfirm': true,
            'preConfirm': ( token ) => {
                return fetch("<?= base_url("auth/verificar_token")?>" + "/" + usuarioId + "/" + token )
                .then(response => {
                    if (!response.ok) {
                    throw new Error(response.statusText)
                    }
                    return usuarioId
                   
                })
                .catch(error => {
                    Swal.showValidationMessage(
                    `Token no valido: ${error}`
                    )
                    // return false;
                })
            },
            allowOutsideClick: () => !Swal.isLoading()
        }).then((result) => {
            
            // console.log(result);

            if( result.isConfirmed ) {
                tituloH1.innerText = 'Escriba una nueva contraseña';
                labelInput.innerText = 'Nueva contraseña';
                input.placeholder = '*******';
                input.id = 'nuevaPass';
                input.name = 'nuevaPass';
                input.type = 'password';
                btn.innerText = 'Guardar';

                 //darle el valor del id del usuario
                inputIdUsuario.value = result.value;

                
            }

        })


        
    }

</script>

<?= $this->endSection("contenido")?>


