<?= $this->extend("layouts/authLayout")?>
<?= $this->section("contenido")?>


<div class="login__container">
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
        <form method="POST" class="login__form" action="<?= base_url('AutenticarUsuario'); ?>">
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

                <a href="<?= base_url("auth/Recuperar_Clave_Pagina")?>">
                    ¿Has olvidado tu contraseña?
                </a>

                <div class="contenedor">
                    <button class="btn_login" type="submit">Entrar</button>
                    
                </div>
                
            </div>

            <div class="login__form-register">
                <p><strong>¿No te has registrado aún?</strong></p>
                <a class="" href="<?php echo base_url('CrearCuenta'); ?>">Crear mi cuenta!</a>
            </div>
        </form>
    </div>
</div>

<script>
/* 
function MostrarModal() {

Swal.fire({
  title: 'Restablecer Contraseña',
  input: 'email',
  inputLabel: 'Te enviaremos un enlace de restablecimiento de contraseña a tu correo electrónico para que puedas recuperar tu acceso a nuestra plataforma.',
  inputPlaceholder: 'Ej: name@example.com',
  heightAuto: false,
  customClass: {
    inputLabel: 'my-custom-class'
  },
  inputValidator: (value) => {
    if (!value) {
      return 'Por favor, ingresa el correo electrónico';
    } else if (!/\S+@\S+\.\S+/.test(value)) {
      return 'Correo electrónico inválido';
    }
  }
}).then((result) => {
  if (result.isConfirmed) {
    const email = result.value;
    Swal.fire(`El link de restablacimiento de contraseña llegara al correo: ${email}`);

    setTimeout(() => {
      window.location.href = 
    }, 1000)
  }
});

} */

</script>

<?= $this->endSection("contenido")?>