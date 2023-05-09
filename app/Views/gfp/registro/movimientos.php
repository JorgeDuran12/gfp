<?= $this->extend("layouts/gfpLayout")?>

<?= $this->section("contenido")?>

<div class="titulo">
    <h1> <img class="img" src="<?= base_url("img/movimiento.png")?>">
        Movimientos</h1>
</div>
<div class="contenedorMovimiento" >
    <form method="POST" action="<?php echo base_url('/movimiento/insertar'); ?>" autocomplete="off" class="movimiento"><br> <br>
        <div class="tm">
            <select class="form-select"  aria-label="Floating label select example" id="tipo_movimiento" name="tipo_movimiento">
                <option selected class="tl">Tipo De Movimiento</option>
                <option value="1" class="tl">Egreso</option>
                <option value="2" class="tl">Ingreso</option>

            </select>   
        </div>
        <br>
        <div class="tm">
            <select class="form-select"  aria-label="Floating label select example" id="clase_movimiento" name="clase_movimiento">
                <option selected class="tl">Clase De Movimiento</option>
                <option value="1" class="tl">Bancario</option>
                <option value="2" class="tl">No Bancario</option>
            </select>
        </div>
        <br>

        <div class="tx">
            <input type="number" class="form-control" placeholder="Valor" id="valor" name="valor">
            <label for="floatingInput"></label>
        </div>
        <br>
        <div class="dc">
            <textarea class="dc" placeholder="Descripcion" id="descripcion" name="descripcion"></textarea>

        </div>
        <br>
        <div class="tx">
            <input type="date" class="form-control"  placeholder="name@example.com" id="fecha_movimiento" name="fecha_movimiento">
            <label for="floatingInput"></label>
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

        <div class="b" data-bs-toggle="modal" data-bs-target="#reporteingresoModal"> <a href="#" class="btn-neon">
        <span id="span1"></span>
        <span id="span2"></span>
        <span id="span3"></span>
        <span id="span4"></span>
        Reporte Ingreso
      </a></div>
        </div>&nbsp&nbsp&nbsp&nbsp&nbsp
        

        
        <!-- <div class="rt">
            <button data-bs-toggle="modal" data-bs-target="#reporteegresoModal" type="button" class="btn btn-secondary">
                <img src="<?= base_url("icons/file-earmark-spreadsheet-fill.svg") ?>">
                Reporte Egreso
            </button>
        </div>&nbsp&nbsp&nbsp&nbsp&nbsp -->


        <div class="b" data-bs-toggle="modal" data-bs-target="#reporteegresoModal"> <a href="#" class="btn-neon">
        <span id="span1"></span>
        <span id="span2"></span>
        <span id="span3"></span>
        <span id="span4"></span>
        Reporte Egreso
      </a></div>

      </div>
        </div>
        
    </form>

    </div>


<div class="modal fade" id="reporteingresoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <h5 class="modal-title" id="exampleModalLabel">Reporte Ingreso</h5>
            </div>
            <div class="modal-body">
                <div id="contenedor">
                    <div id="limite">
                        <div class="table-responsive">
                            <table class="table table-bordered table-sm table-striped" id="dataTable" width="100%"
                                cellspacing="0">
                                <thead>
                                    <tr>

                                        <th>valor</th>
                                        <th>fecha</th>
                                        <th>tipoMovimiento</th>
                                        <th>descripcion</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>1.000.000</td>
                                        <td>11/5/2023</td>
                                        <td>No Bancario</td>
                                        <td>venta de un cel q tenia viejo venta de un cel q tenia viejo venta de un cel
                                            q tenia viejo </td>

                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-primary">Descargar</button>
            </div>
        </div>
    </div>
</div>
</div>



<div class="modal fade" id="reporteegresoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <h5 class="modal-title" id="exampleModalLabel">Reporte Egreso</h5>
            </div>
            <div class="modal-body">

                <div id="contenedor">
                    <div id="limite">
                        <div class="table-responsive">
                            <table class="table table-bordered table-sm table-striped" id="dataTable1" width="100%"
                                cellspacing="0">
                                <thead>
                                    <tr>

                                        <th>valor</th>
                                        <th>fecha</th>
                                        <th>tipoMovimiento</th>
                                        <th>descripcion</th>

                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>50.000</td>
                                        <td>11/6/2023</td>
                                        <td>Bancario</td>
                                        <td>pago del plan pago del plan pago del plan pago del plan pago del plan pago
                                            del plan</td>

                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-primary">Descargar</button>
            </div>
        </div>
    </div>
    </div>
</div>
</div>




<?= $this->endSection("contenido")?>