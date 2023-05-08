<?= $this->extend("layouts/authLayout")?>

<?= $this->section("contenido")?>

<div class="rg_container">

    
    <form action="<?= base_url('Registrar');?>" class="form_container" method="POST">

        <div class="logo_container">
            <img src="<?= base_url("../img/gfp.png");?>" alt="logo_gfp">
        </div>
        
        
        <div class="title_container">
            <p class="title"> <?= $tituloPagina?> </p>
          pspspspspspspsp
            </div>
 <!-- <-----------------------valifacion de login super bonito------------------------------->


<?= $this->endSection("contenido")?>