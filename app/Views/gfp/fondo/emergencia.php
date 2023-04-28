<?= $this->extend("layouts/gfpLayout")?>

<?= $this->section("contenido")?>

<div class="titulo">
    <h3><img class="img" src="<?= base_url("img/emergen.png")?>"> Fondo De Emergencia</h3>
</div><br>



<div class="input-group mb-3 ss ">
    <span class="input-group-text" id="inputGroup-sizing-default"><img
            src="<?= base_url("icons/question-circle-fill.svg")?>"
            title="En esta opcion debera digitalizar el dia del mes donde el aplicativo debera descontar de la disponibilidad de la cuota para el saquito">
        &nbsp Fecha inicial</span>
    <input type="date" class="ss" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>

<form>
    <div class="registro"></div>
    <div class="e a">
        <h4>Asignar Cuota </h4>
    </div>


   <!--  <div class="e b">
        <label> Ingresa Un Valor</label><br><br>
        <input type="number" class="tl aria-label=" Dollar amount (with dot and two decimal places)><br><br>
        <div class="botondeanti">
            <button data-bs-toggle="modal" data-bs-target="#guardaremergeModal" type="button" class="btn btn-success">
                <img class="image" src="<?= base_url("img/Guardar.png") ?> " title="Guardar">
            </button>
            <button data-bs-toggle="modal" data-bs-target="#eliminaremergenModal" type="button" class="btn btn-danger">
                <img class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar">
            </button>
            <button data-bs-toggle="modal" data-bs-target="#editaremergenModal" type="button" class="btn btn-warning">
                <img class="image" src="<?= base_url("img/editar.png") ?> " title="Editar">

            </button>
        </div>
    </div>
    <br> -->



<!-- 

    <div class="e c">
        <label>Presupuesto Actual:</label>

    </div> -->

</form>

<div class="modal fade" id="guardaremergeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Guardar Actividades</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Desea Guardar Esta Actividad
            </div>
            <div class="modal-footer">
                <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-success">Guadar</button>
            </div>
        </div>
    </div>

</div>
</div>

<!-- 
<div class="modal fade" id="eliminaremergenModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Eliminar Registro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Desea Eliminar Este Registro
            </div>
            <div class="modal-footer">
                <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-success">Guadar</button>
            </div>
        </div>
    </div>
</div>
</div> -->

<!-- <div class="modal fade" id="editaremergenModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Registro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="e b">
                    <input type="number" class="tl aria-label=" Dollar amount (with dot and two decimal places)><br><br>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-success">Guadar</button>
            </div>
        </div>
    </div>
</div> -->


<?= $this->endSection("contenido")?>