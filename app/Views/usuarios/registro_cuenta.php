<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= base_url("/css/login/registro.css")?>">
    <title>Registro</title>
</head>
<body>
<div>

<form class="form_container">

  <div class="logo_container">
      <img src="<?= base_url("../img/gfp.png");?>" alt="logo_gfp">
  </div>
  <div class="title_container">
    
    <p class="title"> <?= $tituloPag?> </p>
    <span class="subtitle"> <strong>Fortalece tu bolsillo, controla tu futuro: ¡Gestiona tus finanzas hoy!</strong> </span>
  </div>

  <div class="input_container">
    <label class="input_label" for="email_field">Nombre</label>
    <img src="<?= base_url("icons/person-fill.svg")?>" class="icon">
    <input placeholder="Daniel" name="input-name" type="text" class="input_field" id="nombre">
  </div>

  <div class="input_container">
    <label class="input_label" for="email_field">Apellidos</label>
    <img src="<?= base_url("icons/person-lines-fill.svg")?>" class="icon">
    <input placeholder="Banquet" name="input-name" type="text" class="input_field" id="apellido">
  </div>

  <div class="input_container">
    <label class="input_label" for="email_field">Tipo de documento</label>

        <div class="input-group mb-3">
          <button class="btn btn-outline-secondary dropdown-toggle input_field" type="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</button>
          <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">Separated link</a></li>
          </ul>
          <input type="text" class="form-control input_field" aria-label="Text input with dropdown button">
    </div>
  </div>

  <div class="input_container">
    <label class="input_label" for="email_field">Nombre de usuario</label>
    <img src="<?= base_url("icons/person-check-fill.svg")?>" class="icon">
    <input placeholder="Daniel" name="input-name" type="text" class="input_field" id="usuario">
  </div>

  <div class="input_container">
    <label class="input_label" for="email_field">Teléfono</label>
    <img src="<?= base_url("icons/telephone-fill.svg")?>" class="icon">
    <input placeholder="309 156 9347" name="input-name" type="text" class="input_field" id="telefono">
  </div>

  <div class="input_container">
    <label class="input_label" for="email_field">Correo electronico</label>
    <img src="<?= base_url("icons/envelope-fill.svg")?>" class="icon">
    <input placeholder="name@mail.com"  name="input-name" type="text" class="input_field" id="email">
  </div>

  <div class="input_container">
    <label class="input_label" for="password_field">Contraseña</label>
    <img src="<?= base_url("icons/person-fill-lock.svg")?>" class="icon">
    <input placeholder="Contraseña" name="input-name" type="password" class="input_field" id="password">
  </div>
 
  <div class="input_container">
    <label class="input_label" for="email_field">Confirmar contraseña</label>
    <img src="<?= base_url("icons/shield-lock-fill.svg")?>" class="icon">
    <input placeholder="Validar contraseña" name="input-name" type="text" class="input_field" id="valid_password">
  </div>

  <!-- <button title="Sign In" type="submit" class="sign-in_btn">
    <span>Crear cuenta</span>
  </button> -->
</form>

</body>
</html>