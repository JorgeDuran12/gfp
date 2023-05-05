<?= $this->extend("layouts/gfpLayout")?>

<?= $this->section("contenido")?>

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
            <h3 class="modal-title" id="modal-title">Nuevo recordatorio</h3>
          </div>
          <div class="modal-body">
            <!-- Formulario -->
            <form action="" method="" class="d-flex flex-column ">
              <div class="mb-3" style="display:none;">
                <label for="id" class="form-label">ID: </label>
                <input type="text" hidden
                  class="form-control"  name="id" id="id" aria-describedby="helpId" placeholder="Ej: 2">
              </div>
              
              <div class="mb-3">
                <label for="titulo" class="form-label">Titulo: </label>
                <input type="text"
                  class="form-control" name="titulo" id="titulo" aria-describedby="helpId" placeholder="Ej: Recordatorio">
              </div>

              <div class="w-100 d-flex">
                <div class="mb-3">
                  <label for="fechaInicio" class="form-label">Fecha inicial: </label>
                  <input type="datetime-local"
                    class="form-control" name="fechaInicio" id="fechaInicio" aria-describedby="helpId" placeholder="Ej: año/mes/día">
                </div>
    
                <div class="mb-3 l-3">
                  <label for="fechaFinal" class="form-label">Fecha final: </label>
                  <input type="datetime-local"
                    class="form-control" name="fechaFinal" id="fechaFinal" aria-describedby="helpId" placeholder="Ej: año/mes/día">
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
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="btn-del">Cancelar</button>
              <button type="submit" class="btn btn-primary" id="btn-agg" >Agregar</button>
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
  $(document).ready( function() {
    let calendarEl = document.getElementById('calendar');
    let calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale: 'es',//Traducir al español el calendario
      headerToolbar: { //Etiquetas del header
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
      events:  [ //Mostrar todos los eventos
        <?php foreach($eventos as $event) { ?>
          {
            id: "<?php echo $event['id'];?>",
            title: "<?php echo $event['title'];?>",
            descripcion: "<?php echo $event['descripcion'];?>",
            color: "<?php echo $event['color'];?>",
            start: "<?php echo $event['start'];?>",
            end: "<?php echo $event['end'];?>",
          }, 
        <?php } ?>
      ],
      dateClick: function( data ) { //Click en el dia seleccionado o evento
        // console.log(data.dateStr )
        limpiarFormulario(); //Limpiar formulario
        modalEvento.show();
      },
      eventClick: function ( data ) {
        // console.log(data)
        modalEvento.show();
        recuperar_datos_del_evento( data )
        document.getElementById("modal-title").innerText = 'Actualizar este evento';
        document.getElementById("btn-agg").innerText = 'Actualizar';
        document.getElementById("btn-del").innerText = 'Borrar este evento';

      },
    });
    calendar.render();
  })

</script>

<script>

  //Recuperar y mostrar datos del evento clickeado
  function recuperar_datos_del_evento({ event: evento }) { 
    
    /* Configurar la hora y fecha inicio */
    const fechaI = evento.startStr.split("T");
    // console.log(fecha)
    const horaI = fechaI[1].split("-");
    // console.log(hora[0])

    /* Configurar la hora y fecha de fin */
    const fechaF = evento.endStr.split("T");
    // console.log(fecha)
    const horaF = fechaF[1].split("-");
    // console.log(hora[0])

        document.getElementById("id").value = evento.id;
        document.getElementById("titulo").value = evento.title;
        document.getElementById("fechaInicio").value = fechaI[0] + ' ' + horaI[0];
        document.getElementById("fechaFinal").value = fechaF[0] + ' ' + horaF[0];
        document.getElementById("descripcion").value = evento.extendedProps.descripcion;
        document.getElementById("color").value = evento.backgroundColor;
  }


  function limpiarFormulario() {
        document.getElementById("id").value = "";
        document.getElementById("titulo").value = "";
        document.getElementById("descripcion").value = "";
        document.getElementById("color").value = "";
        document.getElementById("fechaInicio").value = "";
        document.getElementById("fechaFinal").value = "";
  }


</script>





<?= $this->endSection("contenido")?>
