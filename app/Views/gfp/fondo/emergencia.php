
<?= $this->extend("layouts/gfpLayout")?>

 <?= $this->section("contenido")?>

 <div class="titulo">
     <h3><img class="img" src="<?= base_url("img/emergen.png")?>"> Fondo De Emergencia</h3>
 </div>

 <div class="contenedorEmergencia">
     <!-- fecha de creacion del registro -->

     <form action="<?= base_url(''); ?>" method="post">
         <div class="emergencia">
             <div class="input-group mb-3 ss">
                 <span class="input-group-text" id="inputGroup-sizing-default">
                     <img src="<?= base_url("icons/question-circle-fill.svg")?>"
                         title="El usuario ingresa la fecha para determinar el día mensual en que se realizará el descuento correspondiente de su presupuesto actual, destinado al fondo de emergencia."
                         class="icono_emergencia">Fecha de inicio de ahorro para el fondo de emergencia</span>
                 <input type="date" class="ss input_fecha__emergencia" aria-label="Sizing example input"
                     aria-describedby="inputGroup-sizing-default" required>
             </div>
         </div>
         <!-- fin del codigo de fecha creacion -->
         <div class="p_emergencia">
             <div class="emergencia_container_form">

                 <div class="form_container__emergencia">

                     <input type="number" class="emergencia__input" name="emergencia__valor" id="emergencia__valor" required>
                 </div>
             </div>

             <div class="a_emergencia__">
                 <button type="submit" class="btn btn-success ancla_emergencia">Guardar</button>
     </form>

     <a class="btn btn-warning ancla_emergencia" href="#" width="16" height="16">
         <img class="image" src="<?= base_url("img/editar.png") ?> " title="Editar">
     </a>

     <a class="btn btn-danger ancla_emergencia" href="#" width="16" height="16" title="Elimina Registro">
         <img class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar">
     </a>
 </div>
 </div>

 </div>


 <?= $this->endSection("contenido")?>