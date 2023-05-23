<?php

namespace App\Models; 

use CodeIgniter\Model;

class DisponibleModel extends Model{
    protected $table      = 'disponibles'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_disponible';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    // protected $returnType     = 'array';  /* forma en que se retornan los datos */
    // protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['periodo', 'saldo_anterior', 'ingreso', 'egreso', 'estado', 'fecha_crea', 'id_usuario', 'presupuesto_anual']; /* relacion de campos de la tabla */

    // protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    // protected $dateFormat    = 'datetime'; /* Tipo fecha */
    // protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    // protected $skipValidation    = false;


    //Retornar solo el saldo anterior ( o actual )
    public function traer_disponible($id){
        $this->select('disponibles.*');
        $this->where('id_usuario', $id);
        $datos = $this->find();
        
        if( empty($datos) ) {
            return 0;
        }else {
            return $datos[0]['saldo_anterior'];
        }
    }

    //informacion de trasabilidad
    public function obtener_trasabilidad(){
        $session = session();
        $id_usuario = $session->get('id_usuario');

        $this->select('disponibles.*');
        $this->where('estado', 'A');
        $this->where('id_usuario', $id_usuario);
        $datos = $this->findAll();  //nos trae todos los registros que cumplan con una condicion dada 
        return $datos;
    }

    public function datos_ingreso(){
        $session = session();
        $id_usuario = $session->get('id_usuario');

        $this->select('disponibles.saldo_anterior, ingreso , egreso');
        $this->where('estado','A');
        $this->where('id_usuario', $id_usuario);
        $datos = $this-> first();
        // var_dump($datos);
        return $datos;
    }


}
