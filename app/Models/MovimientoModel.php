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
       
        $this->select('movimientos.*, parametros_det.nombre as Tnombre, vw_parametros_det.nombre as Tnombre2, DATE(movimientos.fecha_movimiento) as Fecha_movimiento');
        $this->join('parametros_det', 'movimientos.tipo_movimiento=parametros_det.id_parametro_det');
        $this->join('vw_parametros_det', 'vw_parametros_det.id_parametro_det = movimientos.clase_movimiento');
        $this->where('movimientos.estado', 'A'); 
        $this->where('movimientos.usuario_crea', $id_usuario);
        $data = $this->findAll();
        return $data; 
    }

    public function tasa_movimiento(){
        $session = session();
        $id_usuario = $session->get('id_usuario');
        
        $this->select('movimientos.clase_movimiento, valor');
        $this->where('usuario_crea', $id_usuario);
        $this->where('estado', 'A');
        $datos = $this->findAll();
        return $datos;

    }


    public function grafica_movi() 
    {
        $session = session();
        $id_usuario = $session->get('id_usuario');
        
        $this->select('movimientos.valor,fecha_movimiento, descripcion');
        $this->where('estado', 'A');
        $this->where('usuario_crea', $id_usuario);
        $datos = $this->findAll();
        return $datos;
    }
    

}