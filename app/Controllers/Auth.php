<?php

namespace App\Controllers;
use App\Models\UsuariosModel;
use App\Models\EmailsModel;
use App\Models\ParamentrosModel;
use App\Models\TelefonosModel;

use CodeIgniter\API\ResponseTrait;

class Auth extends BaseController
{
    protected $usuario;
    protected $email;
    protected $parametros;
    protected $telefono;

    use ResponseTrait;

    
    public function __construct()
    {
        $this->usuario = new UsuariosModel();
        $this->parametros = new ParamentrosModel();
        $this->email = new EmailsModel();
        $this->telefono = new TelefonosModel();

        helper('generar_token');
        helper('configurar_sendMail');

    }

    public function index(){

        $session = session();

        echo view("auth/login",
         [
            'tituloPagina' => 'Inicio de sesión',
            'session' => $session
        ]);
    }
    
    public function registroPagina(){ 

        $session = session();

        $usuario = $this->usuario->where('estado', "A")->findAll();   
        $parametros = $this->parametros->obtener_encabezado_3();
        $email = $this->email->where('estado', "A")->findAll();     
        $telefono = $this->telefono->where('estado', "A")->findAll();     
      
        echo view("auth/registro_cuenta", [
            'tituloPagina' => 'Inicio de sesión',
            'usuarios'=>$usuario, 
            'parametros'=>$parametros,
            'email'=>$email,
            'telefono'=>$telefono,
            'session' => $session
        ]);
    }
    
    /* Metodos y pages - view (RECUPERAR CONTRASEÑA) */

    public function Recuperar_Clave_Pagina()
    {
        echo view("auth/recuperar_contraseña", [
            'tituloPagina' => 'Recuperar contraseña',
            'session' => session()
        ]);
    }
    
    public function enviar_token_pass()
    {
        //Servicio de email - Transportador
        $email = \Config\Services::email();

        $emailInput = $this->request->getPost('email');
        $nuevaPass = $this->request->getPost('nuevaPass');

        //Instanciar Modelo Usuario y traer datos
        $usuariosModel = new UsuariosModel();
        $infoUsuario = $usuariosModel->verificar_email_bd( $emailInput );

        if( $emailInput ) {
            //Verificar si existe el correo y usuario     
            if( $infoUsuario != null ) {
                $idUsuario = $infoUsuario['id_usuario'];
                $nombreUsuario = $infoUsuario['nombre'];
            }else {
                return redirect()->
                    to(base_url('auth/Recuperar_Clave_Pagina'))
                    ->with('no_existe_email', 'error');
            }

          //generar token
            $caracteres = "0123456789abcdefghijklmnopqrst";
            $token = generarCaracteres($caracteres, 5);

            $nombre = 'asd';
            //Enviar token al correo respectivo
            $email->setFrom('finanzaspersonales@gmail.com');
            $email->setTo($emailInput);
            $email->setSubject('Reestablecimiento de contraseña');
            $email->setMessage("
                <h1>Estimado/a, $nombreUsuario</h1>                
                <p>Hemos recibido una solicitud para restablecer la contraseña de tu cuenta. 
                Para proceder con el restablecimiento sigue los siguientes pasos:</p>
                
                <p>
                1. Haz clic en el enlace a continuación para acceder a la página de 
                restablecimiento de contraseña:
                    <li><a href='http://localhost/gfp/public/verificar_token/$token/$idUsuario'>Click para restablecer la contraseña</a></li>
                </p>
                
                <p>2. Serás redirigido/a a una página donde podrás ingresar una nueva contraseña.</p>
                
                <p>3. Elige una contraseña segura y asegúrate de que cumpla con los requisitos de seguridad establecidos. 
                Te recomendamos utilizar una combinación de letras mayúsculas y minúsculas, números y símbolos.</p>
                <p>4. Una vez que hayas ingresado tu nueva contraseña, confírmala en el campo designado.</p>
                <p>5. Haz clic en el botón 'Guardar' o 'Restablecer' para completar el proceso.</p>
                
                <p>Si no solicitaste este restablecimiento de contraseña, te recomendamos que contactes nuestro servicio de atención al cliente de inmediato para que podamos investigar el asunto.

                Recuerda que es importante mantener tus contraseñas seguras y no compartirlas con nadie. 
                Si tienes alguna pregunta o necesitas ayuda adicional, no dudes en contactarnos.</p>

                <h4>Atentamente,</h4>

                <p>Tu camino hacia la libertad financiera $nombreUsuario, 
                tu aliado en la gestión financiera personal/p>
            ");

            if($email->send()) {
                //Registrar el token al usuario
                $this->usuario->update($idUsuario, [
                    'token' =>  $token
                ]);
                
                return redirect()->
                to(base_url('auth/Recuperar_Clave_Pagina'))
                ->with('token_enviado', 'true');
            
            }else {
                
                return redirect()->
                to(base_url('auth/Recuperar_Clave_Pagina'))
                ->with('token_enviado', 'false');
            }

            
        }else if( $nuevaPass ) {

            $idUsuario_input = $this->request->getPost('id_usuario');
            $hasPassword = password_hash($nuevaPass, PASSWORD_DEFAULT);


            $this->usuario->update($idUsuario_input, [
                'pass' => $hasPassword
            ]);
            return redirect()->to(base_url('auth'))->with('estado_recuperar_pass', 'true');

        }


    } 

   //verificar token por url
   public function verificar_token_params($tokenUrl, $idUrl)
   {
       $infoUsuario = $this->usuario->traer_info_usuario_rol( $idUrl );
       if( !empty($infoUsuario) && $tokenUrl == $infoUsuario['token'] ) {
           //Si si es el usuario se quita el token
           $this->usuario->update($idUrl, [
               'token' => null
           ]);
           return redirect()->to(base_url('auth/Recuperar_Clave_Pagina'))->with('id_usuario', $idUrl);
       }else {
           return redirect()->to(base_url('auth/Recuperar_Clave_Pagina'))->with('token_verificado', 'false');
       }
   }

    public function guardar(){   

        if ($this->request->getMethod() == "post" ) {

            $password = $this->request->getPost('pass');
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            
            $this->usuario->save([    
                'usuario' => $this->request->getPost('usuario'),    
                'nombre' => $this->request->getPost('nombre'),
                'apellido' => $this->request->getPost('apellido'),
                'tipo_documento' => $this->request->getPost('tipo_documento'),
                'num_documento' => $this->request->getPost('documento'),
                'pass' => $hashed_password,
            ]);
            
            $id_usuario = $this -> usuario ->insertID();

            //Traer rol de usuario
            $datos = $this->usuario->traer_info_usuario_rol( $id_usuario );

            $this -> usuario -> save([
                'id_usuario' => $id_usuario,
                'usuario_crea'=> $id_usuario
            ]);

            $this -> email -> save([
                'id_usuario' => $id_usuario,
                'usuario_crea'=> $id_usuario,
                'prioridad' => 9,
                'email' => $this -> request ->getPost('email')
            ]);

            $this -> telefono -> save([
                'id_usuario' => $id_usuario,
                'usuario_crea'=> $id_usuario,
                'prioridad' => 9,
                'numero' => $this -> request ->getPost('telefono')
            ]);

            $session = session();
            $session->set([ 
                'id_usuario' => $id_usuario,
                'usuario' => $this->request->getPost('usuario'),
                'nombre' => $this->request->getPost('nombre'),
                'apellido' => $this->request->getPost('apellido'),
                'tipo_documento' => $this->request->getPost('tipo_documento'),
                'documento' => $this->request->getPost('num_documento'),
                'emails' => $this -> request ->getPost('email'),
                'telefonos' => $this -> request ->getPost('telefono'),
                'rol' => $datos['id_rol'],
                'logged_in' => true,
            ]);

            return redirect()->to('/Principal'); 
        }
    }

    public function AutenticarUsuario(){

        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');
     
        $usuarioModel = new UsuariosModel();
        $emailModel = new EmailsModel();

        $id_usuario = $emailModel->Id_Usuario_Email($email);
       
        if ($id_usuario) {
           
            $usuario = $usuarioModel->Auth_usuario($email);

            if ($usuario && isset($usuario['pass'])) {
               
                if (password_verify($password, $usuario['pass'])) {

                    $session = session();

                    //Traer rol de usuario
                    $datos = $this->usuario->traer_info_usuario_rol( $id_usuario );
                   
                    $session->set([
                        'id_usuario' => $id_usuario,
                        'usuario' => $usuario['usuario'],
                        'email' => $email,
                        'rol' => $datos['id_rol'],
                        'logged_in' => true
                    ]);

                    $response['id_rol'] = $datos['id_rol'];
                    $response['mensaje'] = '1';

                } else{
                    $response['mensaje'] = '2';
                }
            }      
        } else {
            $response['mensaje'] = '3';
        }
        return $this->response->setJSON($response);
    }

    public function verificar_email($email) {

        $resp = $this->usuario->verificar_email_bd($email);
        return json_encode($resp, true);

    }

    public function recuperar_contraseña_by_email($email) {
        echo 'recuperando...';
    }

    //Cerrar session destruyendo la informacion alojada en la web
    public function logout() {
        $session = session();
        $session->destroy();
        
        return redirect()->to(base_url('/'));
    }

}   