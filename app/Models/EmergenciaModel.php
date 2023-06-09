<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class EmergenciaModel extends Model{
    protected $table      = 'fondo_emergencia'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_fondo-emergencia';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['fecha_registro','valor','estado','usuario_crea','id_usuario', 'fecha_crea']; /* relacion de campos de la tabla */

    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;


    public function traer_fondo($id)
    {
        $this->select('fondo_emergencia.*');
        $this->where('estado','A');
        $this->where('id_usuario', $id);
        $datos = $this->findAll();  
        return $datos;
    }
    

    public function obtenerRegistroPorUsuario($id_usuario)
    {
        return $this->where('id_usuario', $id_usuario)->first();
    }


}