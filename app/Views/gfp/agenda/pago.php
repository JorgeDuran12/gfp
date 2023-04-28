<?=$this->extend("layouts/gfpLayout")?>

<?=$this->section("contenido")?>


<div class="agendaPago__container">
  <full-calendar/>
</div>
    
    <button class="btn btn-danger" id="agendaPago__btn">+</button>    




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