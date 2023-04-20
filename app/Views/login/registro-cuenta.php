<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= base_url("/css/loginn/registro2.css")?>">
    <title>Registro</title>
</head>
<body>
<div>

<form class="form_container">

  <div class="logo_container">
      <img src="<?= base_url("../img/gfp.png");?>" alt="logo_gfp">
  </div>
  <div class="title_container">
    <p class="title">Nuevo usuario</p>
    <span class="subtitle"> <strong>Fortalece tu bolsillo, controla tu futuro: ¡Gestiona tus finanzas hoy!</strong> </span>
  </div>

  <div class="input_container">
    <label class="input_label" for="email_field">Nombre</label>

   

    <input placeholder="Daniel" name="input-name" type="text" class="input_field" id="nombre">
  </div>

  <div class="input_container">
    <label class="input_label" for="email_field">Apellidos</label>
   
    <input placeholder="Banquet" name="input-name" type="text" class="input_field" id="apellido">
  </div>

  <div class="input_container">
    <label class="input_label" for="email_field">Nombre de usuario</label>
    <img src="<?= base_url("icons/person-circle.svg")?>" class="icon">
    <input placeholder="Daniel" name="input-name" type="text" class="input_field" id="usuario">
  </div>

  

  <div class="input_container">
    <label class="input_label" for="email_field">Correo electronico</label>
   
    <input placeholder="name@mail.com"  name="input-name" type="text" class="input_field" id="email">
  </div>

  <div class="input_container">
    <label class="input_label" for="password_field">Contraseña</label>
    
    <input placeholder="Contraseña" name="input-name" type="password" class="input_field" id="password">
  </div>

  <div class="input_container">
    <label class="input_label" for="email_field">Confirmar contraseña</label>
   
    <input placeholder="Validar contraseña" name="input-name" type="text" class="input_field" id="valid_password">
  </div>

  <button title="Sign In" type="submit" class="sign-in_btn">
    <span>Crear cuenta</span>
  </button>
  
</form>

</div>
</div>
</div>

</body>
</html>