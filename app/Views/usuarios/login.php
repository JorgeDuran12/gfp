
<body class="login__body"></body>

<!-- Animacion fondo -->
<div class="login__area">
    <ul class="login__circles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
    
<div class="login__context">
    <div class="login__container">

        <div class="login__logo-container">
            <img src="<?= base_url("../img/gfp.png");?>" alt="logo_gfp">
        </div>
        
        <div class="login__title-container">
            <p class="login__title-text">Iniciar sesión</p>
            <span class="login__subtitle-text"> <strong>Fortalece tu bolsillo, controla tu futuro: ¡Gestiona tus finanzas hoy!</strong> </span>
        </div>

        <form action="#" class="login__form">
        <div class="login__input-container">
            <label class="login__form-input-label" for="email">Correo electronico: </label>
            <img src="<?= base_url("icons/envelope-fill.svg")?>" class="login__form-icon">
            <input placeholder="Ej: correo@gmail.com" name="input-name" type="text" class="login__form-input-field" id="apellido">
        </div>

        <div class="login__input-container">
            <label class="login__form-input-label" for="password">Contraseña: </label>
            <img src="<?= base_url("icons/person-fill-lock.svg")?>" class="login__form-icon">
            <input placeholder="Ej: **********" name="input-name" type="text" class="login__form-input-field" id="usuario">
        </div>
        <div class="login__form-footer">
            <a href="" >
                ¿Has olvidado tu contraseña?
            </a>
            <button class="login__btn-submit">Entrar</button>
        </div>
        </form>
    </div>
    <div class="login__background-content">
        asds
    </div>
</div>

</div>
</body>

