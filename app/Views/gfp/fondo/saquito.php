<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>

<div class="titulo">
    <h3><img class="img" src="<?= base_url("img/saquito1.png")?>"> Saquito</h3>
</div><br>

<div class="input-group mb-3 date ">

<span class="input-group-text" id="inputGroup-sizing-default"><img
        src="<?= base_url("icons/question-circle-fill.svg")?>"
        title="En esta opcion debera digitalizar el dia del mes donde el aplicativo debera descontar de la disponibilidad de la cuota para el saquito">
    &nbsp Fecha inicial</span>
<input type="date" class="ss" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>
<div class="contenedorSaquito">
    <!-- Formulario principal-->
    <form method="POST" action="<?php echo base_url('saquito/Insertar') ?>  " class="saquito">
        <div class="tim">
            <h3>Meta</h3>
        </div>
        <div class="dc">
            <textarea class="dc" name="descripcion" id="floatingTextarea descripcion" placeholder="Descripcion:"></textarea>

        </div>
        <br>
        <div class="tma">
            <input type="date" class="form-control" name="fecha_inicial" id="fecha_inicial floatingInput"
                placeholder="Fecha inicial: ">
            <label for="floatingInput"></label>

        </div>
        <br>
        <div class="tma">
            <input type="number" class="form-control" name="valor" id="floatingInput valor" placeholder="Valor: ">
            <label for="floatingInput"></label>
        </div>
        <br>

        <div class="txa">
        <input type="number" class="form-control" name="numero_cuota" id="numero_cuota floatingInput"
                placeholder="Valor cuotas:">
            <label for="floatingInput"></label>
            <input type="number" class="form-control" name="cuota" id="couta floatingInput" placeholder="Cuotas:">
            <label for="floatingInput"></label>
            
        </div>
        <br>
     <!-- botones-->
        <div class="botondeanti">
            <button data-bs-toggle="modal" data-bs-target="#editarModal" type="button" class="btn btn-warning">
                <img class="image" src="<?= base_url("img/editar.png") ?> " title="Editar">

            </button>
            <button data-bs-toggle="modal" data-bs-target="#exampleModal2" type="button" class="btn btn-danger"> <img
                    class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar">
            </button>

            <button data-bs-toggle="modal" data-bs-target="#exampleModal1" type="submit" class="btn btn-success"> <img
                    class="image" src="<?= base_url("img/Guardar.png") ?> " title="Guardar">
            </button>
        </div>

</div>
</form>
<!-- Modal  Guadar-->
<!--<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <h5 class="modal-title" id="exampleModalLabel">Guardar registro</h5>
            </div>
            <div class="modal-body">
                ¿Desea Guardar este registro?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-success">Guardar</button>
            </div>   
        </div>
    </div>
 </div>-->
<!-- Modal Eliminar-->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <h5 class="modal-title" id="exampleModalLabel">Eliminar Registro</h5>
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
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <img  src="<?= base_url("img/gfp.png") ?> " class="logo">
                <h2 class="modal-title" id="exampleModalLabel">Editar Registro</h2>
            </div>
            <div class="modal-body">

                <div class="tim">
                    <h3>Meta</h3>
                </div>
                <div class="dc">
                    <textarea class="dc"  name="descripcion"placeholder="Descripcion:" id="floatingTextarea"></textarea>

                </div>
                <br>
                <div class="tma">
                    <input type="date" class="form-control" name="fecha_inicial" id="floatingInput" placeholder="Fecha inicial: ">
                    <label for="floatingInput"></label>

                </div>
                <br>
                <div class="tma">
                    <input type="number" class="form-control" name="valor" id="floatingInput" placeholder="Valor: ">
                    <label for="floatingInput"></label>
                </div>
                <br>

                <div class="txa">
                    <input type="number" class="form-control" name="cuota" id="floatingInput cuota" placeholder="Cuotas:">
                    <label for="floatingInput"></label>
                    <input type="number" class="form-control" name="numero_cuota" id="floatingInput numero_cuota" placeholder="Valor cuotas:">
                    <label for="floatingInput"></label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                <button type="Submit" class="btn btn-success" >Actualizar</button>
            </div>
        </div>
        </div>
 <!-- <---------------------div de header y footer-------------------> 
 </div>

</div>
</div>



<?= $this->endSection("contenido")?>

<script>
/*$(document).on("ready",saquito);
function saquito(){
    $("form").submit(function(event){
      
        event.preventDefault();
        $.ajax({
            url:$("form").attr("action"),
            type:$(""form).attr("method"),
            data:$("form").serialize(),
            success:function(respuesta){
                alert(respuesta)
            }

        });
    });
}*/

</script>