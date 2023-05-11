<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class MovimientoModel extends Model{
    protected $table      = 'movimientos'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_movimiento';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['descripcion','tipo_movimiento','clase_movimiento','valor','fecha_movimiento','estado','usuario_crea']; /* relacion de campos de la tabla */

    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;


    public function traer(){

        $session = session();
        $id_usuario = $session->get('id_usuario');

        $this->select('movimientos.*');
        $this->where('estado', 'A');
        $this->where('usuario_crea', $id_usuario);
        $data = $this->findAll();
        return $data;

    }

}