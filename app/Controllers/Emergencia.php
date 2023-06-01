<?php

namespace App\Controllers;
use App\Models\MovimientoModel;
use App\Models\DisponibleModel;

class Emergencia extends BaseController
{
    protected $movimiento, $disponible;

    public function __construct(){

        $this->movimiento = new MovimientoModel();
        $this->disponible = new DisponibleModel();
    }
        
    public function index()
    {
        $session = session();
        // $movi = $this-> movimiento ->resta();
        // $movi = $this-> movimiento ->suma();
        $disponibles = $this-> disponible ->datos_ingreso();

        echo view("gfp/fondo/emergencia", [
            'tituloPagina' => 'Fondo de emergencia',
            // 'suma' => $movi,
            'disponibles' => $disponibles,
            'misDatos' => $session
        ]);
    }
   
}

 
