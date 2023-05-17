<?= $this->extend('layouts/gfpLayout')?>
<?= $this->section('contenido')?>

<div class="perfil__container">

    <div class="perfil__carta">
        <div class="perfil__img"></div>
        <img src="<?= base_url("icons/perfil1.png")?>" alt="iconoPerfil" class="perfil__icono">
        
        
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
                    <li class="fw-bold fs-4">Emails: <span class="fw-normal"> <?= session() -> email ?> </span> </li>
                    <li class="fw-bold fs-4">Telefonos: <span class="fw-normal"> <?= $dataTelefono['numero']?> </span> </li>
            </ul>

        </div>

    </div>
</div>


<?= $this->endSection('contenido')?>