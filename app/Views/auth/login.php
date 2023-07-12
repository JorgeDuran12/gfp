
<?= $this->extend("layouts/authLayout")?>
<?= $this->section("contenido")?>

<div class="login__container">
    <div class="container__2">

        <div class="login__form-container">
            <div class="login__logo-container">
                <img src="<?= base_url("../img/gfp.png");?>" alt="logo_gfp">
            </div>

            <div class="login__title-container">
                <p class="login__title-text">Iniciar sesión</p>
                <span class="login__subtitle-text"> <strong>Fortalece tu bolsillo, controla tu futuro: ¡Gestiona tus
                        finanzas hoy!</strong> </span>
            </div>

            <br>

            <form id="formulario" method="POST" class="login__form" action="<?= base_url('AutenticarUsuario'); ?>">

                <div class="login__input-container">
                    <label class="login__form-input-label" for="email">Correo electronico: </label>
                    <img src="<?= base_url("icons/envelope-fill.svg")?>" class="login__form-icon">
                    <input placeholder="Ej: correo@gmail.com" name="email" type="email" class="login__form-input-field"
                        id="email" required>
                </div>

                <div class="login__input-container">
                    <label class="login__form-input-label" for="password">Contraseña: </label>
                    <img src="<?= base_url("icons/person-fill-lock.svg")?>" class="login__form-icon">
                    <input placeholder="Ej: **********" name="password" type="password" class="login__form-input-field"
                        id="password" required>
                </div>

                <div class="login__form-footer">

                    <div id="mensaje_error"></div>

                    <a href="<?= base_url("auth/Recuperar_Clave_Pagina")?>">
                        ¿Has olvidado tu contraseña?
                    </a>

                    <div class="contenedor__">
                        <button class="btn_login__a" type="submit">Entrar</button>
                    </div>
                    
                </div>

                <div class="login__form-register">

                    <p><strong>¿No te has registrado aún?</strong></p>
                    <a class="" href="<?php echo base_url('CrearCuenta'); ?>">Crear mi cuenta!</a>

                </div>
            </form>
        </div>
    </div>
</div>

<script>

$(document).ready(function() {
    $('#formulario').submit(function(event) {
        event.preventDefault();

        let email = $('#email').val();
        let password = $('#password').val();

        $.ajax({
            url: "<?= base_url('AutenticarUsuario'); ?>",
            type: 'POST',
            data: {
                email: email,
                password: password,
            },
            dataType: 'JSON',
            success: function(response) {
                // console.log(response);
                if (response.mensaje === '2') {
                    Swal.fire({
                title: 'ERROR!',
                text: 'el correo o la contraseña son incorrectos',
                icon: 'error',
                confirmButtonText: 'Ok'
            });
                } else if (response.mensaje === '3') {
                   
            Swal.fire({
                title: 'ERROR!',
                text: 'la cuenta no existe',
                icon: 'error',
                confirmButtonText: 'Ok'
            });
                } else {

                    if (response.id_rol === response.id_rol) {
                        setTimeout(function() {
                            window.location.href = "<?= base_url('principal') ?>";
                        }, 1000);
                    } 
                }
            },
            error: function() {
                alert("Error");
            }
        });
    });
});

</script>

<script>
/* Recuperar pass  (Alerta) */

const estado_recuperar_pass = "<?= $session->estado_recuperar_pass?>";
if( estado_recuperar_pass === 'true' ) {
    Swal.fire('Recuperación exitosa', 'La contraseña se ha recuperado correctamente', 'success', 'Aceptar');
}


</script>

<?= $this->endSection("contenido")?>