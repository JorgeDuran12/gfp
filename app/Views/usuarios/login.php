
<body class="login__body">

<!-- Animacion fondo -->
<div class="login__container">
    <div class="login__form-container">
            <div class="login__logo-container">
                <img src="<?= base_url("../img/gfp.png");?>" alt="logo_gfp">
            </div>
            
            <div class="login__title-container">
                <p class="login__title-text">Iniciar sesión</p>
                <span class="login__subtitle-text"> <strong>Fortalece tu bolsillo, controla tu futuro: ¡Gestiona tus finanzas hoy!</strong> </span>
            </div>
    
            <form class="login__form" action="<?= base_url('Auth/login')?>" method="POST">
            <div class="login__input-container">
                <label class="login__form-input-label" for="email">Correo electronico: </label>
                <img src="<?= base_url("icons/envelope-fill.svg")?>" class="login__form-icon">
                <input placeholder="Ej: correo@gmail.com" name="username" type="text" class="login__form-input-field" id="username">
            </div>
    
            <div class="login__input-container">
                <label class="login__form-input-label" for="password">Contraseña: </label>
                <img src="<?= base_url("icons/person-fill-lock.svg")?>" class="login__form-icon">
                <input placeholder="Ej: **********" name="password" type="text" class="login__form-input-field" id="password">
            </div>
            <div class="login__form-footer">
                <a href="" >
                    ¿Has olvidado tu contraseña?
                </a>
                <br>
                <button class="login__btn-submit" type="submit">Entrar</button>
            </div>
            <div class="login__form-register">
                <p>No te has registrado aún?</p>
                <a class="btn btn-outline-warning"  href="<?php echo base_url('/registro'); ?>">Crear mi cuenta!</a>
            </div>
            </form>
            </div>
        </div>
    </div>

     
</div>