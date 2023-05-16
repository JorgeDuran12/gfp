<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\RolModel;

class Rol extends BaseController
{
    protected $rol;

    public function __construct()
    {
        $this->rol = new RolModel();
    }

    public function index()
    {
        $rol = $this->rol->where('estado', "A")->findAll();   
        $datos = ['tituloPagina' => 'Rol','roles'=>$rol];

        echo view("gestion/roles/rol", $datos);
    }

    public function insertar()
    {
        $tp=$this->request->getPost('tp');
        if ($this->request->getMethod() == "post") {	

            $session = session(); 
            $id_usuario = $session->get('id_usuario');

            if ($tp == 1) {
                $this->rol->save([
                    'descripcion' => $this->request->getPost('descripcion'),
                    'nombre' => $this->request->getPost('nombre'),
                    'usuario_crea' => $id_usuario
                ]);
            } else {
             $this->rol->update($this->request->getPost('id'),[                    
                 'nombre' => $this->request->getPost('nombre'),
                'descripcion' => $this->request->getPost('descripcion'),
                'usuario_crea' => $id_usuario
                
         ]);
             }
            return redirect()->to(base_url('/rol'));
        }
    }
      //<---------------------------------buscar_rol del model traer_rol -------------------------------------->
      public function buscar_rol($id)
      {
          $returnData = array();
          $rol_ = $this->rol->traer_rol($id, 'A');
          if (!empty($rol_)) {
              array_push($returnData, $rol_);    
          }
          echo json_encode($returnData);
      }
}