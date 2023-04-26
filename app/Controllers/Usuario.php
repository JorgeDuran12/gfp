<?php

namespace App\Controllers;


use App\Controllers\BaseController;
use App\Models\UsuariosModel;
use App\Models\RolModel;



class Usuario extends BaseController
{
    protected $usuario,$rol;

    public function __construct()
    {
        $this->usuario = new UsuariosModel();
        $this->rol = new RolModel();

    }

    public function index()
    {
        $usuario = $this->usuario->where('estado', "A")->findAll();   
        $rol = $this->rol->where('estado', "A")->findAll();   
        $datos = ['tituloPag' => 'Administrador','usuarios'=>$usuario, 'roles'=>$rol ];

        $vistaPrincipal = 
        view('componentes/head', $datos)
        .view('componentes/navbar')
        .view('componentes/header')
        .view('usuario/usuario')
        .view('componentes/footer');
        
        return $vistaPrincipal;
    }

    public function insertar()
    {
        $tp=$this->request->getPost('tp');
        if ($this->request->getMethod() == "post") {
            if ($tp == 1) {
                $this->usuario->insert([
                    'usuario' => $this->request->getPost('usuario'),
                    'nombre' => $this->request->getPost('nombre'),
                    'apellido' => $this->request->getPost('apellido'),
                    'id_rol' => $this->request->getPost('id_rol'),
                    'tipo_documento' => $this->request->getPost('tipo_documento'),
                    'num_documento' => $this->request->getPost('num_documento'),
                    'pass' => $this->request->getPost('pass'),
                ]);
            } else {
                $this->usuario->update($this->request->getPost('id'),[       
                    'usuario' => $this->request->getPost('usuario'),             
                    'nombre' => $this->request->getPost('nombre'),
                    'apellido' => $this->request->getPost('apellido'),
                    'id_rol' => $this->request->getPost('id_rol'),
                    'tipo_documento' => $this->request->getPost('tipo_documento'),
                    'num_documento' => $this->request->getPost('num_documento'),
                    'pass' => $this->request->getPost('pass')
                   
                ]);
            }
            return redirect()->to(base_url('/usuario'));
        }
    }
      // <---------------------------------buscar_usuario del model traer_usuario -------------------------------------->
      public function buscar_usuario($id)
      {
          $returnData = array();
          $usuario_ = $this->usuario->traer_usuario($id);
          if (!empty($usuario_)) {
              array_push($returnData, $usuario_);    
          }
          echo json_encode($returnData);
      }

}
