<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class EmergenciaModel extends Model{
    protected $table      = 'fondo_emergencia'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_fondo-emergencia';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['fecha_registro','valor','estado','usuario_crea','id_usuario', 'fecha_crea',]; /* relacion de campos de la tabla */

    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;
    
    
    
    public function grafica_fondo(){
        $session = session();
        $id_usuario = $session->get('id_usuario');
        $this->select('fondo_emergencia.*');
        $this->where('estado','A');
        $this->where('fondo_emergencia.usuario_crea',$id_usuario);
        $datos = $this->first();
        return $datos['valor'];
    } 


    public function traer_fondo($id)
    {
        $this->select('fondo_emergencia.*, sum(valor) as sum');
        $this->where('id_usuario', $id);
        $this->where('estado','A');
        $datos = $this->findAll();
        return $datos;
    }


    public function Actualizar_fondo($id, $estado)
    {
        $this->select('fondo_emergencia.*');
        $this->where('estado', $estado);
        $this->where('id_fondo-emergencia', $id);
        $datos = $this->first();
        return $datos;
    }
    

    public function verificarRegistro($id_usuario)
    {
        $this->select('*');
        $this->where('id_usuario', $id_usuario);
        $this->where('estado', 'A');
        $datos = $this->first();
        return $datos;
    }

    public function obtenerDatosInsercion($id_usuario)
    {
        $this->select('fondo_emergencia.*');
        $this->where('id_usuario', $id_usuario);
        $this->where('estado', 'A');
        $datos = $this->first();
        return $datos;
    }
    
}