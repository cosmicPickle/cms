<?php

namespace Api;
class Process {
    
    public function contactmail($f3) {
          $sys_mail = $f3->get('sys_email');
          $headers = "From: ".$f3->get('POST.email')."\r\n".$f3->get('headers');
          $subject = "Client Message";
          $body = \Template::instance()->render('views/emails/contact.html');
          
          if(mail($sys_mail,$subject,$body,$headers))
          {
              $f3->get('messages')->msg('MAIL_OK');
              $f3->get('utils')->respond($f3->get('messages')->clear());
          }
          else
          {
              $f3->get('messages')->msg('MAIL_ERR');
              $f3->get('utils')->reserrors($f3->get('messages')->clear());
          }
    }
}



