<?php




function sendMailConfig() {
    $sendEmail = \Config\Services::email();

        $config['protocol'] = 'smtp';
        $config['SMTPHost'] = 'sandbox.smtp.mailtrap.io';
        $config['SMTPUser']  = '29bce84301a287';
        $config['SMTPPass'] = 'dfb5a444cacc70';
        $config['SMTPPort'] = 2525;
        $config['crlf'] = "\r\n";
        $config['newline'] = "\r\n";
        $sendEmail->initialize($config);

        return $sendEmail;
}