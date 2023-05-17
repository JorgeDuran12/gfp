 <?= $this->extend("layouts/gfpLayout")?>

<?= $this->section("contenido")?>

<div class="titulo">
    <h3><img class="img" src="<?= base_url("img/emergen.png")?>"> Fondo De Emergencia</h3>
</div>

<div  class="contenedorEmergencia">
    <!-- fecha de creacion del registro -->
    <form class="emergencia">
        <div class="input-group mb-3 ss">
        <span class="input-group-text" id="inputGroup-sizing-default"> <img src="<?= base_url("icons/question-circle-fill.svg")?>"
        title="En esta opcion debera digitalizar el dia del mes donde el aplicativo debera descontar de la disponibilidad de la cuota para el saquito">Fecha inicial</span>
        <input type="date" class="ss" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
    </form>
</div>
    <!-- fin del codigo de fecha creacion -->
<div class="emergencia_container_form">
    <form action="" method="post" class="form_container__emergencia">
        <input type="number" class="emergencia__input" name="emergencia__valor" id="emergencia__valor" >    
    </form>

    <a  class="btn btn-warning"  href="#" onclick="" data-bs-toggle="modal" data-bs-target="#"  width="16" height="16" title="Editar Registro">
    <img class="image" src="<?= base_url("img/editar.png") ?> " title="Editar" >
    </a>

</div>

    <!-- efecto de de animacion del pig	 -->
	<!-- <div class="piggy-wrapper">    
		<div class="piggy-wrap">
			<div class="piggy">
				<div class="nose"></div>
				<div class="mouth"></div>
				<div class="ear"></div>
				<div class="tail">
					<span></span>
					<span></span>
					<span></span>
					<span></span>
				</div>
				<div class="eye"></div>
				<div class="hole"></div>
			</div>
		</div>
		<div class="coin-wrap">
			<div class="coin">$</div>
		</div>
		<div class="legs"></div>
		<div class="legs back"></div>
	</div> -->
    <!-- final del efecto -->


</div>
</div>

<?= $this->endSection("contenido")?>