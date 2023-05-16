<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="author" content="Santiago Guerrero, Daniel Banquet, Jorge Duran, Maria Jose, Carlos de las salas">
    <meta name="description" content="Sin descripcion por ahora...">
    <!-- Estilos Bootstrap -->
    <link rel="stylesheet" href="<?= base_url('bootstrap/bootstrap.min2.css') ?>">
    <link rel="stylesheet" href="<?= base_url('bootstrap/bootstrap-icons.css') ?>">

    <!-- Scripts Bootstrap -->
    <script src="<?= base_url('bootstrap/bootstrap.min.js') ?>"></script>
    <script src="<?= base_url('bootstrap/popper.min.js') ?>"></script>
    <script src="<?= base_url('bootstrap/bootstrap.bundle.min.js') ?>"></script>
    <script src="<?= base_url('js/jquery-3.6.0.js') ?>"></script>
    

    <!-- Todos los estilos -->
    <link rel="stylesheet" href="<?= base_url("/css/layouts/authLayout2.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/usuarios/loginStyles9.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/usuarios/register8.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/usuarios/recuperarcontra2.css")?>">
    <link rel="stylesheet" href="<?= base_url('css/footer/footerStyles.css') ?>">
    
    <!-- Sweetalert -->
    <script src="<?= base_url("sweetalert/sweetalert2@11.js")?>"></script>

    <title><?= $tituloPagina ?></title>
    
</head>

<body class="authLayout__container">
        
        <?= $this->renderSection('contenido') ?>    
            
        <footer class="footer__container">
            <?= view('componentes/footer')?>
        </footer>
</body>
</html>

