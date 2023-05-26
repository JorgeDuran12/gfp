<?php

namespace App\Controllers;


class Prueba extends BaseController
{
    
    public function __construct()
    
    {
        
    }
   
    public function index()
    {
      echo view('gestion/prueba');
    }


  
   

}