
    <?php

    //Funcion para enviar correo al email posteado (Restablecer pass)
    public function enviar_token_pass() {
    
        //Configurar SendMail
        $sendEmail = sendMailConfig();
        //Valores ingresados
        $email = $this->request->getPost('email');
        $nuevaPass = $this->request->getPost('nuevaPass');
        
        //Model Usuario
        $UsuariosModel = new UsuariosModel();

        //Generar Token 
        $caracteres = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $token = generarCaracteres($caracteres, 30);
        
        if( $email ) {

        //Buscar usuario by Email
        $informacion = $UsuariosModel->verificar_email_bd($email);
        if(!$informacion) {
            echo 'Correo no valido';
            exit();
        }
        
        $idUsuario = $informacion['id_usuario'];

        //Insertar token al usuario en la BD
        $UsuariosModel->update($idUsuario,[
            'token' => $token
        ]);
        
        //Enviar token al correo
        $sendEmail->setFrom('gestor@financiero.com', 'GfP - Tu mejor compañia');
        $sendEmail->setTo('someone@example.com');

        $sendEmail->setSubject('Recuperacion de contraseña');
        $sendEmail->setMessage('El codigo de restablecimiento de contraseña es : ' .$token);

        // $sendEmail->send();
        $sendEmail->send(); 

        return redirect()->to(base_url("auth/Recuperar_Clave_Pagina"))->with('usuarioId', $idUsuario );


        }else if( $nuevaPass ) {
            $idUsuario =  $this->request->getPost('id_usuario');

            //Model Usuario
            $UsuariosModel = new UsuariosModel();

            //Encriptar clave
            $hasPassword = password_hash($nuevaPass, PASSWORD_DEFAULT);

            //Update a la password
            $UsuariosModel->update($idUsuario,[
                'pass' => $hasPassword,
                'token' => null
            ]);

            return redirect()->to(base_url("/"));

        }
    }


    public function verificar_token($id, $token) {
       
        //Model Usuario
        $UsuariosModel = new UsuariosModel();

        $usuario = $UsuariosModel->traer_usuario($id);
        $tokenUsuarioBD = $usuario['token'];

        if($tokenUsuarioBD == $token ) {
            
            $msg = [
                [
                    'msg' => 'El token fue verificado correctamente',
                    'ok' => true,
                ]
            ];

            return $this->respond($usuario, 200);

        }else {
            $msg = [
                [
                    'msg' => 'El token no es valido',
                    'ok' => false,
                ]
            ];
                return $this->fail(404);
        }
    }

    
   /* Fin - Metodos y pages - view (RECUPERAR CONTRASEÑA) */