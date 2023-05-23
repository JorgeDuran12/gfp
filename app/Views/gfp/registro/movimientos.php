<?= $this->extend("layouts/gfpLayout")?>

<?= $this->section("contenido")?>

<div class="titulo">
    <h1> <img class="img" src="<?= base_url("img/movimiento.png")?>">
        Movimientos</h1>
</div>
<div class="contenedorMovimiento" >
    <form method="POST" action="<?php echo base_url('/movimiento/insertar'); ?>" autocomplete="off" class="movimiento">
    <br><br>
        <div class="tm">

            <!-- <select class="form-select"  aria-label="Floating label select example" id="tipo_movimiento" name="tipo_movimiento" required>
                <option selected class="tl">Tipo De Movimiento</option>
                <option value="1" class="tl">Egreso</option>
                <option value="2" class="tl">Ingreso</option>
            </select>    -->
            <label for="floatingInput"> Tipo de movimiento</label>
            <select class="form-select" name="tipo_movimiento" id="tipo_movimiento" aria-label="Floating label select example"  required>
            <!-- <option selected >Tipo de movimiento</option>  -->
                <?php foreach ($tipo_movi as $data) {?>
                     
                <option value="<?php echo $data["id_parametro_det"]; ?>"><?php echo $data["nombre"];?></option>
                <?php } ?>
            </select>

        </div>
        <br>
        
        <div class="tm">

            <!-- <select class="form-select"  aria-label="Floating label select example" id="clase_movimiento" name="clase_movimiento" required>
                <option selected class="tl">Clase De Movimiento</option>
                <option value="1" class="tl">Bancario</option>
                <option value="2" class="tl">No Bancario</option>
            </select> -->

            <label for="floatingInput">Clase de movimiento</label>
            <select class="form-select valida" name="clase_movimiento" id="clase_movimiento" aria-label="Floating label select example"  required>
             <!-- <option selected required >Clase de movimiento</option>  -->
                <?php foreach ($clase_movi as $data) {?>
             
                <option value="<?php echo $data["id_parametro_det"]; ?>"><?php echo $data["nombre"];?></option>
                <?php } ?>
            </select>
        </div>
        <br>

        <div class="tx">
            <input type="number" class="form-control valida" placeholder="Valor" id="valor" name="valor" required>
            <label for="floatingInput"></label>
        </div>
        <br>
        <div class="dc">
            <textarea class="dc" placeholder="Descripcion" id="descripcion" name="descripcion" required></textarea>

        </div>
        <br>
        <div class="tx">
            <input type="datetime-local" class="form-control"  placeholder="name@example.com" id="fecha_movimiento" name="fecha_movimiento" required>
            <label for="floatingInput" ></label>
        </div>

        <div class="botondeanti">

        <div class="b"> <button href="#" class="btn-guardar" type="Submit">
        <span id="span1g"></span>
        <span id="span2g"></span>
        <span id="span3g"></span>
        <span id="span4g"></span>
        <img
        class="image" src="<?= base_url("img/Guardar.png") ?> " title="Guardar">
      </button></div>

        </div>
        <br><br><br>
        <div class="hh">
        <div class="rt">

        <div class="b" data-bs-toggle="modal" data-bs-target="#reporteMovimientosModal"> <a href="#" class="btn-neon">
        <span id="span1"></span>
        <span id="span2"></span>
        <span id="span3"></span>
        <span id="span4"></span>
        Reporte De Movimientos
      </a></div>
        </div>&nbsp&nbsp&nbsp&nbsp&nbsp

      </div>
        </div>
        
    </form>

    </div>


<div class="modal fade" id="reporteMovimientosModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="movimientos_modal-content">
            <div class="modal-header">
                
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <h5 class="modal-title" id="exampleModalLabel">Reporte De Movimientos</h5>
            </div>
            <div class="modal-body">

                <div id="contenedor_modal_Movimiento">
                    <div id="limite">
                        <div class="table-responsive">
                            <table class="table table-bordered table-sm table-striped" id="dataTable1" width="100%"
                                cellspacing="0">
                                <thead>
                                    <tr>

                                        <th>valor</th>
                                        <th>fecha</th>
                                        <th>ClaseMovimiento</th>
                                        <th>tipoMovimiento</th>
                                        <th>descripcion</th>
                                     

                                    </tr>
                                </thead>
                                <tbody>

                                  
                                <?php foreach ($Movimientos as $dato) { ?>
                                        <tr>
                                            <td><?php echo $dato ['valor'];?></td>
                                            <td><?php echo $dato ['fecha_movimiento'];?></td>
                                            <td><?php echo $dato ['Tnombre2'];?></td>
                                            <td><?php echo $dato ['Tnombre'];?></td>
                                            <td><?php echo $dato ['descripcion'];?></td>
                                            </tr>
                                            <?php } ?>
                            
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <!-- <button type="Submit" id="pdfout" class="btn btn-primary">Descargar</button> -->
            </div>
        </div>
    </div>
    </div>
</div>
</div>
 <!-- gnerador de pdf -->



<script>

    const saldo_anterior = <?= $disponibles['saldo_anterior']?>;
    const ingreso = <?= $disponibles['ingreso']?>;
    const egreso = <?= $disponibles['egreso']?>;
    console.log("saldo" +saldo_anterior);
    console.log("ingreso" +ingreso)
    console.log("egreso" + egreso)
    let resultado = saldo_anterior + ingreso;
    document.write(resultado);

    $(document).on('blur', '.valida', function(event) {
        var valor = parseInt(document.getElementById("valor").value);
        var tipo = parseInt(document.getElementById("clase_movimiento").value);
        if(valor && tipo){
        // Realizar la división
        var resultado = valor - egreso;
     
         console.log("resultado" + resultado);

        }

    })









</script>




<?= $this->endSection("contenido")?>