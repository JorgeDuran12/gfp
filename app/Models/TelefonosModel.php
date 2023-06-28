<?php

namespace App\Models; //Reservamos el espacio de numero de prioridad ruta app\models

use CodeIgniter\Model;

class TelefonosModel extends Model{
    protected $table      = 'telefonos'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_telefono';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['numero','prioridad','fecha_crea','estado','id_usuario', 'usuario_crea']; /* relacion de campos de la tabla */
    
    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;


 // <-------------funcion traer_usuario que sera usada en controlador por la funcion  buscar_usuario----------------------->

public function Perfiltelefono() {

    $session = session();
    $id_usuario = $session->get('id_usuario');

    $this->select('telefonos.*');
    $this->where('estado','A');
    $this->where('id_usuario',$id_usuario);
    $datos = $this->first();  
    return $datos;
}
 
 public function traer_usuario($id){
    $this->select('telefonos.*');
    $this->where('estado','A');
    $this->where('id_usuario',$id);
    $datos = $this->first();  
    return $datos;
}

public function traer_telefonos_by_id( $id, $prioridad ) {
    $this->select('telefonos.*');
    $this->where('estado','A');
    $this->where('id_usuario',$id);
    $this->where('prioridad', $prioridad);
    $datos = $this->findAll();  
    return $datos;
}

public function traer_telefonos_by_id_verificar( $id ) {
    $this->select('telefonos.*');
    $this->where('estado','A');
    $this->where('id_usuario',$id);
    // $this->where('prioridad', '13');
    $datos = $this->findAll();  
    return $datos;
}
public function traer_telefonos_by_numero( $numero ) {
    $this->select('telefonos.*');
    $this->where('estado','A');
    $this->where('numero',$numero);
    $this->where('prioridad', '10');
    $datos = $this->find();  
    return $datos;
}

    // <-----------------------------------funcion eliminar en vista principal----------------------------------->

//  public function elimina_usuario($id,$estado){
//     $datos = $this->update($id, ['estado' => $estado]);         
//     return $datos;
// }

//  public function obtener_usuario(){
//      $this->select('usuarios.*');
//      $this->where('estado', 'A');
//      $datos = $this->findall();  //nos trae todos los registros que cumplan con una condicion dada 
//       return $datos;
//    }


 
}
