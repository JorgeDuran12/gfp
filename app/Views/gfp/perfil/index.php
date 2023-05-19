<?= $this->extend('layouts/gfpLayout')?>
<?= $this->section('contenido')?>

<div class="perfil__container">

    <div class="perfil__carta">
        <div class="perfil__img">
    <h1>
        Administracion de perfil
    </h1>        
    </div>

    <div class="ubicacion">
        <img src="<?= base_url("img/perfil.png")?>" alt="iconoPerfil" class="perfil__icono">

    </div>
        
        <div class="perfil__informacion">
            <ul>
                    <li class="fw-bold fs-4">Nombre de usuario: <span class="fw-normal"><?= $DatosPerfil['usuario']?></span> </li>
                    <li class="fw-bold fs-4">Nombres: <span class="fw-normal"><?= $DatosPerfil['nombre']?></span> </li>
                    <li class="fw-bold fs-4">Apellidos: <span class="fw-normal"><?= $DatosPerfil['apellido']?></span> </li>
                     <li class="fw-bold fs-4">Documento: <span class="fw-normal"> 
                        <?= $DatosPerfil['pf_tp']?>
                         - <?= $DatosPerfil['num_documento']?></span> 
                    </li>
                        <li class="fw-bold fs-4">Rol actual: <span class="fw-normal"><?= $DatosPerfil['rol_nombre']?></span> </li>
                        <li class="fw-bold fs-4">Email: <span class="fw-normal"> <?= $DatosPerfil['email']?> </span> </li>
                        <li class="fw-bold fs-4">Telefono: <span class="fw-normal"> <?= $DatosPerfil['telefono']?> </span> </li>
            </ul>

        </div>

    </div>
</div>


<?= $this->endSection('contenido')?>