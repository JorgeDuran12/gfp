<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="<?= base_url("/css/loginn/login.css")?>">
</head>
<body class="login__body">

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

        <img src="<?= base_url('img/gfp.png')?>" alt="" class="login__logo">

        <form action="#" class="login__form">
            <div class="login__field">
                <input required="" type="text" class="input">
                <span class="span"></span>
                <label class="label">Correo: ej: micorreo@gmail.com</label>
            </div>

            <div class="login__field">
                <input required="" type="password" class="input">
                <span class="span"></span>
                <label class="label">Contraseña: ***********</label>
            </div>
            
            <div class="forgot-pass">
                <a href="#">¿Olvidaste la contraseña?</a>
            </div>

            <button class="button">ingresar</button>

            <div class="sign-up">
                No tienes cuenta ?
                <a href="#">Registrate</a>
            </div>
        </form>
    </div>
</div>

</div>
</body>

