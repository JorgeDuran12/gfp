<?php

namespace App\Controllers;
use App\Models\SaquitoModel;

class Saquito extends BaseController
{ 
    protected $saquito;

    public function __construct()
    
    {
        //$this->saquito = new SaquitoModel();
        //parent ::__construct();
    }

    public function index()
    {
        echo view("gfp/fondo/saquito", [
            'tituloPagina' => 'Mi saquito'
        ]);
    }
    function guardar(){
        $descripcion= $this->post("descripcion");
        $fecha_inicial= $this->post("fecha_inicial");
        $valor= $this->post("valor");
        $cuotas= $this->post("cuotas");
        $numero_cuotas= $this->post("numero_cuotas");

        $datos = array (
            "descripcion" => $descripcion,
            "fecha_inical" => $fecha_inicial,
            "valor" => $valor,
            "cuota" => $cuotas,
            "numero_cuotas" => $numero_cuotas,

        );
        $this->SaquitoModels->guardar($datos);
        echo "Registro guardado";


    }
    
   
}