<div class="navbar__container">
  <a href="<?= base_url("principal")?>">
    <img 
    src="<?= base_url('img/gfp.png')?>" 
    alt="Logo Fazt" 
    class="navbar__logo"
    />
  </a>
  <!-- <div class="navbar__separator"></div> -->
  <ul>
    <div class="navbar__icons link__last flex flex-column">
      <li class="icon-image"><a href="<?= base_url('mi_perfil')?>"><img src="<?= base_url("icons/perfil.png")?>"/></a></li>
      <span class="icon-name">Ver mi perfil</span>
      <h6 class="mt-2 fw-bold">PANEL</h6>
    </div>

    <!-- <div class="navbar__separator"></div> -->

    <div class="navbar__icons">
      <li class="icon-image"><a href="<?= base_url('agenda_de_pago')?>"><img src="<?= base_url("icons/activitys.png")?>"/></a></li>
      <span class="icon-name">Agenda de pago</span>
    </div>

    <div class="navbar__icons">
      <li class="icon-image"><a href="<?= base_url('mi_saquito')?>"><img src="<?= base_url("icons/saquito.png")?>"/></a></li>
      <span class="icon-name">Saquito</span>
    </div>
    <div class="navbar__icons">
      <li class="icon-image"><a href="<?= base_url('mis_movimientos')?>"><img src="<?= base_url("icons/pagos.png")?>"/></a></li>
      <span class="icon-name">Movimientos</span>
    </div>

    <div class="navbar__icons">
      <li class="icon-image"><a href="<?= base_url('fondo_de_emergencia')?>"><img src="<?= base_url("icons/emergencia.png")?>"/></a></li>
      <span class="icon-name">Fondo emergencia</span>
    </div>

      <div class="navbar__separator"></div>

    <?php if($misDatos->rol != '3') { ?>

    <div class="navbar__icons" id="Admin_gestion">
        <li class="icon-image"><a href="<?= base_url('gestion_de_administradores')?>"><img src="<?= base_url("icons/empresario.png")?>"/></a></li>
        <span class="icon-name">Administradores</span>
    </div>

    <div class="navbar__icons">
        <li class="icon-image"><a href="<?= base_url('gestion/roles')?>"><img src="<?= base_url("icons/roles.png")?>"/></a></li>
        <span class="icon-name">Manejo De Roles</span>
    </div>

    <?php } ?>
    <div class="navbar__icons navbar__icon-logout">
      <li class="icon-image"><a href="<?= base_url('auth/logout')?>"><img src="<?= base_url("icons/logout.png")?>"/></a></li>
      <span class="icon-name">Salir</span>
    </div>
  </ul>
</div>

<script>


</script>