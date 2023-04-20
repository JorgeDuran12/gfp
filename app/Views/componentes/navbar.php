
<div class="navbar__container">
  <a href="#">
    <img 
    src="<?= base_url('img/gfp.png')?>" 
    alt="Logo Fazt" 
    class="navbar__logo"
    />
  </a>
  <div class="navbar__separator"></div>
  <ul>
    <div class="icon link__last">
      <li class="icon-image"><a href="<?= base_url('/principal')?>"><img src="<?= base_url("icons/inicio.png")?>"/></a></li>
      <span class="icon-name">Inicio</span>
    </div>
    <div class="navbar__separator"></div>
    <div class="icon">
      <li class="icon-image"><a href="<?= base_url('Agenda')?>"><img src="<?= base_url("icons/activitys.png")?>"/></a></li>
      <span class="icon-name">Agenda de pago</span>
    </div>
    <div class="icon">
      <li class="icon-image"><a href="<?= base_url('Saquito')?>"><img src="<?= base_url("icons/saquito.png")?>"/></a></li>
      <span class="icon-name">Saquito</span>
    </div>
    <div class="icon">
      <li class="icon-image"><a href="<?= base_url('Registro')?>"><img src="<?= base_url("icons/pagos.png")?>"/></a></li>
      <span class="icon-name">Movimientos</span>
    </div>
    <div class="icon">
      <li class="icon-image"><a href="<?= base_url('Emergencia')?>"><img src="<?= base_url("icons/emergencia.png")?>"/></a></li>
      <span class="icon-name">Fondo emergencia</span>
    </div>
    <div class="navbar__separator"></div>
    <div class="icons__admin">
      <div class="icon">
        <li class="icon-image"><a href="#"><img src="<?= base_url("icons/disabled.png")?>"/></a></li>
        <span class="icon-name">Deshabilitado</span>
      </div>
      <div class="icon">
        <li class="icon-image"><a href="#"><img src="<?= base_url("icons/disabled.png")?>"/></a></li>
        <span class="icon-name">Deshabilitado</span>
      </div>
    </div>
  </ul>

</div>





<script>
  // const icon = document.querySelector('.icon');
  // const iconName = document.querySelector('.icon-name');

  // icon.addEventListener('mouseenter', () => {
  //   iconName.classList.add('show');
  //   setTimeout(() => { iconName.classList.remove('show') }, 1000)
    
    
  // })
</script>

