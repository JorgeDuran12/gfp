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
    protected $perfil;
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
        $session = session();

        $usuario = $this->usuario->where('estado', "A")->findAll();   
        $parametro = $this->parametro->obtener_encabezado_3();   
        $rol = $this->rol->where('estado', "A")->findAll();  
        $email = $this->email->where('estado', "A")->findAll();     
        $telefono = $this->telefono->where('estado', "A")->findAll();    

        echo view("gestion/administrador/administrador", [
            'tituloPagina' => 'Administradores',
            'usuarios'=>$usuario, 
            'roles'=>$rol, 
            'parametros'=>$parametro, 
            'misDatos' => $session,
        ]);
    }

    
    public function insertar()
    {
        $tp=$this->request->getPost('tp');

        if ($this->request->getMethod() == "post") {
            if ($tp == 1) {

                $password = $this->request->getPost('pass');
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);

                $this->usuario->save([
                    'usuario' => $this->request->getPost('usuario'),
                    'nombre' => $this->request->getPost('nombre'),
                    'apellido' => $this->request->getPost('apellido'),
                    'id_rol' => $this->request->getPost('id_rol'),
                    'tipo_documento' => $this->request->getPost('tipo_documento'),
                    'num_documento' => $this->request->getPost('num_documento'),
                    'pass' => $hashed_password
                ]);

                $id_usuario = $this -> usuario ->insertID(); 

                $this -> usuario -> save([
                    'id_usuario' => $id_usuario,
                    'usuario_crea'=> $id_usuario
                ]);
    
                $this -> email -> save([
                    'id_usuario' => $id_usuario,
                    'usuario_crea'=> $id_usuario,
                    'prioridad' => 13,
                    'email' => $this -> request ->getPost('email')
                ]);
    
                $this -> telefono -> save([
                    'id_usuario' => $id_usuario,
                    'usuario_crea'=> $id_usuario,
                    'prioridad' => 13,
                    'numero' => $this -> request ->getPost('telefono')
                ]);
                
            } else {
                $this->usuario->update($this->request->getPost('id_usuario'),[       
                    'usuario' => $this->request->getPost('usuario'),             
                    'id_rol' => $this->request->getPost('id_rol'),
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
          $usuario_ = $this->usuario->DataActualizar($id_usuario, 'A');
          if (!empty($usuario_)) {
              array_push($returnData, $usuario_);    
          }
          echo json_encode($returnData);
      }
}
 