<?php

namespace App\Controllers;

use App\Models\ProyeccionModel;
//use App\Models\MovimientosModel;
use App\Models\UsuariosModel;
use App\Models\SaquitoModel;

class Proyeccion extends BaseController
{
    protected $proyeccion;
    protected $saquito;
    //protected $movimiento;

    
    public function __construct()
    
    {
        // $this->Movimineto = new MovimientoModel();
        $this->Proyeccion = new ProyeccionModel();
        $this->usuario = new UsuariosModel();
        $this->saquito = new SaquitoModel();
        
    }
   
    public function index()
    {
        $Proyeccion= $this->Proyeccion->traer();
        echo view("gfp/fondo/proyeccion_saquito", [
            'tituloPagina' => 'Proyeccion',
            'proyeccion' => $Proyeccion,
            
        ]);
    }

    public function Insertar()
    {

        $session = session();
        $id_usuario = $session->get('id_usuario');

        $id_saquito = $this-> saquito -> traerId_saquito();

        $this->Proyeccion->save([
            'fecha_cuota' => $this->request->getPost('fecha_cuota'), 
            'valor_cuota' => $this->request->getPost('valor_cuota'), 
            'usuario_crea' => $id_usuario,
            'id_saquito' => $id_saquito,
        ]);

        return redirect()->to(base_url('/proyeccion'));
    }


  
   

}