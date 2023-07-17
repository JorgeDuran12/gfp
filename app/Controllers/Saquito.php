<?php

namespace App\Controllers;

use App\Models\SaquitoModel;
use App\Models\UsuariosModel;
use App\Models\DisponibleModel;
use App\Models\ProyeccionModel;
use CodeIgniter\API\ResponseTrait;


class Saquito extends BaseController
{
    protected $saquito, $usuario, $disponible , $proyeccion;
    use ResponseTrait;
    
    public function __construct()
    
    {
        
        $this->proyeccion = new ProyeccionModel();
        $this->usuario = new UsuariosModel();
        $this->saquito = new SaquitoModel();
        $this->disponible = new DisponibleModel();

    }
   
    public function index()
     {
        $session = session();

        $saquitos = $this-> saquito-> traer();
        
        echo view("gfp/fondo/saquito", [
            'tituloPagina' => 'Mi saquito',
            'saquito'=>$saquitos,
            'misDatos' => $session,
        ]);
    }


                            
    public function Insertar(){

        $tp=$this->request->getPost('tp');

        if ($this->request->getMethod() == "post" ) {

            $session = session();
            $id_usuario = $session->get('id_usuario');

            if($tp == 1){
            $this->saquito->save([    
                'descripcion' => $this->request->getPost('descripcion'),
                'fecha_inicial' => $this->request->getPost('fecha_inicial'),
                
                'valor' => $this->request->getPost('valor'),
                'numero_cuota' => $this->request->getPost('numero_cuota'),
                'cuota' => $this->request->getPost('cuota'),
                'usuario_crea' => $id_usuario
            ]);

            
        } else {
            $this->saquito->update($this->request->getPost('id_saquito'),[
                'descripcion' => $this->request->getPost('descripcion'),
                'fecha_inicial' => $this->request->getPost('fecha_inicial'),
               
                'valor' => $this->request->getPost('valor'),
                'numero_cuota' => $this->request->getPost('numero_cuota'),
                'cuota' => $this->request->getPost('cuota'),
                'usuario_crea' => $id_usuario
            ]);
        }
            return redirect()->to(base_url('/mi_saquito'))->with('estado_saquito', 2);
            
        }
    }
    
    public function buscar_Registro(){
        $returnData = array();

        $session = session();
        $idUsuario = $session->id_usuario;

        $saquito_ = $this->saquito->traer_saquitos($idUsuario);
        if (!empty($saquito_)) {
            array_push($returnData, $saquito_);
        }
        echo json_encode($returnData);

    }


    public function completado(){

        $saquitoId = $this->saquito->traerId_saquito();

        try{
            $this->saquito-> completar_saquito($saquitoId,'C');
            return $this->respond('Saquito completado', 200);
            return redirect()->to(base_url('/mi_saquito'));

        }catch(error) {
            return $this->fail('Error al actualizar', 400);
        }

    }
    

    public function buscar_historial_p($id)
    {
        $returnData = array();
        $historial_p = $this->proyeccion->historialProyeccionByIdSaquito($id);
        if (!empty($historial_p)) {
            array_push($returnData, $historial_p); 
            echo json_encode($returnData);   
        }else{
            echo("ta vacio");
        }
       
    }
 

    public function verificar_registro()
    {
        // Obtener el ID de usuario desde la sesión
        $session = session();
        $id_usuario = $session->get('id_usuario');

        // Realizar la lógica para verificar si el usuario tiene un registro insertado
        $tieneRegistro = $this->saquito->verificarRegistro($id_usuario);

        // Crear un array con la respuesta
        $response = array(
            'tieneRegistro' => $tieneRegistro
        );

        // Devolver la respuesta en formato JSON
        return $this->response->setJSON($response);
    }
    


}