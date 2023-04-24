<body>
<link rel="stylesheet" href="<?= base_url("/css/registro/movimientoss.css")?>">

<div class="titulo"> 
  <h2>Movimientos</h2>
</div ><br><br>
<div  >
<form action="" class="registro">
<div class="tm">
      <select class="form-select" id="floatingSelectGrid" aria-label="Floating label select example">
        <option selected class="tl">Tipo De Movimiento</option>
        <option value="1" class="tl">Egreso</option>
        <option value="2" class="tl">Ingreso</option>
       
      </select>
 </div>     
 <br>
 <div class="tm">
      <select class="form-select" id="floatingSelectGrid" aria-label="Floating label select example">
        <option selected class="tl">Clase De Movimiento</option>
        <option value="1" class="tl">Bancario</option>
        <option value="2" class="tl">No Bancario</option>
       
      </select>
 </div>  
<br>

<div class="tx">
  <input  type="number" class="form-control" id="floatingInput" placeholder="Valor ">
  <label for="floatingInput"></label>
</div>
<br>
<div class="dc">
  <textarea class="dc" placeholder="Descripcion" id="floatingTextarea"></textarea>
   
</div>
<br>
<div class="">
  <input type="date" class="form-control" id="floatingInput" placeholder="name@example.com">
  <label for="floatingInput"></label>
</div>

<div class="botondeanti">
  <button data-bs-toggle="modal" data-bs-target="#movimientoModal" type="button" class="btn btn-success"> <img  class="image" src="<?= base_url("img/Guardar.png") ?> " title="Guardar" >
    </button>
</div>
<br>
<div class="rt">
  <button data-bs-toggle="modal" data-bs-target="#reporteingresoModal"   type="button" class="btn btn-secondary">
 <img src="<?= base_url("icons/file-earmark-spreadsheet-fill.svg") ?>" > 
    Reporte ingreso
  </button>
    
</div><br> 
<div class="rt">
  <button data-bs-toggle="modal" data-bs-target="#reporteegresoModal" type="button" class="btn btn-secondary">  
 <img src="<?= base_url("icons/file-earmark-spreadsheet-fill.svg") ?>" > 
    Reporte egreso
  </button>
    
</div>

</form>
<div class="modal fade" id="movimientoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Guardar Movimiento</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Desea Guardar Este Movimiento
        </div>
        <div class="modal-footer">
          <button type="button" class=" btn a" data-bs-dismiss="modal">Cancelar</button>
          <button type="Submit" class="btn btn-success">Guadar</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="reporteingresoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Reporte Ingreso</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        <div id="contenedor">
  <div id="limite">
            <div class="table-responsive">
                <table class="table table-bordered table-sm table-striped" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr >
                         
                            <th>valor</th>
                            <th>fecha</th>
                            <th>tipoMovimiento</th>
                            <th>descripcion</th>
                        </tr>
                    </thead>
                    <tbody >

                          <tr>
                            <td>1.000.000</td>
                            <td>11/5/2023</td>
                            <td>No Bancario</td>
                            <td>venta de un cel q tenia viejo venta de un cel q tenia viejo venta de un cel q tenia viejo </td>
                         
                          </tr>
                        
                    </tbody>
                </table>
            </div>
            </div>
            </div>

        </div>
        <div class="modal-footer">
          <button type="button" class=" btn a" data-bs-dismiss="modal">Cancelar</button>
          <button type="Submit" class="btn btn-success">Guadar</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="reporteegresoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Reporte Egreso</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
       
        <div id="contenedor">
  <div id="limite">
            <div class="table-responsive">
                <table class="table table-bordered table-sm table-striped" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr >
                         
                            <th>valor</th>
                            <th>fecha</th>
                            <th>tipoMovimiento</th>
                            <th>descripcion</th>
                            
                        </tr>
                    </thead>
                    <tbody >

                          <tr>
                            <td>50.000</td>
                            <td>11/6/2023</td>
                            <td>bancario</td>
                            <td>pago del plan pago del plan pago del plan pago del plan pago del plan pago del plan</td>
                            
                          </tr>
                        
                    </tbody>
                </table>
            </div>
            </div>
            </div>

        </div>
        <div class="modal-footer">
          <button type="button" class=" btn a" data-bs-dismiss="modal">Cancelar</button>
          <button type="Submit" class="btn btn-success">Guadar</button>
        </div>
      </div>
    </div>
  </div>
</div>


</div>
</div>
</body>