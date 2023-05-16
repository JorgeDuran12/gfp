<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>

<div class="titulo">
    <h1><img class="img" src="<?= base_url("img/saquito.png")?>"> Saquito</h1>
</div><br>

<div class="tabla">
    <h1>Progreso de saquito</h1>

    <!--<div class="input-group mb-3 date ">

<span class="input-group-text" id="inputGroup-sizing-default"><img
        src="<= base_url("icons/question-circle-fill.svg")?>"
        title="En esta opcion debera digitalizar el dia del mes donde el aplicativo debera descontar de la disponibilidad de la cuota para el saquito">
    &nbsp Ingrese  Dia</span>
<input type="week" class="ss" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>-->

    <a href="#" onclick="selecionaRegistro(<?php echo 1 . ',' . 1 ?>);" class="btn btn-success regresar_Btn"
        data-bs-toggle="modal" data-bs-target="#editarModal">Agregar</a>

    &nbsp <a href="<?php echo base_url(''); ?>" class="btn btn-secondary regresar_Btn">Eliminados</a>

   
</div>

<table class="table table-striped">
    <thead>
        <tr class="cm"></tr>
            <th>Descripcion</th>
            <th>Fecha inicial</th>
            <th>valor</th>
            <th>Numero cuota</th>
            <th>cuota</th>
            <th>estado</th>
            <th colspan="2">Acciones</th>

        </tr>
    </thead>
    <tbody class=" jm">
        <?php foreach ($saquito as $dato) { ?>
        <tr>
            <td><?php echo $dato ['descripcion'];?></td>
            <td><?php echo $dato['fecha_inicial'];?></td>
            <td><?php echo $dato['valor'];?></td>
            <td><?php echo $dato['numero_cuota'];?></td>
            <td> <?php echo $dato['cuota'];?></td>
            <td><?php echo $dato['estado'];?></td>
            <td>
                <a class="btn btn-warning" href="#"
                    onclick=" selecionaRegistro(<?php echo $dato['id_saquito'] . ',' . 2 ?>);" data-bs-toggle="modal"
                    data-bs-target="#editarModal" width="16" height="16" title="Editar Registro">
                    <img class="image" src="<?= base_url("img/editar.png") ?> " title="Editar">
                </a>

                

            </td>
        </tr>
        <?php } ?>
    </tbody>


</table>
</div>
</div>

</form>

<!-- Modal Eliminar-->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <h5 class="modal-title">Eliminar Registro</h5>
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
                <img src="<?= base_url("img/gfp.png") ?> " class="logo">
                <h2 class="modal-title" id="exampleModalLabel">Agregar Registro</h2>
            </div>

            <form class="form" method="POST" action="<?php echo base_url('Insertar') ?>  ">
                <div class="modal-body">

                    <input hidden id="id_saquito" name="id_saquito">
                    <input hidden id="tp" name="tp">

                    <div class="tim">
                        <h3>Meta</h3>
                    </div>

                    <div class="dca">
                        <textarea class="dca" name="descripcion" placeholder="Descripcion:"
                            id="descripcion" required></textarea>
                    </div>
                    <br>
                    <div class="tma">
                        <input type="date" class="form-control" name="fecha_inicial" id="fecha_inicial"
                            placeholder="Fecha inicial: " required>
                        <label for="floatingInput"></label>
                    </div>

                    <br>
                    <div class="tma">
                        <input type="number" class="form-control" name="valor" id="valor"
                            placeholder="Valor: " required>
                        <label for="floatingInput"></label>
                    </div>
                    <br>
                    <div class="txa">
                        <input type="number" class="form-control" name="cuota" id="cuota"
                            placeholder="Cuotas:" required>
                        <label for="floatingInput"></label>
                        <input type="number" class="form-control" name="numero_cuota" id="numero_cuota"
                            placeholder="Valor cuotas:" required>
                        <label for="floatingInput"></label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <button type="Submit" class="btn btn-success" id="btn_guardar_saquito">guardar</button>
                </div>
        </div>
    </div>
</div>

<!-- <---------------------div de header y footer------------------->
</div>

</div>
</div>

<script>

function selecionaRegistro(id, tp) {
    if (tp == 2) {
        dataURL = "<?php echo base_url('buscar_Registro'); ?>" + "/" + id;
        $.ajax({
            //alert(tp);

            type: "POST",
            url: dataURL,
            dataType: "json",
            success: function(rs) {
                // console.log(rs)
                document.getElementById('exampleModalLabel').innerText= "Actualizar Registro";  
                $("#tp").val(2);
                $("#id_saquito").val(id);
                $("#descripcion").val(rs[0]['descripcion']);
                $("#fecha_inicial").val(rs[0]['fecha_inicial']);
                $("#valor").val(rs[0]['valor']);
                $("#numero_cuota").val(rs[0]['numero_cuota']);
                $("#cuota").val(rs[0]['cuota']);
                $("#btn_guardar_saquito").text('Actualizar');
            }
        });

    } else {
        $("#tp").val(1);
        document.getElementById('exampleModalLabel').innerText = "Agregar Registro";
        $("#descripcion").val('');
        $("#fecha_inicial").val('');
        $("#valor").val('');
        $("#numero_cuota").val('');
        $("#cuota").val('');
        $("#btn_guardar_saquito").text('Guardar');
       
    }

}
</script>
<script>
var cuota = parseint(promt("ingrese su cuota"));
var numero_cuota= parseint(promt("ingrese el numero de cuotas"));
var divi = cuota/numero_cuota
cosole.log("el resultado es:")
</script>

<?= $this->endSection("contenido")?>