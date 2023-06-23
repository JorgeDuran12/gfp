<?php

namespace App\Controllers;
use App\Models\MovimientoModel;
use App\Models\DisponibleModel;
use App\Models\EmergenciaModel;
use App\Models\ParamentrosModel;

class Emergencia extends BaseController
{
    protected $movimiento, $disponible, $emergencia, $parametros;

    public function __construct(){

        $this->movimiento = new MovimientoModel();
        $this->disponible = new DisponibleModel();
        $this->emergencia = new EmergenciaModel();
        $this->parametros = new ParamentrosModel();
    }
        
    
    public function index()
    {
        $session = session();
        $id = $session->id_usuario;

        $disponibles = $this-> disponible ->datos_ingreso();
        $emergencia = $this->emergencia->traer_fondo($id);
        $parametros =  $this->parametros->traerdeta();

        echo view("gfp/fondo/emergencia", [
            'tituloPagina' => 'Fondo de emergencia',
            'emergencia' => $emergencia,
            'disponibles' => $disponibles,
            'params'=>$parametros,
            'misDatos' => $session,

        ]);
    }


    public function insertar()
    {
        $session = session();
        $id_usuario = $session->get('id_usuario');
    
        // Obtiene el registro disponible del usuario actual
        $disponibleModel = new DisponibleModel();
        $disponible = $disponibleModel->where('id_usuario', $id_usuario)->first();
    
        // Obtiene el último registro existente en EmergenciaModel
        $lastRegistro = $this->emergencia->where('id_usuario', $id_usuario)->orderBy('id_fondo-emergencia', 'DESC')->first();

        $uso_fondo = $this->emergencia->where('id_usuario', $id_usuario)->orderBy('id_fondo-emergencia', 'DESC')->first();
    
        if ($disponible && $this->request->getPost('params') === '82') {

            $emergencia_valor = $this->request->getPost('emergencia__valor');
            $suma_total = $lastRegistro ? $lastRegistro['suma_total'] + $emergencia_valor : $emergencia_valor;
    
            // Inserta el nuevo registro en la tabla EmergenciaModel
            $this->emergencia->insert([
                'id_parametro_det' => $this->request->getPost('params'),
                'valor' => $emergencia_valor,
                'suma_total' => $suma_total,
                'fecha_registro' => $this->request->getPost('fecha_registro'),
                'descripcion' => $this->request->getPost('descripcion'),
                'usuario_crea' => $id_usuario,
                'id_usuario' => $id_usuario,
            ]);
    
            // Realiza el cálculo y la actualización del campo presupuesto_anual en DisponibleModel
            $nuevoPresupuesto = $disponible['presupuesto_anual'] - $emergencia_valor;
            $egreso_total = $disponible['egreso'] + $emergencia_valor;
    
            $disponibleModel->update($disponible['id_disponible'], ['presupuesto_anual' => $nuevoPresupuesto]);
            $disponibleModel->update($disponible['id_disponible'], ['egreso' => $egreso_total]);

        } else if ($this->request->getPost('params') === '83') {

            $em_valor = $this->request->getPost('emergencia__valor');
            $suma_total_resta = $uso_fondo ? $uso_fondo['suma_total'] - $em_valor : $em_valor;
    
            // Inserta el nuevo registro en la tabla EmergenciaModel
            $this->emergencia->insert([
                'id_parametro_det' => $this->request->getPost('params'),
                'valor' => $em_valor,
                'suma_total' => $suma_total_resta,
                'fecha_registro' => $this->request->getPost('fecha_registro'),
                'descripcion' => $this->request->getPost('descripcion'),
                'usuario_crea' => $id_usuario,
                'id_usuario' => $id_usuario,
            ]);
            
        }
    
        return redirect()->to(base_url('/emergencia'));
    }
    
    

    // public function update()
    // {
    //     if ($this->request->getMethod() == "post") {
    //         // Es una actualización
    //         $this->emergencia->update($this->request->getPost('id'),[ 
    //             'fecha_registro' => $this->request->getPost('editar_fecha_registra'),
    //             'valor' => $this->request->getPost('editar_emergencia__valor'),
    //         ]);
    //     }
    
    //     return redirect()->to(base_url('/emergencia'));
    // }
 
    
    // public function buscar_fondo($id_usuario)
    //   {
    //       $returnData = array();
    //       $usuario_ = $this->emergencia->Actualizar_fondo($id_usuario, 'A');
    //       if (!empty($usuario_)) {
    //           array_push($returnData, $usuario_);    
    //       }
    //       echo json_encode($returnData);
    //   }

        
}