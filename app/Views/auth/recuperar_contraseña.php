<?=$this->extend("Layouts/authLayout")?>
<?= $this->section("contenido")?>

        <div class="recuperarPass__container">
            <div class="recuperarPass__form">

                <form action="<?= base_url("auth/enviar_token_pass")?>" method="post" class="form-control">
                
                    <h1 class="text-center mb-4" id="titulo">Recuperar contraseña</h1>

                    <label for="Nueva contraseña" id="label">Ingrese el correo electronico:</label>
                    <input required type="email" name="email" id="email" class="form-control">
                    
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


const EstadoTokenEnviado = "<?= $session->ok?>";

    if(EstadoTokenEnviado === '1' ) {
        tituloH1.innerText = 'Escriba una nueva contraseña';
        labelInput.innerText = 'Nueva contraseña';
        input.placeholder = '*******';
        btn.innerText = 'Guardar'
    }

</script>

<?= $this->endSection("contenido")?>


