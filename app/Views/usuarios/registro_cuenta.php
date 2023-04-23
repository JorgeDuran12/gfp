<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= base_url("/css/usuarios/registro.css")?>">
    <title>Registro</title>
</head>
<body>

<div class="registro_cuenta">

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
  <select id="opcion" class="select">
    <option value="3" class="option">Opción 3</option>
      <option value="1" class="option">Opción 1</option>
      <option value="2" class="option">Opción 2</option>
  </select>
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

  <button title="Sign In" type="submit" class="sign-in_btn">
    <span>Crear cuenta</span>
  </button>
</form>



</body>
</html>