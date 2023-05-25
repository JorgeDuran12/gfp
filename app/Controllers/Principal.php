<?php

namespace App\Controllers;
use App\Models\DisponibleModel;

class Principal extends BaseController
{

    protected $disponible;

    public function __construct()
    {
        $this->disponible = new DisponibleModel();
        

    }

    public function index(){

        $datos = session();
        $Disponible = $this->disponible->traer_disponible($datos->id_usuario);
        $trasabilidad_model = new DisponibleModel();
        $trasabilidad = $trasabilidad_model->obtener_trasabilidad();
        

        echo view('gfp/principal/principal', [ 
            'tituloPagina' => 'Inicio',
            'trasabilidad' => $trasabilidad,
            'misDatos' => $datos,
            'presupuestoActual' => $Disponible
        ]);

    }

    /* metodos */
    
    public function agregar_presupuesto() {
        $session = session();
        $idUsuarioGlobal = $session->id_usuario;

        $periodo = $this->request->getPost('periodo_input');
        $presupuesto = $this->request->getPost('presupuesto_input');

        $this->disponible->insert([
            'periodo' => $periodo,
            'saldo_anterior' => $presupuesto,
            'ingreso' => 0,
            'egreso' => 0,
            'id_usuario' => $idUsuarioGlobal,
        ]);

        $session->set(['presupuesto' => $presupuesto ]);

        return redirect()->to(base_url('/principal'))->with('estadoPresupuesto', 1);
        
    }

}
