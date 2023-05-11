<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;
use CodeIgniter\Filters\CSRF;
use CodeIgniter\Filters\DebugToolbar;
use CodeIgniter\Filters\Honeypot;
use CodeIgniter\Filters\InvalidChars;
use CodeIgniter\Filters\SecureHeaders;

class Filters extends BaseConfig
{
    /**
     * Configures aliases for Filter classes to
     * make reading things nicer and simpler.
     */
    public array $aliases = [
        'csrf'          => CSRF::class,
        'toolbar'       => DebugToolbar::class,
        'honeypot'      => Honeypot::class,
        'invalidchars'  => InvalidChars::class,
        'secureheaders' => SecureHeaders::class,
        'Verificar_Auth' => \App\Filters\Verificar_Auth::class, // y mas abajo en la linea 67 se implementara la seguridad de enrutamiento al sistema
    ];

    /**
     * List of filter aliases that are always
     * applied before and after every request.
     */
    public array $globals = [
        'before' => [
            // 'honeypot',
            // 'csrf',
            // 'invalidchars',
        ],
        'after' => [
            'toolbar',
            // 'honeypot',
            // 'secureheaders',
        ],
    ];

    /**
     * List of filter aliases that works on a
     * particular HTTP method (GET, POST, etc.).
     *
     * Example:
     * 'post' => ['foo', 'bar']
     *
     * If you use this, you should disable auto-routing because auto-routing
     * permits any HTTP method to access a controller. Accessing the controller
     * with a method you don’t expect could bypass the filter.
     */
    public array $methods = [];

    /**
     * List of filter aliases that should run on any
     * before or after URI patterns.
     *
     * Example:
     * 'isLoggedIn' => ['before' => ['account/*', 'profiles/*']]
     */



    public array $filters = [
        'Verificar_Auth' => [
            'before' => [
                /* Controladores */
                'agenda',
                'agenda/*',
                'principal',
                'principal/*',
                'emergencia',
                'emergencia/*',
                'registro',
                'registro/*',
                'rol',
                'rol/*',
                'saquito',
                'saquito/*',
                'usuario',
                'usuario/*',
                'progreso_saquito',
                'progreso_saquito/*',

                /* Rutas de agenda*/
                'agenda_de_pago',
                'listaDeEventos',
                'insertar_evento',

                /* Rutas de saquito*/
                'mi_saquito',

                /* Rutas de movimientos*/
                'mis_movimientos',

                /* Rutas de usuarios */
                'gestion/usuarios',
                'gestion_de_administradores',

                /* Rutas de roles*/
                'gestion/roles',

                /* Rutas de emergencia */
                'fondo_de_emergencia',


            ]
        ]
    ];
}
