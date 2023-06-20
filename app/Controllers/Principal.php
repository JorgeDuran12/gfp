<?php

namespace App\Controllers;
use App\Models\DisponibleModel;
use App\Models\ProyeccionModel;
use App\Models\SaquitoModel;
use App\Models\EmergenciaModel;

class Principal extends BaseController
{

    protected $disponible, $proyeccion, $saquito, $emergencia, $grafica_e;

    public function __construct()
    {
        $this->disponible = new DisponibleModel();
        $this->Proyeccion = new ProyeccionModel();
        $this->saquito = new SaquitoModel();
        $this->emergencia = new EmergenciaModel();
        $this->grafica_e = new EmergenciaModel();

    }

    public function index(){

        $datos = session();
        $Disponible = $this->disponible->traer_disponible($datos->id_usuario);
        $trasabilidad_model = new DisponibleModel();
        $trasabilidad = $trasabilidad_model->obtener_trasabilidad();
        $grafica =  $this-> grafica_e->grafica_fondo();
        
        echo view('gfp/principal/principal', [ 
            'tituloPagina' => 'Inicio',
            'trasabilidad' => $trasabilidad,
            'misDatos' => $datos,
            'presupuestoActual' => $Disponible,
            'graficas_e'=>$grafica,
            

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
                'presupuesto_anual' => $presupuesto,
                'ingreso' => 0,
                'egreso' => 0,
                'id_usuario' => $idUsuarioGlobal,
            ]);

        $session->set(['presupuesto' => $presupuesto ]);

        return redirect()->to(base_url('/principal'))->with('estadoPresupuesto', 1);
        
    }

    public function buscar_presupuesto(){
        $returnData = array();

        $session = session();
        $idUsuario = $session->id_usuario;

        $disponible_ = $this->disponible->traer_disponible($idUsuario);
        if (!empty($disponible_)) {
            array_push($returnData, $disponible_);
        }
        echo json_encode($returnData);

    }
    // public function buscar_grafica(){
    //     $returnData = array();

    //     $session = session();
    //     $idUsuario = $session->id_usuario;

    //     $emergencia_ = $this->emergencia->grafica_fondo($idUsuario);
    //     if (!empty($emergencia_)) {
    //         array_push($returnData, $emergencia_);
    //     }
    //     echo json_encode($returnData);

    // }

}
    