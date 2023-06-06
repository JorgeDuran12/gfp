
<?= $this->extend("layouts/gfpLayout")?>

 <?= $this->section("contenido")?>

 <div class="titulo">
     <h3><img class="img" src="<?= base_url("img/emergen.png")?>"> Fondo De Emergencia</h3>
 </div>

 <div class="contenedorEmergencia">
     <!-- fecha de creacion del registro -->
     <form method="POST" action="<?php echo base_url('/emergencia/insertar'); ?>" autocomplete="off">

         <div class="emergencia">
             <div class="input-group mb-3 ss">
                 <span class="input-group-text" id="inputGroup-sizing-default">

                     <img src="<?= base_url("icons/question-circle-fill.svg")?>"
                         title="El usuario ingresa la fecha para determinar el día mensual en que se realizará el descuento correspondiente de su presupuesto actual, destinado al fondo de emergencia."
                         class="icono_emergencia">Fecha de inicio de ahorro para el fondo de emergencia</span>
                 <input type="date" class="ss input_fecha__emergencia" aria-label="Sizing example input"
                     aria-describedby="inputGroup-sizing-default" id="fecha_registro" name="fecha_registro" required>
             </div>
         </div>
         <!-- fin del codigo de fecha creacion -->
         <div class="p_emergencia">
             <div class="emergencia_container_form">
                 <div class="form_container__emergencia">
                     <input type="number" class="emergencia__input" name="emergencia__valor" id="emergencia__valor" required>
                 </div>
            </div>
<button class="btn btn-success regresar_Btn" type="submit">Enviar</button>
             
</form>

 <?= $this->endSection("contenido")?>