 <?= $this->extend("layouts/gfpLayout")?>

 <?= $this->section("contenido")?>

 <div class="titulo">
     <h3><img class="img" src="<?= base_url("img/emergen.png")?>"> Fondo De Emergencia</h3>
 </div>

 <div class="contenedorEmergencia">
     <!-- fecha de creacion del registro -->
     <form class="emergencia">
         <div class="input-group mb-3 ss">
             <span class="input-group-text" id="inputGroup-sizing-default">
                 <img src="<?= base_url("icons/question-circle-fill.svg")?>"
                     title="En esta opcion debera digitalizar el dia del mes donde el aplicativo debera descontar de la disponibilidad de la cuota para el saquito"
                     class="icono_emergencia">Fecha inicial</span>
             <input type="date" class="ss input_fecha__emergencia" aria-label="Sizing example input"
                 aria-describedby="inputGroup-sizing-default">
     </form>
 </div>
 <!-- fin del codigo de fecha creacion -->

 <div class="emergencia_container_form">

     <form action="" method="post" class="form_container__emergencia">
         <input type="number" class="emergencia__input" name="emergencia__valor" id="emergencia__valor">
     </form>

     <div class="a_emergencia__">

         <a href="#" class="btn btn-success ancla_emergencia">Guardar</a>

         <a class="btn btn-warning ancla_emergencia" href="#" width="16" height="16">
             <img class="image" src="<?= base_url("img/editar.png") ?> " title="Editar">
         </a>

         <a class="btn btn-danger ancla_emergencia" href="#" width="16" height="16" title="Elimina Registro">
             <img class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar">
         </a>
     </div>

 </div>


 </div>
 </div>

 <?= $this->endSection("contenido")?>