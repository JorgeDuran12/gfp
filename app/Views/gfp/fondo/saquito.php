<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>

<div class="titulo">
    <h1><img class="img" src="<?= base_url("img/saquito.png")?>"> Saquito</h1>
</div><br>

<div class="tabla">


    <div class="input-group mb-3 date ">


     </div>

         <button  href="#" id="agregar" onclick="selecionaRegistro(<?php echo 1 . ',' . 1 ?>);" class="btn btn-success regresar_Btn"
             data-bs-toggle="modal" data-bs-target="#editarModal" hidden   >Agregar</button>

             <a href=" <?php echo base_url('/proyeccion'); ?>" hidden  class="btn btn-primary regresar_Btn"  id="proyeccion" >Proyeccion</a> &nbsp

        


   
</div>
<div id="contenedor">
    <div id="limite">

<table id="miTabla" class="display">
            <thead>
                <tr>
                <th>Descripcion</th>
            <th>Fecha inicial</th>
           
            <th>valor</th>
            <th>Numero cuota</th>
            <th>cuota</th>
            <th>estado</th>
            <!-- <th>Acciones</th> -->

                </tr>
            </thead>
            <tbody>
               <?php foreach ($saquito as $dato) { ?>
        <tr>
            <td><?php echo $dato['descripcion'];?></td>
            <td><?php echo $dato['fecha_inicial'];?></td>
           
            <td><?php echo $dato['valor'];?></td>
            <td><?php echo $dato['numero_cuota'];?></td>
            <td> <?php echo $dato['cuota'];?></td>
            <td> <?php if($dato['estado']=="A"){echo "No completado";}else{echo "completado";}?></td>
            
        
        </tr>
        <?php } ?>
            </tbody>
        </table>
</div>
</div>
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

            <form id="formulario" class="form" method="POST" action="<?php echo base_url('Insertar') ?>  ">
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
        
                        <label for="floatingInput">fecha inicial:</label>
                        <input type="date" class="form-control" name="fecha_inicial" id="fecha_inicial"
                            placeholder="Fecha inicial: " required>
                    </div>
                    

                    <br>
                    
                <div class="tma">
<form id="myForm">
  <label for="num1">precio del objetivo:</label>
  <input type="number"   class="form-control valida" id="valor" name="valor" >
  <br>
  <label for="num2">numero de cuotas:</label>
  <input type="number" class="form-control valida"  id="numero_cuota" name="numero_cuota">
  <br>
  <label for="num3">Cuotas</label>
  <input type="number" class="form-control" id="cuota" name="cuota">
</form>
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
<!--Funcion para desaparecer el boton de agregar si no hay un valor en presupuesto-->
<<script>
    let  btnAgregar = document.getElementById('agregar');
    
   $(document).ready(function(){
    $.ajax({
        url:"<?php echo base_url("principal/buscar_presupuesto")?>",
        type:"get",
        dataType:"json",
        success:function(data){
            
            if( data.length > 0 ) {
                btnAGregar.hidden = false;
                
                
            } else{
                btnAGregar.hidden = true;
                btnAGregar.disabled = true;  
                  

                

            }
        }
    })
   })
    

    
</script> 

<script>
    let btnAGregar = document.getElementById('agregar');
    let pp = document.getElementById('proyeccion');


                $(document).ready(function() {
                    $.ajax({
                        url: "<?php echo base_url("saquito/buscar_Registro")?>",
                        type: "get",
                        dataType: "json",
                        success: function (data) {
                            

                            //Si hay saquito que desactive el boton de agregar
                            if( data.length > 0 ) {
                                btnAGregar.hidden = true
                                //btnAGregar.disabled = true;                    
                                
                                for(saquito of data[0]) {
    
                                    if( saquito.estado === 'C' ) {
                                        btnAGregar.hidden = false;
                                        pp.hidden = true;
                                        
                                         
                                         console.log("completado exitoso");
                                        //btnAGregar.disabled = false;  
                                        
    
                                    }else {
                                        
                                        btnAGregar.hidden = true;
                                        pp.hidden = false;

                                        //btnAGregar.disabled = true;
                               

                                        break; 
                                    }
                                }
                            }else {
                                btnAGregar.hidden = false
                             
                                //btnAGregar.disabled = false;                    
                                
                            }

                            /* ***************************************** */

                            /* ************************************** */

                        }
                    })

                })




    // <-- logica para hacer la operaccion-->
    $(document).on('blur','.valida', function(event){
        var num1 = parseInt(document.getElementById("valor").value);
        var num2 = parseInt(document.getElementById("numero_cuota").value);
if(num1 && num2){
        // Realizar la división
        var resultado = num1 / num2;
        document.getElementById("cuota").value=resultado
        
}
    })


// <--------------------------llamdo de  formulario para valores de operacion--------------------->



let numero1 = document.querySelectorAll("#numero_cuota");
let numero2  = document.querySelectorAll("#valor");
let resultadoOperacion = parseFloat(numero1)/parseFloat(numero2);



function selecionaRegistro(id, tp) {
    if (tp == 2) {
        dataURL = "<?php echo base_url('buscar_Registro'); ?>" + "/" + id;
        $.ajax({
            

            type: "POST",
            url: dataURL,
            dataType: "json",
            success: function(rs) {
              
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

/******* Data - Table ***********/
$(document).ready(function() {
    $('#miTabla').DataTable({
        scrollY: '500px',
        scrollCollapse: true,
        paging: true,
        language: {
            lengthMenu: 'Display _MENU_ records per page',
            zeroRecords: 'No se encontro nada - Lo siento',
            info: 'Mostrando pagina _PAGE_ de _PAGES_',
            infoEmpty: 'No se encontro el registro',
            infoFiltered: '(Filtrado de _MAX_ registros totales)',
        },
        responsive: true


    });
});

</script>




<?= $this->endSection("contenido")?>



<!-- <td>
    <a class="btn btn-warning" href="#"
        onclick=" selecionaRegistro(<php echo $dato['id_saquito'] . ',' . 2 ?>);" data-bs-toggle="modal"
        data-bs-target="#editarModal" width="16" height="16" title="Editar Registro">
        <img class="image" src="<?= base_url("img/editar.png") ?> " title="Editar">
    </a>
</td> -->