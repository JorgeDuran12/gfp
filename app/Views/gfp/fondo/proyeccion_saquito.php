<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>

<div class="titulo">
    <h1>Progreso de saquito</h1>
    <div class="formulario_proyeccion">

        <form id="formulario" method="POST" action="<?php echo base_url('Insertar_proyeccion'); ?>">

            <div class="tma"><input type="date" class="form-control" name="fecha_cuota" id="fecha_cuota"
                    placeholder="Fecha inicial: " required>
                <label for="floatingInput"></label>
            </div>

            <div class="tma"> <input type="number" class="form-control" name="valor_cuota" id="valor_cuota"
                    placeholder="Valor: " required>
                <label for="floatingInput"></label>
            </div>

            <div> 
                <button class="btn btn-success" href="#" class="btn-guardar" type="Submit">
                    <img class="image" src="<?= base_url("img/Guardar.png") ?>" title="Guardar">
                </button>
            </div>

        </form>
    </div>
</div>

<br>
<!-- <div class="table-responsive">
                <table class="tabla" id="dataTable" cellspacing="0">
                    <thead>
                        <tr class="cm" >
                            <th>fecha</th>
                            <th>Valor</th>
                             <th>Descripcion</th>
                            <th>Mes</th> 
                        
                        </tr>
                    </thead>
                    <tbody >
                        <tr>
                            <td>cuota</td>
                            <td>valor</td>
                        </tr>
                    </tbody>
</table> 
</div>    -->



</div>
</div>

<?= $this->endSection("contenido")?>