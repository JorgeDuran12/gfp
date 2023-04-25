<body>
<link rel="stylesheet" href="<?= base_url("/css/actividades/actividadess.css")?>">
    <div class="titulo"> 
        <h2>Actividades</h2>
    </div ><br><br>

   <div>
    <form  class="actividad" action="">

    <div >
       <div class="titulo"> Mi Recordatorio De Pago Mes a Mes</div>
  <textarea class="dp" placeholder="Descripcion" id="floatingTextarea"></textarea>
</div>
 
<div class="tm">
         <input type="date" class="form-control" id="floatingInput"            placeholder="name@example.com">
         <label for="floatingInput"></label>
    </div>

<div class="tm">
         <input type="time" class="form-control" id="floatingInput"            placeholder="name@example.com">
         <label for="floatingInput"></label>
    </div>
   

    <div class="botondeanti">
  <button data-bs-toggle="modal" data-bs-target="#guardarmesModal" type="button" class="btn btn-success"> <img  class="image" src="<?= base_url("img/Guardar.png") ?> " title="Editar" >
    </button>
  <button data-bs-toggle="modal" data-bs-target="#eliminarmesModal"  type="button" class="btn btn-danger"> <img  class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar" >
    </button>
  <button data-bs-toggle="modal" data-bs-target="#editarmesModal"  type="button" class="btn btn-warning">
    <img  class="image" src="<?= base_url("img/editar.png") ?> " title="Editar" >
  </button>
  </div>
<br><br><br>
  <div class="titulo"> Mi Recordatorio Diario</div>
  <textarea class="sd" placeholder="Descripcion" id="floatingTextarea"></textarea>
<br>
<div class="tm">
         <input type="time" class="form-control" id="floatingInput"            placeholder="name@example.com">
         <label for="floatingInput"></label>
    </div>
    <div class="botondeanti">
  <button data-bs-toggle="modal" data-bs-target="#guardardiaModal"  type="button" class="btn btn-success"> <img  class="image" src="<?= base_url("img/Guardar.png") ?> " title="Guardar" >
    </button>
  <button data-bs-toggle="modal" data-bs-target="#eliminardiaModal"  type="button" class="btn btn-danger"> <img  class="image" src="<?= base_url("img/Eliminar.png") ?> " title="Eliminar" >
    </button>
  <button data-bs-toggle="modal" data-bs-target="#editardiaModal"  type="button" class="btn btn-warning">
    <img  class="image" src="<?= base_url("img/editar.png") ?> " title="Editar" >
  </button>
  </div>
        
</div>
       
    </form>

    <div class="modal fade" id="guardardiaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Guardar Recordatorio</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          ¿Desea guardar este recordatorio diario?
        </div>
        <div class="modal-footer">
          <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
          <button type="Submit" class="btn btn-success">Guadar</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="guardarmesModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Guardar Recordatorio</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        ¿Desea guardar este recordatorio mensual?
        </div>
        <div class="modal-footer">
          <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
          <button type="Submit" class="btn btn-success">Guadar</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="eliminarmesModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Eliminar Recordatorio</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          ¿Desea eliminar este recordatorio mensual?
        </div>
        <div class="modal-footer">
          <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
          <button type="Submit" class="btn btn-success">Guadar</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="eliminardiaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Eliminar Recordatorio </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        ¿Desea eliminar este recordatorio diario?
        </div>
        <div class="modal-footer">
          <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
          <button type="Submit" class="btn btn-success">Guadar</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="editarmesModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Editar Recordatorio Mensual</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        
        <div >
       <div class="titulo"></div>
          <textarea class="dp" placeholder="Descripcion" id="floatingTextarea"></textarea>
      </div>
 
        <div class="tm">
           <input type="date" class="form-control" id="floatingInput"            placeholder="name@example.com">
           <label for="floatingInput"></label>
       </div>

        <div class="tm">
            <input type="time" class="form-control" id="floatingInput"            placeholder="name@example.com">
         <label for="floatingInput"></label>
        </div>
   

         </div>
         <div class="modal-footer">
            <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
            <button type="Submit" class="btn btn-success">Guadar</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="editardiaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Editar Recordatorio Diario</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        
        <div class="titulo"></div>
  <textarea class="sd" placeholder="Descripcion" id="floatingTextarea"></textarea>
<br>
<div class="tm">
         <input type="time" class="form-control" id="floatingInput"            placeholder="name@example.com">
         <label for="floatingInput"></label>
    </div>

         </div>
         <div class="modal-footer">
            <button type="button" class=" btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
            <button type="Submit" class="btn btn-success">Guadar</button>
        </div>
      </div>
    </div>
  </div>
</div>


   </div>

    </div>
    </div></div> 
    <div></div>
</body>
<label class="btnt"></label>