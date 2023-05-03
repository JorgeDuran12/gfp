<?=$this->extend("layouts/gfpLayout")?>

<?=$this->section("contenido")?>

<button 
type="button"
class="btn btn-danger"
id="agendaPago__btn" 
data-bs-toggle="modal" 
data-bs-target="#modalEvento">
+
</button>    

<div class="agendaPago__container">
  <!-- Agenda -->
  <div class="agendaPago__calendar">
    <div id="calendar"></div>
  </div>
  <!-- Fin Agenda -->

  <!-- Notas o resumen -->
  <div class="agendaPago__notas">
    
  </div>
  <!-- Fin notas o resumen -->

  <!-- Modal -->
  <div class="modal fade" id="modalEvento" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" id="agendaPago__modal-header">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <img src="<?= base_url("img/gfp.png")?>" alt="" class="w-25 p-3">
            <h3 class="modal-title" id="exampleModalLabel">Datos del evento</h3>
          </div>
          <div class="modal-body">
            <!-- Formulario -->
            <form action="<?= base_url("")?>" method="post" class="d-flex flex-column ">
              <div class="mb-3">
                <label for="id" class="form-label">ID: </label>
                <input type="text"
                  class="form-control"  name="id" id="id" aria-describedby="helpId" placeholder="Ej: 2">
              </div>
              
              <div class="mb-3">
                <label for="titulo" class="form-label">Titulo: </label>
                <input type="text"
                  class="form-control" name="titulo" id="titulo" aria-describedby="helpId" placeholder="Ej: Recordatorio">
              </div>

              <div class="w-100 d-flex">
                <div class="mb-3">
                  <label for="fecha" class="form-label">Fecha inicial: </label>
                  <input type="datetime-local"
                    class="form-control" name="fecha" id="fecha" aria-describedby="helpId" placeholder="Ej: año/mes/día">
                </div>
    
                <div class="mb-3 l-3">
                  <label for="fecha" class="form-label">Fecha final de pago: </label>
                  <input type="datetime-local"
                    class="form-control" name="fecha" id="fecha" aria-describedby="helpId" placeholder="Ej: año/mes/día">
                </div>
              </div>

              <div class="mb-3">
                <label for="descripcion" class="form-label">Descripcion:</label>
                <textarea class="form-control" name="descripcion" id="descripcion" rows="3"></textarea>
              </div>

              <div class="mb-3">
                <label for="color" class="form-label">Color: </label>
                <input type="color"
                  class="form-control" name="color" id="color" aria-describedby="helpId" placeholder="color">
              </div>
              
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Borrar este evento</button>
              <button type="submit" class="btn btn-primary" >Agregar</button>
            </div>

          </form>
          <!-- fin Formulario -->
        </div>
      </div>
    </div>
    <!-- fin modal -->


</div>






<script>

let modalEvento; 
  modalEvento = new bootstrap.Modal( document.getElementById('modalEvento'), { keyboard: false }); //Abrir modal cuando se de click en un evento.




// console.log(evento)
document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          locale: 'es', //Traducir al español el calendario
          headerToolbar: { //Etiquetas del header
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
          dateClick: function( event ) {
            // console.log( event )
            modalEvento.show();
          },  
          events: "http://localhost/gfp/public/listaDeEventos",
        });
        calendar.render();
      });




</script> 

<?=$this->endSection("contenido")?>