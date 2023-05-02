<?=$this->extend("layouts/gfpLayout")?>

<?=$this->section("contenido")?>

<button class="btn btn-danger" id="agendaPago__btn">+</button>    

<div class="agendaPago__container">
  <div class="agendaPago__calendar">
    <full-calendar/>
  </div>

  <div class="agendaPago__notas">
    
  </div>
</div>






<script>

const fullCalendarElement = document.querySelector('full-calendar')

fullCalendarElement.options = {
  headerToolbar: {
    left: 'prev,next today',
    center: 'title',
    right: 'dayGridMonth,dayGridWeek,dayGridDay'
  },
  locale: 'ES'
}
</script>

<?=$this->endSection("contenido")?>