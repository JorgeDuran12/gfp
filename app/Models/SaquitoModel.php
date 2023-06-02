<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class SaquitoModel extends Model{
    protected $table      = 'saquitos'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_saquito';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    protected $returnType     = 'array';  /* forma en que se retornan los datos */
    protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['descripcion','fecha_inicial','valor','numero_cuota','cuota','estado','fecha_crea','usuario_crea']; /* relacion de campos de la tabla */

    protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = ''; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation    = false;
  
   
        public function traer_saquitos($id){

            $this->select('saquitos.*');
            $this->where('usuario_crea', $id);
            // $this->where('estado', $estado);
            $datos = $this->findAll();  // nos trae el registro que cumpla con una condicion dada 
            return $datos;
        }

        public function traer(){

            $session = session();
            $id_usuario = $session->get('id_usuario');
    
            $this->select('saquitos.*');
            // $this->where('estado', 'A');
            $this->where('usuario_crea', $id_usuario);
            $data = $this->findAll();
            return $data;
        }

        public function traerId_saquito()
        {
            $session = session();
            $id_usuario = $session->get('id_usuario');

            $this->select('saquitos.*');
              $this->where('estado', 'A');
            $this->where('usuario_crea', $id_usuario);
            $datos = $this->first();
            return $datos['id_saquito'];
        }
        public function traer_sqto(){
            $session = session();
            $id_usuario = $session->get('id_usuario');
    
            $this->select('saquitos.*');
            $this->where('estado','A');
            $this->where('usuario_crea', $id_usuario);
            $datos = $this-> first();
            // var_dump($datos);
    
             if( empty($datos) ) {
                $datos['valor'] = 0;
                 $datos['numero_cuota'] = 0;
                $datos['cuota'] = 0;
                 return $datos;
             }else {
                 return $datos;
             }
        }
        public function completar_saquito($id,$estado){
            $datos = $this->update($id, ['estado' => $estado]);         
            return $datos;
        }
}


