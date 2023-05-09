<?php

namespace App\Controllers;

use App\Controllers\BaseController; /*la plantilla del controlador general de codeigniter */
use App\Models\MovimientoModel;

class Movimiento extends BaseController    
{    
  protected $Movimiento;

    public function __construct()
    {
      $this->Movimiento = new MovimientoModel();

      
    }
    public function insertar()
    {
        if ($this->request->getMethod() == "post") {
             
                $this->Movimiento->save([
                    'descripcion' => $this->request->getPost('descripcion'),
                    'tipo_movimiento' => $this->request->getPost('tipo_movimiento'),
                    'clase_movimiento' => $this->request->getPost('clase_movimiento'),
                    'valor' => $this->request->getPost('valor'),
                    'fecha_movimiento' => $this->request->getPost('fecha_movimiento')
                ]);
            } 
            return redirect()->to(base_url('/mis_movimientos'));
        }

    
    }





        

    
   
