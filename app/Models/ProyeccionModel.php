<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class ProyeccionModel extends Model{
    protected $table      = 'proyeccion'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_proyeccion';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['fecha_cuota','valor_cuota','id_saquito','fecha_crea','usuario_crea','estado']; /* relacion de campos de la tabla */
    
    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;



    public function traer_Proyeccion($id){
        $this->select('proyeccion.*');
        $this->where('usuario_crea',$id);
        $this->where('proyeccion.estado','A');
        $datos = $this->findAll();  // nos trae el registro que cumpla con una condicion dada 

        return $datos;
    }


    public function traer(){
    $session = session();
    $id_usuario = $session->get('id_usuario');

        $this->select('proyeccion.*, saquitos.descripcion as descripcion');
        $this->join('saquitos', 'saquitos.id_saquito = proyeccion.id_saquito');
        $this->where('saquitos.estado ','A');
        $this->where('proyeccion.usuario_crea',$id_usuario);
        $data = $this->findAll();
        return $data;
    }
    
    public function traer_proye(){
        $session = session();
        $id_usuario = $session->get('id_usuario');

        $this->select('proyeccion. valor_cuota');
        $this->join('saquitos', 'saquitos.id_saquito = proyeccion.id_saquito');
        
        
        $this->where('saquitos.estado','A');
        $this->where('proyeccion.usuario_crea', $id_usuario);
        $this->where('proyeccion.estado','A');
        $datos['valor_cuota']= $this-> find();
        //  var_dump($datos);   

          if( empty($datos) ) {
            $datos['valor_cuota'] = 0;
              return $datos;
          }else {
              return $datos;
          } 

    }
    

    public function obtenerDatos()
    {
        $this->select('valor_cuota, fecha_cuota, id_saquito, total');
        $this->where('estado','A');
        $datos = $this->findAll();

        return $datos;
    }

        //    funcion para llenar de manara dinamica la tabla de proyeccion 

    function historialProyeccionByIdSaquito($id) {
        $this->select('proyeccion.*');
        $this->where('id_saquito', $id);
        $datos = $this->findAll();
        return $datos;
    }

   
}
    

