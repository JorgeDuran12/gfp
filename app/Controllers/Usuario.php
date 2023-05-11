<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\UsuariosModel;
use App\Models\RolModel;
use App\Models\EmailsModel;
use App\Models\ParamentrosModel;
use App\Models\TelefonosModel;


class Usuario extends BaseController
{
    protected $usuario,$rol,$parametro,$email,$telefono;

    public function __construct()
    {
        $this->usuario = new UsuariosModel();
        $this->rol = new RolModel();
        $this->parametro = new ParamentrosModel();
        $this->email = new EmailsModel();
        $this->telefono = new TelefonosModel();
    }

    public function index()
    {
        
        $usuario = $this->usuario->where('estado', "A")->findAll();   
        $parametro = $this->parametro->obtener_encabezado_3();   
        $rol = $this->rol->where('estado', "A")->findAll();  
        $email = $this->email->where('estado', "A")->findAll();     
        $telefono = $this->telefono->where('estado', "A")->findAll();    
        $datos = ['tituloPag' => 'Administrador','usuarios'=>$usuario, 'roles'=>$rol, 'parametros'=>$parametro, 'tituloPagina' => 'Administradores' ];

        echo view("gestion/administrador/administrador", $datos);
    }

    public function insertar()
    {
        $tp=$this->request->getPost('tp');

        if ($this->request->getMethod() == "post") {

            if ($tp === 1) {
                
            $session = session();
            $usuario_crea = $session->get('id_usuario');

                $password = $this->request->getPost('pass');
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);

                $this->usuario->save([
                    'usuario' => $this->request->getPost('usuario'),
                    'nombre' => $this->request->getPost('nombre'),
                    'apellido' => $this->request->getPost('apellido'),
                    'id_rol' => $this->request->getPost('id_rol'),
                    'tipo_documento' => $this->request->getPost('tipo_documento'),
                    'num_documento' => $this->request->getPost('num_documento'),
                    'pass' => $hashed_password,
                    'usuario_crea' =>  $usuario_crea
                ]);

                $id_usuario = $this -> usuario ->insertID(); 

                $this -> usuario -> save([
                    'id_usuario' => $id_usuario,
                    'usuario_crea'=> $usuario_crea
                ]);
    
                $this -> email -> save([
                    'id_usuario' => $id_usuario,
                    'usuario_crea'=> $usuario_crea,
                    'prioridad' => 13,
                    'email' => $this -> request ->getPost('email')
                ]);
    
                $this -> telefono -> save([
                    'id_usuario' => $id_usuario,
                    'usuario_crea'=>  $usuario_crea,
                    'prioridad' => 13,
                    'numero' => $this -> request ->getPost('telefono')
                ]);
    

            } else {
                $this->usuario->update($this->request->getPost('id_usuario'),[       
                    'usuario' => $this->request->getPost('usuario'),             
                    'nombre' => $this->request->getPost('nombre'),
                    'apellido' => $this->request->getPost('apellido'),
                    'id_rol' => $this->request->getPost('id_rol'),
                    'tipo_documento' => $this->request->getPost('tipo_documento'),
                    'num_documento' => $this->request->getPost('num_documento'),
                    'pass' => $this->request->getPost('pass'),
                    'usuario_crea' =>  $usuario_crea
                   
                ]);
            }

            return redirect()->to(base_url('/usuario'));
        }
    }
//  <----------------------------------------vista eliminados------------------------------------>
    public function eliminados()
    {
        $usuario = $this->usuario->where('estado', "e")->findAll();   
        $parametro = $this->parametro->obtener_encabezado_3();   
        $rol = $this->rol->where('estado', "A")->findAll();  
        $email = $this->email->where('estado', "A")->findAll();     
        $telefono = $this->telefono->where('estado', "A")->findAll();    
        $datos = ['tituloPag' => 'Administrador','usuarios'=>$usuario, 'roles'=>$rol, 'parametros'=>$parametro, 'tituloPagina' => 'Administradores' ];
        echo view("gestion/administrador/admin_eliminados", $datos);
    }

// funcion eliminar
    public function eliminar__usuario($id,$estado){
       $usuario_ = $this->usuario->elimina_usu($id,$estado);
       return redirect()->to(base_url('gestion_de_administradores'));
    }

      // <---------------------------------buscar_usuario del model traer_usuario -------------------------------------->
      public function buscar_usuario($id_usuario)
      {
          $returnData = array();
          $usuarioF_ = $this -> usuario ->DataActualizar($id);
          var_dump($usuarioF_);
          exit();
          if (!empty($usuarioF_)) {
              array_push($returnData, $usuarioF_);    
          }
          echo json_encode($returnData);
      }

}
