<?php

namespace App\Controllers;


use App\Controllers\BaseController;
use App\Models\UsuariosModel;
use App\Models\RolModel;
use App\Models\ParamentrosModel;




class Usuario extends BaseController
{
    protected $usuario,$rol,$parametro;

    public function __construct()
    {
        $this->usuario = new UsuariosModel();
        $this->rol = new RolModel();
        $this->parametro = new ParamentrosModel();

    }

    public function index()
    {
        $usuario = $this->usuario->where('estado', "A")->findAll();   
        $parametro = $this->parametro->where('estado', "A")->findAll();   
        $rol = $this->rol->where('estado', "A")->findAll();   
        $datos = ['tituloPag' => 'Administrador','usuarios'=>$usuario, 'roles'=>$rol, 'parametros'=>$parametro, 'tituloPagina' => 'Administradores' ];

        echo view("gestion/administrador/administrador", $datos);
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
      public function buscar_usuario($id_usuario)
      {
          $returnData = array();
          $usuario_ = $this->usuario->traer_usuario($id_usuario);
          if (!empty($usuario_)) {
              array_push($returnData, $usuario_);    
          }
          echo json_encode($returnData);
      }

}
