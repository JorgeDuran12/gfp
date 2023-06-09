<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class EmailsModel extends Model{
    protected $table      = 'emails'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_email';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['email','prioridad','id_usuario','usuario_crea','estado','fecha_crea']; /* relacion de campos de la tabla */
    
    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;


 // <-------------funcion traer_email que sera usada en controlador por la funcion  buscar_email----------------------->

    public function traerEmail($id){
    $this->select('emails.*');
    $this->where('emails',$id);
    $this->where('estado','A');
    $datos = $this->first();  
    return $datos;
    }

    // <-----------------------------------funcion eliminar en vista principal----------------------------------->

    public function elimina_email($id,$estado){
     $datos = $this->update($id, ['estado' => $estado]);         
    return $datos;
    }

    // public function obtener_parametros(){
    //  $this->select('emails.*');
    //   $this->where('estado', 'A');
    //  $datos = $this->findAll();  //nos trae todos los registros que cumplan con una condicion dada 
    //   return $datos;
    // }
 
    public function AuthEmail($email){
      $this->select('emails.*, usuarios.pass');
      $this->join('usuarios', 'emails.id_usuario = usuarios.id_usuario');
      $this->where('email', $email);
      $this->where('prioridad', 9);
      $this->where('emails.estado', 'A');
      $datos = $this->first(); 
      // var_dump($datos);
      return $datos;
    }
    
  
  public function Id_Usuario_Email($email)
  {
      $datos = $this->AuthEmail($email);
      return $datos ? $datos['id_usuario'] : null;
  }

  public function traer_emails_by_id( $id, $prioridad )
  {
    $this->select('emails.*');
    $this->where('estado','A');
    $this->where('id_usuario',$id);
    $this->where('prioridad', $prioridad);
    $datos = $this->findAll();  
    return $datos;
  }

  public function traer_emails_by_id_verificar( $id )
  {
    $this->select('emails.*');
    $this->where('estado','A');
    $this->where('id_usuario',$id);
    // $this->where('prioridad', $prioridad);
    $datos = $this->findAll();  
    return $datos;
  }
  public function traer_emails_by_correo( $email )
  {
    $this->select('emails.*');
    $this->where('estado','A');
    $this->where('email',$email);
    // $this->where('prioridad', '14');
    $datos = $this->find();  
    return $datos;
    
  }

}
