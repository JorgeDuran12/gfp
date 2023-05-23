<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class UsuariosModel extends Model{
    protected $table      = 'usuarios'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_usuario';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['usuario','nombre','apellido','pass','fecha_crea','estado','id_rol','usuario_crea','tipo_documento','num_documento', 'token']; /* relacion de campos de la tabla */
    
    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;

 // <-------------funcion traer_usuario que sera usada en controlador por la funcion  buscar_usuario----------------------->

    public function traer_usuario()
    {

    $session = session();
    $id_usuario = $session->get('id_usuario');

    $this->select('usuarios.*, roles.nombre as rol_nombre, parametros_det.nombre as pf_tp, telefonos.numero as telefono, emails.email as email');
    $this->join('roles', 'roles.id_rol = usuarios.id_rol');
    $this->join('telefonos', 'telefonos.id_usuario = usuarios.id_usuario');
    $this->join('emails','emails.id_usuario = usuarios.id_usuario');
    $this->join('parametros_det', 'parametros_det.id_parametro_det = usuarios.tipo_documento');
    $this->where('usuarios.estado','A');
    $this->where('usuarios.id_usuario',$id_usuario);
    $datos = $this->first();  
    return $datos;
    }

    
    public function DataActualizar($id, $estado)
    {
        $this->select('usuarios.*, emails.email as email, telefonos.numero as telefono');
        $this->join('telefonos', 'telefonos.id_usuario = usuarios.id_usuario');
        $this->join('emails', 'emails.id_usuario = usuarios.id_usuario');
        $this->where('usuarios.id_usuario', $id);
        $this->where('usuarios.estado', $estado);
        $this->where('emails.estado', 'A');
        $this->where('telefonos.estado', 'A');
        $datos = $this->first();
    
        return $datos;
    }
    
    // <-----------------------------------funcion eliminar en vista principal----------------------------------->

    public function elimina_usu($id,$estado){
        $datos = $this->update($id, ['estado' => $estado]);         
        return $datos;
    }

    public function obtener_usuario(){
        $this->select('usuarios.*');
        $this->where('estado', 'A');
        $datos = $this->findall();  //nos trae todos los registros que cumplan con una condicion dada 
        return $datos;
    }

    public function Auth_usuario($email) {
        $this->select('usuarios.*');
        $this->join('emails', 'emails.id_usuario = usuarios.id_usuario');
        $this->where('emails.email', $email);
        $this->where('usuarios.estado', 'A');
        $datos = $this->get()->getRowArray(); 
        // var_dump($datos);
        return $datos;
    }
    public function verificar_email_bd($email) {
        $this->select('usuarios.*');
        $this->join('emails', 'emails.id_usuario = usuarios.id_usuario');
        $this->where('emails.email', $email);
        $this->where('usuarios.estado', 'A');
        $datos = $this->get()->getRowArray(); 
        // var_dump($datos);
        return $datos;
    }


    
}