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
                        class="icono_emergencia">Fecha de ahorro para el fondo de emergencia</span>
                <input type="date" class="ss input_fecha__emergencia" aria-label="Sizing example input"
                    aria-describedby="inputGroup-sizing-default" id="fecha_registro" name="fecha_registro" required>
            </div>
        </div>
        <!-- fin del codigo de fecha creacion -->
        <div class="p_emergencia">
            <div class="emergencia_container_form">
                <div class="form_container__emergencia">
                    <input type="number" class="emergencia__input" name="emergencia__valor" id="emergencia__valor"
                        required>
                </div>
            </div>
            <br>
            <button class="btn btn-success regresar_Btn" type="submit">Enviar</button>
            <br>
    </form>

    <a class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#ActualizarModal">
        <img class="image" src="<?= base_url("img/editar.png") ?> " title="Editar">
        </a>

 <table class="table">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">fecha</th>
      <th scope="col">id_usuario</th>
      <th scope="col">valor</th>
    </tr>
  </thead>
  <tbody>
<?php foreach ($emergencia as $dato) { ?>

    <tr>
    <td> <?php echo $dato ['id_fondo-emergencia'];?></td>
    <td> <?php echo $dato ['fecha_registro'];?></td>
    <td> <?php echo $dato ['id_usuario'];?></td>
    <td> <?php echo $dato ['valor'];?></td>
    </tr>

    <?php } ?>

  </tbody>
</table> 

    <div class="modal fade" id="ActualizarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" id="movimientos_modal-content">
                <div class="modal-header">

                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                    <h5 class="modal-title" id="exampleModalLabel">Actualizar fondo de emergencia</h5>
                </div>
                <div class="modal-body">

                    <form action="<?php echo base_url('/emergencia/editar'); ?>  method="POST" autocomplete="off">

                        <div>
                            <div>
                                <input type="date" class="ss input_fecha__emergencia" aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing-default" id="editar_fecha_registra"
                                    name="editar_fecha_registra" required>
                            </div>
                            <br>
                            <div>
                                <input type="number" class="emergencia__input" name="editar_emergencia__valor"
                                    id="editar_emergencia__valor" required>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <button type="Submit" id="pdfout" class="btn btn-primary">Actualizar</button>
                </div>
            </div>
        </div>
        </div>
        

        <?= $this->endSection("contenido")?>