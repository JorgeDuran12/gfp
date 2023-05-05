<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class SaquitoModel extends Model{
    protected $table      = 'saquito'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_saquito';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['descripcion','fecha_inicial','valor','numero_cuotas','cuota','estado','fecha_crea','id_usuario_crea']; /* relacion de campos de la tabla */

    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;
  
   
     
       /* public function traer_saquitos($id){
            $this->select('saquitos.*');
            $this->where('id', $id);
            $datos = $this->first();  // nos trae el registro que cumpla con una condicion dada 
            return $datos;
        }*/
}


