<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class UsuariosModel extends Model{
    protected $table      = 'usuarios'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_usuario';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['usuario','nombre','apellido','pass','fecha_crea','estado','id_rol','usuario_crea']; /* relacion de campos de la tabla */

    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;


 // <-------------funcion traer_cargo que sera usada en controlador por la funcion  buscar cargo----------------------->

 
 public function traerUsuario($clave, $valor){
    $this->select('usuarios.*');
    $this->where($clave, $valor);
    $datos = $this->first();  
    return $datos;
}

    // <-----------------------------------funcion eliminar en vista principal----------------------------------->

 public function elimina_usuario($id,$estado){
     $datos = $this->update($id, ['estado' => $estado]);         
    return $datos;
}

 public function obtenerusuario(){
     $this->select('usuarios.*');
      $this->where('estado', 'A');
     $datos = $this->findAll();  //nos trae todos los registros que cumplan con una condicion dada 
      return $datos;
   }
 
}
