<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>

<div class="titulo">
    <h1>Progreso de saquito</h1>
</div>   
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

    <div class="table table-striped">
                <table class="table table-striped" id="dataTable" cellspacing="0">
                    <thead>
                        <tr class="cm" >
                            <th>fecha_cuota</th>
                            <th>Valor_cuota</th>
                             <th>saquito</th>
                             <th>estado</th>
                             
                        
                        </tr>
                    </thead>
                    <tbody class=" jm">
                        <?php foreach ($proyeccion as $dato){ ?>
                            <tr> 
                                <td><?php echo $dato['fecha_cuota'];?></td> 
                                <td><?php echo $dato['valor_cuota'];?></td>
                                <td><?php echo $dato['descripcion'];?></td>
                                <td><?php echo $dato['estado'];?></td>
                            </tr>

                        <?php } ?> 
                   
                    </tbody>
                </table> 
   </div>    

   </div>
   
</div>





</div>
</div>

<?= $this->endSection("contenido")?>