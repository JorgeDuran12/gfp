<?php

namespace App\Controllers;

use App\Models\ProyeccionModel;
use App\Models\MovimientoModel;
use App\Models\UsuariosModel;
use App\Models\SaquitoModel;
use App\Models\DisponibleModel;
use App\Models\ParamentrosModel;
use App\Models\EmergenciaModel;


class Proyeccion extends BaseController
{
    protected $proyeccion;
    protected $saquito;
    protected $Movimiento;
    protected $disponible;
    protected $usuario;
    protected $params;
    protected $emergencia;

    public function __construct()
    {
        $this->Movimiento = new MovimientoModel();
        $this->proyeccion = new ProyeccionModel();
        $this->usuario = new UsuariosModel();
        $this->saquito = new SaquitoModel();
        $this->disponible = new DisponibleModel();
        $this->params = new ParamentrosModel();
        $this->emergencia = new EmergenciaModel();
        
    }
   
    public function index()
    {
        $session = session();
        $id_usuario = $session->get('id_usuario');

        $disponibles = $this-> disponible ->datos_ingreso();

        $proye = new ProyeccionModel();
        $traer_sqto= new SaquitoModel();
        $traer_proy= new ProyeccionModel();

        $proyeccion = $proye -> traer();
        $traer_sqto =   $traer_sqto -> traer_sqto ();
        $traer_proye=   $traer_proy -> traer_proye ();

        $params = $this -> params -> traerProyeccion();
        $proyeccion_enc = $this->emergencia->traer_fondo($id_usuario);

        echo view("gfp/fondo/proyeccion_saquito", [
            'tituloPagina' => 'Proyeccion',
            'proyeccion' => $proyeccion,
            'disponibles' => $disponibles,
            'misDatos' => $session,
            'traer_sqto' => $traer_sqto,
            'traer_proye' => $traer_proye['valor_cuota'],
            'encabezado' => $params,
            'proyeccion_enc' => $proyeccion_enc,
        ]);
    }


    public function Insertar()
    {

        $session = session();
        $id_usuario = $session->get('id_usuario');

        $id_saquito = $this-> saquito -> traerId_saquito();

        $id_disponible = new DisponibleModel();
        $identificador = $id_disponible->traer_id_disponible();
        
        // $id_emergencia = new EmergenciaModel();
        // $emergencia_id = $id_emergencia->traer_id_emergencia();

        
        
        $this->proyeccion->save([
            'fecha_cuota' => $this->request->getPost('fecha_cuota'), 
            'valor_cuota' => $this->request->getPost('valor_cuota'), 
            'usuario_crea' => $id_usuario,
            'id_saquito' => $id_saquito,
        ]);

        $this->Movimiento->save([
           'tipo_movimiento'=>2,
           'clase_movimiento'=>4,
           'descripcion'=>"cuota saquito",
           'valor' => $this->request->getPost('valor_cuota'), 
           'usuario_crea' => $id_usuario,

        ]);


        if($this->request->getPost('id_parametro_det') === '34'){
           $this->disponible->update($identificador,[
           
            'egreso' => $this->request->getPost('egreso'),
           'presupuesto_anual' => $this->request->getPost('presupuesto'),
           'id_usuario' => $id_usuario,

          ]);  
        }elseif($this->request->getPost('id_parametro_det') === '35'){
            
          $this->emergencia->save([
           
            'valor' => $this->request->getPost('valor_cuota'), 
           'suma_total' => $this->request->getPost('suma_total'),
           'id_usuario' => $id_usuario,
           'usuario_crea' => $id_usuario,
           'descripcion'=>"cuota saquito",
           'id_parametro_det'=>33,

          ]);
        }

       

        return redirect()->to(base_url('/proyeccion'));
    }




    public function buscar_Proyeccion(){
        $returnData = array();

        $session = session();
        $idUsuario = $session->id_usuario;

        $proyeccion_ = $this->proyeccion->traer_Proyeccion($idUsuario);
        if (!empty($proyeccion_)) {
            array_push($returnData, $proyeccion_);
        }
        echo json_encode($returnData);

    }


    public function getDatos()
    {
        // Obtener los datos de la base de datos
        $proyeccionSaquitoModel = new ProyeccionModel();
        $datos = $proyeccionSaquitoModel->obtenerDatos(); // Suponiendo que tienes un modelo llamado "ProyeccionSaquitoModel" con un método "obtenerDatos" que devuelve los datos

        // Preparar la respuesta
        $response = [
            'datos' => $datos
        ];

        // Enviar la respuesta como JSON
        return $this->respond($response);
    }


    // public function buscar_($id)
    //   {
    //       $returnData = array();
    //       $encabezado_ = $this->encabezado->traer_registro($id, 'A');
    //       if (!empty($encabezado_)) {
    //           array_push($returnData, $encabezado_);    
    //       }
    //       echo json_encode($returnData);
    //   }

}