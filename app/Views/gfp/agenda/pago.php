<?= $this->extend("layouts/gfpLayout")?>

<?= $this->section("contenido")?>


<div class="agendaPago__container">
  <!-- Agenda -->
    <div id="calendar"></div>
  <!-- Fin Agenda -->
    
  </div>

  <!-- Modal -->
  <div class="modal fade" id="modalEvento" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" id="agendaPago__modal-header">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <img src="<?= base_url("img/gfp.png")?>" alt="" class="w-25 p-3">
            <h3 class="modal-title" id="modal-title">Nuevo recordatorio</h3>
          </div>
          <div class="alert alert-danger" role="alert" id="mensajeError" hidden></div>
          <div class="modal-body">
            <!-- Formulario -->
            <form class="d-flex flex-column" id="datosFormulario" action="<?= base_url("insertar_evento")?>" method="POST" onsubmit="return validateForm()">
                <input type="text" hidden
                  class="form-control"  name="id" id="id" aria-describedby="helpId" placeholder="Ej: 2">
              
              <div class="mb-3">
                <label for="titulo" class="form-label">Titulo: </label>
                <input type="text"
                  class="form-control" name="titulo" id="titulo" aria-describedby="helpId" placeholder="Ej: Recordatorio">
                  <!-- <div class="valid-feedback">Valido.</div> -->
                  <div class="invalid-feedback">Campo invalido.</div>
              </div>

              <div class="w-100 d-flex">
                <div class="mb-3">
                  <label for="fechaInicio" class="form-label">Fecha inicial: </label>
                  <input type="datetime-local"
                    class="form-control" name="fechaInicio" id="fechaInicio"  placeholder="Ej: año/mes/día">
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
                <button type="button" class="btn btn-danger" id="btn-del" onclick="eliminar_evento()">Borrar este evento</button>
              <button type="submit" class="btn btn-primary" id="btn-agg">Agregar</button>
            </div>

          </form>
          <!-- fin Formulario -->
        </div>
      </div>
    </div>
    <!-- fin modal -->


</div>






<script>

//Referencia formulario 
let formulario        = document.querySelector('#datosFormulario');

//Referencias inputs HTML
let inputId           = document.querySelector('#id');
let inputTitulo       = document.querySelector("#titulo");
let inputFechaInicio  = document.querySelector("#fechaInicio");
let inputFechaFinal   = document.querySelector("#fechaFinal");
let inputDescripcion  = document.querySelector("#descripcion");
let inputColor        = document.querySelector("#color");

//Referencias Botones HTML
let tituloModal = document.querySelector("#modal-title");
let btnAgregar  = document.querySelector("#btn-agg");
let btnEliminar = document.querySelector("#btn-del");
let divAlerta = document.querySelector("#mensajeError");

//Abrir modal cuando se de click en un evento.
let modalEvento; 
  modalEvento = new bootstrap.Modal( document.getElementById('modalEvento'), { keyboard: false }); 

    
  //Inicializar Calendario
  $(document).ready( function() {
    let calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
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
            id: "<?php echo $event['id_agenda'];?>",
            title: "<?php echo $event['title'];?>",
            descripcion: "<?php echo $event['descripcion'];?>",
            color: "<?php echo $event['color'];?>",
            start: "<?php echo $event['start'];?>",
            end: "<?php echo $event['end'];?>",
          }, 
        <?php } ?>
      ],
      //Click en el dia seleccionado o evento
      dateClick: function( data ) { 
        limpiar_formulario( data ); //Limpiar formulario
        modalEvento.show();
      },
      //funcion al hacer click en evento creado
      eventClick: function ( data ) {
        modalEvento.show();
        recuperar_datos_del_evento( data );
        tituloModal.innerText = 'Actualizar este evento';
        btnAgregar.innerText = 'Actualizar';
        btnEliminar.disabled = false;

      },
    });

    calendar.render();
  })



  //Recuperar y mostrar datos del evento clickeado
  function recuperar_datos_del_evento({ event: evento }) { 
    
    let fechaInicial = configurar_fecha( evento.startStr );
    let fechaFinal = configurar_fecha( evento.endStr );

        inputId.value = evento.id;
        inputTitulo.value = evento.title;
        inputFechaInicio.value = fechaInicial;
        inputFechaFinal.value = fechaFinal;
        inputDescripcion.value = evento.extendedProps.descripcion;
        inputColor.value = evento.backgroundColor;

  }


  //Limpiar campos del formulario cada que de "click" en otro
  function limpiar_formulario( data ) {
      
        inputId.value = "";
        inputTitulo.value = "";
        inputFechaInicio.value = data.dateStr + ' ' + '00' + ':' + '00';
        inputFechaFinal.value = "";
        inputDescripcion.value = "";
        inputColor.value = "";

        tituloModal.innerText = 'Crear nuevo evento';
        btnAgregar.innerText = 'Guardar';
        btnEliminar.disabled = true;
  }


  //Eliminar un evento
  function eliminar_evento() {
    Swal.fire({
      title: 'Alerta', 
      text: 'Estas seguro que deseas eliminar este evento?', 
      icon: 'info', 
      confirmButtonText: 'Confirmar'
    }).then(result => {
      if( result.isConfirmed === true ) {

        $.ajax({
          url: "<?= base_url("eliminar_evento")?>" + '/' + inputId.value,
          type: 'get',
          dataType: 'json'
        })
        setTimeout(() => {
          window.location.reload();
        }, 50)
        swalMensaje('Información', 'El evento fue eliminado exitosamente', 'info', 'Aceptar');
      }
    })
    
  }


  //Configurar fecha y hora
  function configurar_fecha( date ) {

    let fecha = date.split("T");
    let hora = fecha[1].split("-");
    hora = hora[0].split(":");

    return fecha[0] + ' ' + hora[0] + ":" + hora[1];
  }



  //Validar campos 
function validateForm() {

  //capturamos el valor(value) de myfrom/fname 
  const titulo = inputTitulo.value;
  const desc = inputDescripcion.value;
  let start = inputFechaInicio.value;
  let end = inputFechaFinal.value;
  const color = inputColor.value;

  start = start.split('T');
  end = end.split('T');
  
  // start[0] < end[0] ? console.log(true) : console.log(false);

  //validamos para ver si existe un valor agregado al input
  if (titulo.length <= 5 || desc.length <= 5 
    ) {
    
    divAlerta.hidden = false;
    divAlerta.innerText = 'Error, los campos estan vaciós o requieren más caracteres!'
    
    setTimeout(() => {
      
      divAlerta.hidden = true;
      divAlerta.innerText = ''
      
    }, 1000)
    
    return false;
  }

  if( end[1] < start[1] || end[0] < start[0]  ) {

    divAlerta.hidden = false;
    divAlerta.innerText = 'Error, la fecha de finalización no debe ser menor a la de Inicio!'
    
    setTimeout(() => {
      
      divAlerta.hidden = true;
      divAlerta.innerText = ''
      
    }, 1000)
    
    return false;
  }

}


</script>




<script>

  
 const estado = "<?= $session->mensaje?>";

 if( estado === 5 ) {

  Swal.fire({
    'title': 'Actualización exitosa',
    'text': 'Se ha actualizado el evento correctamente',
    'icon': 'success',
    'confirmButtonText': 'Aceptar'
  })

 }else if(estado == 6 ) {

  Swal.fire({
    'title': 'Creación exitosa',
    'text': 'Se ha creado el evento correctamente',
    'icon': 'success',
    'confirmButtonText': 'Aceptar'
  })

 }

 //Swal (Mensajes dinamicos)
 function swalMensaje(titulo, descripcion, icono, textBoton ) {

    return Swal.fire({
      title: titulo,
      text: descripcion, 
      icon: icono,
      confirmButtonText: textBoton
    })

 }

</script>




<?= $this->endSection("contenido")?>
