<?php




function sendMailConfig() {
    $sendEmail = \Config\Services::email();

        $config['protocol'] = 'smtp';
        $config['SMTPHost'] = 'sandbox.smtp.mailtrap.io';
        $config['SMTPUser']  = '2aa7fdc649a6dc';
        $config['SMTPPass'] = '9edaa9c637f692';
        $config['SMTPPort'] = 2525;
        $config['crlf'] = "\r\n";
        $config['newline'] = "\r\n";
        $sendEmail->initialize($config);

        return $sendEmail;
}