-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2023 a las 23:38:26
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gfp_bd`
--
CREATE DATABASE IF NOT EXISTS `gfp_bd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gfp_bd`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

CREATE TABLE `acciones` (
  `id_accion` smallint(2) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `id_usuario_crea` smallint(2) NOT NULL,
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `acciones`
--

INSERT INTO `acciones` (`id_accion`, `nombre`, `descripcion`, `estado`, `id_usuario_crea`, `fecha_crea`) VALUES
(1, 'Asignación de rol', 'Asignar un rol a un usuario en especifico', 'A', 1, '2023-04-21 12:35:54'),
(2, 'Quitar rol', 'Quitar un rol a un usuario en especifico', 'A', 1, '2023-04-21 12:35:54'),
(3, 'Eliminar rol', 'Eliminar un rol especifico', 'A', 1, '2023-04-21 12:35:54'),
(4, 'Actualizar administrador', 'Actualizar información o datos de un administrador', 'A', 1, '2023-04-21 12:35:54'),
(5, 'Deshabilitar administrador', 'Deshabilitar cuenta de un administrador', 'A', 1, '2023-04-21 12:35:54'),
(6, 'Agregar rol', 'Agregar un nuevo rol ', 'A', 1, '2023-04-21 12:35:54'),
(7, 'Eliminar usuario', 'Eliminar cuenta de un usuario en especifico', 'A', 1, '2023-04-21 12:35:54'),
(8, 'Listar usuario', 'Listar y ver perfiles de todos los usuarios registrados', 'A', 1, '2023-04-21 12:35:54'),
(9, 'Crear usuario', 'Crear un usuario nuevo en el sistema', 'A', 1, '2023-04-21 12:35:54'),
(10, 'Enviar boletines informativos', 'Enviar boletines informativos de interés a todos los usuarios registrados o a uno en especifico', 'A', 1, '2023-04-21 12:35:54'),
(11, 'Restauración de cuenta', 'Restaurar cuenta eliminada de un usuario y/o administrador', 'A', 1, '2023-04-21 12:35:54'),
(12, 'Actualizar usuario', 'Actualizar información o datos de un usuario', 'A', 1, '2023-04-21 12:35:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `id_agenda` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `color` varchar(200) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponibles`
--

CREATE TABLE `disponibles` (
  `id_disponible` smallint(2) NOT NULL,
  `periodo` year(4) NOT NULL,
  `saldo_anterior` decimal(11,2) NOT NULL,
  `ingreso` decimal(11,2) NOT NULL,
  `egreso` decimal(11,2) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emails`
--

CREATE TABLE `emails` (
  `id_email` smallint(2) NOT NULL,
  `email` varchar(200) NOT NULL,
  `prioridad` smallint(2) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` smallint(2) NOT NULL,
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `emails`
--

INSERT INTO `emails` (`id_email`, `email`, `prioridad`, `estado`, `fecha_crea`, `id_usuario`, `usuario_crea`) VALUES
(1, 'duranolivaresjorgeluis1@gmail.com', 13, 'A', '2023-05-11 12:22:43', 3, 3),
(8, 'danipc@gmail.com', 13, 'A', '2023-05-08 21:13:02', 28, 28),
(32, 'iiggyysdwefsdfgs123132@gma.ccccc', 13, 'A', '2023-05-10 21:02:01', 54, 54),
(33, 'mariase3105@gmail.com', 13, 'A', '2023-05-10 16:02:26', 31, 31),
(34, 'santiagoguerreroh034@gmail.com', 13, 'A', '2023-05-11 17:24:20', 55, 55),
(35, 'dta@gmail.com', 13, 'A', '2023-05-11 17:45:56', 56, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondo_emergencia`
--

CREATE TABLE `fondo_emergencia` (
  `id_fondo-emergencia` smallint(2) NOT NULL,
  `fecha_inicial` date NOT NULL,
  `valor` decimal(11,2) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id_movimiento` smallint(2) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `tipo_movimiento` smallint(2) NOT NULL,
  `clase_movimiento` smallint(2) NOT NULL,
  `valor` decimal(11,2) NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id_movimiento`, `descripcion`, `tipo_movimiento`, `clase_movimiento`, `valor`, `fecha_movimiento`, `estado`, `fecha_crea`, `usuario_crea`) VALUES
(1, 'fdgdsg', 2, 1, '50000.00', '2023-05-10 12:22:18', 'A', '2023-05-09 21:18:04', 3),
(2, 'lo', 2, 2, '10000.00', '2023-05-10 12:22:15', 'A', '2023-05-09 21:19:55', 3),
(3, 'pago de cel de dani pc', 1, 2, '1000000.00', '2023-05-10 12:22:11', 'A', '2023-05-09 21:32:49', 3),
(4, '6511', 2, 2, '1651.00', '2023-05-10 12:14:26', 'A', '2023-05-10 17:13:23', 3),
(6, 'gascgg<ad d ', 1, 1, '100000.00', '2023-05-26 05:00:00', 'A', '2023-05-10 17:17:45', 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros_det`
--

CREATE TABLE `parametros_det` (
  `id_parametro_det` smallint(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `resumen` char(2) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_parametro_enc` smallint(2) NOT NULL,
  `id_usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `parametros_det`
--

INSERT INTO `parametros_det` (`id_parametro_det`, `nombre`, `resumen`, `estado`, `fecha_crea`, `id_parametro_enc`, `id_usuario_crea`) VALUES
(1, 'Bancario', 'Ba', 'A', '2023-05-11 13:45:16', 1, 1),
(2, 'No bancario', 'Nb', 'A', '2023-05-11 13:45:32', 1, 1),
(3, 'Ingreso', 'In', 'A', '2023-04-21 13:23:09', 2, 1),
(4, 'Egreso', 'Eg', 'A', '2023-05-11 13:45:25', 2, 1),
(9, 'Cedula de Ciudadania', 'Cc', 'A', '2023-05-01 12:45:56', 3, 1),
(10, 'Tarjeta de Identidad', 'Td', 'A', '2023-05-01 12:46:42', 3, 1),
(11, 'Pasaporte', 'Pt', 'A', '2023-05-01 12:46:47', 3, 1),
(12, 'Cedula de Extranjeria', 'Ce', 'A', '2023-05-01 12:49:34', 3, 1),
(13, 'principal', 'pr', 'A', '2023-04-21 13:39:50', 6, 1),
(14, 'secundario', 'sg', 'A', '2023-04-25 13:10:49', 6, 1),
(15, 'Numero de Identificacion Tributaria', 'NI', 'A', '2023-05-01 12:54:55', 3, 2),
(16, 'Permiso Especial de Permanencia', 'PE', 'A', '2023-05-01 12:57:25', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros_enc`
--

CREATE TABLE `parametros_enc` (
  `id_parametro_enc` smallint(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `parametros_enc`
--

INSERT INTO `parametros_enc` (`id_parametro_enc`, `nombre`, `estado`, `fecha_crea`, `id_usuario_crea`) VALUES
(1, 'Tipo de movimiento', 'A', '2023-03-01 13:24:28', 1),
(2, 'Clase de movimiento', 'A', '2023-03-01 13:24:40', 1),
(3, 'tipo_dcto', 'A', '2023-04-21 13:16:02', 1),
(6, 'prioridad', 'A', '2023-04-21 13:38:55', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permiso` smallint(2) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `id_rol` smallint(2) NOT NULL,
  `id_accion` smallint(2) NOT NULL,
  `id_usuario_crea` smallint(2) NOT NULL,
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `estado`, `id_rol`, `id_accion`, `id_usuario_crea`, `fecha_crea`) VALUES
(1, 'A', 1, 1, 1, '2023-02-28 16:20:51'),
(2, 'A', 1, 2, 1, '2023-02-28 16:20:53'),
(3, 'A', 1, 3, 1, '2023-02-28 16:20:55'),
(4, 'A', 1, 4, 1, '2023-02-28 16:20:57'),
(5, 'A', 1, 5, 1, '2023-02-28 16:20:58'),
(6, 'A', 1, 6, 1, '2023-02-28 16:21:01'),
(7, 'A', 1, 7, 1, '2023-02-28 16:21:02'),
(8, 'A', 2, 7, 1, '2023-02-28 16:21:03'),
(9, 'A', 1, 8, 1, '2023-02-28 16:21:04'),
(10, 'A', 2, 8, 1, '2023-02-28 16:21:06'),
(11, 'A', 1, 9, 1, '2023-02-28 16:21:08'),
(12, 'A', 2, 9, 1, '2023-02-28 16:21:09'),
(13, 'A', 1, 10, 1, '2023-02-28 16:21:10'),
(14, 'A', 2, 10, 1, '2023-02-28 16:21:11'),
(15, 'A', 1, 11, 1, '2023-02-28 16:21:12'),
(16, 'A', 2, 11, 1, '2023-02-28 16:21:13'),
(17, 'A', 1, 12, 1, '2023-02-28 16:21:15'),
(18, 'A', 2, 12, 1, '2023-02-28 16:21:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyeccion`
--

CREATE TABLE `proyeccion` (
  `id_proyeccion` smallint(2) NOT NULL,
  `fecha_cuota` date NOT NULL,
  `valor_cuota` decimal(11,2) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_saquito` smallint(2) NOT NULL,
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` smallint(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `id_usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`, `descripcion`, `estado`, `id_usuario_crea`) VALUES
(1, 'Super Administrador', 'Acceso completo en el sistema.\r\npuede gestionar usuarios, roles, grupos y otros superadministradores u administradores.\r\nDarle mantenimiento a la pagina, etc.', 'A', 1),
(2, 'Administrador', 'Permiso para gestionar a todos los usuarios finales dentro del sistema\r\n', 'A', 1),
(3, 'Usuario', 'Acceso a todas las herramientas que ofrece el sistema ', 'A', 1),
(4, 'gerente', 'se encarga de gestionar los avances', 'A', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saquitos`
--

CREATE TABLE `saquitos` (
  `id_saquito` smallint(2) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha_inicial` date NOT NULL,
  `valor` decimal(11,2) NOT NULL,
  `numero_cuota` varchar(5) NOT NULL,
  `cuota` decimal(11,2) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `saquitos`
--

INSERT INTO `saquitos` (`id_saquito`, `descripcion`, `fecha_inicial`, `valor`, `numero_cuota`, `cuota`, `estado`, `fecha_crea`, `usuario_crea`) VALUES
(1, 'funciona', '2023-05-31', '900000.00', '9', '100000.00', 'A', '2023-05-10 12:14:28', 31),
(2, 'fhv', '2023-05-19', '4646.00', '4', '600.00', 'A', '2023-05-10 17:17:17', 31),
(3, '876', '2023-05-10', '2052.00', '8587', '8578.00', 'A', '2023-05-10 17:28:45', 3),
(4, 'aaaaaaaaffff', '2023-05-10', '1000000.00', '10', '100000.00', 'A', '2023-05-10 17:35:04', 31),
(5, 'wqdd', '2023-05-20', '4174.00', '772', '757.00', 'A', '2023-05-10 18:17:27', 3),
(6, 'dgdg', '2023-05-19', '452.00', '5', '152.00', 'A', '2023-05-11 17:01:09', 31),
(7, 'gggg', '2023-05-19', '5852.00', '21', '128.00', 'A', '2023-05-11 17:02:19', 31),
(8, 'hjkil', '2023-05-02', '444444.00', '44444', '4444.00', 'A', '2023-05-11 17:39:40', 31),
(9, 'dg', '2023-05-01', '556.00', '42', '4.00', 'A', '2023-05-11 18:22:39', 31),
(10, 'wrss', '2023-05-17', '50000.00', '4', '11000.00', 'A', '2023-05-11 21:45:23', 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id_telefono` smallint(2) NOT NULL,
  `numero` varchar(15) NOT NULL,
  `prioridad` smallint(2) NOT NULL,
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` char(1) NOT NULL DEFAULT 'A',
  `id_usuario` smallint(2) NOT NULL,
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id_telefono`, `numero`, `prioridad`, `fecha_crea`, `estado`, `id_usuario`, `usuario_crea`) VALUES
(39, '3145553222', 13, '2023-05-08 21:13:02', 'A', 28, 28),
(42, '3003095834', 13, '2023-05-09 17:16:44', 'A', 31, 31),
(51, '15465165', 13, '2023-05-09 20:48:06', 'A', 40, 40),
(55, '444444444', 13, '2023-05-10 21:02:01', 'A', 54, 54),
(56, '3145775332', 13, '2023-05-11 17:24:20', 'A', 55, 55),
(57, '23423', 13, '2023-05-11 17:45:56', 'A', 56, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` smallint(2) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `token` varchar(200) DEFAULT NULL,
  `id_rol` smallint(2) DEFAULT 3,
  `usuario_crea` smallint(2) NOT NULL,
  `tipo_documento` smallint(2) NOT NULL,
  `num_documento` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `nombre`, `apellido`, `pass`, `estado`, `fecha_crea`, `token`, `id_rol`, `usuario_crea`, `tipo_documento`, `num_documento`) VALUES
(1, 'devLas', 'carlos', 'de las salas', 'hola', 'A', '2023-05-11 12:21:38', '', 1, 1, 9, '6565632'),
(2, 'Safe', 'santiago', 'guerrero', 'hola', 'A', '2023-05-05 13:12:26', '', 1, 1, 9, '32323'),
(3, 'JorgeDuran12', 'Jorge Luis', 'Duran Olivares', '$2y$10$t2JV.BaqDOhhDBQZCywzHOGRx51L0nV4skNtAMXKIVWBGoHBwuh8u', 'A', '2023-05-11 12:37:54', 'x9pyYTQt9kji4RAPdEyrsNuNyZQUCG', 1, 3, 9, '1007219901'),
(28, 'danipc', 'daniel', 'Banquet', '$2y$10$Y.pApjdV4iGUqioYGymDPeWScJ9xWX1mE5OQhx2YRrV1mq6sqqdJ6', 'A', '2023-05-10 16:23:32', 'T38e7nEypqPVWubUlDoNnWppxlR5LY', 1, 28, 9, '5535'),
(31, 'Majo', 'Maria jose', 'Ramirez', '$2y$10$lJCs.OVlFG6Cno/nKGRmU.0585QD08xr.um.bIcgGEeiL5CNb8i0S', 'A', '2023-05-10 12:20:35', '', 3, 31, 9, '21113535'),
(40, 'duran12', 'jorge', 'duran', '$2y$10$t2JV.BaqDOhhDBQZCywzHOGRx51L0nV4skNtAMXKIVWBGoHBwuh8u', 'A', '2023-05-09 15:48:06', '', 3, 40, 9, '546546546546'),
(54, 'ttt777', 'aaaaa', 'ygtgyy', '$2y$10$KJVTdsxqgJb4z3.U/wmeHuXaLZWxq8MtbqiZtUmNZO0J7XyWQvCga', 'A', '2023-05-10 16:02:01', NULL, 3, 54, 10, '10333334'),
(55, 'santo', 'santiago', 'guerrero', '$2y$10$t2JV.BaqDOhhDBQZCywzHOGRx51L0nV4skNtAMXKIVWBGoHBwuh8u', 'A', '2023-05-11 13:11:20', NULL, 3, 55, 9, '1001893022'),
(56, '42343', '354', '32423', '$2y$10$da2qZueVkfRjKBbJMLXKguGdstoMqglSwnUVbD8O2M3.r0SbuRkF2', 'A', '2023-05-11 17:45:56', NULL, 3, 3, 12, '32423');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones`
--
ALTER TABLE `acciones`
  ADD PRIMARY KEY (`id_accion`),
  ADD KEY `accion_usuario` (`id_usuario_crea`);

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agenda`);

--
-- Indices de la tabla `disponibles`
--
ALTER TABLE `disponibles`
  ADD PRIMARY KEY (`id_disponible`),
  ADD KEY `disponible_usuario` (`id_usuario`);

--
-- Indices de la tabla `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id_email`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `email_usuario` (`id_usuario`),
  ADD KEY `usuario_crea` (`usuario_crea`),
  ADD KEY `email_prioridad` (`prioridad`);

--
-- Indices de la tabla `fondo_emergencia`
--
ALTER TABLE `fondo_emergencia`
  ADD PRIMARY KEY (`id_fondo-emergencia`),
  ADD KEY `fondoEmergencia_usuario` (`id_usuario`) USING BTREE;

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `usuario_crea` (`usuario_crea`),
  ADD KEY `tipo_movimiento` (`tipo_movimiento`),
  ADD KEY `clase_movimiento` (`clase_movimiento`);

--
-- Indices de la tabla `parametros_det`
--
ALTER TABLE `parametros_det`
  ADD PRIMARY KEY (`id_parametro_det`),
  ADD KEY `parametro-det_parametro-enc` (`id_parametro_enc`),
  ADD KEY `parametro-det_usuario-crea` (`id_usuario_crea`);

--
-- Indices de la tabla `parametros_enc`
--
ALTER TABLE `parametros_enc`
  ADD PRIMARY KEY (`id_parametro_enc`),
  ADD KEY `parametro_usuario_crea` (`id_usuario_crea`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD KEY `permiso_accion` (`id_accion`),
  ADD KEY `permiso_rol` (`id_rol`),
  ADD KEY `permiso_usuario` (`id_usuario_crea`);

--
-- Indices de la tabla `proyeccion`
--
ALTER TABLE `proyeccion`
  ADD PRIMARY KEY (`id_proyeccion`),
  ADD KEY `proyeccion_saquito` (`id_saquito`),
  ADD KEY `usario_crear` (`usuario_crea`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD KEY `roles_usuario` (`id_usuario_crea`);

--
-- Indices de la tabla `saquitos`
--
ALTER TABLE `saquitos`
  ADD PRIMARY KEY (`id_saquito`),
  ADD KEY `usuario_crea` (`usuario_crea`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`id_telefono`),
  ADD KEY `prioridad_telefono` (`prioridad`),
  ADD KEY `usario_telefono` (`id_usuario`),
  ADD KEY `usario_crea` (`usuario_crea`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `usuario_rol` (`id_rol`),
  ADD KEY `documento_usuario` (`tipo_documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones`
--
ALTER TABLE `acciones`
  MODIFY `id_accion` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `disponibles`
--
ALTER TABLE `disponibles`
  MODIFY `id_disponible` smallint(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `emails`
--
ALTER TABLE `emails`
  MODIFY `id_email` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `fondo_emergencia`
--
ALTER TABLE `fondo_emergencia`
  MODIFY `id_fondo-emergencia` smallint(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `parametros_det`
--
ALTER TABLE `parametros_det`
  MODIFY `id_parametro_det` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `parametros_enc`
--
ALTER TABLE `parametros_enc`
  MODIFY `id_parametro_enc` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `proyeccion`
--
ALTER TABLE `proyeccion`
  MODIFY `id_proyeccion` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `saquitos`
--
ALTER TABLE `saquitos`
  MODIFY `id_saquito` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id_telefono` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acciones`
--
ALTER TABLE `acciones`
  ADD CONSTRAINT `accion_usuario` FOREIGN KEY (`id_usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `disponibles`
--
ALTER TABLE `disponibles`
  ADD CONSTRAINT `disponible_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `email_prioridad` FOREIGN KEY (`prioridad`) REFERENCES `parametros_det` (`id_parametro_det`),
  ADD CONSTRAINT `email_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usuario_crea` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `fondo_emergencia`
--
ALTER TABLE `fondo_emergencia`
  ADD CONSTRAINT `fondoEmergencia_usuario_crea` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`tipo_movimiento`) REFERENCES `parametros_det` (`id_parametro_det`),
  ADD CONSTRAINT `movimientos_ibfk_3` FOREIGN KEY (`clase_movimiento`) REFERENCES `parametros_det` (`id_parametro_det`);

--
-- Filtros para la tabla `parametros_det`
--
ALTER TABLE `parametros_det`
  ADD CONSTRAINT `parametro-det_parametro-enc` FOREIGN KEY (`id_parametro_enc`) REFERENCES `parametros_enc` (`id_parametro_enc`),
  ADD CONSTRAINT `parametro-det_usuario-crea` FOREIGN KEY (`id_usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `parametros_enc`
--
ALTER TABLE `parametros_enc`
  ADD CONSTRAINT `parametro_usuario_crea` FOREIGN KEY (`id_usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permiso_accion` FOREIGN KEY (`id_accion`) REFERENCES `acciones` (`id_accion`),
  ADD CONSTRAINT `permiso_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `permiso_usuario` FOREIGN KEY (`id_usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `proyeccion`
--
ALTER TABLE `proyeccion`
  ADD CONSTRAINT `proyeccion_saquito` FOREIGN KEY (`id_saquito`) REFERENCES `saquitos` (`id_saquito`),
  ADD CONSTRAINT `usario_crear` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `usuario_crear` FOREIGN KEY (`id_usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `saquitos`
--
ALTER TABLE `saquitos`
  ADD CONSTRAINT `saquitos_ibfk_1` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `prioridad_telefono` FOREIGN KEY (`prioridad`) REFERENCES `parametros_det` (`id_parametro_det`),
  ADD CONSTRAINT `usario_crea` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usario_telefono` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `documento_usuario` FOREIGN KEY (`tipo_documento`) REFERENCES `parametros_det` (`id_parametro_det`),
  ADD CONSTRAINT `usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
