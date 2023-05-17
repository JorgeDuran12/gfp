<?php

namespace App\Controllers;
use App\Models\UsuariosModel;



class SendGrid extends BaseController
{


    
    public function __construct()
    {
        $this->usuario = new UsuariosModel();


        helper('generar_token');
        helper('sendGrid');

    }

    public function enviar_token_pass(){

        //Configurar SendGrid

        $email = \Config\Services::email();
       
        // $this->load->library('email');
        
        // Enviar Correos
        
        $email->setFrom('your@example.com', 'Your Name');
        $email->setTo('delassalasospino2003@gmail.com');
        $email->setSubject('Email Test');
        $email->setMessage('Testing the email class.');

        if($email->send()) {
            echo 'Enviado';
        }else {
            echo 'No enviado';
        }
        




    }
    
   

}   