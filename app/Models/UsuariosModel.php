<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class UsuariosModel extends Model{
    protected $table      = 'usuarios'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_usuario';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['usuario','nombre','apellido','pass','fecha_crea','estado','id_rol','usuario_crea','tipo_documento','num_documento']; /* relacion de campos de la tabla */
    
    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;


 // <-------------funcion traer_usuario que sera usada en controlador por la funcion  buscar_usuario----------------------->

 
 public function traer_usuario($id){
    $this->select('usuarios.*');
    $this->where('estado','A');
    $this->where('id_usuario',$id);
    $datos = $this->first();  
    return $datos;
}

    // <-----------------------------------funcion eliminar en vista principal----------------------------------->

 public function elimina_usuario($id,$estado){
     $datos = $this->update($id, ['estado' => $estado]);         
    return $datos;
}

 public function obtener_usuario(){
     $this->select('usuarios.*');
     $this->where('estado', 'A');
     $datos = $this->findall();  //nos trae todos los registros que cumplan con una condicion dada 
      return $datos;
   }
}