<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class ParamentrosModel extends Model{
    protected $table      = 'parametros_det'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_parametro_det';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['resumen','nombre','id_parametro_enc','fecha_crea','id_usuario_crea','estado']; /* relacion de campos de la tabla */
    
    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;


 // <-------------funcion traer_usuario que sera usada en controlador por la funcion  buscar_usuario----------------------->

 
    public function traerUsuario($clave, $valor){
    $this->select('parametros_det.*');
    $this->where($clave, $valor);
    $datos = $this->first();  
    return $datos;
    }
    // <-----------------------------------funcion eliminar en vista principal----------------------------------->

    public function elimina_usuario($id,$estado){
     $datos = $this->update($id, ['estado' => $estado]);         
    return $datos;
    }

    public function obtener_parametros(){
    $this->select('parametros_det.*');
    $this->where('estado', 'A');
    $datos = $this->findAll();  //nos trae todos los registros que cumplan con una condicion dada 
    return $datos;
    }

    public function obtener_encabezado_3(){
        $this->select('parametros_det.*');
        $this->where('estado', 'A');
        $this->where('id_parametro_enc', 3);
        $datos = $this->findAll();  //nos trae todos los registros que cumplan con una condicion dada 
        return $datos;
    }
    
    public function obtener_encabezado_1(){
        $this->select('parametros_det.*');
        $this->where('estado', 'A');
        $this->where('id_parametro_enc', 1);
        $datos = $this->findAll();  //nos trae todos los registros que cumplan con una condicion dada 
        return $datos;
   }

    public function obtener_encabezado_2(){
        $this->select('parametros_det.*');
        $this->where('estado', 'A');
        $this->where('id_parametro_enc', 2);
        $datos = $this->findAll();  //nos trae todos los registros que cumplan con una condicion dada 
        return $datos;
    }
    
    public function obtener_encabezado_6(){
        $this->select('parametros_det.*');
        $this->where('estado', 'A');
        $this->where('id_parametro_enc', 6);
        $datos = $this->findAll();  //nos trae todos los registros que cumplan con una condicion dada 
        return $datos;
    }

    public function ParametrosMovimientos(){
        $this->select('parametros_det.*, parametros_enc.estado');
        $this->join('parametros_enc', 'parametros_enc.id_parametro_enc = parametros_det.id_parametro_enc');
        $this->where('parametros_det.estado', 'A');
        $this->where('parametros_enc.estado', 'A');
        $this->whereIn('parametros_det.id_parametro_enc', [7,8]);
        $datos = $this->findAll();
        return $datos;
    }


    // public function ParametrosMovimientos($id_parametro_enc){

    // $this->select('parametros_det.*, parametros_enc.estado');
    // $this->join('parametros_enc', 'parametros_enc.id_parametro_enc = parametros_det.id_parametro_enc');
    // $this->where('parametros_det.estado', 'A');
    // $this->where('parametros_enc.estado', 'A');
    // $this->whereIn('parametros_det.id_parametro_enc', $id_parametro_enc);
    // $datos = $this->findAll();
    // return $datos;
    // }

}