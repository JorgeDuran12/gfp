<?= $this->extend("layouts/authLayout")?>

<?= $this->section("contenido")?>

<div class="rg_container">

    
    <form action="<?= base_url('Registrar');?>" class="form_container" method="POST">

        <div class="logo_container">
            <img src="<?= base_url("../img/gfp.png");?>" alt="logo_gfp">
        </div>
        
        
        <div class="title_container">
            <p class="title"> <?= $tituloPagina?> </p>
            <span class="subtitle"> <strong>Fortalece tu bolsillo, controla tu futuro:
                Gestiona tus finanzas hoy</strong> </span>
            </div>
 <!-- <-----------------------valifacion de login super bonito------------------------------->



        <div class="input_container ">
            <label class="input_label" for="email_field">Nombre</label>
            <img src="<?= base_url("icons/person-fill.svg")?>" class="icon">
            <input placeholder="Ej: Daniel" name="nombre" type="text" class="input_field" id="nombre" required>
        </div>


  <!-- <-----------------------apellido------------------------------->

        <div class="input_container">
            <label class="input_label" for="email_field">Apellidos</label>
            <img src="<?= base_url("icons/person-lines-fill.svg")?>" class="icon">
            <input placeholder="Ej: Banquet" name="apellido" type="text" class="input_field" id="apellido" required>
        </div>
      <!-- <-----------------------tipo de documento------------------------------->

        <div class="input_container">
            <label class="input_label" for="email_field">Tipo de documento</label>
            <img src="<?= base_url("icons/person-vcard-fill.svg")?>" class="icon">
            <select class="select" name="tipo_documento" id="tipo_documento" aria-label="Default select example"
                required>
                <?php foreach ($parametros as $data) {?>
                <option value="<?php echo $data["id_parametro_det"]; ?>"><?php echo $data["nombre"];?></option>
                <?php } ?>
            </select>
        </div>
<!-- <-----------------------num de documento------------------------------->

        <div class="input_container">
            <label class="input_label" for="email_field">Numero de documento</label>
            <img src="<?= base_url("icons/person-video.svg")?>" class="icon">
            <input placeholder="Ej: 1007 265 547" name="num_documento" type="number" class="input_field"
                id="num_documento" required>
        </div>
 <!-- <-----------------------nombre de usuario------------------------------->

        <div class="input_container">
            <label class="input_label" for="email_field">Nombre de usuario</label>
            <img src="<?= base_url("icons/person-check-fill.svg")?>" class="icon">
            <input placeholder="Ej: Dani" name="usuario" type="text" class="input_field" id="usuario" required>
        </div>

<!-- <-----------------------telefono------------------------------->

        <div class="input_container">
            <label class="input_label" for="email_field">Teléfono</label>
            <img src="<?= base_url("icons/telephone-fill.svg")?>" class="icon">
            <input placeholder="Ej: 309 156 9347" name="telefono" type="number" class="input_field" id="telefono"
                required>
        </div>
<!-- <-----------------------contraseña------------------------------->

        <div class="input_container">
            <label class="input_label" for="password_field">Contraseña</label>
            <img src="<?= base_url("icons/person-fill-lock.svg")?>" class="icon">
            <input placeholder="Contraseña" name="password" type="password" class="input_field" id="password" required>
        </div>
<!-- <-----------------------confima contraseña------------------------------->

        <div class="input_container">
            <label class="input_label" for="email_field">Confirmar contraseña</label>
            <img src="<?= base_url("icons/shield-lock-fill.svg")?>" class="icon">
            <input placeholder="Validar contraseña" name="valid_password" type="password" class="input_field"
                id="valid_password" required>
        </div>
  <!-- <-----------------------correo------------------------------->


        <div class="input_container">
            <label class="input_label" for="email_field">Correo electronico</label>
            <img src="<?= base_url("icons/envelope-fill.svg")?>" class="icon">
            <input placeholder="Ej: correo@mail.com" name="email" type="email" class="input_field" id="email" required>
        </div>
        <div class="btn_container">
            <button type="submit" class="bnkl">
                <span class="span">Crear cuenta</span>
            </button>
            <div class="cuenta_register">
                <p><strong>¿Ya tienes cuenta?</strong> <a href="<?php echo base_url("/")?>">Iniciar sesión</a></p>
            </div>
        </div>
    </form>
</div>
<script>


</script>
<?= $this->endSection("contenido")?>