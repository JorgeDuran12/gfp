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
    <script src="<?= base_url('../js/jquery-3.6.0.js') ?>"></script>

    <!-- Scripts ChartJs -->
    
    
    <!-- Funciones javascript -->
    <script src="<?= base_url('helpers/chartjs.js') ?>"></script>

    <!-- Todos los estilos -->
    <link rel="stylesheet" href="<?= base_url('css/header/headerStyless.css') ?>">
    <link rel="stylesheet" href="<?= base_url('css/general/globalStyless.css') ?>">
    <link rel="stylesheet" href="<?= base_url('css/navbar/navStyless12.css') ?>">
    <link rel="stylesheet" href="<?= base_url('css/pagina/paginaStyle.css') ?>">
    <link rel="stylesheet" href="<?= base_url('css/footer/footerStyles3.css') ?>">
    <link rel="stylesheet" href="<?= base_url("/css/usuarios/recuperarcontra2.css")?>">
    <link rel="stylesheet" href="<?= base_url('css/principal/prrincipalStyles1.css') ?>">
    <link rel="stylesheet" href="<?= base_url("/css/agenda/pagoStylees.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/actividades/actividad.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/saquito/saquito1.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/saquito/progreso_saquito6.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/registro/movimiento3.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/agenda/pagoStyles.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/fullCalendar/fullCalendar.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/123/emergencia6.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/123/administrador.css")?>">
    <link rel="stylesheet" href="<?= base_url("/css/perfil/perfilStyles1.css")?>">

    <link rel="stylesheet" href="<?= base_url("/css/layouts/gfpLayout.css")?>">


    <!-- Full calendar JS-->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js'></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

    <!-- Sweealert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- gnerador de pdf -->
    
    <!-- DataTable -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
    <script src="<?= base_url('js/jquery-3.6.0.js') ?>"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
   
    
    <!-- Progress Bar -->
    <script src="<?= base_url("progressBar/progressbar.min.js")?>"></script>

</head>
<body class="body__container">
    <div class="body__content">
        
        <div class="navbar__container">
            <?= view('componentes/navbar')?>
        </div>
        
        <div class="page__container">
            <div class="contenido__container">
                <?= $this->renderSection('contenido') ?>          
            </div>   
        </div>
        
    </div>
    <footer class="footer__container">
        <?= view('componentes/footer')?>
     </footer>

</body>

</html>
