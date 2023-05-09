<?php

namespace App\Models; //Reservamos el espacio de nombre de la ruta app\models

use CodeIgniter\Model;

class AgendaModel extends Model{
    protected $table      = 'agenda'; /* nombre de la tabla modelada/*/
    protected $primaryKey = 'id_agenda';

    protected $useAutoIncrement = true; /* Si la llave primaria se genera con autoincremento*/

    // protected $returnType     = 'array';  /* forma en que se retornan los datos */
    // protected $useSoftDeletes = false; /* si hay eliminacion fisica de registro */

    protected $allowedFields = ['descripcion', 'title', 'color', 'start', 'end']; /* relacion de campos de la tabla */

    // protected $useTimestamps = true; /*tipo de tiempo a utilizar */
    // protected $dateFormat    = 'datetime'; /* Tipo fecha */
    // protected $createdField  = 'fecha_crea'; /*fecha automatica para la creacion */
    protected $updatedField  = ''; /*fecha automatica para la edicion */
    protected $deletedField  = 'id_agenda'; /*no se usara, es para la eliminacion fisica */

    protected $validationRules    = [];
    protected $validationMessages = [];
    // protected $skipValidation    = false;



    public function traer_todos_los_eventos(){
        $this->select('agenda.*');
        $datos = $this->find();
        return $datos;
    }



}
