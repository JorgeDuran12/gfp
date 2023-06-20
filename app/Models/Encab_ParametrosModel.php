<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class Encab_ParametrosModel extends Model{
    protected $table      = 'parametros_enc'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_parametro_enc';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['nombre','fecha_crea','id_usuario_crea','estado']; /* relacion de campos de la tabla */
    
    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;

    public function traer_Datos(){
        $this->select('parametros_enc.*');
        $this->where('estado', 'A');
        $this->whereIn('id_parametro_enc', [7,8,9]);
        $datos = $this->findAll();
        return $datos;

    }

    // funcion para traer el nombre del encabezado
    public function traer1Datos(){
        $this->select('parametros_enc.*');
        $this->where('estado', 'A');
        $datos = $this->findAll();
        return $datos;
    }
     
// funtion para  llamar solo el registro segun su id en ecabezado

    public function traer_registro($id){
        $this->select('parametros_enc.* ,parametros_det.*');
        $this->join('parametros_det','parametros_det.id_parametro_enc = parametros_enc.id_parametro_enc');
        $this->where('parametros_det.id_parametro_enc',$id);
        $this->where('parametros_enc.estado', 'A');
        $this->where('parametros_det.estado', 'A');
        // $this->where('parametros_det.id_parametro_enc', 'parametros_enc.id_parametro_enc');

        $datos = $this->findAll();
        return $datos;
    }


    public function traer_parametro($id){
        $this->select('parametros_enc.*');
        $this->where('id_parametro_enc',$id);
        $this->where('estado','A');
        $datos = $this->first();  
        return $datos;
    }

    
}

