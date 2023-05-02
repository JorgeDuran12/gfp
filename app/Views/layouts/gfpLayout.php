<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="author" content="Santiago Guerrero, Daniel Banquet, Jorge Duran, Maria Jose, Carlos de las salas">
    <meta name="description" content="Sin descripcion por ahora...">
    <!-- Estilos Bootstrap -->
    <link rel="stylesheet" href="<?= base_url('bootstrap/bootstrap.min.css') ?>">
    <link rel="stylesheet" href="<?= base_url('bootstrap/bootstrap-icons.css') ?>">

    <!-- Scripts Bootstrap -->
    <script src="<?= base_url('bootstrap/bootstrap.min.js') ?>"></script>
    <script src="<?= base_url('bootstrap/popper.min.js') ?>"></script>
    <script src="<?= base_url('bootstrap/bootstrap.bundle.min.js') ?>"></script>
    <script src="<?= base_url('js/jquery-3.6.0.js') ?>"></script>

    <!-- Scripts ChartJs -->
    
    <!-- Funciones javascript -->
    <script src="<?= base_url('helpers/chartjs.js') ?>"></script>

    <!-- Todos los estilos -->
    <link rel="stylesheet" href="<?= base_url('css/header/headerStyless.css') ?>">
    <link rel="stylesheet" href="<?= base_url('css/general/globalStyles.css') ?>">
    <link rel="stylesheet" href="<?= base_url('css/navbar/navvStyless.css') ?>">
    <link rel="stylesheet" href="<?= base_url('css/pagina/paginaStyle.css') ?>">
    <link rel="stylesheet" href="<?= base_url('css/footer/footerStyles.css') ?>">
    <link rel="stylesheet" href="<?= base_url('css/principal/principalStyles.css') ?>">
    <link rel="stylesheet" href="<?= base_url("/css/usuarios/loginStyles2.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/agenda/pagoStylees.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/registro/movimientoss.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/actividades/actividad.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/saquito/saquito1.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/registro/movimiento.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/agenda/pagoStyles.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/fullCalendar/fullCalendarr.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/123/123456.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/123/987654.css")?>">


    <!-- Full calendar -->
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.6/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/web-component@6.1.6/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.6/index.global.min.js'></script>

</head>

<body class="body__container">
    <div class="body__content">
        
        <div class="navbar__container">
            <?= view('componentes/navbar')?>
        </div>
        
        <div class="page__container">
            <header class="header__container">
                <?= view('componentes/header')?>
            </header>
            
            <div class="principal__container">
                <?= $this->renderSection('contenido') ?>

                <footer class="footer__container">
                    <?= view('componentes/footer')?>
                </footer>

            </body>
            </div>
        </div>

    </div>
            
</html>

