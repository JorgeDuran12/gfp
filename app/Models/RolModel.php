<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class RolModel extends Model{
    protected $table      = 'roles'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_rol';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['nombre','usuario_crea','fecha_crea','estado','descripcion']; /* relacion de campos de la tabla */

    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;


 // <-------------funcion traer_rol que sera usada en controlador por la funcion  buscar rol----------------------->

 
 public function traer_rol($id){
    $this->select('roles.*');
    $this->where('estado','A');
    $this->where('id_rol',$id);
    $datos = $this->first();  
    return $datos;
}

public function elimina_rol($id,$estado){
    $datos = $this->update($id, ['estado' => $estado]);         
    return $datos;
}


    // <-----------------------------------funcion eliminar en vista principal----------------------------------->

public function obtenerusuario(){
    $this->select('roles.*');
      $this->where('estado', 'A');
    $datos = $this->findAll();  //nos trae todos los registros que cumplan con una condicion dada 
     return $datos;
  }
 
}
