<body class="login__body">

    <!-- Animacion fondo -->
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
            <form class="login__form" action="<?= base_url('Auth/login')?>" method="POST">
                <div class="login__input-container">
                    <label class="login__form-input-label" for="email">Correo electronico: </label>
                    <img src="<?= base_url("icons/envelope-fill.svg")?>" class="login__form-icon">
                    <input placeholder="Ej: correo@gmail.com" name="username" type="text"
                        class="login__form-input-field" id="username">
                </div>

                <div class="login__input-container">
                    <label class="login__form-input-label" for="password">Contraseña: </label>
                    <img src="<?= base_url("icons/person-fill-lock.svg")?>" class="login__form-icon">
                    <input placeholder="Ej: **********" name="password" type="text" class="login__form-input-field"
                        id="password">
                </div>
                <div class="login__form-footer">
                    <a data-bs-toggle="modal" data-bs-target="#recuperarModal" href="#">
                        ¿Has olvidado tu contraseña?
                    </a>
                    <button class="login__btn-submit" type="submit">Entrar</button>
                </div>
                <div class="login__form-register">
                    <p><strong>¿No te has registrado aún?</strong></p>
                    <a class="" href="<?php echo base_url('/registro'); ?>">Crear mi cuenta!</a>
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
                                    <p> Si haz olvidado la contraseña ingresar el correo electronico para restablecerla.
                                    </p>
                                    <input type="email" class="form-control" id="floatingInput"
                                        placeholder="name@example.com">
                                    <label for="floatingInput"></label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                                <button type="Submit" class="btn btn-success">Enviar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
    </div>


    </div>