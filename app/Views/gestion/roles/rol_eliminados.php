<?= $this->extend("layouts/gfpLayout")?>
<?= $this->section("contenido")?>

<body>

  <div>
    <div>
      <h1 class="titulo_Vista">Roles Eliminados</h1>
    </div>
    <div class="card-body">

      <div class="row col-sm-12" >
      <div class="col-md-5ths col-lg-5ths col-xs-6 col-sm-5"></div>
      <div class="col-md-5ths col-lg-5ths col-xs-6 col-sm-2">        
        <a href="<?php echo base_url('gestion/roles'); ?>" class="btn btn-primary regresar_Btn">Regresar</a>
      </div>
      </div>

      <br>
      <div class="table-responsive">
        <table class="table  table-sm table-striped" id="miTabla" width="100%" cellspacing="0">
          <thead>
                            <th>Id rol</th>
                            <th>Nombre</th>
                            <th></th>
                            <th>estado</th>
             
              <th>Acciones</th>
             </tr>
          </thead>
          <tbody >
            <?php foreach ($roles as $dato) { ?>
              <tr>
              <td> <?php echo $dato['id_rol']; ?></td>
                    <td> <?php echo $dato['nombre']; ?></td>
                    <td> <?php echo $dato['descripcion']; ?></td>
                    <td> <?php if($dato['estado']=="A"){echo "Activo";}else{echo "Eliminado";}?></td>
                <td>
                <a class="btn btn-info"  href="#" data-href="<?php echo base_url('rol/eliminar__rol') . '/' .$dato['id_rol']. '/' .'A'; ?>" data-bs-toggle="modal" data-bs-target="#modal-confirma"  width="16" height="16" title="Activar Registro">
                <img
                    class="image" src="<?= base_url("img/restaurar.png") ?> " title="Eliminar">
               </a>
              
                </td>
            
                </td>

              </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      
      <!-- Modal Confirma Eliminar -->
      <div class="modal fade" id="modal-confirma" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div  class="modal-content">
                <div class="modaal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Activación de Registro</h5>
                    
                </div>
                <div style="text-align:center;font-weight:bold;" class="modal-body">
                    <p>Seguro Desea Activar Este Registro?</p>
                </div>
                <div class="modal-footer">
                    <a type="button" class="btn btn-primary close" data-bs-dismiss="modal">No</a>
                    <a class="btn btn-danger btn-ok">Si</a>
                </div>
            </div>
        </div>
    </div>
       <!-- Modal Elimina -->
    

</body>
<script>
    $('#modal-confirma').on('show.bs.modal', function(e) {
        $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
    });
  
  function eliminados_rol(id_rol) {     
      $("#id").val(id_rol);
      dataURL = "<?php echo base_url('eliminar__rol'); ?>" + "/" + id_rol + "/" + 'A';
      $.ajax({
        type: "POST",
        url: dataURL,
        dataType: "json",
        success: function(rs) {

        },
        error: function() {
                alert("No se ha podido activar el registro");
            }
      })

  };
 
  $('.close').click(function() {$("#modal-confirma").modal("hide");});




  $(document).ready(function() {
    $('#miTabla').DataTable({
        scrollY: '700px',
        scrollCollapse: true,
        paging: true,
        responsive: true,

        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }
    });
});
</script>

<?= $this->endSection("contenido")?>