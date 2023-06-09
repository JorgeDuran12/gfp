<?php

namespace App\Controllers;

use App\Models\ProyeccionModel;
use App\Models\MovimientoModel;
use App\Models\UsuariosModel;
use App\Models\SaquitoModel;
use App\Models\DisponibleModel;


class Proyeccion extends BaseController
{
    protected $proyeccion;
    protected $saquito;
    protected $Movimiento;
    protected $disponible;

    public function __construct()
    {
        $this->Movimiento = new MovimientoModel();
        $this->Proyeccion = new ProyeccionModel();
        $this->usuario = new UsuariosModel();
        $this->saquito = new SaquitoModel();
        $this->disponible = new DisponibleModel();
        
    }
   
    public function index()
    {
        $session = session();
        $disponibles = $this-> disponible ->datos_ingreso();

        $proye = new ProyeccionModel();
        $traer_sqto= new SaquitoModel();
        $traer_proy= new ProyeccionModel();

        $proyeccion = $proye -> traer();
        $traer_sqto =   $traer_sqto -> traer_sqto ();
        $traer_proye=   $traer_proy -> traer_proye ();

        echo view("gfp/fondo/proyeccion_saquito", [
            'tituloPagina' => 'Proyeccion',
            'proyeccion' => $proyeccion,
            'disponibles' => $disponibles,
            'misDatos' => $session,
            'traer_sqto' => $traer_sqto,
            'traer_proye' => $traer_proye['valor_cuota'],
        ]);
    }

    public function Insertar()
    {

        $session = session();
        $id_usuario = $session->get('id_usuario');

        $id_saquito = $this-> saquito -> traerId_saquito();
        $id_disponible = new DisponibleModel();
        $identificador = $id_disponible->traer_id_disponible();

        $this->Proyeccion->save([
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

        $this->disponible->update($identificador,[
           
             'egreso' => $this->request->getPost('egreso'),
           'presupuesto_anual' => $this->request->getPost('presupuesto'),
           'id_usuario' => $id_usuario,

          ]);
        return redirect()->to(base_url('/proyeccion'));
    }


    public function buscar_Proyeccion(){
        $returnData = array();

        $session = session();
        $idUsuario = $session->id_usuario;

        $proyeccion_ = $this->saquito->traer_Proyeccion($idUsuario);
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

}