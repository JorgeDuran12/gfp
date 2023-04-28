<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>


<div class="tim2">
    <h1> <img class="img" src="<?= base_url("img/saquito1.png")?>"> Saquito</h1>
</div>

<br><br>

<div class="input-group mb-3 date ">
    <span class="input-group-text" id="inputGroup-sizing-default"><img
            src="<?= base_url("icons/question-circle-fill.svg")?>"
            title="En esta opcion debera digitalizar el dia del mes donde el aplicativo debera descontar de la disponibilidad de la cuota para el saquito">
        &nbsp Fecha inicial</span>
    <input type="date" class="ss" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>
<div>
    <form method="POST" action="" class="registro">

        <div class="tim">
            <h3>Meta</h3>
        </div>
        <div class="dc">
            <textarea class="dc" name="descripcion" placeholder="Descripcion:" id="floatingTextarea"></textarea>

        </div>
        <br>
        <div class="tm">
            <input type="date" class="form-control" name="fecha_inicial" id="floatingInput"
                placeholder="Fecha inicial: ">
            <label for="floatingInput"></label>

        </div>
        <br>
        <div class="tm">
            <input type="number" class="form-control" name="valor" id="floatingInput" placeholder="Valor: ">
            <label for="floatingInput"></label>
        </div>
        <br>

        <div class="tx">
            <input type="number" class="form-control" name="cuota" id="floatingInput" placeholder="Cuotas:">
            <label for="floatingInput"></label>
            <input type="number" class="form-control" name="numero_cuotas" id="floatingInput"
                placeholder="Valor cuotas:">
            <label for="floatingInput"></label>
        </div>
        <br>





        <div class="botondeanti">
            <button data-bs-toggle="modal" data-bs-target="#editarModal" type="button" class="btn btn-warning">
                <img class="image" src="<?= base_url("img/editar.png") ?> " title="Editar">

            </button>
            <button data-bs-toggle="modal" data-bs-target="#exampleModal2" type="button" class="btn btn-danger"> <img
                    class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar">
            </button>

            <button data-bs-toggle="modal" data-bs-target="#exampleModal" type="button" class="btn btn-success"> <img
                    class="image" src="<?= base_url("img/Guardar.png") ?> " title="Guardar">
            </button>
        </div>

</div>
</form>
<!-- Modal  Guadar-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Guardar Registro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ¿Desea guardar este registro?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-success">Guadar</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal Eliminar-->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Eliminar registro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ¿Desea Eliminar este registro?
            </div>
            <div class="modal-footer">
                <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-success">Eliminar</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal  Editar-->
<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Registro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="tim">
                    <h3>Meta</h3>
                </div>
                <div class="dc">
                    <textarea class="dc" placeholder="Descripcion:" id="floatingTextarea"></textarea>

                </div>
                <br>
                <div class="tm">
                    <input type="date" class="form-control" id="floatingInput" placeholder="Fecha inicial: ">
                    <label for="floatingInput"></label>

                </div>
                <br>
                <div class="tm">
                    <input type="number" class="form-control" id="floatingInput" placeholder="Valor: ">
                    <label for="floatingInput"></label>
                </div>
                <br>

                <div class="tx">
                    <input type="number" class="form-control" id="floatingInput" placeholder="Cuotas:">
                    <label for="floatingInput"></label>
                    <input type="number" class="form-control" id="floatingInput" placeholder="Valor cuotas:">
                    <label for="floatingInput"></label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-success">Guadar</button>
            </div>
        </div>
 <!-- <---------------------div de header y footer-------------------> 
 </div>

</div>


<?= $this->endSection("contenido")?>