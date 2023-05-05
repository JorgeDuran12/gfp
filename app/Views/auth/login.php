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
        <form method="POST" class="login__form" action="<?=base_url('AutenticarUsuario') ?>">
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
                <a data-bs-toggle="modal" data-bs-target="#recuperarModal" href="#">
                    ¿Has olvidado tu contraseña?
                </a>
                <div class="contenedor">
                <button class="btn btn-5" type="submit">Entrar</button>
                </div>
            </div>

            <div class="login__form-register">
                <p><strong>¿No te has registrado aún?</strong></p>
                <a class="" href="<?php echo base_url('CrearCuenta'); ?>">Crear mi cuenta!</a>
            </div>
        </form>

        <div class="modal fade" id="recuperarModal" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Recuperar Contraseña</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div>
                            <div class="tm">
                                <p><strong>¿Olvidaste tu contraseña? No hay problema, te enviaremos un enlace de
                                        restablecimiento a tu correo electrónico para que puedas recuperar tu acceso a
                                        nuestra plataforma</strong></p>
                                <input type="email" class="form-control" id="floatingInput"
                                    placeholder="Ej: name@example.com">
                                <!-- <label for="floatingInput"></label> -->
                            </div>
                        </div>
                        <div class="modal-footer bp">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                            <button type="Submit" class="btn btn-success enviar">Enviar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>




<?= $this->endSection("contenido")?>